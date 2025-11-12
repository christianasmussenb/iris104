Class BAPI.USER.CHANGE.REFuUSERX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = REF_USERX ]
{

/// REF_USER
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property REFuUSER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "REFuUSER");

Parameter XMLNAME As %String = "REF_USERX";

Storage Default
{
<Data name="REFuUSERXState">
<Value name="1">
<Value>REFuUSER</Value>
</Value>
</Data>
<State>REFuUSERXState</State>
<StreamLocation>^BAPI.USER.CHANGE.REFuUSERXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
