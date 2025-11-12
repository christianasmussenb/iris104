Class BAPI.USER.GET.DETAIL.ALIAS Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ALIAS ]
{

/// USERALIAS
/// [CHAR] Nombre alias p.usuario de Internet
Property USERALIAS As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "USERALIAS");

Parameter XMLNAME As %String = "ALIAS";

Storage Default
{
<Data name="ALIASState">
<Value name="1">
<Value>USERALIAS</Value>
</Value>
</Data>
<State>ALIASState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.ALIASS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
