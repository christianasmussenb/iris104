/// REST API Service para gestión de usuarios SAP
/// Expone 4 endpoints: GET /list, POST /check, POST /lock, POST /unlock
Class POC01.API.UserManagementService Extends (%CSP.REST, Ens.BusinessService)
{

/// Configurar como Business Service
Parameter ADAPTER = "Ens.InboundAdapter";

/// Charset para REST
Parameter CHARSET = "UTF-8";

/// Usar sesión HTTP
Parameter UseSession As Integer = 1;

/// Definición de rutas (URL Map)
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <!-- GET /list - Obtener lista de usuarios -->
  <Route Url="/list" Method="GET" Call="GetUserList" />
  
  <!-- POST /check - Verificar existencia de usuario -->
  <Route Url="/check" Method="POST" Call="CheckUserExistence" />
  
  <!-- POST /lock - Bloquear usuario -->
  <Route Url="/lock" Method="POST" Call="LockUser" />
  
  <!-- POST /unlock - Desbloquear usuario -->
  <Route Url="/unlock" Method="POST" Call="UnlockUser" />
</Routes>
}

/// GET /list - Obtener lista de usuarios SAP
ClassMethod GetUserList() As %Status
{
    Try {
        // Obtener parámetro opcional maxRows
        Set maxRows = $Get(%request.Data("maxRows",1), "")
        
        // Crear request para el BP
        Set request = ##class(BAPI.USER.GETLIST.ISCuRequest).%New()
        Set request.MAXuROWS = maxRows
        Set request.WITHuUSERNAME = "X"
        
        // Enviar request al Business Process usando Testing Service
        Set sc = ##class(EnsLib.Testing.Service).SendTestRequest("POC01.BP.GetUserListBP", request, .response, .sessionId, 1)
        If $$$ISERR(sc) {
            Set json = {}
            Set json.success = 0
            Set json.error = $System.Status.GetErrorText(sc)
            Write json.%ToJSON()
            Return $$$OK
        }
        
        // Devolver respuesta JSON
        If $IsObject(response) && response.%IsA("Ens.StringResponse") {
            Write response.StringValue
        } Else {
            // Error si no hay respuesta
            Set json = {}
            Set json.success = 0
            Set json.error = "No se obtuvo respuesta del Business Process"
            Write json.%ToJSON()
        }
        
        Return $$$OK
        
    } Catch ex {
        // Manejo de errores
        Set json = {}
        Set json.success = 0
        Set json.error = ex.DisplayString()
        Write json.%ToJSON()
        Return ex.AsStatus()
    }
}

/// POST /check - Verificar existencia de usuario SAP
ClassMethod CheckUserExistence() As %Status
{
    Try {
        // Leer body JSON
        Set body = %request.Content
        Set json = {}.%FromJSON(body)
        
        // Validar que viene el username
        If '$IsObject(json) || (json.username = "") {
            Set error = {}
            Set error.success = 0
            Set error.error = "USERNAME es requerido en el body JSON"
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Crear request para el BP
        Set request = ##class(BAPI.USER.EXISTENCE.CHECK.ISCuRequest).%New()
        Set request.USERNAME = json.username
        
        // Enviar request al Business Process usando Testing Service
        Set sc = ##class(EnsLib.Testing.Service).SendTestRequest("POC01.BP.CheckUserExistenceBP", request, .response, .sessionId, 1)
        If $$$ISERR(sc) {
            Set error = {}
            Set error.success = 0
            Set error.error = $System.Status.GetErrorText(sc)
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Verificar que recibimos respuesta
        If '$IsObject(response) {
            Set error = {}
            Set error.success = 0
            Set error.error = "No se obtuvo respuesta del Business Process"
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Devolver respuesta JSON
        If $IsObject(response) && response.%IsA("Ens.StringResponse") {
            Write response.StringValue
        } Else {
            Set error = {}
            Set error.success = 0
            Set error.error = "No se obtuvo respuesta del Business Process"
            Write error.%ToJSON()
        }
        
        Return $$$OK
        
    } Catch ex {
        Set error = {}
        Set error.success = 0
        Set error.error = ex.DisplayString()
        Write error.%ToJSON()
        Return ex.AsStatus()
    }
}

/// POST /lock - Bloquear usuario SAP
ClassMethod LockUser() As %Status
{
    Try {
        // Leer body JSON
        Set body = %request.Content
        Set json = {}.%FromJSON(body)
        
        // Validar que viene el username
        If '$IsObject(json) || (json.username = "") {
            Set error = {}
            Set error.success = 0
            Set error.error = "USERNAME es requerido en el body JSON"
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Crear request para el BP
        Set request = ##class(BAPI.USER.LOCK.ISCuRequest).%New()
        Set request.USERNAME = json.username
        
        // Enviar request al Business Process usando Testing Service
        Set sc = ##class(EnsLib.Testing.Service).SendTestRequest("POC01.BP.LockUserBP", request, .response, .sessionId, 1)
        If $$$ISERR(sc) {
            Set error = {}
            Set error.success = 0
            Set error.error = $System.Status.GetErrorText(sc)
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Devolver respuesta JSON
        If $IsObject(response) && response.%IsA("Ens.StringResponse") {
            Write response.StringValue
        } Else {
            Set error = {}
            Set error.success = 0
            Set error.error = "No se obtuvo respuesta del Business Process"
            Write error.%ToJSON()
        }
        
        Return $$$OK
        
    } Catch ex {
        Set error = {}
        Set error.success = 0
        Set error.error = ex.DisplayString()
        Write error.%ToJSON()
        Return ex.AsStatus()
    }
}

/// POST /unlock - Desbloquear usuario SAP
ClassMethod UnlockUser() As %Status
{
    Try {
        // Leer body JSON
        Set body = %request.Content
        Set json = {}.%FromJSON(body)
        
        // Validar que viene el username
        If '$IsObject(json) || (json.username = "") {
            Set error = {}
            Set error.success = 0
            Set error.error = "USERNAME es requerido en el body JSON"
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Crear request para el BP
        Set request = ##class(BAPI.USER.UNLOCK.ISCuRequest).%New()
        Set request.USERNAME = json.username
        
        // Enviar request al Business Process usando Testing Service
        Set sc = ##class(EnsLib.Testing.Service).SendTestRequest("POC01.BP.UnlockUserBP", request, .response, .sessionId, 1)
        If $$$ISERR(sc) {
            Set error = {}
            Set error.success = 0
            Set error.error = $System.Status.GetErrorText(sc)
            Write error.%ToJSON()
            Return $$$OK
        }
        
        // Devolver respuesta JSON
        If $IsObject(response) && response.%IsA("Ens.StringResponse") {
            Write response.StringValue
        } Else {
            Set error = {}
            Set error.success = 0
            Set error.error = "No se obtuvo respuesta del Business Process"
            Write error.%ToJSON()
        }
        
        Return $$$OK
        
    } Catch ex {
        Set error = {}
        Set error.success = 0
        Set error.error = ex.DisplayString()
        Write error.%ToJSON()
        Return ex.AsStatus()
    }
}

}
