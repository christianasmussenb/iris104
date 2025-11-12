Class BAPI.USER.GET.DETAIL.ADMINDATA Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADMINDATA ]
{

/// ANAME
/// [CHAR] Autor registro maestro usuario
Property ANAME As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "ANAME");

/// ERDAT
/// [DATE] Fecha creación registro maestro usuario
Property ERDAT As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "ERDAT");

/// TRDAT
/// [DATE] Fecha del último acceso al sistema
Property TRDAT As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "TRDAT");

Parameter XMLNAME As %String = "ADMINDATA";

Storage Default
{
<Data name="ADMINDATAState">
<Value name="1">
<Value>ANAME</Value>
</Value>
<Value name="2">
<Value>ERDAT</Value>
</Value>
<Value name="3">
<Value>TRDAT</Value>
</Value>
</Data>
<State>ADMINDATAState</State>
<StreamLocation>^BAPI.USER.GET.DE2965.ADMINDATAS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
