Class BAPI.USER.GET.DETAIL.SNC Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = SNC ]
{

/// GUIFLAG
/// [CHAR] Permitir acceso por palabra clv.p.SAP GUI (específ.usuario)
Property GUIFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "GUIFLAG");

/// PNAME
/// [CHAR] SNC: Nombre imprimible
Property PNAME As %String(MAXLEN = 255, TRUNCATE = 1, XMLNAME = "PNAME");

Parameter XMLNAME As %String = "SNC";

Storage Default
{
<Data name="SNCState">
<Value name="1">
<Value>GUIFLAG</Value>
</Value>
<Value name="2">
<Value>PNAME</Value>
</Value>
</Data>
<State>SNCState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.SNCS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
