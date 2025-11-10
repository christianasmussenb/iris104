/// Business Operation para operaciones SAP
/// Configuración basada en EnsLib.SAP.Operation para conectar con sistemas SAP
Class POC01.BO.SAPOperation Extends EnsLib.SAP.Operation
{

/// Configuración de parámetros SAP
Parameter SETTINGS = "SAPClient,SAPCredentials,SAPHost,SAPLanguage,SAPSystemNumber,JavaGatewayConfigItemName,SAPResponseHandler,SAPGWHost,SAPGWServ,SAPMSHost,SAPR3Name,SAPTraceLevel";

/// Cliente SAP
Property SAPClient As %String [ InitialExpression = "600" ];

/// Credenciales SAP
Property SAPCredentials As %String [ InitialExpression = "CNETuser" ];

/// Host SAP
Property SAPHost As %String [ InitialExpression = "cnetdev" ];

/// Idioma SAP
Property SAPLanguage As %String [ InitialExpression = "ES" ];

/// Número de sistema SAP
Property SAPSystemNumber As %String [ InitialExpression = "00" ];

/// Nombre del item de configuración Java Gateway
Property JavaGatewayConfigItemName As %String [ InitialExpression = "POC01.Services.JavaGatewayService" ];

/// Manejador de respuesta SAP
Property SAPResponseHandler As %String;

/// Host Gateway SAP
Property SAPGWHost As %String [ InitialExpression = "cnetdev" ];

/// Servicio Gateway SAP
Property SAPGWServ As %String [ InitialExpression = "3300" ];

/// Host Message Server SAP
Property SAPMSHost As %String [ InitialExpression = "cnetdev" ];

/// Nombre R3 SAP
Property SAPR3Name As %String [ InitialExpression = "CNQ" ];

/// Nivel de trace SAP
Property SAPTraceLevel As %String [ InitialExpression = "1" ];

}
