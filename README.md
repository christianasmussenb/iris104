# POC01 - Sistema de Gestión de Usuarios SAP

## 📋 Descripción General

Sistema integral de gestión de usuarios SAP que permite listar, verificar existencia, bloquear y desbloquear usuarios en SAP mediante BAPIs, utilizando InterSystems IRIS como plataforma de integración y SAP JCo 3.1 como conector Java.

**Tecnologías:**
- InterSystems IRIS 2024.1+ / Ensemble
- SAP JCo 3.1 (sapjco3.jar)
- Java Runtime Environment (JRE 1.8.0_461)
- SAP System: cnetdev (Client 600, System 00, Language ES, R3 Name CNQ)

## 🏗️ Arquitectura del Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                        Frontend Web (CSP)                        │
│                 POC01.Web.UserManagementPage.cls                 │
│                   (HTML + CSS + JavaScript)                      │
└────────────────────────────┬────────────────────────────────────┘
                             │ HTTP/REST
┌────────────────────────────▼────────────────────────────────────┐
│                      REST API Service                            │
│              POC01.API.UserManagementService.cls                 │
│              (Extends %CSP.REST, Ens.BusinessService)            │
│  Endpoints: /list, /check, /lock, /unlock                       │
└────────────────────────────┬────────────────────────────────────┘
                             │ EnsLib.Testing.Service
┌────────────────────────────▼────────────────────────────────────┐
│                    Business Processes (BPL)                      │
│  ┌──────────────┐  ┌──────────────┐  ┌────────┐  ┌──────────┐  │
│  │GetUserListBP │  │CheckUserBP   │  │LockBP  │  │UnlockBP  │  │
│  │.cls          │  │ExistenceBP   │  │.cls    │  │.cls      │  │
│  └──────────────┘  └──────────────┘  └────────┘  └──────────┘  │
└────────────────────────────┬────────────────────────────────────┘
                             │ Ens.Request/Response
┌────────────────────────────▼────────────────────────────────────┐
│                    Business Operation                            │
│                 POC01.BO.SAPOperation.cls                        │
│           (Extends EnsLib.JavaGateway.Operation)                 │
└────────────────────────────┬────────────────────────────────────┘
                             │ Java Gateway
┌────────────────────────────▼────────────────────────────────────┐
│                    Java Gateway Service                          │
│              POC01.Services.JavaGatewayService                   │
│                    (Port 55558)                                  │
└────────────────────────────┬────────────────────────────────────┘
                             │ SAP JCo 3.1
┌────────────────────────────▼────────────────────────────────────┐
│                        SAP System                                │
│                    cnetdev (172.10.250.3)                        │
│              BAPIs: BAPI_USER_GETLIST, etc.                      │
└──────────────────────────────────────────────────────────────────┘
```

## 📁 Estructura del Proyecto

```
POC01/
├── README.md                          # Este archivo
├── API.md                             # Documentación de APIs
├── SPRINTS.md                         # Planificación Sprints 8-10
│
├── BO/                                # Business Operations
│   └── SAPOperation.cls               # Operación SAP via Java Gateway
│
├── BP/                                # Business Processes (BPL)
│   ├── GetUserListBP.cls              # Listar usuarios SAP
│   ├── CheckUserExistenceBP.cls       # Verificar existencia de usuario
│   ├── LockUserBP.cls                 # Bloquear usuario
│   └── UnlockUserBP.cls               # Desbloquear usuario
│
├── Messages/                          # Clases de mensajes
│   ├── BAPI.USER.GETLIST.ISCuRequest.cls
│   ├── BAPI.USER.EXISTENCE.CHECK.ISCuRequest.cls
│   ├── BAPI.USER.LOCK.ISCuRequest.cls
│   └── BAPI.USER.UNLOCK.ISCuRequest.cls
│
├── API/                               # REST API
│   └── UserManagementService.cls      # Servicio REST principal
│
├── Services/                          # Servicios Gateway
│   ├── JavaGatewayService.cls         # Gateway principal (55558)
│   └── JavaGatewayMYSISSService.cls   # Gateway secundario (55556)
│
├── Web/                               # Frontend
│   └── UserManagementPage.cls         # Página CSP web
│
├── Utils/                             # Utilidades
│   ├── CompileAll.cls                 # Compilar todo el proyecto
│   ├── ImportAll.cls                  # Importar clases
│   └── TestGetUserList.cls            # Tests unitarios
│
└── PROD01.cls                         # Production configuration
```

## 🔧 Componentes Principales

### 1. Java Gateway Service
**Archivo:** `POC01.Services.JavaGatewayService.cls`
- **Puerto:** 55558
- **JavaHome:** /Library/Java/JavaVirtualMachines/jre-1.8.jdk/Contents/Home
- **ClassPath:** /usr/local/sapjco3/sapjco3.jar
- **Función:** Conexión con SAP mediante JCo 3.1

### 2. Business Operation - SAPOperation
**Archivo:** `POC01.BO.SAPOperation.cls`
- Extiende: `EnsLib.JavaGateway.Operation`
- Ejecuta BAPIs en SAP
- Transforma respuestas SAP a formato JSON

### 3. Business Processes (BPL)
Todos extienden `Ens.BusinessProcessBPL`:

**GetUserListBP.cls**
- BAPI: `BAPI_USER_GETLIST`
- Input: maxRows, WITHuUSERNAME
- Output: JSON array con usuarios

**CheckUserExistenceBP.cls**
- BAPI: `BAPI_USER_EXISTENCE_CHECK`
- Input: USERNAME
- Output: JSON con exists boolean

**LockUserBP.cls**
- BAPI: `BAPI_USER_LOCK`
- Input: USERNAME
- Output: JSON con success/error

**UnlockUserBP.cls**
- BAPI: `BAPI_USER_UNLOCK`
- Input: USERNAME
- Output: JSON con success/error

### 4. REST API Service
**Archivo:** `POC01.API.UserManagementService.cls`
- Extiende: `%CSP.REST` y `Ens.BusinessService`
- Base URL: `/api/users`

**Endpoints:**
- `GET /list?maxRows=20` - Listar usuarios
- `POST /check` - Verificar usuario
- `POST /lock` - Bloquear usuario
- `POST /unlock` - Desbloquear usuario

### 5. Frontend Web
**Archivo:** `POC01.Web.UserManagementPage.cls`
- Página CSP nativa (%CSP.Page)
- URL: `http://iriscnet/irisestandar/csp/demo/POC01.Web.UserManagementPage.cls`
- Interfaz responsive con 4 pestañas
- JavaScript para consumir API REST

## 🚀 Configuración y Despliegue

### Prerequisitos
1. InterSystems IRIS 2024.1+
2. Java Runtime Environment (JRE 1.8)
3. SAP JCo 3.1 instalado en `/usr/local/sapjco3/`
4. Acceso al sistema SAP cnetdev

### Instalación

**1. Compilar clases:**
```objectscript
do $system.OBJ.CompilePackage("POC01", "cuk")
```

**2. Iniciar Production:**
```objectscript
set sc = ##class(Ens.Director).StartProduction("POC01.PROD01")
```

**3. Verificar Java Gateway:**
- Management Portal → Interoperability → Configure → Java Gateway Settings
- Estado: Connected (Port 55558)

**4. Configurar Web Application:**
- Ya configurada en `/api/users` para REST API
- CSP pages accesibles en `/csp/demo/`

### Configuración SAP
**Conexión SAP (en SAPOperation):**
- Host: 172.10.250.3
- Client: 600
- System Number: 00
- Language: ES
- User/Password: Configurados en Production

## 🧪 Testing

### Pruebas con curl

**1. Listar Usuarios:**
```bash
curl -u "usuario:password" -X GET "http://iriscnet/api/users/list?maxRows=5"
```

**2. Verificar Usuario:**
```bash
curl -u "usuario:password" -X POST http://iriscnet/api/users/check \
  -H "Content-Type: application/json" \
  -d '{"username":"ADSUSER"}'
```

**3. Bloquear Usuario:**
```bash
curl -u "usuario:password" -X POST http://iriscnet/api/users/lock \
  -H "Content-Type: application/json" \
  -d '{"username":"TESTUSER"}'
```

**4. Desbloquear Usuario:**
```bash
curl -u "usuario:password" -X POST http://iriscnet/api/users/unlock \
  -H "Content-Type: application/json" \
  -d '{"username":"TESTUSER"}'
```

### Resultados de Pruebas Exitosas

✅ **GetUserListBP**: 233 usuarios retornados (limitados a 20)
✅ **CheckUserExistenceBP**: ADSUSER verificado correctamente
✅ **LockUserBP**: ADSUSER bloqueado exitosamente
✅ **UnlockUserBP**: ADSUSER desbloqueado exitosamente
✅ **REST API**: Todos los endpoints funcionando
✅ **Frontend Web**: Interfaz responsive operativa

## 📊 Monitoreo

### Message Viewer
- Management Portal → Interoperability → Messages
- Ver flujo completo de mensajes entre componentes
- Verificar tiempos de respuesta y errores

### Logs del Sistema
- Management Portal → System Operation → System Logs → Application Error Log
- Revisar errores de Java Gateway
- Validar conexiones SAP

## 🔒 Seguridad

- Autenticación HTTP Basic en REST API
- Autenticación HTTP en páginas CSP
- Credenciales SAP almacenadas en Production (encriptadas)
- Web Application configurada con Password authentication

## 📈 Métricas de Rendimiento

- Tiempo promedio de respuesta BAPI: ~1-2 segundos
- Capacidad: 100+ requests/minuto
- Máximo usuarios por consulta: 100

## 🐛 Troubleshooting

### Java Gateway no conecta
```objectscript
// Verificar puerto
do ##class(%Net.Remote.Service).StopGateway(55558)
do ##class(%Net.Remote.Service).StartGateway(55558)
```

### Error en BAPI
- Verificar credenciales SAP en Production
- Revisar conectividad: `ping 172.10.250.3`
- Validar parámetros de entrada en Message Viewer

### Frontend no carga
- Verificar compilación: `do $system.OBJ.Compile('POC01.Web.UserManagementPage','cuk')`
- Verificar Web Application `/csp/demo/` está habilitada
- Revisar permisos de usuario

## 👥 Autores

- Christian Asmussen B.
- Proyecto: POC01 - SAP User Management System
- Fecha: Noviembre 2025

## 📝 Licencia

Uso interno - Organización

## 🔄 Próximos Pasos

Ver archivo `SPRINTS.md` para planificación detallada de Sprints 8-10.
