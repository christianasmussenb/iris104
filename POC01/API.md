# API REST - POC01 (Implementación actual)

Base path: `/api/users`

## Convenciones actuales
- `Content-Type`: `application/json; charset=UTF-8`
- `username` se normaliza a mayúsculas en backend.
- Respuestas incluyen metadata cuando aplica: `code`, `date`, `time`.
- Errores de negocio suelen retornar HTTP 200 con `success=0`.

## 1) GET /list
Lista usuarios SAP.

### Query params
- `maxRows` (opcional): 1..50, default 5
- `usernameFilter` (opcional):
  - sin comodines: coincidencia por contiene
  - con comodines: `*`, `?`

### Ejemplos
```http
GET /api/users/list?maxRows=20
GET /api/users/list?maxRows=20&usernameFilter=ADMI
GET /api/users/list?maxRows=20&usernameFilter=ADMI*
```

### Response OK
```json
{
  "success": 1,
  "code": "USER_LIST_OK",
  "count": 2,
  "data": [
    {
      "id": 123,
      "username": "ADMISIONURG",
      "firstname": "",
      "lastname": "",
      "fullname": ""
    }
  ],
  "date": "2026-03-12",
  "time": "17:55:10"
}
```

### Notas técnicas
- Llama `BAPI_USER_GETLIST` vía `SISSSAPOperation`.
- Si hay `usernameFilter`, backend pide lote SAP ampliado (`MAXuROWS=2000`) y filtra en IRIS.
- Si el filtrado deja 0, intenta fallback desde historial `BAPI_USER_GETLIST.USERLIST`.

## 2) POST /check
Verifica existencia de usuario.

### Body
```json
{"username":"ADMISIONURG"}
```

### Response ejemplo (usuario existe)
```json
{
  "success": 1,
  "code": "USER_EXISTS",
  "exists": 1,
  "username": "ADMISIONURG",
  "message": "Usuario existe en SAP",
  "lockStatus": "UNLOCKED",
  "lockStatusSource": "APP_HISTORY",
  "lockStatusMessage": "Estado inferido por la ultima accion registrada: DESBLOQUEAR",
  "date": "2026-03-12",
  "time": "17:56:01"
}
```

### Response ejemplo (no existe)
```json
{
  "success": 1,
  "code": "USER_NOT_FOUND",
  "exists": 0,
  "username": "NOEXISTE",
  "message": "Usuario no existe en SAP",
  "date": "2026-03-12",
  "time": "17:56:20"
}
```

### Notas técnicas
- Usa `BAPI_USER_EXISTENCE_CHECK`.
- `lockStatus` no es lectura realtime SAP; se calcula por historial local lock/unlock.

## 3) POST /lock
Bloquea usuario SAP.

### Body
```json
{"username":"ADMISIONURG"}
```

### Response éxito
```json
{
  "success": 1,
  "code": "USER_LOCKED",
  "username": "ADMISIONURG",
  "message": "Usuario bloqueado exitosamente",
  "date": "2026-03-12",
  "time": "17:57:10"
}
```

### Response error
```json
{
  "success": 0,
  "code": "USER_LOCK_ERROR",
  "error": "Error al bloquear usuario en SAP",
  "date": "2026-03-12",
  "time": "17:57:40"
}
```

### Notas técnicas
- Usa `BAPI_USER_LOCK` directo a `SISSSAPOperation`.
- Extrae status desde tablas:
  - `BAPI_USER_LOCK.ISCuResponse`
  - `BAPI_USER_LOCK.RETURN`

## 4) POST /unlock
Desbloquea usuario SAP.

### Body
```json
{"username":"ADMISIONURG"}
```

### Response éxito
```json
{
  "success": 1,
  "code": "USER_UNLOCKED",
  "username": "ADMISIONURG",
  "message": "Usuario desbloqueado exitosamente",
  "date": "2026-03-12",
  "time": "17:58:10"
}
```

### Response error
```json
{
  "success": 0,
  "code": "USER_UNLOCK_ERROR",
  "error": "Error al desbloquear usuario en SAP",
  "date": "2026-03-12",
  "time": "17:58:40"
}
```

### Notas técnicas
- Usa `BAPI_USER_UNLOCK` directo a `SISSSAPOperation`.
- Extrae status desde tablas:
  - `BAPI_USER_UNLOCK.ISCuResponse`
  - `BAPI_USER_UNLOCK.RETURN`

## Errores comunes
- `USERNAME es requerido en el body JSON`: body vacío o inválido.
- `SISSSAPOperation no devolvio respuesta`: problema de host/operation o timeout SAP.
- `ErrBusinessDispatchNameNotRegistered`: producción activa no corresponde al host esperado.

## Pruebas rápidas
```bash
# Listar
curl -u "user:pass" "http://<host>/api/users/list?maxRows=20"

# Listar con filtro
curl -u "user:pass" "http://<host>/api/users/list?maxRows=20&usernameFilter=ADMI*"

# Check
curl -u "user:pass" -X POST "http://<host>/api/users/check" \
  -H "Content-Type: application/json" \
  -d '{"username":"ADMISIONURG"}'

# Lock
curl -u "user:pass" -X POST "http://<host>/api/users/lock" \
  -H "Content-Type: application/json" \
  -d '{"username":"ADMISIONURG"}'

# Unlock
curl -u "user:pass" -X POST "http://<host>/api/users/unlock" \
  -H "Content-Type: application/json" \
  -d '{"username":"ADMISIONURG"}'
```
