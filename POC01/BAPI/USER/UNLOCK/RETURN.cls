Class BAPI.USER.UNLOCK.RETURN Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = RETURN ]
{

/// TYPE
/// [CHAR] Tipo mensaje: S Success, E Error, W Warning, I Info A Abort
Property TYPE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TYPE");

/// ID
/// [CHAR] Clase de mensajes
Property ID As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ID");

/// NUMBER
/// [NUM] Número de mensaje
Property NUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NUMBER");

/// MESSAGE
/// [CHAR] Texto de mensaje
Property MESSAGE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGE");

/// LOG_NO
/// [CHAR] Log de aplicación: Número de log
Property LOGuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOGuNO");

/// LOG_MSG_NO
/// [NUM] Log aplicación: Número consecutivo interno de mensaje
Property LOGuMSGuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOGuMSGuNO");

/// MESSAGE_V1
/// [CHAR] Variable de mensaje
Property MESSAGEuV1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV1");

/// MESSAGE_V2
/// [CHAR] Variable de mensaje
Property MESSAGEuV2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV2");

/// MESSAGE_V3
/// [CHAR] Variable de mensaje
Property MESSAGEuV3 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV3");

/// MESSAGE_V4
/// [CHAR] Variable de mensaje
Property MESSAGEuV4 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MESSAGEuV4");

/// PARAMETER
/// [CHAR] Parámetro
Property PARAMETER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PARAMETER");

/// ROW
/// [INT] Línea en el parámetro
Property ROW As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "ROW");

/// FIELD
/// [CHAR] Campo en parámetro
Property FIELD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FIELD");

/// SYSTEM
/// [CHAR] Sistema (lógico) del que procede el mensaje
Property SYSTEM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SYSTEM");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = RETURN ];

Parameter XMLNAME As %String = "RETURN";

Storage Default
{
<Data name="RETURNDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>TYPE</Value>
</Value>
<Value name="3">
<Value>ID</Value>
</Value>
<Value name="4">
<Value>NUMBER</Value>
</Value>
<Value name="5">
<Value>MESSAGE</Value>
</Value>
<Value name="6">
<Value>LOGuNO</Value>
</Value>
<Value name="7">
<Value>LOGuMSGuNO</Value>
</Value>
<Value name="8">
<Value>MESSAGEuV1</Value>
</Value>
<Value name="9">
<Value>MESSAGEuV2</Value>
</Value>
<Value name="10">
<Value>MESSAGEuV3</Value>
</Value>
<Value name="11">
<Value>MESSAGEuV4</Value>
</Value>
<Value name="12">
<Value>PARAMETER</Value>
</Value>
<Value name="13">
<Value>ROW</Value>
</Value>
<Value name="14">
<Value>FIELD</Value>
</Value>
<Value name="15">
<Value>SYSTEM</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.UNLOCK.ISCuResponse.RETURN")</DataLocation>
<DefaultData>RETURNDefaultData</DefaultData>
<IdLocation>^BAPI.USER.UNLOCK.ISCuResponseC("RETURN")</IdLocation>
<IndexLocation>^BAPI.USER.UNLOCK.RETURNI</IndexLocation>
<StreamLocation>^BAPI.USER.UNLOCK.RETURNS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
