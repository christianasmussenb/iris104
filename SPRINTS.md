# Sprint Planning - POC01 (Sprints 8-10)

## Estado Actual del Proyecto

### ✅ Completado (Sprints 1-7)

**Sprint 1: Infraestructura Base**
- ✅ Java Gateway configurado (Port 55558)
- ✅ SAP Operation creada y probada
- ✅ Clases de mensajes BAPI definidas
- ✅ Conexión SAP verificada

**Sprint 2: GetUserListBP**
- ✅ Business Process implementado
- ✅ Transformación JSON correcta
- ✅ Pruebas exitosas (233 usuarios, limitado a 20)

**Sprint 3: CheckUserExistenceBP**
- ✅ Business Process implementado
- ✅ Validación de usuario funcional
- ✅ Mensajes de error manejados

**Sprint 4: LockUserBP y UnlockUserBP**
- ✅ Ambos BPs implementados
- ✅ Pruebas exitosas en usuario ADSUSER
- ✅ Manejo de errores implementado

**Sprint 5: API REST Service**
- ✅ UserManagementService.cls creado
- ✅ 4 endpoints funcionando (/list, /check, /lock, /unlock)
- ✅ Web Application configurada
- ✅ Pruebas con curl exitosas

**Sprint 6: Configuración Production**
- ✅ PROD01.cls actualizado con todos los componentes
- ✅ Componentes habilitados y configurados
- ✅ Production iniciada correctamente

**Sprint 7: Frontend Web**
- ✅ UserManagementPage.cls (CSP Page) creada
- ✅ Interfaz responsive con 4 pestañas
- ✅ JavaScript para consumir API REST
- ✅ Página web funcional

---

## 📋 Sprint 8: Testing End-to-End y Validación

**Duración:** 3-5 días
**Objetivo:** Validar exhaustivamente todo el sistema, crear suite de tests, documentar casos de uso

### Tareas

#### 8.1 Testing Unitario de Business Processes
**Prioridad:** Alta

- [ ] Crear `POC01.Tests.TestGetUserListBP.cls`
  - Método: TestWithMaxRows()
  - Método: TestWithNoParameters()
  - Método: TestWithInvalidMaxRows()
  - Validar estructura JSON de respuesta

- [ ] Crear `POC01.Tests.TestCheckUserExistenceBP.cls`
  - Método: TestExistingUser()
  - Método: TestNonExistingUser()
  - Método: TestEmptyUsername()
  - Método: TestSpecialCharacters()

- [ ] Crear `POC01.Tests.TestLockUnlockBP.cls`
  - Método: TestLockExistingUser()
  - Método: TestLockNonExistingUser()
  - Método: TestUnlockUser()
  - Método: TestDoubleUnlock()

**Código base para tests:**
```objectscript
Class POC01.Tests.TestGetUserListBP Extends %UnitTest.TestCase
{

Method TestWithMaxRows()
{
    Set request = ##class(BAPI.USER.GETLIST.ISCuRequest).%New()
    Set request.MAXROWS = 5
    
    Set sc = ##class(EnsLib.Testing.Service).SendTestRequest(
        "POC01.BP.GetUserListBP", request, .response, .sessionId, 1)
    
    Do $$$AssertStatusOK(sc, "BP execution should succeed")
    Do $$$AssertTrue($IsObject(response), "Response should be an object")
    
    Set json = {}.%FromJSON(response.StringValue)
    Do $$$AssertEquals(json.success, 1, "Success should be 1")
    Do $$$AssertTrue(json.count <= 5, "Count should be <= 5")
}

Method TestWithInvalidMaxRows()
{
    Set request = ##class(BAPI.USER.GETLIST.ISCuRequest).%New()
    Set request.MAXROWS = -1
    
    Set sc = ##class(EnsLib.Testing.Service).SendTestRequest(
        "POC01.BP.GetUserListBP", request, .response, .sessionId, 1)
    
    // Should handle gracefully
    Do $$$AssertStatusOK(sc, "BP should handle invalid input")
}

}
```

#### 8.2 Testing de API REST
**Prioridad:** Alta

- [ ] Crear script de pruebas `POC01/Tests/test-api.sh`:
```bash
#!/bin/bash
BASE_URL="http://iriscnet/api/users"
AUTH="usuario:password"

echo "=== Testing API REST POC01 ==="

# Test 1: List Users
echo "1. Testing GET /list"
curl -s -u "$AUTH" "$BASE_URL/list?maxRows=5" | jq .

# Test 2: Check Existing User
echo "2. Testing POST /check - Existing User"
curl -s -u "$AUTH" -X POST "$BASE_URL/check" \
  -H "Content-Type: application/json" \
  -d '{"username":"ADSUSER"}' | jq .

# Test 3: Check Non-Existing User
echo "3. Testing POST /check - Non-Existing User"
curl -s -u "$AUTH" -X POST "$BASE_URL/check" \
  -H "Content-Type: application/json" \
  -d '{"username":"NOEXISTE99"}' | jq .

# Test 4: Lock User
echo "4. Testing POST /lock"
curl -s -u "$AUTH" -X POST "$BASE_URL/lock" \
  -H "Content-Type: application/json" \
  -d '{"username":"TESTUSER"}' | jq .

# Test 5: Unlock User
echo "5. Testing POST /unlock"
curl -s -u "$AUTH" -X POST "$BASE_URL/unlock" \
  -H "Content-Type: application/json" \
  -d '{"username":"TESTUSER"}' | jq .

echo "=== Tests Complete ==="
```

- [ ] Hacer ejecutable: `chmod +x POC01/Tests/test-api.sh`
- [ ] Ejecutar y documentar resultados

#### 8.3 Testing de Frontend Web
**Prioridad:** Media

- [ ] **Pruebas Manuales:**
  - Abrir página en diferentes navegadores (Chrome, Firefox, Safari)
  - Verificar responsive design (Desktop, Tablet, Mobile)
  - Probar cada una de las 4 pestañas
  - Validar mensajes de error
  - Verificar loading spinner
  - Confirmar alertas de confirmación (Lock/Unlock)

- [ ] **Checklist de Validación:**
  - [ ] Página carga correctamente
  - [ ] Autenticación HTTP funciona
  - [ ] Tabs cambian correctamente
  - [ ] Listar usuarios muestra tabla
  - [ ] Verificar usuario muestra resultado
  - [ ] Bloquear usuario pide confirmación
  - [ ] Desbloquear usuario pide confirmación
  - [ ] Mensajes de error se muestran correctamente
  - [ ] Loading overlay aparece/desaparece

#### 8.4 Performance Testing
**Prioridad:** Media

- [ ] Crear `POC01.Tests.PerformanceTest.cls`:
```objectscript
Class POC01.Tests.PerformanceTest Extends %RegisteredObject
{

ClassMethod TestConcurrentRequests(count As %Integer = 10) As %Status
{
    Set startTime = $ZH
    
    For i=1:1:count {
        Set request = ##class(BAPI.USER.GETLIST.ISCuRequest).%New()
        Set request.MAXROWS = 5
        
        Set sc = ##class(EnsLib.Testing.Service).SendTestRequest(
            "POC01.BP.GetUserListBP", request, .response, .sessionId, 1)
        
        If $$$ISERR(sc) {
            Write "Request ",i," failed",!
        }
    }
    
    Set endTime = $ZH
    Set duration = endTime - startTime
    Set avgTime = duration / count
    
    Write "Total requests: ",count,!
    Write "Total time: ",duration," seconds",!
    Write "Average time: ",avgTime," seconds",!
    Write "Requests/second: ",(count/duration),!
    
    Quit $$$OK
}

}
```

- [ ] Ejecutar pruebas de carga
- [ ] Documentar tiempos de respuesta
- [ ] Identificar cuellos de botella

#### 8.5 Documentación de Casos de Uso
**Prioridad:** Media

- [ ] Crear `POC01/CASOS_USO.md`:
  - Caso 1: Administrador lista usuarios para auditoría
  - Caso 2: Help desk verifica existencia antes de reset password
  - Caso 3: Seguridad bloquea usuario comprometido
  - Caso 4: Recursos humanos desbloquea empleado reintegrado
  - Incluir screenshots del frontend
  - Incluir respuestas JSON de ejemplo

#### 8.6 Validación de Seguridad
**Prioridad:** Alta

- [ ] Verificar autenticación en todos los endpoints
- [ ] Probar sin credenciales (debe retornar 401)
- [ ] Probar con credenciales inválidas
- [ ] Verificar que credenciales SAP están encriptadas en Production
- [ ] Revisar logs para no exponer passwords
- [ ] Validar input sanitization (SQL injection, XSS)

### Entregables Sprint 8
- [ ] Suite de tests unitarios compilados
- [ ] Script de tests API ejecutado con resultados
- [ ] Checklist de validación frontend completado
- [ ] Reporte de performance con métricas
- [ ] Documento de casos de uso con screenshots
- [ ] Reporte de seguridad con hallazgos

---

## 🔧 Sprint 9: Mejoras y Refinamiento

**Duración:** 4-6 días
**Objetivo:** Mejorar manejo de errores, implementar logging avanzado, optimizar performance

### Tareas

#### 9.1 Mejora de Manejo de Errores
**Prioridad:** Alta

- [ ] **En Business Processes:**
  - Agregar try/catch en todos los BPs
  - Implementar retry logic para errores transitorios
  - Mejorar mensajes de error para el usuario
  - Logging detallado de stack traces

Ejemplo:
```objectscript
Try {
    // BAPI call
} Catch ex {
    Set json = {}
    Set json.success = 0
    Set json.error = "Error interno: " _ ex.DisplayString()
    Set json.errorCode = ex.Code
    
    $$$LOGERROR("Error in GetUserListBP: "_ex.DisplayString())
    
    Set response = ##class(Ens.StringResponse).%New()
    Set response.StringValue = json.%ToJSON()
}
```

- [ ] **En REST API:**
  - Implementar error handler global
  - Retornar códigos HTTP apropiados (500, 400, 401)
  - Logging de todas las requests

- [ ] **En Frontend:**
  - Mejorar mensajes de error al usuario
  - Agregar botón "Reintentar" en errores
  - Mostrar detalles técnicos en modo debug

#### 9.2 Sistema de Logging Avanzado
**Prioridad:** Alta

- [ ] Crear `POC01.Utils.Logger.cls`:
```objectscript
Class POC01.Utils.Logger Extends %RegisteredObject
{

ClassMethod Info(component As %String, message As %String)
{
    Set timestamp = $ZDT($H,3)
    Set logMsg = timestamp_" [INFO] ["_component_"] "_message
    Do ##class(Ens.Util.Log).LogInfo("POC01", component, message)
}

ClassMethod Error(component As %String, message As %String, exception As %Exception.AbstractException = "")
{
    Set timestamp = $ZDT($H,3)
    Set logMsg = timestamp_" [ERROR] ["_component_"] "_message
    
    If $IsObject(exception) {
        Set logMsg = logMsg_" | "_exception.DisplayString()
    }
    
    Do ##class(Ens.Util.Log).LogError("POC01", component, logMsg)
}

ClassMethod Performance(component As %String, operation As %String, duration As %Numeric)
{
    Set logMsg = "Performance: "_operation_" took "_duration_" seconds"
    Do ##class(Ens.Util.Log).LogInfo("POC01.Performance", component, logMsg)
}

}
```

- [ ] Integrar Logger en todos los componentes
- [ ] Configurar log rotation en IRIS
- [ ] Crear dashboard de logs en Management Portal

#### 9.3 Optimizaciones de Performance
**Prioridad:** Media

- [ ] **Caching:**
  - Implementar cache de usuarios (TTL 5 minutos)
  - Cache de verificación de existencia
  
```objectscript
ClassMethod GetUserListCached(maxRows As %Integer) As %String
{
    Set cacheKey = "UserList_"_maxRows
    Set cachedData = $Get(^POC01.Cache(cacheKey))
    
    If cachedData'="" {
        Set cacheTime = $Get(^POC01.Cache(cacheKey,"Time"))
        Set now = $H
        Set diff = $System.SQL.DATEDIFF("s", cacheTime, now)
        
        If diff < 300 { // 5 minutes
            Return cachedData
        }
    }
    
    // Get fresh data from SAP
    Set freshData = ..GetUserListFromSAP(maxRows)
    
    // Store in cache
    Set ^POC01.Cache(cacheKey) = freshData
    Set ^POC01.Cache(cacheKey,"Time") = $H
    
    Return freshData
}
```

- [ ] **Connection Pooling:**
  - Verificar pool de Java Gateway
  - Optimizar Pool Size en Production

- [ ] **Compresión:**
  - Habilitar gzip en responses grandes
  - Minimizar JSON responses

#### 9.4 Monitoreo y Alertas
**Prioridad:** Media

- [ ] Crear `POC01.Utils.HealthCheck.cls`:
```objectscript
Class POC01.Utils.HealthCheck Extends %RegisteredObject
{

ClassMethod CheckAll() As %DynamicObject
{
    Set result = {}
    Set result.timestamp = $ZDT($H,3)
    Set result.status = "OK"
    Set result.components = []
    
    // Check Production
    Set prodStatus = ##class(POC01.Utils.HealthCheck).CheckProduction()
    Do result.components.%Push(prodStatus)
    
    // Check Java Gateway
    Set gatewayStatus = ##class(POC01.Utils.HealthCheck).CheckJavaGateway()
    Do result.components.%Push(gatewayStatus)
    
    // Check SAP Connection
    Set sapStatus = ##class(POC01.Utils.HealthCheck).CheckSAPConnection()
    Do result.components.%Push(sapStatus)
    
    // Determine overall status
    For i=0:1:result.components.%Size()-1 {
        Set comp = result.components.%Get(i)
        If comp.status'="OK" {
            Set result.status = "DEGRADED"
        }
    }
    
    Return result
}

}
```

- [ ] Endpoint REST `/health` para health checks
- [ ] Configurar alertas por email en errores críticos
- [ ] Dashboard de métricas (requests/min, errores, latencia)

#### 9.5 Mejoras de UI/UX
**Prioridad:** Baja

- [ ] Agregar paginación en lista de usuarios
- [ ] Implementar búsqueda/filtrado de usuarios
- [ ] Agregar breadcrumbs de navegación
- [ ] Mejorar feedback visual (toasts en lugar de alerts)
- [ ] Agregar modo oscuro
- [ ] Exportar lista a CSV/Excel

#### 9.6 Documentación de Operaciones
**Prioridad:** Alta

- [ ] Crear `POC01/OPERATIONS.md`:
  - Procedimiento de inicio/parada de Production
  - Checklist de verificación diaria
  - Procedimiento de troubleshooting
  - Escalamiento de incidentes
  - Contactos de soporte

### Entregables Sprint 9
- [ ] Sistema de logging implementado y funcionando
- [ ] Mejoras de error handling en todos los componentes
- [ ] Cache implementado con tests de performance
- [ ] Health check endpoint operativo
- [ ] Mejoras de UI implementadas
- [ ] Documentación de operaciones completa

---

## 🚀 Sprint 10: Deployment y Producción

**Duración:** 5-7 días
**Objetivo:** Preparar sistema para producción, deployment, capacitación, documentación final

### Tareas

#### 10.1 Preparación de Ambientes
**Prioridad:** Alta

- [ ] **Ambiente de Desarrollo (DEV):**
  - Ya existe en namespace DEMO
  - Documentar configuración

- [ ] **Ambiente de QA/Testing:**
  - Crear namespace POC01QA
  - Clonar Production con datos de SAP QA
  - Configurar Web Applications en /api-qa/

- [ ] **Ambiente de Producción (PROD):**
  - Crear namespace POC01PROD
  - Configurar credenciales SAP productivo
  - Java Gateway en puerto dedicado
  - SSL/TLS habilitado

#### 10.2 Scripts de Deployment
**Prioridad:** Alta

- [ ] Crear `deploy.sh`:
```bash
#!/bin/bash

NAMESPACE=$1
ENVIRONMENT=$2

echo "=== POC01 Deployment Script ==="
echo "Namespace: $NAMESPACE"
echo "Environment: $ENVIRONMENT"

# 1. Backup actual
iris session IRIS -U $NAMESPACE << EOF
do ##class(%Library.Global).Export("POC01-backup-$(date +%Y%m%d).xml", "POC01.*")
quit
EOF

# 2. Compilar clases
iris session IRIS -U $NAMESPACE << EOF
do \$system.OBJ.CompilePackage("POC01", "cuk")
quit
EOF

# 3. Stop Production
iris session IRIS -U $NAMESPACE << EOF
set sc = ##class(Ens.Director).StopProduction()
quit
EOF

# 4. Import changes
iris session IRIS -U $NAMESPACE << EOF
do \$system.OBJ.LoadDir("/path/to/POC01", "ck")
quit
EOF

# 5. Start Production
iris session IRIS -U $NAMESPACE << EOF
set sc = ##class(Ens.Director).StartProduction("POC01.PROD01")
quit
EOF

# 6. Health Check
curl -s http://localhost/api/users/health | jq .

echo "=== Deployment Complete ==="
```

- [ ] Crear `rollback.sh` para reversar cambios
- [ ] Documentar procedimiento en `DEPLOYMENT.md`

#### 10.3 Seguridad y Hardening
**Prioridad:** Crítica

- [ ] **SSL/TLS:**
  - Configurar certificados SSL
  - Forzar HTTPS en producción
  - Actualizar URLs en frontend

- [ ] **Credenciales:**
  - Rotar passwords SAP
  - Usar %SYS.Ens Credential Store
  - Encriptar configuración sensible

- [ ] **Firewall:**
  - Documentar puertos necesarios
  - Restringir acceso Java Gateway
  - Configurar IP whitelist si aplica

- [ ] **Auditoría:**
  - Habilitar audit log en IRIS
  - Logging de todos los accesos
  - Compliance con políticas de seguridad

#### 10.4 Backup y Disaster Recovery
**Prioridad:** Alta

- [ ] **Backup Strategy:**
  - Backup diario automático de namespace
  - Backup de configuración Production
  - Backup de código fuente (Git)
  - Retention: 30 días

- [ ] **Disaster Recovery Plan:**
  - Documentar RTO (Recovery Time Objective): 4 horas
  - Documentar RPO (Recovery Point Objective): 24 horas
  - Procedimiento de restore
  - Servidor de contingencia configurado

- [ ] Crear `backup.sh`:
```bash
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups/POC01"

iris session IRIS << EOF
do ##class(%Library.Global).Export("$BACKUP_DIR/POC01_$DATE.xml", "POC01.*")
quit
EOF

# Comprimir
gzip $BACKUP_DIR/POC01_$DATE.xml

# Copiar a servidor remoto
scp $BACKUP_DIR/POC01_$DATE.xml.gz backup-server:/backups/

echo "Backup completed: POC01_$DATE.xml.gz"
```

#### 10.5 Capacitación
**Prioridad:** Alta

- [ ] **Material de Capacitación:**
  - Crear POC01/TRAINING.md con:
    - Introducción al sistema
    - Demo en vivo
    - Casos de uso reales
    - FAQ
    - Troubleshooting básico

- [ ] **Sesiones de Capacitación:**
  - Sesión 1: Usuarios finales (Help Desk, Seguridad)
  - Sesión 2: Administradores IRIS
  - Sesión 3: Soporte nivel 2

- [ ] **Videos Tutoriales:**
  - Tutorial frontend (5 min)
  - Tutorial troubleshooting (10 min)
  - Tutorial deployment (15 min)

#### 10.6 Documentación Final
**Prioridad:** Alta

- [ ] **Actualizar README.md** con:
  - Versión final
  - Ambientes disponibles
  - Contactos de soporte

- [ ] **Crear CHANGELOG.md:**
```markdown
# Changelog

## [1.0.0] - 2025-11-12

### Added
- Initial release
- 4 BAPIs implementados
- REST API completa
- Frontend web responsive
- Sistema de logging
- Health checks
- Tests unitarios

### Changed
- N/A

### Fixed
- N/A
```

- [ ] **Crear SUPPORT.md:**
  - Niveles de soporte
  - SLAs
  - Proceso de escalamiento
  - Contactos

#### 10.7 Go-Live Checklist
**Prioridad:** Crítica

- [ ] **Pre Go-Live (1 semana antes):**
  - [ ] Todos los tests pasan
  - [ ] Performance validado
  - [ ] Seguridad auditada
  - [ ] Backups configurados
  - [ ] Capacitación completada
  - [ ] Documentación revisada
  - [ ] Plan de rollback listo

- [ ] **Go-Live Day:**
  - [ ] Deployment a producción
  - [ ] Smoke tests
  - [ ] Health check OK
  - [ ] Monitoreo activo
  - [ ] Equipo en stand-by

- [ ] **Post Go-Live (1 semana después):**
  - [ ] Monitoreo continuo
  - [ ] Recolección de feedback
  - [ ] Ajustes menores
  - [ ] Lecciones aprendidas
  - [ ] Celebración del equipo 🎉

### Entregables Sprint 10
- [ ] Ambientes QA y PROD configurados
- [ ] Scripts de deployment probados
- [ ] Seguridad hardening completado
- [ ] Backup y DR plan implementado
- [ ] Capacitación completada
- [ ] Documentación final
- [ ] Sistema en producción funcionando
- [ ] Post mortem y lecciones aprendidas

---

## 📊 Resumen de Entregables Totales

### Documentación
- [x] README.md completo
- [x] API.md con especificación de endpoints
- [ ] CASOS_USO.md con screenshots
- [ ] OPERATIONS.md para operaciones diarias
- [ ] DEPLOYMENT.md con procedimientos
- [ ] TRAINING.md para capacitación
- [ ] CHANGELOG.md versionado
- [ ] SUPPORT.md con contactos

### Código
- [x] 4 Business Processes (BPL)
- [x] Business Operation (SAPOperation)
- [x] REST API Service
- [x] Frontend Web (CSP Page)
- [x] Production Configuration
- [ ] Suite de tests unitarios
- [ ] Sistema de logging
- [ ] Health checks
- [ ] Scripts de deployment

### Infraestructura
- [x] Java Gateway configurado
- [x] Web Applications configuradas
- [ ] Ambientes QA/PROD
- [ ] SSL/TLS
- [ ] Backups automáticos
- [ ] Monitoreo y alertas

---

## 🎯 Criterios de Éxito

### Sprint 8
- ✅ Todos los tests unitarios pasan
- ✅ API tests ejecutados sin errores
- ✅ Frontend validado en 3 navegadores
- ✅ Performance: < 2 segundos promedio

### Sprint 9
- ✅ Logging implementado en todos los componentes
- ✅ Error handling robusto
- ✅ Health checks funcionando
- ✅ Cache mejora performance en 50%

### Sprint 10
- ✅ Sistema deployado en producción
- ✅ Capacitación completada
- ✅ Documentación 100% completa
- ✅ Zero incidentes críticos en primera semana

---

## 📅 Timeline Estimado

| Sprint | Duración | Fecha Inicio | Fecha Fin |
|--------|----------|--------------|-----------|
| Sprint 8 | 4 días | 13-Nov-2025 | 16-Nov-2025 |
| Sprint 9 | 5 días | 17-Nov-2025 | 21-Nov-2025 |
| Sprint 10 | 6 días | 22-Nov-2025 | 27-Nov-2025 |
| **Total** | **15 días** | **13-Nov-2025** | **27-Nov-2025** |

**Go-Live Target:** 28-Noviembre-2025

---

## 🚨 Riesgos y Mitigación

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|---------|------------|
| Performance insuficiente | Media | Alto | Implementar caching, optimizar queries |
| Problemas SAP connectivity | Baja | Alto | Plan de contingencia, monitoreo proactivo |
| Bugs en producción | Media | Medio | Tests exhaustivos, rollback plan |
| Falta de adopción usuarios | Media | Medio | Capacitación efectiva, UX amigable |
| Sobrecarga Java Gateway | Baja | Alto | Pool size adecuado, monitoreo |

---

**Documento creado:** 12-Noviembre-2025
**Última actualización:** 12-Noviembre-2025
**Autor:** Christian Asmussen B.
