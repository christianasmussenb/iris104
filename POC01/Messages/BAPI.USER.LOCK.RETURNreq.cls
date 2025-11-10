/// Clase para manejar información de retorno de BAPI
/// Contiene detalles de respuesta y mensajes del sistema SAP
Class BAPI.USER.LOCK.RETURNreq Extends (%Persistent, %XML.Adaptor)
{

/// Tipo de mensaje: S Success, E Error, W Warning, I Info, A Abort
Property TYPE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TYPE");

/// ID de clase de mensaje
Property ID As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ID");

/// Número de mensaje
Property NUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NUMBER");

/// Texto del mensaje
Property MESSAGE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGE");

/// Application log: log number
Property LOGuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOGuNO");

/// Application log: Internal message serial number
Property LOGuMSGuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOGuMSGuNO");

/// Variable de mensaje 1
Property MESSAGEuV1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV1");

/// Variable de mensaje 2
Property MESSAGEuV2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV2");

/// Variable de mensaje 3
Property MESSAGEuV3 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV3");

/// Variable de mensaje 4
Property MESSAGEuV4 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV4");

/// Nombre del parámetro
Property PARAMETER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PARAMETER");

/// Líneas en parámetro
Property ROW As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "ROW");

/// Campo en parámetro
Property FIELD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FIELD");

/// Sistema lógico desde donde se origina el mensaje
Property SYSTEM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SYSTEM");

/// Referencia al mensaje de solicitud padre
Property ISCuRequest As %String;

/// Nombre XML del elemento
Parameter XMLNAME = "RETURN";

Storage Default
{
<Data name="RETURNreqDefaultData">
<Subscript>"RETURNreq"</Subscript>
<Value name="1">
<Value>TYPE</Value>
</Value>
<Value name="2">
<Value>ID</Value>
</Value>
<Value name="3">
<Value>NUMBER</Value>
</Value>
<Value name="4">
<Value>MESSAGE</Value>
</Value>
<Value name="5">
<Value>LOGuNO</Value>
</Value>
<Value name="6">
<Value>LOGuMSGuNO</Value>
</Value>
<Value name="7">
<Value>MESSAGEuV1</Value>
</Value>
<Value name="8">
<Value>MESSAGEuV2</Value>
</Value>
<Value name="9">
<Value>MESSAGEuV3</Value>
</Value>
<Value name="10">
<Value>MESSAGEuV4</Value>
</Value>
<Value name="11">
<Value>PARAMETER</Value>
</Value>
<Value name="12">
<Value>ROW</Value>
</Value>
<Value name="13">
<Value>FIELD</Value>
</Value>
<Value name="14">
<Value>SYSTEM</Value>
</Value>
<Value name="15">
<Value>ISCuRequest</Value>
</Value>
<Value name="16">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^BAPI.USER.LOCK.RETURNreqD</DataLocation>
<DefaultData>RETURNreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.LOCK.RETURNreqD</IdLocation>
<IndexLocation>^BAPI.USER.LOCK.RETURNreqI</IndexLocation>
<StreamLocation>^BAPI.USER.LOCK.RETURNreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
