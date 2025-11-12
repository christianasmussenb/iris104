# API Documentation - POC01 User Management

## Base URL
```
http://iriscnet/api/users
```

## Authentication
All endpoints require HTTP Basic Authentication with IRIS credentials.

## Endpoints

---

### 1. GET /list - Listar Usuarios SAP

Obtiene una lista de usuarios del sistema SAP.

**Request:**
```http
GET /api/users/list?maxRows=20
Authorization: Basic <base64(username:password)>
```

**Query Parameters:**
| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| maxRows | integer | No | 20 | Número máximo de usuarios a retornar (1-100) |

**Response Success (200):**
```json
{
  "success": 1,
  "count": 5,
  "data": [
    {
      "username": "ADSUSER",
      "firstname": "",
      "lastname": "ADSUSER",
      "fullname": "ADSUSER"
    },
    {
      "username": "AGUIGUS",
      "firstname": "QRTGUSTAVO",
      "lastname": "QRTAGUIRRE",
      "fullname": "QRTGUSTAVO QRTAGUIRRE"
    }
  ]
}
```

**Response Error:**
```json
{
  "success": 0,
  "error": "Descripción del error"
}
```

**Ejemplo curl:**
```bash
curl -u "usuario:password" -X GET \
  "http://iriscnet/api/users/list?maxRows=5"
```

---

### 2. POST /check - Verificar Existencia de Usuario

Verifica si un usuario existe en el sistema SAP.

**Request:**
```http
POST /api/users/check
Authorization: Basic <base64(username:password)>
Content-Type: application/json

{
  "username": "ADSUSER"
}
```

**Request Body:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| username | string | Yes | Nombre de usuario SAP (se convierte a mayúsculas) |

**Response Success (200) - Usuario Existe:**
```json
{
  "success": 1,
  "exists": 1,
  "username": "ADSUSER",
  "message": "El usuario ADSUSER existe"
}
```

**Response Success (200) - Usuario No Existe:**
```json
{
  "success": 1,
  "exists": 0,
  "username": "NOEXISTE",
  "message": "El usuario NOEXISTE no existe"
}
```

**Response Error:**
```json
{
  "success": 0,
  "error": "USERNAME es requerido en el body JSON"
}
```

**Ejemplo curl:**
```bash
curl -u "usuario:password" -X POST http://iriscnet/api/users/check \
  -H "Content-Type: application/json" \
  -d '{"username":"ADSUSER"}'
```

---

### 3. POST /lock - Bloquear Usuario

Bloquea un usuario en el sistema SAP.

**Request:**
```http
POST /api/users/lock
Authorization: Basic <base64(username:password)>
Content-Type: application/json

{
  "username": "TESTUSER"
}
```

**Request Body:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| username | string | Yes | Nombre de usuario SAP a bloquear |

**Response Success (200):**
```json
{
  "success": 1,
  "username": "TESTUSER",
  "message": "Usuario bloqueado exitosamente"
}
```

**Response Error - Usuario No Existe:**
```json
{
  "success": 0,
  "username": "TESTUSER",
  "error": "El usuario TESTUSER no existe"
}
```

**Response Error - Otro Error:**
```json
{
  "success": 0,
  "username": "TESTUSER",
  "error": "Descripción del error SAP"
}
```

**Ejemplo curl:**
```bash
curl -u "usuario:password" -X POST http://iriscnet/api/users/lock \
  -H "Content-Type: application/json" \
  -d '{"username":"TESTUSER"}'
```

---

### 4. POST /unlock - Desbloquear Usuario

Desbloquea un usuario previamente bloqueado en SAP.

**Request:**
```http
POST /api/users/unlock
Authorization: Basic <base64(username:password)>
Content-Type: application/json

{
  "username": "TESTUSER"
}
```

**Request Body:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| username | string | Yes | Nombre de usuario SAP a desbloquear |

**Response Success (200):**
```json
{
  "success": 1,
  "username": "TESTUSER",
  "message": "Usuario desbloqueado exitosamente"
}
```

**Response Error - Usuario No Existe:**
```json
{
  "success": 0,
  "username": "TESTUSER",
  "error": "El usuario TESTUSER no existe"
}
```

**Response Error - Otro Error:**
```json
{
  "success": 0,
  "username": "TESTUSER",
  "error": "Descripción del error SAP"
}
```

**Ejemplo curl:**
```bash
curl -u "usuario:password" -X POST http://iriscnet/api/users/unlock \
  -H "Content-Type: application/json" \
  -d '{"username":"TESTUSER"}'
```

---

## Error Codes

| HTTP Code | Description |
|-----------|-------------|
| 200 | Success (incluso si success=0 en JSON) |
| 401 | Unauthorized - credenciales inválidas |
| 500 | Internal Server Error |

## Rate Limiting

No hay límite de rate implementado actualmente. Capacidad estimada: 100+ requests/minuto.

## BAPIs Utilizados

| Endpoint | BAPI SAP |
|----------|----------|
| /list | BAPI_USER_GETLIST |
| /check | BAPI_USER_EXISTENCE_CHECK |
| /lock | BAPI_USER_LOCK |
| /unlock | BAPI_USER_UNLOCK |

## Notas Técnicas

1. **Autenticación**: Se requiere usuario IRIS válido con permisos en namespace DEMO
2. **Timeout**: Timeout de 30 segundos en llamadas a BPs
3. **Encoding**: UTF-8 para todos los requests/responses
4. **Username**: Automáticamente convertido a mayúsculas
5. **Transacciones SAP**: No requiere BAPI_TRANSACTION_COMMIT (auto-commit en BAPIs de usuario)

## Testing con Postman

**Configuración:**
1. Authorization → Basic Auth → Ingresar credenciales IRIS
2. Headers → Content-Type: application/json
3. Body → raw → JSON

**Collection de ejemplo:**
```json
{
  "info": {
    "name": "POC01 - SAP User Management",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "List Users",
      "request": {
        "method": "GET",
        "url": "http://iriscnet/api/users/list?maxRows=10"
      }
    },
    {
      "name": "Check User",
      "request": {
        "method": "POST",
        "url": "http://iriscnet/api/users/check",
        "body": {
          "mode": "raw",
          "raw": "{\"username\":\"ADSUSER\"}"
        }
      }
    }
  ]
}
```

## Frontend Integration

El frontend web (`POC01.Web.UserManagementPage.cls`) consume esta API usando `fetch()`:

```javascript
const response = await fetch('/api/users/list?maxRows=20', {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json'
  }
});
const data = await response.json();
```

La autenticación se maneja automáticamente por la sesión HTTP del navegador.
