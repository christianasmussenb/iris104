Class BAPI.USER.CHANGE.GROUPSX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = GROUPSX ]
{

/// USERGROUP
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property USERGROUP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "USERGROUP");

Parameter XMLNAME As %String = "GROUPSX";

Storage Default
{
<Data name="GROUPSXState">
<Value name="1">
<Value>USERGROUP</Value>
</Value>
</Data>
<State>GROUPSXState</State>
<StreamLocation>^BAPI.USER.CHANGE.GROUPSXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
