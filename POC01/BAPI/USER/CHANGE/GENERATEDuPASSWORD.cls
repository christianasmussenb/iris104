Class BAPI.USER.CHANGE.GENERATEDuPASSWORD Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = GENERATED_PASSWORD ]
{

/// BAPIPWD
/// [CHAR] Clave acceso nueva
Property BAPIPWD As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "BAPIPWD");

Parameter XMLNAME As %String = "GENERATED_PASSWORD";

Storage Default
{
<Data name="GENERATEDuPASSWORDState">
<Value name="1">
<Value>BAPIPWD</Value>
</Value>
</Data>
<State>GENERATEDuPASSWORDState</State>
<StreamLocation>^BAPI.USERB225.GENERATEDuP66B5S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
