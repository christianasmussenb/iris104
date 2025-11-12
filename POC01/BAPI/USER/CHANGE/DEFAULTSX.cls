Class BAPI.USER.CHANGE.DEFAULTSX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = DEFAULTSX ]
{

/// STCOD
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STCOD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STCOD");

/// SPLD
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SPLD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPLD");

/// SPLG
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SPLG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPLG");

/// SPDB
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SPDB As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPDB");

/// SPDA
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SPDA As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPDA");

/// DATFM
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DATFM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DATFM");

/// DCPFM
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DCPFM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DCPFM");

/// LANGU
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGU As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGU");

/// CATT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CATT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CATT");

/// KOSTL
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property KOSTL As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "KOSTL");

/// START_MENU
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STARTuMENU As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STARTuMENU");

/// TIMEFM
/// [CHAR] Formato hora (salida de hora 12/24)
Property TIMEFM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TIMEFM");

Parameter XMLNAME As %String = "DEFAULTSX";

Storage Default
{
<Data name="DEFAULTSXState">
<Value name="1">
<Value>STCOD</Value>
</Value>
<Value name="2">
<Value>SPLD</Value>
</Value>
<Value name="3">
<Value>SPLG</Value>
</Value>
<Value name="4">
<Value>SPDB</Value>
</Value>
<Value name="5">
<Value>SPDA</Value>
</Value>
<Value name="6">
<Value>DATFM</Value>
</Value>
<Value name="7">
<Value>DCPFM</Value>
</Value>
<Value name="8">
<Value>LANGU</Value>
</Value>
<Value name="9">
<Value>CATT</Value>
</Value>
<Value name="10">
<Value>KOSTL</Value>
</Value>
<Value name="11">
<Value>STARTuMENU</Value>
</Value>
<Value name="12">
<Value>TIMEFM</Value>
</Value>
</Data>
<State>DEFAULTSXState</State>
<StreamLocation>^BAPI.USER.CHANGE.DEFAULTSXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
