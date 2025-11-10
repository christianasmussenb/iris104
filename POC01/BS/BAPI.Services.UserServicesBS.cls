/// Business Service para manejar servicios de usuario BAPI
/// Extendido de Ens.BusinessService para procesamiento de servicios BAPI
Class BAPI.Services.UserServicesBS Extends Ens.BusinessService
{

/// Método principal para procesar entrada de solicitudes de usuario
Method OnProcessInput(pInput As BAPI.Services.UserServicesReq, Output pOutput As BAPI.Services.UserServicesRes) As %Status
{
	set tSC = $System.Status.OK()
	try {
		// Crear nueva instancia de solicitud BAPI
		set p = ##class(BAPI.USER.LOCK.ISCuRequest).%New()
		set p.USERNAME = pInput.USERNAME
		
		// Enviar solicitud asíncrona a la operación SAP
		set tSC = ..SendRequestAsync("SAPOperation", p, .res)
		
		// Escribir respuesta (para debug/log)
		w res.respuesta
		
	} catch mierror {
		// Capturar y procesar errores
		set ex = mierror.AsStatus()
		set tSC = ex
	}
	
	quit tSC
}

}
