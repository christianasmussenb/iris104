Class BAPI.USER.GET.DETAIL.COMPANY Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = COMPANY ]
{

/// COMPANY
/// [CHAR] Dirección empresa, clave válida p.todo el sistema
Property COMPANY As %String(MAXLEN = 42, TRUNCATE = 1, XMLNAME = "COMPANY");

Parameter XMLNAME As %String = "COMPANY";

Storage Default
{
<Data name="COMPANYState">
<Value name="1">
<Value>COMPANY</Value>
</Value>
</Data>
<State>COMPANYState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.COMPANYS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
