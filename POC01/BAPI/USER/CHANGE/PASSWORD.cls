Class BAPI.USER.CHANGE.PASSWORD Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = PASSWORD ]
{

/// BAPIPWD
/// [CHAR] Clave acceso nueva
Property BAPIPWD As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "BAPIPWD");

Parameter XMLNAME As %String = "PASSWORD";

Storage Default
{
<Data name="PASSWORDState">
<Value name="1">
<Value>BAPIPWD</Value>
</Value>
</Data>
<State>PASSWORDState</State>
<StreamLocation>^BAPI.USER.CHANGE.PASSWORDS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
