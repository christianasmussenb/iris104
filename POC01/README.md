# POC01 - Componentes Ensemble/IRIS para Integración SAP

Este directorio contiene los componentes extraídos y corregidos de los archivos XML exportados de la producción PRD.PROD1.

## Estructura de Carpetas

```
POC01/
├── BS/                     # Business Services
├── BO/                     # Business Operations  
├── BP/                     # Business Processes (reservado)
├── Messages/               # Clases de mensaje (Request/Response)
├── Services/               # Servicios auxiliares (Java Gateway)
└── Utils/                  # Utilidades de compilación y testing
```

## Componentes Disponibles

### Business Services (BS/)
- **BAPI.Services.UserServicesBS.cls**: Servicio principal para procesar solicitudes BAPI de usuario

### Business Operations (BO/)
- **POC01.BO.SAPOperation.cls**: Operación SAP que extiende EnsLib.SAP.Operation para conectar con sistemas SAP

### Clases de Mensaje (Messages/)
- **BAPI.Services.UserServicesReq.cls**: Request de servicios de usuario
- **BAPI.Services.UserServicesRes.cls**: Response de servicios de usuario  
- **BAPI.USER.LOCK.ISCuRequest.cls**: Request para BAPI_USER_LOCK
- **BAPI.USER.LOCK.RETURNreq.cls**: Estructura de retorno de mensajes BAPI

### Servicios (Services/)
- **POC01.Services.JavaGatewayService.cls**: Java Gateway principal
- **POC01.Services.JavaGatewayMYSISSService.cls**: Java Gateway secundario (puerto 55556)

### Utilidades (Utils/)
- **POC01.Utils.ImportAll.cls**: Script de importación automática
- **POC01.Utils.CompileAll.cls**: Script de compilación en orden correcto
- **POC01.Utils.BasicTest.cls**: Tests básicos de funcionalidad

## Configuración del Servidor

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

## Instalación y Compilación

### Opción 1: Importación Automática (Recomendado)

```objectscript
// En el terminal de IRIS namespace DEMO:
do ##class(POC01.Utils.ImportAll).ImportDir("/Users/cab/VSCODE/iris104/POC01")
```

### Opción 2: Importación Manual

```objectscript
// En el terminal de IRIS namespace DEMO:
do $system.OBJ.ImportDir("/Users/cab/VSCODE/iris104/POC01", "*.cls", "ck", .errors, 1)
```

### Orden de Compilación Manual

Si necesitas compilar manualmente en orden específico:

1. Mensajes básicos:
   ```objectscript
   do $system.OBJ.Compile("BAPI.Services.UserServicesReq.cls","cuk")
   do $system.OBJ.Compile("BAPI.Services.UserServicesRes.cls","cuk")
   ```

2. Mensajes BAPI:
   ```objectscript
   do $system.OBJ.Compile("BAPI.USER.LOCK.RETURNreq.cls","cuk")
   do $system.OBJ.Compile("BAPI.USER.LOCK.ISCuRequest.cls","cuk")
   ```

3. Servicios y Operaciones:
   ```objectscript
   do $system.OBJ.Compile("POC01.Services.JavaGatewayService.cls","cuk")
   do $system.OBJ.Compile("POC01.Services.JavaGatewayMYSISSService.cls","cuk")
   do $system.OBJ.Compile("POC01.BO.SAPOperation.cls","cuk")
   ```

4. Business Service:
   ```objectscript
   do $system.OBJ.Compile("BAPI.Services.UserServicesBS.cls","cuk")
   ```

## Verificación

### Verificar Clases Compiladas
```objectscript
do ##class(POC01.Utils.CompileAll).VerifyClasses()
```

### Ejecutar Tests Básicos
```objectscript
do ##class(POC01.Utils.BasicTest).TestObjectCreation()
do ##class(POC01.Utils.BasicTest).TestBusinessService()
```

## Configuración de Producción

Para usar estos componentes en una producción Ensemble:

1. Crear nueva producción o usar existente
2. Agregar componentes en este orden:
   - **Java Gateway**: POC01.Services.JavaGatewayService (JG)
   - **Java Gateway MYSISS**: POC01.Services.JavaGatewayMYSISSService (JGMYSISS)
   - **SAP Operation**: POC01.BO.SAPOperation (SAPOperation)
   - **Business Service**: BAPI.Services.UserServicesBS

3. Configurar parámetros según ambiente

## Correcciones Realizadas

Durante el desarrollo se corrigieron los siguientes problemas:

✅ Eliminados parámetros inválidos (CARDINALITY, INVERSE)  
✅ Simplificadas relaciones padre-hijo complejas  
✅ Corregida sintaxis de parámetros ObjectScript  
✅ Eliminado método OnValidateSettings inexistente  
✅ Optimizado storage de clases persistentes  

## Notas Importantes

- Todos los archivos están validados y listos para compilación
- Las rutas de Java y JAR deben ajustarse según el servidor destino
- Los credenciales SAP deben configurarse apropiadamente
- La estructura soporta extensión para nuevos BAPIs

## Soporte

Para problemas de compilación, revisar:
1. Que las clases de mensaje se compilen primero
2. Que las rutas de Java Gateway sean correctas
3. Que el namespace DEMO esté activo
4. Que los permisos de usuario sean adecuados