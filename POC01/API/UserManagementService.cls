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

        // Filtro opcional por letras de username (prefijo)
        Set usernameFilter = $ZConvert($ZStrip($Get(%request.Data("usernameFilter",1)), "<W"), "U")
        
        // Crear request para la operación SAP
        Set request = ##class(BAPI.USER.GETLIST.ISCuRequest).%New()
        Set fetchRows = maxRows
        If usernameFilter'="" {
            // Al filtrar localmente, pedir un lote mayor a SAP para evitar falsos vacíos.
            Set fetchRows = 2000
        }
        Set request.MAXuROWS = fetchRows
        // WITHuUSERNAME actúa como flag en este wrapper; mantener "X".
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

        Do ..WriteGetUserListJSONFromSAP(sapResponse, usernameFilter, maxRows)
        
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
        Set %response.ContentType = "application/json; charset=UTF-8"
        Set username = ..GetUsernameFromRequest()
        
        // Validar que viene el username
        If username = "" {
            Do ..WriteSimpleErrorJSON("USERNAME es requerido en el body JSON")
            Return $$$OK
        }
        
        // Crear request para SAP
        Set request = ##class(BAPI.USER.EXISTENCE.CHECK.ISCuRequest).%New()
        Set request.USERNAME = username
        
        // Crear servicio de testing e invocar SISSSAPOperation directamente.
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

        Do ..WriteCheckUserExistenceJSONFromSAP(username, sapResponse)
        
        Return $$$OK
        
    } Catch ex {
        Do ..WriteSimpleErrorJSON(ex.DisplayString())
        Return $$$OK
    }
}

/// POST /lock - Bloquear usuario SAP
ClassMethod LockUser() As %Status
{
    Try {
        Set %response.ContentType = "application/json; charset=UTF-8"
        Set username = ..GetUsernameFromRequest()
        
        // Validar que viene el username
        If username = "" {
            Do ..WriteSimpleErrorJSON("USERNAME es requerido en el body JSON", "USER_LOCK_VALIDATION_ERROR")
            Return $$$OK
        }
        
        // Crear request para SAP
        Set request = ##class(BAPI.USER.LOCK.ISCuRequest).%New()
        Set request.USERNAME = username
        
        // Crear servicio de testing e invocar SISSSAPOperation directamente.
        Set sc = ##class(Ens.Director).CreateBusinessService("EnsLib.Testing.Service", .svc)
        If $$$ISERR(sc) {
            Do ..WriteSimpleErrorJSON($System.Status.GetErrorText(sc), "USER_LOCK_ERROR")
            Return $$$OK
        }

        Set sc = svc.SendTestRequest("SISSSAPOperation", request, .sapResponse, .sessionId, 1)
        If $$$ISERR(sc) {
            Do ..WriteSimpleErrorJSON($System.Status.GetErrorText(sc), "USER_LOCK_ERROR")
            Return $$$OK
        }

        Do ..WriteLockUserJSONFromSAP(username, sapResponse)
        
        Return $$$OK
        
    } Catch ex {
        Do ..WriteSimpleErrorJSON(ex.DisplayString(), "USER_LOCK_ERROR")
        Return $$$OK
    }
}

/// POST /unlock - Desbloquear usuario SAP
ClassMethod UnlockUser() As %Status
{
    Try {
        Set %response.ContentType = "application/json; charset=UTF-8"
        Set username = ..GetUsernameFromRequest()
        
        // Validar que viene el username
        If username = "" {
            Do ..WriteSimpleErrorJSON("USERNAME es requerido en el body JSON")
            Return $$$OK
        }
        
        // Crear request para SAP
        Set request = ##class(BAPI.USER.UNLOCK.ISCuRequest).%New()
        Set request.USERNAME = username
        
        // Crear servicio de testing e invocar SISSSAPOperation directamente.
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

        Do ..WriteUnlockUserJSONFromSAP(username, sapResponse)
        
        Return $$$OK
        
    } Catch ex {
        Do ..WriteSimpleErrorJSON(ex.DisplayString())
        Return $$$OK
    }
}

ClassMethod WriteSimpleErrorJSON(errorText As %String, responseCode As %String = "ERROR")
{
    Set json = {}
    Set json.success = 0
    Set json.code = responseCode
    Set json.error = errorText
    Do ..AddResponseMetadata(.json, responseCode)
    Write json.%ToJSON()
}

ClassMethod AddResponseMetadata(ByRef json, responseCode As %String = "")
{
    If '$IsObject(json) {
        Quit
    }

    Set h = $H
    Set d = +$Piece(h, ",", 1)
    Set t = +$Piece(h, ",", 2)

    If responseCode="" {
        Try {
            Set responseCode = $Get(json.%Get("code"))
        } Catch exCode {
            Set responseCode = ""
        }
    }
    If responseCode="" {
        Set responseCode = "OK"
    }
    Set json.code = responseCode

    Set json.date = $ZDate(d, 3)
    Set json.time = $ZTime(t, 1)
}

ClassMethod WriteActionResponseJSON(rawJSON As %String, successCode As %String = "ACTION_OK", errorCode As %String = "ACTION_ERROR")
{
    Set obj = ""
    Try {
        Set obj = {}.%FromJSON(rawJSON)
    } Catch ex {
        Set obj = ""
    }

    If '$IsObject(obj) {
        Do ..WriteSimpleErrorJSON("Respuesta JSON invalida del proceso", errorCode)
        Quit
    }

    Set success = 0
    Try {
        Set success = +$Get(obj.%Get("success"))
    } Catch ex2 {
        Set success = 0
    }

    Set code = ""
    Try {
        Set code = $Get(obj.%Get("code"))
    } Catch ex3 {
        Set code = ""
    }
    If code="" {
        If success=1 {
            Set code = successCode
        } Else {
            Set code = errorCode
        }
        Set obj.code = code
    }

    Do ..AddResponseMetadata(.obj, code)
    Write obj.%ToJSON()
}

ClassMethod GetUsernameFromRequest() As %String
{
    Set username = ""
    Set bodyText = ""
    Set contentObj = ""

    Try {
        If $IsObject(%request.Content) {
            Set contentObj = %request.Content
            Try {
                Do contentObj.Rewind()
            } Catch exRewind1 {
            }
            For {
                Set chunk = contentObj.Read(32000)
                Quit:chunk=""
                Set bodyText = bodyText _ chunk
            }
        } Else {
            Set bodyText = $Get(%request.Content)
        }
    } Catch exBody {
        Set bodyText = ""
    }

    If bodyText'="" {
        Try {
            Set json = {}.%FromJSON(bodyText)
            If $IsObject(json) {
                Set username = $ZConvert($ZStrip($Get(json.%Get("username")), "<W"), "U")
            }
        } Catch exJson {
            Set username = ""
        }
    }

    // fallback: parseo manual de {"username":"..."} si %FromJSON falla.
    If (username="") && (bodyText'="") {
        Set username = ..ExtractUsernameFromJSONText(bodyText)
    }

    // intento adicional: parsear directo desde stream de contenido.
    If (username="") && $IsObject(contentObj) {
        Try {
            Do contentObj.Rewind()
            Set json2 = {}.%FromJSON(contentObj)
            If $IsObject(json2) {
                Set username = $ZConvert($ZStrip($Get(json2.%Get("username")), "<W"), "U")
            }
        } Catch exJson2 {
            Set username = ""
        }
    }

    // fallback para form/querystring
    If username = "" {
        Set username = $ZConvert($ZStrip($Get(%request.Data("username",1)), "<W"), "U")
    }

    Return username
}

ClassMethod GetQueryParam(paramName As %String) As %String
{
    Set out = $Get(%request.Data(paramName,1))
    If out'="" {
        Quit out
    }

    Set url = ""
    Try {
        Set url = $Get(%request.URL)
    } Catch exUrl {
        Set url = ""
    }
    If url="" {
        Quit ""
    }

    Set qPos = $Find(url, "?")
    If 'qPos {
        Quit ""
    }
    Set query = $Extract(url, qPos, *)
    If query="" {
        Quit ""
    }

    Set target = $ZConvert($Get(paramName), "L")
    Set p = 1
    Set out = ""
    For {
        Quit:p>$Length(query)
        Set amp = $Find(query, "&", p)
        If 'amp {
            Set amp = $Length(query) + 2
        }
        Set pair = $Extract(query, p, amp-2)
        Set eq = $Find(pair, "=")
        If eq {
            Set key = $ZConvert($Extract(pair,1,eq-2), "L")
            If key=target {
                Set out = $Extract(pair, eq, *)
                Quit
            }
        }
        Set p = amp
    }

    // Decodificación mínima para comodines y espacios.
    If out'="" {
        Set out = $Replace(out, "+", " ")
        Set out = $Replace(out, "%2A", "*")
        Set out = $Replace(out, "%2a", "*")
        Set out = $Replace(out, "%3F", "?")
        Set out = $Replace(out, "%3f", "?")
    }

    Quit out
}

ClassMethod ExtractUsernameFromJSONText(bodyText As %String) As %String
{
    Set out = ""
    Set lower = $ZConvert($Get(bodyText), "L")
    Set p = $Find(lower, """username""")
    If 'p {
        Quit ""
    }

    Set colon = $Find(lower, ":", p)
    If 'colon {
        Quit ""
    }

    Set len = $Length(bodyText)
    Set i = colon
    For  {
        Quit:i>len
        Set ch = $Extract(bodyText, i)
        If (ch'=" ") && (ch'=$Char(9)) && (ch'=$Char(10)) && (ch'=$Char(13)) {
            Quit
        }
        Set i = i + 1
    }
    If i>len {
        Quit ""
    }

    If $Extract(bodyText, i)="""" {
        Set i = i + 1
        Set j = i
        For  {
            Quit:j>len
            If $Extract(bodyText, j)="""" {
                Quit
            }
            Set j = j + 1
        }
        If j<=len {
            Set out = $Extract(bodyText, i, j-1)
        }
    } Else {
        Set j = i
        For  {
            Quit:j>len
            Set ch = $Extract(bodyText, j)
            If (ch=",") || (ch="}") {
                Quit
            }
            Set j = j + 1
        }
        Set out = $Extract(bodyText, i, j-1)
    }

    Set out = $ZConvert($ZStrip($Get(out), "<W"), "U")
    Quit out
}

ClassMethod WriteCheckUserExistenceJSONFromSAP(username As %String, sapResponse As %RegisteredObject)
{
    If '$IsObject(sapResponse) {
        Do ..WriteSimpleErrorJSON("SISSSAPOperation no devolvio respuesta")
        Quit
    }

    Set json = {}
    Set isOK = 0
    Set errorMessage = ""
    Set returnType = ""
    Set returnMessage = ""

    // Camino principal: leer respuesta persistida en tabla SQL de la BAPI.
    Set extracted = ..TryExtractCheckFromSQL(sapResponse, .isOK, .errorMessage, .returnType, .returnMessage)

    // Fallback a objeto en memoria si no se pudo extraer por SQL.
    If 'extracted {
        Set isOK = +$Get(sapResponse.ISCuIsOK)
        Set errorMessage = $ZStrip($Get(sapResponse.ISCuErrorMessage), "<W")

        Try {
            If $IsObject(sapResponse.RETURN) {
                Set returnType = $ZConvert($ZStrip($Get(sapResponse.RETURN.TYPE), "<W"), "U")
                Set returnMessage = $ZStrip($Get(sapResponse.RETURN.MESSAGE), "<W")
            }
        } Catch exReturn {
            Set returnType = ""
            Set returnMessage = ""
        }
    }

    Set exists = 0
    If (isOK=1) && (errorMessage="") && (returnType'="E") && (returnType'="A") {
        Set exists = 1
    }

    Set json.success = 1
    Set json.exists = exists
    Set json.username = username
    If exists {
        Set json.code = "USER_EXISTS"
    } Else {
        Set json.code = "USER_NOT_FOUND"
    }

    If exists {
        If returnMessage'="" {
            Set json.message = returnMessage
        } Else {
            Set json.message = "Usuario existe en SAP"
        }
    } Else {
        If returnMessage'="" {
            Set json.message = returnMessage
        } ElseIf errorMessage'="" {
            Set json.message = errorMessage
        } Else {
            Set json.message = "Usuario no existe en SAP"
        }
    }

    Do ..AddLockStatusFromHistory(username, .json)

    Set code = ""
    Try {
        Set code = json.%Get("code")
    } Catch exCode1 {
        Set code = ""
    }
    Do ..AddResponseMetadata(.json, code)
    Write json.%ToJSON()
}

ClassMethod AddLockStatusFromHistory(username As %String, ByRef json)
{
    If '$IsObject(json) {
        Quit
    }

    Set uname = $ZConvert($ZStrip($Get(username), "<W"), "U")
    If uname="" {
        Set json.lockStatus = "UNKNOWN"
        Set json.lockStatusSource = "APP_HISTORY"
        Set json.lockStatusMessage = "Sin username para evaluar historial"
        Quit
    }

    Set lockReqId = ""
    Set unlockReqId = ""

    Try {
        &sql(SELECT TOP 1 ID INTO :lockReqId
             FROM BAPI_USER_LOCK.ISCuRequest
             WHERE USERNAME = :uname
             ORDER BY ID DESC)
        If SQLCODE'=0 {
            Set lockReqId = ""
        }
    } Catch exLock {
        Set lockReqId = ""
    }

    Try {
        &sql(SELECT TOP 1 ID INTO :unlockReqId
             FROM BAPI_USER_UNLOCK.ISCuRequest
             WHERE USERNAME = :uname
             ORDER BY ID DESC)
        If SQLCODE'=0 {
            Set unlockReqId = ""
        }
    } Catch exUnlock {
        Set unlockReqId = ""
    }

    Set status = "UNKNOWN"
    Set statusMsg = "Sin historial de bloqueo/desbloqueo para este usuario"

    If (lockReqId'="") && (unlockReqId'="") {
        If (+lockReqId>+unlockReqId) {
            Set status = "LOCKED"
            Set statusMsg = "Estado inferido por la ultima accion registrada: BLOQUEAR"
        } Else {
            Set status = "UNLOCKED"
            Set statusMsg = "Estado inferido por la ultima accion registrada: DESBLOQUEAR"
        }
    } ElseIf lockReqId'="" {
        Set status = "LOCKED"
        Set statusMsg = "Estado inferido por historial: solo hay accion BLOQUEAR"
    } ElseIf unlockReqId'="" {
        Set status = "UNLOCKED"
        Set statusMsg = "Estado inferido por historial: solo hay accion DESBLOQUEAR"
    }

    Set json.lockStatus = status
    Set json.lockStatusSource = "APP_HISTORY"
    Set json.lockStatusMessage = statusMsg
}

ClassMethod WriteUnlockUserJSONFromSAP(username As %String, sapResponse As %RegisteredObject)
{
    If '$IsObject(sapResponse) {
        Do ..WriteSimpleErrorJSON("SISSSAPOperation no devolvio respuesta")
        Quit
    }

    Set json = {}
    Set isOK = 0
    Set errorMessage = ""
    Set returnType = ""
    Set returnMessage = ""

    // Camino principal: leer tablas SQL de BAPI_USER_UNLOCK.
    Set extracted = ..TryExtractUnlockFromSQL(sapResponse, .isOK, .errorMessage, .returnType, .returnMessage)

    // Fallback al objeto en memoria.
    If 'extracted {
        Set isOK = +$Get(sapResponse.ISCuIsOK)
        Set errorMessage = $ZStrip($Get(sapResponse.ISCuErrorMessage), "<W")

        Try {
            Set key = ""
            If $IsObject(sapResponse.RETURN) {
                Set ret = sapResponse.RETURN.GetNext(.key)
                If $IsObject(ret) {
                    Set returnType = $ZConvert($ZStrip($Get(ret.TYPE), "<W"), "U")
                    Set returnMessage = $ZStrip($Get(ret.MESSAGE), "<W")
                }
            }
        } Catch exReturn {
            Set returnType = ""
            Set returnMessage = ""
        }
    }

    Set success = 0
    If (isOK=1) && (errorMessage="") && (returnType'="E") && (returnType'="A") {
        Set success = 1
    }

    Set json.success = success
    Set json.username = username
    If success {
        Set json.code = "USER_UNLOCKED"
    } Else {
        Set json.code = "USER_UNLOCK_ERROR"
    }

    If success {
        If returnMessage'="" {
            Set json.message = returnMessage
        } Else {
            Set json.message = "Usuario desbloqueado exitosamente"
        }
    } Else {
        If returnMessage'="" {
            Set json.error = returnMessage
        } ElseIf errorMessage'="" {
            Set json.error = errorMessage
        } Else {
            Set json.error = "Error al desbloquear usuario en SAP"
        }
    }

    Set code = ""
    Try {
        Set code = json.%Get("code")
    } Catch exCode2 {
        Set code = ""
    }
    Do ..AddResponseMetadata(.json, code)
    Write json.%ToJSON()
}

ClassMethod WriteLockUserJSONFromSAP(username As %String, sapResponse As %RegisteredObject)
{
    If '$IsObject(sapResponse) {
        Do ..WriteSimpleErrorJSON("SISSSAPOperation no devolvio respuesta", "USER_LOCK_ERROR")
        Quit
    }

    Set json = {}
    Set isOK = 0
    Set errorMessage = ""
    Set returnType = ""
    Set returnMessage = ""

    // Camino principal: leer tablas SQL de BAPI_USER_LOCK.
    Set extracted = ..TryExtractLockFromSQL(sapResponse, .isOK, .errorMessage, .returnType, .returnMessage)

    // Fallback al objeto en memoria.
    If 'extracted {
        Set isOK = +$Get(sapResponse.ISCuIsOK)
        Set errorMessage = $ZStrip($Get(sapResponse.ISCuErrorMessage), "<W")

        Try {
            Set key = ""
            If $IsObject(sapResponse.RETURN) {
                Set ret = sapResponse.RETURN.GetNext(.key)
                If $IsObject(ret) {
                    Set returnType = $ZConvert($ZStrip($Get(ret.TYPE), "<W"), "U")
                    Set returnMessage = $ZStrip($Get(ret.MESSAGE), "<W")
                }
            }
        } Catch exReturn {
            Set returnType = ""
            Set returnMessage = ""
        }
    }

    Set success = 0
    If (isOK=1) && (errorMessage="") && (returnType'="E") && (returnType'="A") {
        Set success = 1
    }

    Set json.success = success
    Set json.username = username
    If success {
        Set json.code = "USER_LOCKED"
    } Else {
        Set json.code = "USER_LOCK_ERROR"
    }

    If success {
        If returnMessage'="" {
            Set json.message = returnMessage
        } Else {
            Set json.message = "Usuario bloqueado exitosamente"
        }
    } Else {
        If returnMessage'="" {
            Set json.error = returnMessage
        } ElseIf errorMessage'="" {
            Set json.error = errorMessage
        } Else {
            Set json.error = "Error al bloquear usuario en SAP"
        }
    }

    Set code = ""
    Try {
        Set code = json.%Get("code")
    } Catch exCode3 {
        Set code = ""
    }
    Do ..AddResponseMetadata(.json, code)
    Write json.%ToJSON()
}

ClassMethod TryExtractCheckFromSQL(sapResponse As %RegisteredObject, ByRef isOK, ByRef errorMessage, ByRef returnType, ByRef returnMessage) As %Boolean
{
    Set ok = 0
    Set responseId = ""
    Set lastTriedId = ""

    If '$IsObject(sapResponse) {
        Quit 0
    }

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

    For attempt=1:1:2 {
        Set lookupId = responseId
        If (attempt=2) || (lookupId="") {
            &sql(SELECT TOP 1 ID INTO :lookupId FROM BAPI_USER_EXISTENCE_CHECK.ISCuResponse ORDER BY ID DESC)
            If (SQLCODE'=0) {
                Set lookupId = ""
            }
        }
        Continue:lookupId=""
        Continue:lookupId=lastTriedId
        Set lastTriedId = lookupId

        &sql(SELECT ISCuIsOK, ISCuErrorMessage, RETURN_TYPE, RETURN_MESSAGE
             INTO :qIsOK, :qErrMsg, :qRetType, :qRetMsg
             FROM BAPI_USER_EXISTENCE_CHECK.ISCuResponse
             WHERE ID = :lookupId)
        If SQLCODE=0 {
            Set isOK = +$Get(qIsOK)
            Set errorMessage = $ZStrip($Get(qErrMsg), "<W")
            Set returnType = $ZConvert($ZStrip($Get(qRetType), "<W"), "U")
            Set returnMessage = $ZStrip($Get(qRetMsg), "<W")
            Set ok = 1
            Quit
        }
    }

    Quit ok
}

ClassMethod TryExtractUnlockFromSQL(sapResponse As %RegisteredObject, ByRef isOK, ByRef errorMessage, ByRef returnType, ByRef returnMessage) As %Boolean
{
    Set ok = 0
    Set responseId = ""
    Set lastTriedId = ""

    If '$IsObject(sapResponse) {
        Quit 0
    }

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

    For attempt=1:1:2 {
        Set lookupId = responseId
        If (attempt=2) || (lookupId="") {
            &sql(SELECT TOP 1 ID INTO :lookupId FROM BAPI_USER_UNLOCK.ISCuResponse ORDER BY ID DESC)
            If (SQLCODE'=0) {
                Set lookupId = ""
            }
        }
        Continue:lookupId=""
        Continue:lookupId=lastTriedId
        Set lastTriedId = lookupId

        &sql(SELECT ISCuIsOK, ISCuErrorMessage
             INTO :qIsOK, :qErrMsg
             FROM BAPI_USER_UNLOCK.ISCuResponse
             WHERE ID = :lookupId)
        If (SQLCODE'=0) {
            Continue
        }

        Set qRetType = ""
        Set qRetMsg = ""
        &sql(SELECT TOP 1 TYPE, MESSAGE
             INTO :qRetType, :qRetMsg
             FROM BAPI_USER_UNLOCK.RETURN
             WHERE ISCuResponse = :lookupId
             ORDER BY ID1)
        If (SQLCODE'=0) {
            Set qRetType = ""
            Set qRetMsg = ""
        }

        Set isOK = +$Get(qIsOK)
        Set errorMessage = $ZStrip($Get(qErrMsg), "<W")
        Set returnType = $ZConvert($ZStrip($Get(qRetType), "<W"), "U")
        Set returnMessage = $ZStrip($Get(qRetMsg), "<W")
        Set ok = 1
        Quit
    }

    Quit ok
}

ClassMethod TryExtractLockFromSQL(sapResponse As %RegisteredObject, ByRef isOK, ByRef errorMessage, ByRef returnType, ByRef returnMessage) As %Boolean
{
    Set ok = 0
    Set responseId = ""
    Set lastTriedId = ""

    If '$IsObject(sapResponse) {
        Quit 0
    }

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

    For attempt=1:1:2 {
        Set lookupId = responseId
        If (attempt=2) || (lookupId="") {
            &sql(SELECT TOP 1 ID INTO :lookupId FROM BAPI_USER_LOCK.ISCuResponse ORDER BY ID DESC)
            If (SQLCODE'=0) {
                Set lookupId = ""
            }
        }
        Continue:lookupId=""
        Continue:lookupId=lastTriedId
        Set lastTriedId = lookupId

        &sql(SELECT ISCuIsOK, ISCuErrorMessage
             INTO :qIsOK, :qErrMsg
             FROM BAPI_USER_LOCK.ISCuResponse
             WHERE ID = :lookupId)
        If (SQLCODE'=0) {
            Continue
        }

        Set qRetType = ""
        Set qRetMsg = ""
        &sql(SELECT TOP 1 TYPE, MESSAGE
             INTO :qRetType, :qRetMsg
             FROM BAPI_USER_LOCK.RETURN
             WHERE ISCuResponse = :lookupId
             ORDER BY ID1)
        If (SQLCODE'=0) {
            Set qRetType = ""
            Set qRetMsg = ""
        }

        Set isOK = +$Get(qIsOK)
        Set errorMessage = $ZStrip($Get(qErrMsg), "<W")
        Set returnType = $ZConvert($ZStrip($Get(qRetType), "<W"), "U")
        Set returnMessage = $ZStrip($Get(qRetMsg), "<W")
        Set ok = 1
        Quit
    }

    Quit ok
}

ClassMethod WriteGetUserListJSONFromSAP(sapResponse As %RegisteredObject, usernameFilter As %String = "", maxRows As %Integer = 50)
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

        // Filtro de prefijo completo (todas las letras ingresadas).
        If usernameFilter'="" {
            Do ..ApplyUsernamePrefixFilter(.userArray, .userCount, usernameFilter)
            If userCount=0 {
                Do ..LoadUsersByFilterFromHistory(.userArray, .userCount, usernameFilter, maxRows)
            }
        }
        
        // Limitar resultado final a maxRows para la UI/API.
        Do ..LimitUserArray(.userArray, .userCount, maxRows)

        Set json.success = 1
        Set json.code = "USER_LIST_OK"
        Set json.count = userCount
        Set json.data = userArray
        Do ..AddResponseMetadata(.json, "USER_LIST_OK")
        Write json.%ToJSON()
    } Catch ex {
        Do ..WriteSimpleErrorJSON(ex.DisplayString(), "USER_LIST_ERROR")
    }
}

ClassMethod LimitUserArray(ByRef userArray, ByRef userCount, maxRows As %Integer = 50)
{
    If '$IsObject(userArray) {
        Set userCount = 0
        Quit
    }

    If maxRows<1 {
        Set maxRows = 1
    }

    Set size = 0
    Try {
        Set size = +userArray.%Size()
    } Catch exSize1 {
        Set size = 0
    }
    If size'>maxRows {
        Set userCount = size
        Quit
    }

    Set limited = []
    For i=0:1:(maxRows-1) {
        Set row = userArray.%Get(i)
        Continue:'$IsObject(row)
        Do limited.%Push(row)
    }

    Set userArray = limited
    Set userCount = 0
    Try {
        Set userCount = +limited.%Size()
    } Catch exSize2 {
        Set userCount = 0
    }
}

ClassMethod ApplyUsernamePrefixFilter(ByRef userArray, ByRef userCount, usernameFilter As %String)
{
    If '$IsObject(userArray) {
        Quit
    }

    Set prefix = $ZConvert($ZStrip($Get(usernameFilter), "<W"), "U")
    If prefix="" {
        Quit
    }

    Set filtered = []
    Set size = 0
    Try {
        Set size = +userArray.%Size()
    } Catch exSize1 {
        Set size = 0
    }
    For i=0:1:(size-1) {
        Set row = userArray.%Get(i)
        Continue:'$IsObject(row)

        Set uname = ""
        Try {
            Set uname = $ZConvert($ZStrip($Get(row.%Get("username")), "<W"), "U")
        } Catch ex1 {
            Set uname = ""
        }
        Continue:uname=""
        
        Set isMatch = 0
        Do ..EvaluateUsernameFilter(uname, prefix, .isMatch)
        Continue:'isMatch

        Do filtered.%Push(row)
    }

    Set userArray = filtered
    Set userCount = 0
    Try {
        Set userCount = +filtered.%Size()
    } Catch exSize2 {
        Set userCount = 0
    }
}

ClassMethod EvaluateUsernameFilter(username As %String, usernameFilter As %String, ByRef isMatch As %Integer)
{
    Set isMatch = 0
    Set txt = $ZConvert($Get(username), "U")
    Set pat = $ZConvert($Get(usernameFilter), "U")

    If (txt="") || (pat="") {
        Quit
    }

    // Sin comodines: se interpreta como "contiene".
    If (pat'["*") && (pat'["?") {
        If $Find(txt, pat) {
            Set isMatch = 1
        }
        Quit
    }

    // Con comodines:
    // * = cualquier secuencia (incluida vacía)
    // ? = un carácter
    Set tLen = $Length(txt)
    Set pLen = $Length(pat)
    Set tPos = 1
    Set pPos = 1
    Set starPos = 0
    Set matchPos = 0

    For  {
        Quit:tPos>tLen

        If pPos<=pLen {
            Set pChar = $Extract(pat, pPos)
            Set tChar = $Extract(txt, tPos)

            If (pChar="?") || (pChar=tChar) {
                Set pPos = pPos + 1
                Set tPos = tPos + 1
                Continue
            }

            If pChar="*" {
                Set starPos = pPos
                Set matchPos = tPos
                Set pPos = pPos + 1
                Continue
            }
        }

        If starPos>0 {
            Set pPos = starPos + 1
            Set matchPos = matchPos + 1
            Set tPos = matchPos
            Continue
        }

        Quit
    }

    For  {
        Quit:pPos>pLen
        Quit:$Extract(pat,pPos)'="*"
        Set pPos = pPos + 1
    }

    If pPos>pLen {
        Set isMatch = 1
    }
}

ClassMethod LoadUsersByFilterFromHistory(ByRef userArray, ByRef userCount, usernameFilter As %String, maxRows As %Integer = 50)
{
    Set userArray = []
    Set userCount = 0
    Set filter = $ZConvert($ZStrip($Get(usernameFilter), "<W"), "U")
    If filter="" {
        Quit
    }

    If maxRows<1 {
        Set maxRows = 1
    }

    Set seen = ""
    &sql(DECLARE HistCur CURSOR FOR
         SELECT ID, USERNAME, FIRSTNAME, LASTNAME, FULLNAME
         FROM BAPI_USER_GETLIST.USERLIST
         ORDER BY ID DESC)
    &sql(OPEN HistCur)
    If (SQLCODE'=0) {
        Quit
    }

    For {
        &sql(FETCH HistCur INTO :hId, :hUser, :hFirst, :hLast, :hFull)
        Quit:(SQLCODE'=0)

        Set uname = $ZConvert($ZStrip($Get(hUser), "<W"), "U")
        Continue:uname=""
        Continue:$Data(seen(uname))

        Set isMatch = 0
        Do ..EvaluateUsernameFilter(uname, filter, .isMatch)
        Continue:'isMatch

        Set userObj = {}
        Set userObj.id = +$Get(hId)
        Set userObj.username = uname
        Set userObj.firstname = $ZStrip($Get(hFirst), "<W")
        Set userObj.lastname = $ZStrip($Get(hLast), "<W")
        Set userObj.fullname = $ZStrip($Get(hFull), "<W")
        Do userArray.%Push(userObj)
        Set userCount = userCount + 1
        Set seen(uname)=1
        Quit:userCount>=maxRows
    }
    &sql(CLOSE HistCur)
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
