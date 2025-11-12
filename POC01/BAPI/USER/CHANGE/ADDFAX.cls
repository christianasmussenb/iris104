Class BAPI.USER.CHANGE.ADDFAX Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDFAX ]
{

/// COUNTRY
/// [CHAR] País para el número de teléfono/fax
Property COUNTRY As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "STDuNO");

/// FAX
/// [CHAR] Número fax: prefijo+número
Property FAX As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "FAX");

/// EXTENSION
/// [CHAR] Nº fax: Extensión
Property EXTENSION As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "EXTENSION");

/// FAX_NO
/// [CHAR] Número de fax completo: Prefijo+número+extensión
Property FAXuNO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "FAXuNO");

/// SENDER_NO
/// [CHAR] Nº de fax para determinar el remitente
Property SENDERuNO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "SENDERuNO");

/// FAX_GROUP
/// [CHAR] Grupo telefax (G3, G4, ...)
Property FAXuGROUP As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "FAXuGROUP");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: Lado opuesto conectado a un Sistema SAP
Property Ru3uUSER As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDFAX ];

Parameter XMLNAME As %String = "ADDFAX";

Storage Default
{
<Data name="ADDFAXDefaultData">
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
<Value>FAX</Value>
</Value>
<Value name="6">
<Value>EXTENSION</Value>
</Value>
<Value name="7">
<Value>FAXuNO</Value>
</Value>
<Value name="8">
<Value>SENDERuNO</Value>
</Value>
<Value name="9">
<Value>FAXuGROUP</Value>
</Value>
<Value name="10">
<Value>STDuRECIP</Value>
</Value>
<Value name="11">
<Value>Ru3uUSER</Value>
</Value>
<Value name="12">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="13">
<Value>CONSNUMBER</Value>
</Value>
<Value name="14">
<Value>ERRORFLAG</Value>
</Value>
<Value name="15">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="16">
<Value>VALIDuFROM</Value>
</Value>
<Value name="17">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDFAX")</DataLocation>
<DefaultData>ADDFAXDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDFAX")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDFAXI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDFAXS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
