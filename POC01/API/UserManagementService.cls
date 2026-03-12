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
        Set %response.ContentType = "application/json; charset=UTF-8"

        // Obtener parámetro opcional maxRows
        Set maxRows = +$Get(%request.Data("maxRows",1), 5)
        If maxRows<1 {
            Set maxRows = 5
        }
        If maxRows>50 {
            Set maxRows = 50
        }
        
        // Crear request para la operación SAP
        Set request = ##class(BAPI.USER.GETLIST.ISCuRequest).%New()
        Set request.MAXuROWS = maxRows
        Set request.WITHuUSERNAME = "X"
        
        // Crear servicio de testing e invocar directamente SISSSAPOperation (PRD.PROD1/DEMO).
        Set sc = ##class(Ens.Director).CreateBusinessService("EnsLib.Testing.Service", .svc)
        If $$$ISERR(sc) {
            Do ..WriteSimpleErrorJSON($System.Status.GetErrorText(sc))
            Return $$$OK
        }

        Set sc = svc.SendTestRequest("SISSSAPOperation", request, .sapResponse, .sessionId, 1)
        If $$$ISERR(sc) {
            Do ..WriteSimpleErrorJSON($System.Status.GetErrorText(sc))
            Return $$$OK
        }

        Do ..WriteGetUserListJSONFromSAP(sapResponse)
        
        Return $$$OK
        
    } Catch ex {
        // Manejo de errores
        Do ..WriteSimpleErrorJSON(ex.DisplayString())
        Return $$$OK
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

ClassMethod WriteSimpleErrorJSON(errorText As %String)
{
    Set json = {}
    Set json.success = 0
    Set json.error = errorText
    Write json.%ToJSON()
}

ClassMethod WriteGetUserListJSONFromSAP(sapResponse As %RegisteredObject)
{
    If '$IsObject(sapResponse) {
        Do ..WriteSimpleErrorJSON("SISSSAPOperation no devolvio respuesta")
        Quit
    }

    Set json = {}
    Set userArray = []
    Set userCount = 0

    Try {
        // Camino principal: leer filas hijas USERLIST por relación SQL con ISCuResponse.
        Set ok = ..TryExtractUsersFromSQL(sapResponse, .userArray, .userCount)

        // Fallback 1: parseo de XML completo de la respuesta SAP.
        If 'ok {
            Set ok = ..TryExtractUsernamesFromXML(sapResponse, .userArray, .userCount)
        }
        
        // Fallback 2: recorrer colección USERLIST si el XML no fue utilizable.
        If 'ok {
            Do ..TryExtractUsernamesFromCollection(sapResponse, .userArray, .userCount)
        }

        Set json.success = 1
        Set json.count = userCount
        Set json.data = userArray
        Write json.%ToJSON()
    } Catch ex {
        Do ..WriteSimpleErrorJSON(ex.DisplayString())
    }
}

ClassMethod TryExtractUsersFromSQL(sapResponse As %RegisteredObject, ByRef userArray, ByRef userCount) As %Boolean
{
    Set ok = 0
    Set responseId = ""
    Set lastTriedId = ""

    If '$IsObject(sapResponse) {
        Quit 0
    }

    // Obtener ID persistente de BAPI.USER.GETLIST.ISCuResponse.
    Try {
        Set responseId = sapResponse.%Id()
    } Catch ex1 {
    }
    If responseId = "" {
        Try {
            Set responseId = sapResponse.%Id
        } Catch ex2 {
        }
    }
    If responseId = "" {
        Try {
            Set responseId = sapResponse.ID
        } Catch ex3 {
        }
    }
    If responseId = "" {
        // sin ID directo: se intentará con el último ISCuResponse existente
    }

    &sql(DECLARE UserListCur CURSOR FOR
         SELECT ID, USERNAME, FIRSTNAME, LASTNAME, FULLNAME
         FROM BAPI_USER_GETLIST.USERLIST
         WHERE ISCuResponse = :lookupId
         ORDER BY ID)

    // 1) intento con ID del objeto; 2) fallback con último ID persistido.
    For attempt=1:1:2 {
        Set lookupId = responseId
        If (attempt=2) || (lookupId="") {
            &sql(SELECT TOP 1 ID INTO :lookupId FROM BAPI_USER_GETLIST.ISCuResponse ORDER BY ID DESC)
            If (SQLCODE'=0) {
                Set lookupId = ""
            }
        }
        Continue:lookupId=""
        Continue:lookupId=lastTriedId
        Set lastTriedId = lookupId

        &sql(OPEN UserListCur)
        If (SQLCODE'=0) {
            Continue
        }

        For {
            &sql(FETCH UserListCur INTO :userId, :username, :firstname, :lastname, :fullname)
            Quit:(SQLCODE'=0)

            Set username = $ZStrip($Get(username), "<W")
            Continue:username=""

            Set userObj = {}
            Set userObj.id = $Get(userId)
            Set userObj.username = username
            Set userObj.firstname = $ZStrip($Get(firstname), "<W")
            Set userObj.lastname = $ZStrip($Get(lastname), "<W")
            Set userObj.fullname = $ZStrip($Get(fullname), "<W")
            Do userArray.%Push(userObj)
            Set userCount = $Get(userCount) + 1
            Set ok = 1
        }
        &sql(CLOSE UserListCur)
        Quit:ok
    }

    Quit ok
}

ClassMethod TryExtractUsernamesFromXML(sapResponse As %RegisteredObject, ByRef userArray, ByRef userCount) As %Boolean
{
    Set ok = 0
    Set xml = ""
    Set pos = 1

    If '$IsObject(sapResponse) {
        Quit 0
    }

    // Intento A: método XMLExportToString (runtime dynamic).
    Try {
        XECUTE "Do sapResponse.XMLExportToString(.xml)"
    } Catch exA {
    }

    // Intento B: método %XMLExportToString (runtime dynamic).
    If xml = "" {
        Try {
            XECUTE "Do sapResponse.%XMLExportToString(.xml)"
        } Catch exB {
        }
    }

    // Intento C: export a stream y lectura completa.
    If xml = "" {
        Try {
            Set xmlStream = ##class(%GlobalCharacterStream).%New()
            XECUTE "Do sapResponse.%XMLExport(xmlStream)"
            Do xmlStream.Rewind()
            For {
                Set chunk = xmlStream.Read(32000)
                Quit:chunk=""
                Set xml = xml _ chunk
            }
        } Catch exC {
        }
    }

    If xml = "" {
        Quit 0
    }

    // Parseo tolerante: acepta <USERNAME> y también <ns:USERNAME>.
    For {
        Set lt = $Find(xml, "<", pos)
        Quit:'lt
        Set gt = $Find(xml, ">", lt)
        Quit:'gt

        Set tagText = $Extract(xml, lt, gt-2)
        Set isClosing = ($Extract(tagText,1)="/")
        If 'isClosing, $Find(tagText, "USERNAME") {
            Set valStart = gt
            Set nextLt = $Find(xml, "<", valStart)
            If nextLt {
                Set username = $Extract(xml, valStart, nextLt-2)
                Set username = $ZStrip($Get(username), "<W")
                If username'="" {
                    Set userObj = {}
                    Set userObj.id = $Get(userCount) + 1
                    Set userObj.username = username
                    Set userObj.firstname = ""
                    Set userObj.lastname = ""
                    Set userObj.fullname = ""
                    Do userArray.%Push(userObj)
                    Set userCount = $Get(userCount) + 1
                    Set ok = 1
                }
            }
        }

        Set pos = gt
    }

    Quit ok
}

ClassMethod TryExtractUsernamesFromCollection(sapResponse As %RegisteredObject, ByRef userArray, ByRef userCount)
{
    If '$IsObject(sapResponse) || '$IsObject(sapResponse.USERLIST) {
        Quit
    }

    Set key = ""
    For {
        Set user = sapResponse.USERLIST.GetNext(.key)
        Quit:key=""
        Set username = ""
        
        If $IsObject(user) {
            Try {
                Set username = $Get(user.%Get("USERNAME"))
            } Catch ex1 {
            }

            If username="" {
                For idx=0:1:30 {
                    Try {
                        Set username = $Get(user.%Get("USERNAME", idx))
                    } Catch ex2 {
                        Set username = ""
                    }
                    Quit:username'=""
                }
            }
        } Else {
            Set username = $ZStrip($Get(user), "<W")
        }

        If (username="") && (key '= "") && (key'?1.N) {
            Set username = key
        }
        Continue:username=""

        Set userObj = {}
        If key?1.N {
            Set userObj.id = +key
        } Else {
            Set userObj.id = $Get(userCount) + 1
        }
        Set userObj.username = username
        Set userObj.firstname = ""
        Set userObj.lastname = ""
        Set userObj.fullname = ""
        Do userArray.%Push(userObj)
        Set userCount = $Get(userCount) + 1
    }
}

}
