Class BAPI.USER.CHANGE.ALIASX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ALIASX ]
{

/// BAPIALIAS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BAPIALIAS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BAPIALIAS");

Parameter XMLNAME As %String = "ALIASX";

Storage Default
{
<Data name="ALIASXState">
<Value name="1">
<Value>BAPIALIAS</Value>
</Value>
</Data>
<State>ALIASXState</State>
<StreamLocation>^BAPI.USER.CHANGE.ALIASXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
