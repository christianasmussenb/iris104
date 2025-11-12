Class BAPI.USER.GET.DETAIL.ADDCOMREM Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDCOMREM ]
{

/// COMM_TYPE
/// [CHAR] Forma de comunicación (clave) (Business Address Services)
Property COMMuTYPE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COMMuTYPE");

/// LANGU
/// [CHAR] Clave de idioma
Property LANGU As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGU");

/// LANGU_ISO
/// [CHAR] Código de idioma SAP de dos cifras
Property LANGUuISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUuISO");

/// COMM_NOTES
/// [CHAR] Comentarios referentes al empalme de comunicación
Property COMMuNOTES As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COMMuNOTES");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDCOMREM ];

Parameter XMLNAME As %String = "ADDCOMREM";

Storage Default
{
<Data name="ADDCOMREMDefaultData">
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
<DataLocation>{%%PARENT}("BAPI.USER.GET.DETAIL.ISCuResponse.ADDCOMREM")</DataLocation>
<DefaultData>ADDCOMREMDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET2965.ISCuResponseC("ADDCOMREM")</IdLocation>
<IndexLocation>^BAPI.USER.GET.DE2965.ADDCOMREMI</IndexLocation>
<StreamLocation>^BAPI.USER.GET.DE2965.ADDCOMREMS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
