Class BAPI.USER.CHANGE.EXTIDSX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = EXTIDSX ]
{

/// EXTID
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property EXTID As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "EXTID");

Parameter XMLNAME As %String = "EXTIDSX";

Storage Default
{
<Data name="EXTIDSXState">
<Value name="1">
<Value>EXTID</Value>
</Value>
</Data>
<State>EXTIDSXState</State>
<StreamLocation>^BAPI.USER.CHANGE.EXTIDSXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
