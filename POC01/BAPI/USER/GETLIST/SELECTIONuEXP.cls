Class BAPI.USER.GETLIST.SELECTIONuEXP Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = SELECTION_EXP ]
{

/// LOGOP
/// [CHAR] Operación lógica
Property LOGOP As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "LOGOP");

/// ARITY
/// [INT] Prioridad de la operación lógica
Property ARITY As %String(MAXLEN = 11, TRUNCATE = 1, XMLNAME = "ARITY");

/// PARAMETER
/// [CHAR] Parámetro
Property PARAMETER As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "PARAMETER");

/// FIELD
/// [CHAR] Campo en parámetro
Property FIELD As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "FIELD");

/// OPTION
/// [CHAR] ABAP: Opción de selección (EQ/BT/CP/...)
Property OPTION As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "OPTION");

/// LOW
/// [CHAR] ABAP: Valor de selección (valor LOW, HIGH, formato externo)
Property LOW As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "LOW");

/// HIGH
/// [CHAR] ABAP: Valor de selección (valor LOW, HIGH, formato externo)
Property HIGH As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "HIGH");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = SELECTIONuEXP ];

Parameter XMLNAME As %String = "SELECTION_EXP";

Storage Default
{
<Data name="SELECTIONuEXPDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LOGOP</Value>
</Value>
<Value name="3">
<Value>ARITY</Value>
</Value>
<Value name="4">
<Value>PARAMETER</Value>
</Value>
<Value name="5">
<Value>FIELD</Value>
</Value>
<Value name="6">
<Value>OPTION</Value>
</Value>
<Value name="7">
<Value>LOW</Value>
</Value>
<Value name="8">
<Value>HIGH</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.GETLIST.ISCuResponse.SELECTIONuEXP")</DataLocation>
<DefaultData>SELECTIONuEXPDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET2155.ISCuResponseC("SELECTIONuEXP")</IdLocation>
<IndexLocation>^BAPI.USER.GE2155.SELECTIONuEXPI</IndexLocation>
<StreamLocation>^BAPI.USER.GE2155.SELECTIONuEXPS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
