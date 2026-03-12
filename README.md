# POC01 - Gestión de Usuarios SAP (Estado Actual)

## Resumen
POC01 expone una UI web y una API REST para:
- listar usuarios SAP,
- verificar existencia,
- bloquear,
- desbloquear.

La integración SAP se ejecuta contra la **Operation `SISSSAPOperation`** de la producción activa del namespace (entorno DEMO actual: `PRD.PROD1`).

## Arquitectura implementada

```text
POC01.Web.UserManagementPage (CSP)
  -> /api/users/* (REST)
  -> POC01.API.UserManagementService
  -> Ens.Director.CreateBusinessService("EnsLib.Testing.Service")
  -> svc.SendTestRequest("SISSSAPOperation", request, .response, ...)
  -> SAP (BAPIs USER*)
```

### Importante
- El flujo productivo actual de la API **no depende de los BPL** `POC01.BP.*`.
- Los BPL siguen existiendo en el proyecto, pero la API llama directo a `SISSSAPOperation`.

## Componentes clave
- API REST: `POC01/API/UserManagementService.cls`
- UI web: `POC01/Web/UserManagementPage.cls`
- Operation SAP usada: host de producción `SISSSAPOperation` (clase `EnsLib.SAP.Operation`)
- Clases BAPI: `POC01/BAPI/USER/...`

## Endpoints
Base: `/api/users`

- `GET /list?maxRows=20&usernameFilter=ADMI*`
- `POST /check`
- `POST /lock`
- `POST /unlock`

## Comportamiento actual por endpoint

### 1) Listar usuarios (`GET /list`)
Request params:
- `maxRows` (1..50, default 5)
- `usernameFilter` (opcional)

Lógica:
- Solicita a SAP con `BAPI_USER_GETLIST`.
- Si hay filtro, internamente pide un lote mayor a SAP (`MAXuROWS=2000`) y luego filtra en IRIS.
- Soporta filtro:
  - sin comodines: coincidencia por **contiene**
  - con comodines: `*` (cualquier secuencia), `?` (1 carácter)
- Si el filtro deja 0 resultados, intenta fallback desde historial local `BAPI_USER_GETLIST.USERLIST`.

Response JSON:
- `success`, `code`, `date`, `time`, `count`, `data[]`
- `data[]` incluye: `id`, `username`, `firstname`, `lastname`, `fullname`

### 2) Verificar usuario (`POST /check`)
Body:
```json
{"username":"ADMISIONURG"}
```

Lógica:
- Llama `BAPI_USER_EXISTENCE_CHECK`.
- Mapea existencia desde `ISCuIsOK`, `ISCuErrorMessage`, `RETURN.TYPE`, `RETURN.MESSAGE`.
- Agrega estado de bloqueo inferido por historial de la app (`APP_HISTORY`) comparando últimas acciones lock/unlock en tablas request.

Response JSON (ejemplo):
```json
{
  "success": 1,
  "code": "USER_EXISTS",
  "username": "ADMISIONURG",
  "exists": 1,
  "message": "Usuario existe en SAP",
  "lockStatus": "UNLOCKED",
  "lockStatusSource": "APP_HISTORY",
  "lockStatusMessage": "Estado inferido por la ultima accion registrada: DESBLOQUEAR",
  "date": "2026-03-12",
  "time": "17:45:10"
}
```

### 3) Bloquear usuario (`POST /lock`)
Body:
```json
{"username":"ADMISIONURG"}
```

Lógica:
- Llama `BAPI_USER_LOCK` directo a `SISSSAPOperation`.
- Extrae resultado principal desde SQL:
  - `BAPI_USER_LOCK.ISCuResponse`
  - `BAPI_USER_LOCK.RETURN`
- Fallback al objeto en memoria si SQL no está disponible.

Response JSON:
- éxito: `code=USER_LOCKED`, `message=...`
- error: `code=USER_LOCK_ERROR`, `error=...`
- siempre con `date` y `time`

### 4) Desbloquear usuario (`POST /unlock`)
Body:
```json
{"username":"ADMISIONURG"}
```

Lógica:
- Llama `BAPI_USER_UNLOCK` directo a `SISSSAPOperation`.
- Extrae resultado principal desde SQL:
  - `BAPI_USER_UNLOCK.ISCuResponse`
  - `BAPI_USER_UNLOCK.RETURN`
- Fallback al objeto en memoria si SQL no está disponible.

Response JSON:
- éxito: `code=USER_UNLOCKED`, `message=...`
- error: `code=USER_UNLOCK_ERROR`, `error=...`
- siempre con `date` y `time`

## Respuesta estándar de error
La API devuelve errores de negocio/técnicos en JSON (habitualmente HTTP 200):

```json
{
  "success": 0,
  "code": "ERROR",
  "error": "Detalle...",
  "date": "2026-03-12",
  "time": "17:50:26"
}
```

## UI web
Clase: `POC01/Web/UserManagementPage.cls`

Incluye:
- pestaña Listar (con `maxRows` + `usernameFilter`),
- pestaña Verificar,
- pestaña Bloquear,
- pestaña Desbloquear,
- render de `code` + `date/time` en mensajes.

## Compilación recomendada
```objectscript
do $system.OBJ.Compile("POC01.API.UserManagementService","cuk")
do $system.OBJ.Compile("POC01.Web.UserManagementPage","cuk")
```

## Notas operativas de entorno
- Namespace objetivo: `DEMO`
- Producción activa usada en pruebas: `PRD.PROD1`
- Host de interoperabilidad esperado por la API: `SISSSAPOperation`

## Limitaciones conocidas
- `lockStatus` en `/check` es inferido por historial de la app (`APP_HISTORY`), no lectura directa de estado real SAP en tiempo real.
- El wrapper de `BAPI_USER_GETLIST` tiene `WITHuUSERNAME` modelado como campo corto; por eso el filtro completo se resuelve localmente.
- Existen clases BPL `POC01.BP.*` que hoy no están en el flujo principal de la API.

## Limpieza del proyecto
Ver checklist: `POC01/CLEANUP_CHECKLIST.md`
