Class BAPI.USER.CHANGE.BACKuDISTRIBUTION Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = BACK_DISTRIBUTION ]
{

/// BAPIFLAG
/// [CHAR] Indicador de una posición
Property BAPIFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BAPIFLAG");

Parameter XMLNAME As %String = "BACK_DISTRIBUTION";

Storage Default
{
<Data name="BACKuDISTRIBUTIONState">
<Value name="1">
<Value>BAPIFLAG</Value>
</Value>
</Data>
<State>BACKuDISTRIBUTIONState</State>
<StreamLocation>^BAPI.USERB225.BACKuDISTRI5607S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
