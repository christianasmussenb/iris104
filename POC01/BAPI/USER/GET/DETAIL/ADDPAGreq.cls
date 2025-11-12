Class BAPI.USER.GET.DETAIL.ADDPAGreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDPAGreq ]
{

/// COUNTRY
/// [CHAR] País para el número de teléfono/fax
Property COUNTRY As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "STDuNO");

/// PAGER_TYPE
/// [CHAR] Servicio pager
Property PAGERuTYPE As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "PAGERuTYPE");

/// PAGER
/// [CHAR] Número busca
Property PAGER As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "PAGER");

/// PAGER_NO
/// [CHAR] Campo de búsqueda normalizado para busca
Property PAGERuNO As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "PAGERuNO");

/// CALLER_NO
/// [CHAR] Número de busca para determinar remitente
Property CALLERuNO As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "CALLERuNO");

/// STD_RECIP
/// [CHAR] Referencia codificada a un número actual
Property STDuRECIP As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Referencia codificada a un número actual
Property Ru3uUSER As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = ADDPAG ];

Parameter XMLNAME As %String = "ADDPAG";

Storage Default
{
<Data name="ADDPAGreqDefaultData">
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
<Value>PAGERuTYPE</Value>
</Value>
<Value name="6">
<Value>PAGER</Value>
</Value>
<Value name="7">
<Value>PAGERuNO</Value>
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
<DataLocation>{%%PARENT}("BAPI.USER.GET.DETAIL.ISCuRequest.ADDPAG")</DataLocation>
<DefaultData>ADDPAGreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET2965.ISCuRequestC("ADDPAG")</IdLocation>
<IndexLocation>^BAPI.USER.GET.DE2965.ADDPAGreqI</IndexLocation>
<StreamLocation>^BAPI.USER.GET.DE2965.ADDPAGreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
