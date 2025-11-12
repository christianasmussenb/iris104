Class BAPI.USER.CHANGE.ADDURIreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDURIreq ]
{

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "STDuNO");

/// URI_TYPE
/// [CHAR] Indica de qué tipo de URI se trata
Property URIuTYPE As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuTYPE");

/// URI
/// [CHAR] URI, por ejemplo, página inicial o dirección ftp
Property URI As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URI");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// URI_PART1
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART1 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART1");

/// URI_PART2
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART2 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART2");

/// URI_PART3
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART3 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART3");

/// URI_PART4
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART4 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART4");

/// URI_PART5
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART5 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART5");

/// URI_PART6
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART6 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART6");

/// URI_PART7
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART7 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART7");

/// URI_PART8
/// [CHAR] Universal Resource Identifier (URI): Parte 1 - 8
Property URIuPART8 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART8");

/// URI_PART9
/// [CHAR] Universal Resource Identifier (URI): Parte 9
Property URIuPART9 As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "URIuPART9");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 250, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = ADDURI ];

Parameter XMLNAME As %String = "ADDURI";

Storage Default
{
<Data name="ADDURIreqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STDuNO</Value>
</Value>
<Value name="3">
<Value>URIuTYPE</Value>
</Value>
<Value name="4">
<Value>URI</Value>
</Value>
<Value name="5">
<Value>STDuRECIP</Value>
</Value>
<Value name="6">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="7">
<Value>CONSNUMBER</Value>
</Value>
<Value name="8">
<Value>URIuPART1</Value>
</Value>
<Value name="9">
<Value>URIuPART2</Value>
</Value>
<Value name="10">
<Value>URIuPART3</Value>
</Value>
<Value name="11">
<Value>URIuPART4</Value>
</Value>
<Value name="12">
<Value>URIuPART5</Value>
</Value>
<Value name="13">
<Value>URIuPART6</Value>
</Value>
<Value name="14">
<Value>URIuPART7</Value>
</Value>
<Value name="15">
<Value>URIuPART8</Value>
</Value>
<Value name="16">
<Value>URIuPART9</Value>
</Value>
<Value name="17">
<Value>ERRORFLAG</Value>
</Value>
<Value name="18">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="19">
<Value>VALIDuFROM</Value>
</Value>
<Value name="20">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuRequest.ADDURI")</DataLocation>
<DefaultData>ADDURIreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuRequestC("ADDURI")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDURIreqI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDURIreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
