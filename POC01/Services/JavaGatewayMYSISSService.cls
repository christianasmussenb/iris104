/// Configuración del Java Gateway para MYSISS
/// Servicio Java Gateway secundario con puerto específico
Class POC01.Services.JavaGatewayMYSISSService Extends EnsLib.JavaGateway.Service
{

/// Configuración de parámetros del servicio
Parameter SETTINGS = "JavaHome,ClassPath,Port";

/// Ruta de Java Home
Property JavaHome As %String [ InitialExpression = "C:\Program Files\Java\jre1.8.0_461" ];

/// ClassPath para JAR de SAP JCO
Property ClassPath As %String [ InitialExpression = "C:\Users\iriscnet-admin\Desktop\sapjco31P_12-20009381\JCO\sapjco3.jar" ];

/// Puerto específico para MYSISS
Property Port As %String [ InitialExpression = "55556" ];

/// Método para inicializar el servicio
Method OnInit() As %Status
{
	// Configurar parámetros del adaptador
	Set ..Adapter.JavaHome = ..JavaHome
	Set ..Adapter.ClassPath = ..ClassPath
	Set ..Adapter.Port = ..Port
	
	Quit ##super()
}

}
