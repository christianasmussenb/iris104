Class BAPI.USER.GETLIST.SELECTIONuRANGEreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = SELECTION_RANGEreq ]
{

/// PARAMETER
/// [CHAR] Parámetro
Property PARAMETER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PARAMETER");

/// FIELD
/// [CHAR] Campo en parámetro
Property FIELD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FIELD");

/// SIGN
/// [CHAR] Criterio inclusión/exclusión SIGN p.tablas range
Property SIGN As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SIGN");

/// OPTION
/// [CHAR] Operador de selección OPTION para tablas range
Property OPTION As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "OPTION");

/// LOW
/// [CHAR] SELECT-OPTION 'genérica' para selecciones dinámicas
Property LOW As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOW");

/// HIGH
/// [CHAR] SELECT-OPTION 'genérica' para selecciones dinámicas
Property HIGH As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HIGH");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = SELECTIONuRANGE ];

Parameter XMLNAME As %String = "SELECTION_RANGE";

Storage Default
{
<Data name="SELECTIONuRANGEreqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PARAMETER</Value>
</Value>
<Value name="3">
<Value>FIELD</Value>
</Value>
<Value name="4">
<Value>SIGN</Value>
</Value>
<Value name="5">
<Value>OPTION</Value>
</Value>
<Value name="6">
<Value>LOW</Value>
</Value>
<Value name="7">
<Value>HIGH</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.GETLIST.ISCuRequest.SELECTIONuRANGE")</DataLocation>
<DefaultData>SELECTIONuRANGEreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GETLIST.ISCuRequestC("SELECTIONuRANGE")</IdLocation>
<IndexLocation>^BAPI.USER2155.SELECTIONuR678FI</IndexLocation>
<StreamLocation>^BAPI.USER2155.SELECTIONuR678FS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
