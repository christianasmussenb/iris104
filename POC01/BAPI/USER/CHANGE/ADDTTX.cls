Class BAPI.USER.CHANGE.ADDTTX Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDTTX ]
{

/// COUNTRY
/// [CHAR] Clave de país
Property COUNTRY As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "STDuNO");

/// TELETEX
/// [CHAR] Número teletex
Property TELETEX As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "TELETEX");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: Lado opuesto conectado a un Sistema SAP
Property Ru3uUSER As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 14, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDTTX ];

Parameter XMLNAME As %String = "ADDTTX";

Storage Default
{
<Data name="ADDTTXDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>COUNTRY</Value>
</Value>
<Value name="3">
<Value>COUNTRYISO</Value>
</Value>
<Value name="4">
<Value>STDuNO</Value>
</Value>
<Value name="5">
<Value>TELETEX</Value>
</Value>
<Value name="6">
<Value>STDuRECIP</Value>
</Value>
<Value name="7">
<Value>Ru3uUSER</Value>
</Value>
<Value name="8">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="9">
<Value>CONSNUMBER</Value>
</Value>
<Value name="10">
<Value>ERRORFLAG</Value>
</Value>
<Value name="11">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="12">
<Value>VALIDuFROM</Value>
</Value>
<Value name="13">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDTTX")</DataLocation>
<DefaultData>ADDTTXDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDTTX")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDTTXI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDTTXS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
