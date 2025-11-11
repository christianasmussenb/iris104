/// Configuración del Java Gateway para MYSISS
/// Servicio Java Gateway secundario con puerto específico
Class POC01.Services.JavaGatewayMYSISSService Extends EnsLib.JavaGateway.Service
{

/// Configuración de parámetros para el Java Gateway de MYSISS
Parameter SETTINGS = "JavaHome:Basic,ClassPath:Basic,Port:Basic,Address:Basic,HeartbeatInterval:Basic,HeartbeatFailureTimeout:Basic,HeartbeatFailureAction:Basic,HeartbeatFailureRetry:Basic";

Property JavaHome As %String [ InitialExpression = "C:\Program Files\Java\jre1.8.0_461" ];

/// Ruta al archivo JAR de SAP JCo (Java Connector)
Property ClassPath As %String [ InitialExpression = "C:\Users\iriscnet-admin\Desktop\sapjco31P_12-20009381\JCO\sapjco3.jar" ];

/// Puerto específico para este Java Gateway
Property Port As %String [ InitialExpression = "55559" ];

}
