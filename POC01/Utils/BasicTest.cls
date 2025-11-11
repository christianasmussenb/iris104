/// Test básico para verificar funcionalidad POC01
Class POC01.Utils.BasicTest Extends %RegisteredObject
{

/// Prueba básica de creación de objetos
ClassMethod TestObjectCreation() As %Status
{
    Set tSC = $$$OK
    
    Try {
        Write "=== POC01 Basic Test ===", !
        
        // Test 1: Crear solicitud de usuario
        Write "Test 1: Creating UserServicesReq... "
        Set req = ##class(BAPI.Services.UserServicesReq).%New()
        Set req.USERNAME = "TESTUSER"
        Write "OK", !
        
        // Test 2: Crear respuesta de usuario  
        Write "Test 2: Creating UserServicesRes... "
        Set res = ##class(BAPI.Services.UserServicesRes).%New()
        Set res.Respuesta = "Test Response"
        Write "OK", !
        
        // Test 3: Crear solicitud BAPI
        Write "Test 3: Creating ISCuRequest... "
        Set bapiReq = ##class(BAPI.USER.LOCK.ISCuRequest).%New()
        Set bapiReq.USERNAME = "TESTUSER"
        Write "OK", !
        
        // Test 4: Crear objeto RETURN
        Write "Test 4: Creating RETURNreq... "
        Set returnObj = ##class(BAPI.USER.LOCK.RETURNreq).%New()
        Set returnObj.TYPE = "S"
        Set returnObj.MESSAGE = "Success"
        Write "OK", !
        
        Write !, "=== All basic tests passed! ===", !
        
    } Catch ex {
        Write "ERROR: ", ex.DisplayString(), !
        Set tSC = ex.AsStatus()
    }
    
    Return tSC
}

/// Test simple de Business Service
ClassMethod TestBusinessService() As %Status
{
    Set tSC = $$$OK
    
    Try {
        Write "=== Testing Business Service Creation ===", !
        
        // Crear instancia del Business Service
        Write "Creating UserServicesBS instance... "
        Set bs = ##class(BAPI.Services.UserServicesBS).%New()
        Write "OK", !
        
        Write "Business Service created successfully!", !
        
    } Catch ex {
        Write "ERROR: ", ex.DisplayString(), !
        Set tSC = ex.AsStatus()
    }
    
    Return tSC
}

}
