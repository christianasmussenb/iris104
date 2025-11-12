Class BAPI.USER.CHANGE.ADDSMTP Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDSMTP ]
{

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuNO");

/// E_MAIL
/// [CHAR] Dirección de correo electrónico
Property EuMAIL As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "EuMAIL");

/// EMAIL_SRCH
/// [CHAR] Campo búsqueda para dirección correo electrónico
Property EMAILuSRCH As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "EMAILuSRCH");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: Lado opuesto conectado a un Sistema SAP
Property Ru3uUSER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// ENCODE
/// [CHAR] Codificación de datos deseada (e-mail)
Property ENCODE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ENCODE");

/// TNEF
/// [CHAR] Ind.: Destinatario puede recibir codific.TNEF mediante SMTP
Property TNEF As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TNEF");

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
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDSMTP ];

Parameter XMLNAME As %String = "ADDSMTP";

Storage Default
{
<Data name="ADDSMTPDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STDuNO</Value>
</Value>
<Value name="3">
<Value>EuMAIL</Value>
</Value>
<Value name="4">
<Value>EMAILuSRCH</Value>
</Value>
<Value name="5">
<Value>STDuRECIP</Value>
</Value>
<Value name="6">
<Value>Ru3uUSER</Value>
</Value>
<Value name="7">
<Value>ENCODE</Value>
</Value>
<Value name="8">
<Value>TNEF</Value>
</Value>
<Value name="9">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="10">
<Value>CONSNUMBER</Value>
</Value>
<Value name="11">
<Value>ERRORFLAG</Value>
</Value>
<Value name="12">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="13">
<Value>VALIDuFROM</Value>
</Value>
<Value name="14">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDSMTP")</DataLocation>
<DefaultData>ADDSMTPDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDSMTP")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDSMTPI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDSMTPS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
