Class BAPI.USER.CHANGE.COMPANYX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = COMPANYX ]
{

/// COMPANY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property COMPANY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COMPANY");

Parameter XMLNAME As %String = "COMPANYX";

Storage Default
{
<Data name="COMPANYXState">
<Value name="1">
<Value>COMPANY</Value>
</Value>
</Data>
<State>COMPANYXState</State>
<StreamLocation>^BAPI.USER.CHANGE.COMPANYXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
