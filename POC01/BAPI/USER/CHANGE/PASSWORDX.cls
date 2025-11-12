Class BAPI.USER.CHANGE.PASSWORDX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = PASSWORDX ]
{

/// BAPIPWD
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BAPIPWD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BAPIPWD");

Parameter XMLNAME As %String = "PASSWORDX";

Storage Default
{
<Data name="PASSWORDXState">
<Value name="1">
<Value>BAPIPWD</Value>
</Value>
</Data>
<State>PASSWORDXState</State>
<StreamLocation>^BAPI.USER.CHANGE.PASSWORDXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
