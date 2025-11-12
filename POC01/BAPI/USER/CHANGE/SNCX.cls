Class BAPI.USER.CHANGE.SNCX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = SNCX ]
{

/// GUIFLAG
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property GUIFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "GUIFLAG");

/// PNAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PNAME");

Parameter XMLNAME As %String = "SNCX";

Storage Default
{
<Data name="SNCXState">
<Value name="1">
<Value>GUIFLAG</Value>
</Value>
<Value name="2">
<Value>PNAME</Value>
</Value>
</Data>
<State>SNCXState</State>
<StreamLocation>^BAPI.USER.CHANGE.SNCXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
