Class BAPI.USER.CHANGE.ADDTEL Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDTEL ]
{

/// COUNTRY
/// [CHAR] País para el número de teléfono/fax
Property COUNTRY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuNO");

/// TELEPHONE
/// [CHAR] Número teléfono: Prefijo+número
Property TELEPHONE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TELEPHONE");

/// EXTENSION
/// [CHAR] Número teléfono: Extensión
Property EXTENSION As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "EXTENSION");

/// TEL_NO
/// [CHAR] Número teléfono completo: Prefijo+número+extensión
Property TELuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TELuNO");

/// CALLER_NO
/// [CHAR] Número de teléfono para determinar la persona que llama
Property CALLERuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CALLERuNO");

/// STD_RECIP
/// [CHAR] ID: Teléfono puede enviar/recibir SMS
Property STDuRECIP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: El teléfono es un teléfono móvil
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

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDTEL ];

Parameter XMLNAME As %String = "ADDTEL";

Storage Default
{
<Data name="ADDTELDefaultData">
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
<Value>TELEPHONE</Value>
</Value>
<Value name="6">
<Value>EXTENSION</Value>
</Value>
<Value name="7">
<Value>TELuNO</Value>
</Value>
<Value name="8">
<Value>CALLERuNO</Value>
</Value>
<Value name="9">
<Value>STDuRECIP</Value>
</Value>
<Value name="10">
<Value>Ru3uUSER</Value>
</Value>
<Value name="11">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="12">
<Value>CONSNUMBER</Value>
</Value>
<Value name="13">
<Value>ERRORFLAG</Value>
</Value>
<Value name="14">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="15">
<Value>VALIDuFROM</Value>
</Value>
<Value name="16">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDTEL")</DataLocation>
<DefaultData>ADDTELDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDTEL")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDTELI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDTELS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
