/// Script de importación para cargar todos los archivos POC01 al servidor IRIS
/// Ejecutar en el terminal de IRIS:
/// do ##class(POC01.Utils.ImportAll).Import("/Users/cab/VSCODE/iris104/POC01")
Class POC01.Utils.ImportAll
{

/// Importar y compilar todos los archivos .cls desde el directorio POC01
ClassMethod Import(pRootDir As %String = "/Users/cab/VSCODE/iris104/POC01") As %Status
{
    Set tSC = $$$OK
    
    Write "=== Importando archivos POC01 ===", !
    Write "Directorio: ", pRootDir, !, !
    
    Try {
        // Orden de importación
        Set files = ##class(%ListOfDataTypes).%New()
        Do files.Insert(pRootDir_"/Messages/BAPI.Services.UserServicesReq.cls")
        Do files.Insert(pRootDir_"/Messages/BAPI.Services.UserServicesRes.cls")
        Do files.Insert(pRootDir_"/Messages/BAPI.USER.LOCK.RETURNreq.cls")
        Do files.Insert(pRootDir_"/Messages/BAPI.USER.LOCK.ISCuRequest.cls")
        Do files.Insert(pRootDir_"/Services/JavaGatewayService.cls")
        Do files.Insert(pRootDir_"/Services/JavaGatewayMYSISSService.cls")
        Do files.Insert(pRootDir_"/BO/SAPOperation.cls")
        Do files.Insert(pRootDir_"/BS/BAPI.Services.UserServicesBS.cls")
        
        // Importar cada archivo
        For i=1:1:files.Count() {
            Set filename = files.GetAt(i)
            Write "Importando: ", filename, " ... "
            
            Set tSC = $system.OBJ.Load(filename, "ck")
            If $$$ISERR(tSC) {
                Write "ERROR", !
                Do $System.Status.DisplayError(tSC)
                Return tSC
            } Else {
                Write "OK", !
            }
        }
        
        Write !, "=== Importación completada exitosamente ===", !
        
    } Catch ex {
        Set tSC = ex.AsStatus()
        Write "ERROR: ", ex.DisplayString(), !
    }
    
    Return tSC
}

/// Método alternativo usando $system.OBJ.ImportDir
ClassMethod ImportDir(pRootDir As %String = "/Users/cab/VSCODE/iris104/POC01") As %Status
{
    Set tSC = $$$OK
    
    Write "=== Importando directorio POC01 ===", !
    Write "Directorio: ", pRootDir, !, !
    
    Try {
        // Importar todos los archivos .cls recursivamente
        Set tSC = $system.OBJ.ImportDir(pRootDir, "*.cls", "ck", .errors, 1)
        
        If $$$ISERR(tSC) {
            Write "ERROR durante la importación", !
            Do $System.Status.DisplayError(tSC)
        } Else {
            Write "=== Importación completada ===", !
        }
        
    } Catch ex {
        Set tSC = ex.AsStatus()
        Write "ERROR: ", ex.DisplayString(), !
    }
    
    Return tSC
}

}
