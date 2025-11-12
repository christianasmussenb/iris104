Class BAPI.USER.CHANGE.PARAMETERX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = PARAMETERX ]
{

/// PARID
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PARID As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PARID");

/// PARVA
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PARVA As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PARVA");

/// PARTXT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PARTXT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PARTXT");

Parameter XMLNAME As %String = "PARAMETERX";

Storage Default
{
<Data name="PARAMETERXState">
<Value name="1">
<Value>PARID</Value>
</Value>
<Value name="2">
<Value>PARVA</Value>
</Value>
<Value name="3">
<Value>PARTXT</Value>
</Value>
</Data>
<State>PARAMETERXState</State>
<StreamLocation>^BAPI.USER.CHANGE.PARAMETERXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
