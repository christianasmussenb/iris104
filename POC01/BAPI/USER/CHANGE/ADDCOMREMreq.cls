Class BAPI.USER.CHANGE.ADDCOMREMreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDCOMREMreq ]
{

/// COMM_TYPE
/// [CHAR] Forma de comunicación (clave) (Business Address Services)
Property COMMuTYPE As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "COMMuTYPE");

/// LANGU
/// [CHAR] Clave de idioma
Property LANGU As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "LANGU");

/// LANGU_ISO
/// [CHAR] Código de idioma SAP de dos cifras
Property LANGUuISO As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "LANGUuISO");

/// COMM_NOTES
/// [CHAR] Comentarios referentes al empalme de comunicación
Property COMMuNOTES As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "COMMuNOTES");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = ADDCOMREM ];

Parameter XMLNAME As %String = "ADDCOMREM";

Storage Default
{
<Data name="ADDCOMREMreqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>COMMuTYPE</Value>
</Value>
<Value name="3">
<Value>LANGU</Value>
</Value>
<Value name="4">
<Value>LANGUuISO</Value>
</Value>
<Value name="5">
<Value>COMMuNOTES</Value>
</Value>
<Value name="6">
<Value>CONSNUMBER</Value>
</Value>
<Value name="7">
<Value>ERRORFLAG</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuRequest.ADDCOMREM")</DataLocation>
<DefaultData>ADDCOMREMreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuRequestC("ADDCOMREM")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDCOMREMreqI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDCOMREMreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
