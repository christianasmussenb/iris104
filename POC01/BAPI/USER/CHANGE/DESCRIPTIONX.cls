Class BAPI.USER.CHANGE.DESCRIPTIONX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = DESCRIPTIONX ]
{

/// RESPONSIBLE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property RESPONSIBLE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "RESPONSIBLE");

/// TECHDESC
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TECHDESC As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TECHDESC");

Parameter XMLNAME As %String = "DESCRIPTIONX";

Storage Default
{
<Data name="DESCRIPTIONXState">
<Value name="1">
<Value>RESPONSIBLE</Value>
</Value>
<Value name="2">
<Value>TECHDESC</Value>
</Value>
</Data>
<State>DESCRIPTIONXState</State>
<StreamLocation>^BAPI.USER.CHANGE.DESCRIPTIONXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
