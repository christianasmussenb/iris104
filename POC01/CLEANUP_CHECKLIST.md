# POC01 - Checklist de Limpieza (para revisión)

## 1. Alineación de arquitectura
- [ ] Decidir y documentar una sola ruta oficial de ejecución:
  - Opción A: API -> `SISSSAPOperation` directa (estado actual)
  - Opción B: API -> `POC01.BP.*` (BPL)
- [ ] Si se mantiene Opción A, desactivar/retirar dependencias BPL no usadas en runtime.
- [ ] Actualizar `POC01/PROD01.cls` para reflejar entorno real objetivo o marcarlo explícitamente como referencia.

## 2. Producción y hosts
- [ ] Confirmar host oficial por entorno (DEMO/QA/PROD): `SISSSAPOperation` vs `POC01.BO.SAPOperation`.
- [ ] Estandarizar nombres de items en producción para evitar confusión de dispatch.
- [ ] Documentar precondición operativa: producción activa y host habilitado antes de probar API.

## 3. API y contratos
- [ ] Definir contrato estable de errores (códigos `code`) por endpoint.
- [ ] Homogeneizar códigos de validación (ej. unlock usa `ERROR` genérico en validación; lock usa `USER_LOCK_VALIDATION_ERROR`).
- [ ] Decidir si errores de negocio deben seguir en HTTP 200 o mapear a 4xx/5xx.

## 4. Filtro de listado
- [ ] Confirmar comportamiento final de `usernameFilter` (contains vs prefix) con negocio.
- [ ] Evaluar mover filtro al request SAP real si se dispone de wrapper correcto para rangos (`SELECTION_*`) con longitudes válidas.
- [ ] Revisar costo de `MAXuROWS=2000` y fallback histórico en rendimiento.

## 5. Estado de bloqueo en /check
- [ ] Confirmar con negocio si `lockStatusSource=APP_HISTORY` es aceptable.
- [ ] Si no, incorporar BAPI de lectura de estado realtime (ej. detalle de usuario) y reemplazar inferencia por historial.

## 6. Calidad de código
- [ ] Eliminar métodos no usados (`WriteActionResponseJSON`, `GetQueryParam`) si no se requieren.
- [ ] Unificar manejo de parseo de entrada (query/body) en helpers comunes mínimos.
- [ ] Revisar capturas `Try/Catch` silenciosas y agregar trazas diagnósticas en puntos críticos.

## 7. UI
- [ ] Revisar labels del filtro: actualmente dice “prefijo”, pero backend sin comodines opera como “contiene”.
- [ ] Mostrar en UI el filtro aplicado para facilitar soporte.
- [ ] Validar íconos/estilo (hay emojis en botones/título) según guideline de producto.

## 8. Testing
- [ ] Crear suite de pruebas de integración por endpoint con casos:
  - [ ] éxito
  - [ ] validación
  - [ ] timeout/host no disponible
  - [ ] usuario inexistente
  - [ ] lock/unlock idempotencia
- [ ] Agregar pruebas específicas para matcher de filtro (`*`, `?`, exacto, contains).

## 9. Operación y observabilidad
- [ ] Añadir trazas controladas (`LOGINFO/LOGERROR`) por request-id o username.
- [ ] Definir tablero mínimo: tasa de éxito, latencia SAP, errores por código.

## 10. Documentación
- [ ] Mantener `README.md` y `POC01/API.md` sincronizados con cada cambio de flujo.
- [ ] Registrar matriz “entorno -> producción activa -> host SAP” en documento operativo.
