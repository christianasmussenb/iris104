# POC01 - Sistema de Gestión de Usuarios SAP

Este proyecto proporciona una solución completa para la gestión de usuarios SAP a través de una interfaz web moderna, utilizando InterSystems IRIS/Ensemble como plataforma de integración.

## 🎯 Objetivo del Proyecto

Desarrollar una aplicación web simple y eficaz que permita:
- **Listar usuarios** SAP con sus datos básicos
- **Verificar existencia** de usuarios específicos
- **Bloquear (Lock)** usuarios en el sistema SAP
- **Desbloquear (Unlock)** usuarios en el sistema SAP

## 🏗️ Arquitectura de la Solución

```
┌─────────────────────────────────────────────────────────────┐
│                    CAPA DE PRESENTACIÓN                     │
│                      (Frontend Web)                         │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  index.html + app.js + styles.css                    │  │
│  │  - Interfaz usuario simple                           │  │
│  │  - JavaScript vanilla (sin frameworks)               │  │
│  │  - Llamadas AJAX/Fetch a APIs REST                   │  │
│  └──────────────────────────────────────────────────────┘  │
└───────────────────────────┬─────────────────────────────────┘
                            │ HTTP/REST
┌───────────────────────────▼─────────────────────────────────┐
│                    CAPA DE API REST                         │
│              (InterSystems IRIS REST Service)               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  POC01.API.UserManagementService                     │  │
│  │  ├─ GET  /api/users/list      → Listar usuarios     │  │
│  │  ├─ POST /api/users/check     → Verificar usuario   │  │
│  │  ├─ POST /api/users/lock      → Bloquear usuario    │  │
│  │  └─ POST /api/users/unlock    → Desbloquear usuario │  │
│  └──────────────────────────────────────────────────────┘  │
└───────────────────────────┬─────────────────────────────────┘
                            │ Ens.Request/Response
┌───────────────────────────▼─────────────────────────────────┐
│              CAPA DE ORQUESTACIÓN (Business Logic)          │
│                 (Business Processes - BPL)                  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  POC01.BP.GetUserListBP                              │  │
│  │  - Transforma HTTP Request → BAPI Request            │  │
│  │  - Llama a SAPOperation                              │  │
│  │  - Transforma BAPI Response → JSON Response          │  │
│  ├──────────────────────────────────────────────────────┤  │
│  │  POC01.BP.CheckUserExistenceBP                       │  │
│  │  POC01.BP.LockUserBP                                 │  │
│  │  POC01.BP.UnlockUserBP                               │  │
│  └──────────────────────────────────────────────────────┘  │
└───────────────────────────┬─────────────────────────────────┘
                            │ BAPI Request/Response
┌───────────────────────────▼─────────────────────────────────┐
│                  CAPA DE INTEGRACIÓN SAP                    │
│             (Business Operation + Java Gateway)             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  POC01.BO.SAPOperation                               │  │
│  │  - Ejecuta BAPIs SAP via JCo                         │  │
│  │  - Gestiona conexión SAP                             │  │
│  │  - Usa JavaGatewayService (puerto 55558)            │  │
│  └──────────────────────────────────────────────────────┘  │
└───────────────────────────┬─────────────────────────────────┘
                            │ RFC/JCo
┌───────────────────────────▼─────────────────────────────────┐
│                      SISTEMA SAP                            │
│                     (cnetdev:00)                            │
│  - BAPI_USER_GETLIST                                        │
│  - BAPI_USER_EXISTENCE_CHECK                                │
│  - BAPI_USER_LOCK                                           │
│  - BAPI_USER_UNLOCK                                         │
└─────────────────────────────────────────────────────────────┘
```

## 📁 Estructura de Carpetas

```
POC01/
├── API/                    # REST Services (endpoints web)
│   └── UserManagementService.cls
├── BP/                     # Business Processes (lógica de orquestación)
│   ├── GetUserListBP.cls
│   ├── CheckUserExistenceBP.cls
│   ├── LockUserBP.cls
│   └── UnlockUserBP.cls
├── BO/                     # Business Operations (integración SAP)
│   └── SAPOperation.cls
├── BAPI/                   # Clases de mensaje BAPI (generadas)
│   └── USER/
│       ├── GETLIST/
│       ├── EXISTENCE/CHECK/
│       ├── LOCK/
│       └── UNLOCK/
├── Services/               # Servicios auxiliares (Java Gateway)
│   ├── JavaGatewayService.cls
│   └── JavaGatewayMYSISSService.cls
├── Web/                    # Aplicación web frontend
│   ├── index.html          # Página principal
│   ├── app.js              # Lógica JavaScript
│   └── styles.css          # Estilos CSS
└── Utils/                  # Utilidades de desarrollo
    ├── ImportAll.cls
    ├── CompileAll.cls
    └── BasicTest.cls
```

## 🔌 APIs REST Disponibles

La aplicación expone los siguientes endpoints REST:

### 1. Listar Usuarios
```http
GET /api/users/list
```
**Response:**
```json
{
  "success": true,
  "data": [
    {
      "username": "USUARIO01",
      "firstname": "Juan",
      "lastname": "Pérez",
      "fullname": "Juan Pérez"
    }
  ],
  "count": 100
}
```

### 2. Verificar Existencia de Usuario
```http
POST /api/users/check
Content-Type: application/json

{
  "username": "USUARIO01"
}
```
**Response:**
```json
{
  "success": true,
  "exists": true,
  "username": "USUARIO01"
}
```

### 3. Bloquear Usuario
```http
POST /api/users/lock
Content-Type: application/json

{
  "username": "USUARIO01"
}
```
**Response:**
```json
{
  "success": true,
  "message": "Usuario bloqueado exitosamente"
}
```

### 4. Desbloquear Usuario
```http
POST /api/users/unlock
Content-Type: application/json

{
  "username": "USUARIO01"
}
```
**Response:**
```json
{
  "success": true,
  "message": "Usuario desbloqueado exitosamente"
}
```

## 🧩 Componentes Implementados

### APIs REST (API/)
- **POC01.API.UserManagementService**: Servicio REST que expone los 4 endpoints principales

### Business Processes (BP/)
- **POC01.BP.GetUserListBP**: Orquesta la llamada a BAPI_USER_GETLIST
- **POC01.BP.CheckUserExistenceBP**: Orquesta BAPI_USER_EXISTENCE_CHECK
- **POC01.BP.LockUserBP**: Orquesta BAPI_USER_LOCK
- **POC01.BP.UnlockUserBP**: Orquesta BAPI_USER_UNLOCK

### Business Operations (BO/)
- **POC01.BO.SAPOperation**: Operación SAP que ejecuta BAPIs via JCo

### Clases BAPI (BAPI/USER/)
- **GETLIST**: Request/Response para listar usuarios SAP
- **EXISTENCE/CHECK**: Request/Response para verificar existencia
- **LOCK**: Request/Response para bloquear usuarios
- **UNLOCK**: Request/Response para desbloquear usuarios

### Servicios (Services/)
- **POC01.Services.JavaGatewayService**: Java Gateway principal (puerto 55558)
- **POC01.Services.JavaGatewayMYSISSService**: Java Gateway secundario (puerto 55556)

### Frontend Web (Web/)
- **index.html**: Interfaz de usuario simple y moderna
- **app.js**: Lógica JavaScript para consumir APIs
- **styles.css**: Estilos CSS minimalistas

### Utilidades (Utils/)
- **POC01.Utils.ImportAll**: Script de importación automática
- **POC01.Utils.CompileAll**: Script de compilación en orden correcto
- **POC01.Utils.BasicTest**: Tests básicos de funcionalidad

## 🚀 Plan de Implementación

El desarrollo sigue un enfoque modular y estructurado:

### Fase 1: Capa de Orquestación (Business Processes)
**Objetivo:** Crear 4 Business Processes que orquestan las llamadas a SAP

1. **GetUserListBP.cls**
   - Recibe petición HTTP
   - Crea `BAPI.USER.GETLIST.ISCuRequest`
   - Llama a `POC01.BO.SAPOperation`
   - Procesa `BAPI.USER.GETLIST.ISCuResponse`
   - Devuelve JSON con lista de usuarios

2. **CheckUserExistenceBP.cls**
   - Recibe username desde HTTP
   - Crea `BAPI.USER.EXISTENCE.CHECK.ISCuRequest`
   - Llama a `POC01.BO.SAPOperation`
   - Procesa respuesta y devuelve JSON (exists: true/false)

3. **LockUserBP.cls**
   - Recibe username desde HTTP
   - Crea `BAPI.USER.LOCK.ISCuRequest`
   - Llama a `POC01.BO.SAPOperation`
   - Devuelve resultado de la operación

4. **UnlockUserBP.cls**
   - Recibe username desde HTTP
   - Crea `BAPI.USER.UNLOCK.ISCuRequest`
   - Llama a `POC01.BO.SAPOperation`
   - Devuelve resultado de la operación

### Fase 2: Capa de API REST
**Objetivo:** Exponer endpoints HTTP que invocan los Business Processes

**UserManagementService.cls** extiende `%CSP.REST`
- Define UrlMap para routing
- Implementa métodos HTTP (GET/POST)
- Valida parámetros de entrada
- Maneja errores y respuestas

### Fase 3: Configuración de Production
**Objetivo:** Registrar todos los componentes en PROD01

- Agregar 4 Business Processes a la Production
- Agregar REST Service a la Production
- Configurar rutas y dependencias
- Habilitar componentes

### Fase 4: Frontend Web
**Objetivo:** Crear interfaz web simple y funcional

**index.html:**
- 4 secciones: Lista, Verificar, Lock, Unlock
- Formularios simples para input
- Tablas para mostrar resultados

**app.js:**
- Funciones `fetch()` para cada API
- Manejo de respuestas y errores
- Actualización dinámica del DOM

**styles.css:**
- Diseño limpio y responsivo
- Colores corporativos
- Feedback visual claro

## ⚙️ Configuración del Servidor

### Conexión IRIS
- **Host**: iriscnet (172.10.250.26)
- **Puerto**: 80
- **Namespace**: DEMO
- **Path**: /irisestandar

### Configuraciones SAP
- **Cliente**: 600
- **Host**: cnetdev
- **Sistema**: 00
- **Idioma**: ES
- **R3 Name**: CNQ
- **Gateway**: 3300

## 📦 Instalación y Despliegue

### Prerequisitos
- InterSystems IRIS 2024.1+
- Java Runtime Environment (JRE 1.8+)
- SAP JCo 3.1 (sapjco3.jar)
- Acceso a sistema SAP (cnetdev)

### Paso 1: Importación del Código

#### Opción A: Importación Automática (Recomendado)
```objectscript
// En el terminal de IRIS namespace DEMO:
do ##class(POC01.Utils.ImportAll).ImportDir("/Users/Nuevo/VSCODE/iris104/POC01")
```

#### Opción B: Importación Manual
```objectscript
// En el terminal de IRIS namespace DEMO:
do $system.OBJ.ImportDir("/Users/Nuevo/VSCODE/iris104/POC01", "*.cls", "ck", .errors, 1)
```

### Paso 2: Compilación del Proyecto

```objectscript
// Compilar todos los componentes en orden:
do ##class(POC01.Utils.CompileAll).CompileAll()
```

#### Orden de Compilación Manual (si es necesario)

1. **Clases BAPI (mensajes base):**
   ```objectscript
   do $system.OBJ.Compile("BAPI.USER.GETLIST.ISCuRequest.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.GETLIST.ISCuResponse.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.EXISTENCE.CHECK.ISCuRequest.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.EXISTENCE.CHECK.ISCuResponse.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.LOCK.ISCuRequest.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.LOCK.ISCuResponse.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.UNLOCK.ISCuRequest.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.UNLOCK.ISCuResponse.cls","cuk")
   ```

2. **Servicios Java Gateway:**
   ```objectscript
   do $system.OBJ.Compile("POC01.Services.JavaGatewayService.cls","cuk")
   do $system.OBJ.Compile("POC01.Services.JavaGatewayMYSISSService.cls","cuk")
   ```

3. **Business Operations:**
   ```objectscript
   do $system.OBJ.Compile("POC01.BO.SAPOperation.cls","cuk")
   ```

4. **Business Processes:**
   ```objectscript
   do $system.OBJ.Compile("POC01.BP.GetUserListBP.cls","cuk")
   do $system.OBJ.Compile("POC01.BP.CheckUserExistenceBP.cls","cuk")
   do $system.OBJ.Compile("POC01.BP.LockUserBP.cls","cuk")
   do $system.OBJ.Compile("POC01.BP.UnlockUserBP.cls","cuk")
   ```

5. **REST Service:**
   ```objectscript
   do $system.OBJ.Compile("POC01.API.UserManagementService.cls","cuk")
   ```

### Paso 3: Configurar la Production

1. Abrir Management Portal: `http://iriscnet/csp/sys/UtilHome.csp`
2. Navegar a: **Interoperability > Configure > Production**
3. Abrir producción: **POC01.PROD01**
4. Verificar que estén habilitados:
   - ✅ POC01.Services.JavaGatewayService
   - ✅ POC01.BO.SAPOperation
   - ✅ POC01.BP.GetUserListBP
   - ✅ POC01.BP.CheckUserExistenceBP
   - ✅ POC01.BP.LockUserBP
   - ✅ POC01.BP.UnlockUserBP
   - ✅ POC01.API.UserManagementService

### Paso 4: Configurar la Aplicación Web

1. En Management Portal: **System Administration > Security > Applications > Web Applications**
2. Crear nueva aplicación web:
   - **Name**: `/api/users`
   - **Namespace**: DEMO
   - **REST Class**: POC01.API.UserManagementService
   - **Authentication**: Password
   - **Allowed**: Enabled

### Paso 5: Desplegar el Frontend

Copiar archivos `Web/` a un servidor web o servir desde IRIS:
```bash
# Opción 1: Usar IRIS CSP
cp Web/* /opt/intersystems/iris/csp/demo/users/

# Opción 2: Servidor web externo (nginx, apache)
cp Web/* /var/www/html/sap-users/
```

## ✅ Verificación y Testing

### 1. Verificar Compilación
```objectscript
do ##class(POC01.Utils.CompileAll).VerifyClasses()
```

### 2. Verificar Production Activa
```objectscript
// Comprobar estado de la producción
write ##class(Ens.Director).IsProductionRunning("POC01.PROD01")
// Debería retornar: 1 (activo)

// Iniciar producción si no está activa
do ##class(Ens.Director).StartProduction("POC01.PROD01")
```

### 3. Test de Endpoints REST

#### Test: Listar Usuarios
```bash
curl -X GET http://iriscnet/api/users/list \
  -u "usuario:password"
```

#### Test: Verificar Usuario
```bash
curl -X POST http://iriscnet/api/users/check \
  -H "Content-Type: application/json" \
  -u "usuario:password" \
  -d '{"username":"USUARIO01"}'
```

#### Test: Bloquear Usuario
```bash
curl -X POST http://iriscnet/api/users/lock \
  -H "Content-Type: application/json" \
  -u "usuario:password" \
  -d '{"username":"USUARIO01"}'
```

#### Test: Desbloquear Usuario
```bash
curl -X POST http://iriscnet/api/users/unlock \
  -H "Content-Type: application/json" \
  -u "usuario:password" \
  -d '{"username":"USUARIO01"}'
```

### 4. Test desde Frontend

Abrir en navegador:
```
http://iriscnet/csp/demo/users/index.html
```

### 5. Monitoreo y Logs

Revisar mensajes en Management Portal:
```
Interoperability > Monitor > Messages
```

Filtrar por:
- **Source**: POC01.API.UserManagementService
- **Target**: POC01.BP.*
- **Time**: Últimos 30 minutos

## 🔧 Troubleshooting

### Error: "Java Gateway no responde"
**Solución:**
1. Verificar que Java Home esté correcto
2. Verificar ruta a sapjco3.jar
3. Reiniciar Java Gateway desde Management Portal
4. Verificar puerto 55558 disponible

### Error: "Connection refused to SAP"
**Solución:**
1. Verificar conectividad de red: `ping cnetdev`
2. Verificar credenciales SAP
3. Verificar que puerto 3300 (gateway) esté accesible
4. Revisar logs de SAP Operation

### Error: "Class does not exist"
**Solución:**
1. Compilar en orden correcto (ver sección Compilación)
2. Verificar namespace correcto (DEMO)
3. Ejecutar: `do ##class(POC01.Utils.CompileAll).CompileAll()`

### Error: 404 en endpoints REST
**Solución:**
1. Verificar que Web Application `/api/users` esté creada
2. Verificar que REST Class apunte a: `POC01.API.UserManagementService`
3. Verificar que Production esté activa
4. Revisar logs de Management Portal

### Frontend no se conecta a APIs
**Solución:**
1. Verificar CORS si frontend está en dominio diferente
2. Revisar console del navegador (F12) para errores
3. Verificar autenticación en requests
4. Probar endpoints con curl primero

## 📚 Recursos Adicionales

### Documentación IRIS
- [REST Service Development](https://docs.intersystems.com/iris/latest/csp/docbook/DocBook.UI.Page.cls?KEY=GREST)
- [Business Process (BPL)](https://docs.intersystems.com/iris/latest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_bpl)
- [SAP Adapter](https://docs.intersystems.com/iris/latest/csp/docbook/DocBook.UI.Page.cls?KEY=ESAP)

### BAPI SAP Utilizados
- **BAPI_USER_GETLIST**: Lista todos los usuarios del sistema
- **BAPI_USER_EXISTENCE_CHECK**: Verifica si un usuario existe
- **BAPI_USER_LOCK**: Bloquea un usuario (impide login)
- **BAPI_USER_UNLOCK**: Desbloquea un usuario

## 🎨 Características del Frontend

### Interfaz de Usuario
- ✅ **Diseño responsive**: Funciona en desktop y móvil
- ✅ **Sin dependencias**: JavaScript vanilla, sin frameworks
- ✅ **Feedback visual**: Loading states, mensajes de éxito/error
- ✅ **Tabla interactiva**: Lista de usuarios con scroll
- ✅ **Formularios simples**: Inputs con validación básica

### Funcionalidades
- 🔍 **Búsqueda**: Filtro de usuarios en tabla
- 📊 **Contador**: Muestra cantidad de usuarios
- 🔄 **Refresh**: Botón para recargar lista
- ⚡ **Operaciones rápidas**: Lock/Unlock desde la tabla
- 🎯 **Verificación**: Check de existencia con feedback inmediato

## 🔒 Seguridad

### Consideraciones
- ✅ Autenticación requerida para todos los endpoints
- ✅ Validación de entrada en Business Processes
- ✅ Manejo de errores sin exponer detalles internos
- ✅ Logs de auditoría en Management Portal
- ⚠️ **Recomendado**: Implementar HTTPS en producción
- ⚠️ **Recomendado**: Agregar rate limiting

## 📝 Notas Importantes

### Desarrollo
- ✅ Todos los archivos validados y listos para compilación
- ✅ Arquitectura modular y extensible
- ✅ Separación clara de responsabilidades
- ✅ Fácil de mantener y evolucionar

### Configuración
- ⚙️ Las rutas de Java y JAR deben ajustarse según el servidor
- ⚙️ Los credenciales SAP deben configurarse apropiadamente
- ⚙️ La estructura soporta extensión para nuevos BAPIs
- ⚙️ Frontend puede servirse desde IRIS CSP o servidor externo

### Producción
- 🚀 Production debe estar activa antes de usar la aplicación
- 🚀 Java Gateway debe iniciarse primero
- 🚀 Verificar conectividad SAP antes de desplegar
- 🚀 Monitorear logs regularmente

## 🤝 Contribución y Soporte

Para reportar problemas o sugerir mejoras:
1. Revisar logs en Management Portal
2. Verificar troubleshooting en este README
3. Documentar el error con detalles específicos
4. Incluir información del ambiente (versión IRIS, SAP, etc.)

---

**Desarrollado para:** InterSystems IRIS/Ensemble + SAP JCo  
**Namespace:** DEMO  
**Production:** POC01.PROD01  
**Versión:** 1.0.0