/// Script para compilar todos los componentes POC01 en orden correcto
Class POC01.Utils.CompileAll Extends %RegisteredObject
{

/// Compilar todas las clases de POC01 en orden correcto
ClassMethod CompileAll() As %Status
{
    Set tSC = $$$OK
    
    Write "=== POC01 Compilation Script ===", !
    Write "Compiling all components in correct order...", !, !
    
    // Array de clases en orden de compilación
    Set classes = ##class(%ArrayOfDataTypes).%New()
    Do classes.SetAt("BAPI.Services.UserServicesReq", 1)
    Do classes.SetAt("BAPI.Services.UserServicesRes", 2)
    Do classes.SetAt("BAPI.USER.LOCK.RETURNreq", 3)
    Do classes.SetAt("BAPI.USER.LOCK.ISCuRequest", 4)
    Do classes.SetAt("POC01.Services.JavaGatewayService", 5)
    Do classes.SetAt("POC01.Services.JavaGatewayMYSISSService", 6)
    Do classes.SetAt("POC01.BO.SAPOperation", 7)
    Do classes.SetAt("BAPI.Services.UserServicesBS", 8)
    
    // Compilar cada clase
    Set key = ""
    For {
        Set key = classes.Next(key)
        Quit:key=""
        
        Set className = classes.GetAt(key)
        Write "Compiling: ", className, " ... "
        
        Set tSC = $system.OBJ.Compile(className_".cls", "cuk")
        If $$$ISERR(tSC) {
            Write "ERROR", !
            Do $System.Status.DisplayError(tSC)
            Return tSC
        } Else {
            Write "OK", !
        }
    }
    
    Write !, "=== All classes compiled successfully! ===", !
    Return tSC
}

/// Método para verificar si todas las clases existen
ClassMethod VerifyClasses() As %Status
{
    Set tSC = $$$OK
    
    Write "=== Verifying POC01 Classes ===", !
    
    Set classes = ##class(%ArrayOfDataTypes).%New()
    Do classes.SetAt("BAPI.Services.UserServicesReq", 1)
    Do classes.SetAt("BAPI.Services.UserServicesRes", 2)
    Do classes.SetAt("BAPI.USER.LOCK.RETURNreq", 3)
    Do classes.SetAt("BAPI.USER.LOCK.ISCuRequest", 4)
    Do classes.SetAt("POC01.Services.JavaGatewayService", 5)
    Do classes.SetAt("POC01.Services.JavaGatewayMYSISSService", 6)
    Do classes.SetAt("POC01.BO.SAPOperation", 7)
    Do classes.SetAt("BAPI.Services.UserServicesBS", 8)
    
    Set key = ""
    For {
        Set key = classes.Next(key)
        Quit:key=""
        
        Set className = classes.GetAt(key)
        Write "Checking: ", className, " ... "
        
        If ##class(%Dictionary.ClassDefinition).%ExistsId(className) {
            Write "EXISTS", !
        } Else {
            Write "MISSING", !
            Set tSC = $$$ERROR($$$GeneralError, "Class "_className_" does not exist")
        }
    }
    
    If $$$ISOK(tSC) {
        Write !, "All classes exist and are ready!", !
    }
    
    Return tSC
}

}
