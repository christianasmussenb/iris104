Class POC01.Utils.TestGetUserList Extends %RegisteredObject
{

/// Test directo del Business Process usando MessageSender
ClassMethod TestBP() As %Status
{
    Try {
        Write !,"=== Test GetUserListBP ===",!
        
        // Crear request vacío
        Set request = ##class(Ens.Request).%New()
        
        Write "Invocando Business Process...",!
        
        // Enviar mensaje usando SendRequestSync directamente
        Set sc = ##class(Ens.Director).CreateBusinessService("EnsLib.Testing.Service",.service)
        If $$$ISERR(sc) {
            Write "ERROR: No se pudo crear servicio: ",$System.Status.GetErrorText(sc),!
            
            // Intentar método alternativo directo
            Write !,"Intentando método directo...",!
            Set bp = ##class(POC01.BP.GetUserListBP).%New()
            Set sc = bp.OnRequest(request,.response)
            
            If $$$ISERR(sc) {
                Write "ERROR método directo: ",$System.Status.GetErrorText(sc),!
                Return sc
            }
            
        } Else {
            // Enviar request usando el servicio
            Set sc = service.SendTestRequest("POC01.BP.GetUserListBP",request,.response)
            
            If $$$ISERR(sc) {
                Write "ERROR al enviar request: ",$System.Status.GetErrorText(sc),!
                Return sc
            }
        }
        
        // Mostrar respuesta
        Write !,"=== RESPUESTA ===",!
        If $IsObject(response) {
            Write "Response Type: ",response.%ClassName(1),!
            If response.%IsA("Ens.StringResponse") {
                Write "JSON Response:",!
                Write response.StringValue,!
                
                // Parsear y mostrar bonito
                Set json = {}.%FromJSON(response.StringValue)
                Write !,"Success: ",json.success,!
                Write "Count: ",json.count,!
                Write "Usuarios encontrados: ",json.data.%Size(),!
                
                // Mostrar primeros 5 usuarios
                If json.data.%Size() > 0 {
                    Write !,"Primeros usuarios:",!
                    For i=0:1:4 {
                        Quit:i>=json.data.%Size()
                        Set user = json.data.%Get(i)
                        Write "  - ",user.username," : ",user.fullname,!
                    }
                }
            }
        } Else {
            Write "Response es NULL",!
        }
        
        Write !,"=== TEST COMPLETADO ===",!
        Return $$$OK
        
    } Catch ex {
        Write "EXCEPCION: ",ex.DisplayString(),!
        Return ex.AsStatus()
    }
}

/// Test simplificado que solo verifica la conexión
ClassMethod TestConnection() As %Status
{
    Try {
        Write !,"=== Test Conexión SAP ===",!
        
        // Verificar que la producción está activa
        Set running = ##class(Ens.Director).IsProductionRunning()
        Write "Production activa: ",running,!
        
        If 'running {
            Write "ERROR: La producción no está activa",!
            Write "Ejecutar: do ##class(Ens.Director).StartProduction(""POC01.PROD01"")",!
            Return $$$ERROR($$$GeneralError,"Production no activa")
        }
        
        // Verificar que el BP existe
        If ##class(%Dictionary.ClassDefinition).%ExistsId("POC01.BP.GetUserListBP") {
            Write "✓ Business Process existe",!
        } Else {
            Write "✗ Business Process NO existe",!
            Return $$$ERROR($$$GeneralError,"BP no encontrado")
        }
        
        // Verificar que el BO existe
        If ##class(%Dictionary.ClassDefinition).%ExistsId("POC01.BO.SAPOperation") {
            Write "✓ Business Operation existe",!
        } Else {
            Write "✗ Business Operation NO existe",!
            Return $$$ERROR($$$GeneralError,"BO no encontrado")
        }
        
        Write !,"=== LISTO PARA EJECUTAR ===",!
        Write "Ejecutar: do ##class(POC01.Utils.TestGetUserList).TestBP()",!
        
        Return $$$OK
        
    } Catch ex {
        Write "EXCEPCION: ",ex.DisplayString(),!
        Return ex.AsStatus()
    }
}

}
