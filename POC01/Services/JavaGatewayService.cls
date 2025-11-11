/// Configuración del Java Gateway Principal
/// Servicio Java Gateway para conexiones SAP JCO
Class POC01.Services.JavaGatewayService Extends EnsLib.JavaGateway.Service
{

/// Ruta al directorio de instalación de Java (Java Home)
Parameter SETTINGS = "JavaHome:Basic,ClassPath:Basic";

/// Directorio de instalación de Java (JRE/JDK)
Property JavaHome As %String(MAXLEN = 1000) [ InitialExpression = "C:\Program Files\Java\jre1.8.0_461" ];

/// Ruta al archivo JAR de SAP JCo (Java Connector)
Property ClassPath As %String(MAXLEN = 1000) [ InitialExpression = "C:\Users\iriscnet-admin\Desktop\sapjco31P_12-20009381\JCO\sapjco3.jar" ];

}
