Class BAPI.USER.CHANGE.ADDTLXreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDTLXreq ]
{

/// COUNTRY
/// [CHAR] Clave de país
Property COUNTRY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuNO");

/// TELEX_NO
/// [CHAR] Número télex
Property TELEXuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TELEXuNO");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: Lado opuesto conectado a un Sistema SAP
Property Ru3uUSER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = ADDTLX ];

Parameter XMLNAME As %String = "ADDTLX";

Storage Default
{
<Data name="ADDTLXreqDefaultData">
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
<Value>TELEXuNO</Value>
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
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuRequest.ADDTLX")</DataLocation>
<DefaultData>ADDTLXreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuRequestC("ADDTLX")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDTLXreqI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDTLXreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
