Class BAPI.USER.GET.DETAIL.DEFAULTS Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = DEFAULTS ]
{

/// STCOD
/// [CHAR] Menú inicial (obsoleto, reemplazado por XUSTART)
Property STCOD As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "STCOD");

/// SPLD
/// [CHAR] SPOOL: Dispositivo de salida
Property SPLD As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "SPLD");

/// SPLG
/// [CHAR] Parámetro de impresión 1
Property SPLG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPLG");

/// SPDB
/// [CHAR] Parámetro de impresión 2
Property SPDB As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPDB");

/// SPDA
/// [CHAR] Parámetro de impresión 3
Property SPDA As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SPDA");

/// DATFM
/// [CHAR] Representación de fecha
Property DATFM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DATFM");

/// DCPFM
/// [CHAR] Representación decimal
Property DCPFM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DCPFM");

/// LANGU
/// [CHAR] Idioma
Property LANGU As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGU");

/// CATTKENNZ
/// [CHAR] CATT: Indicador de verificación
Property CATTKENNZ As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CATTKENNZ");

/// KOSTL
/// [CHAR] Centro de coste
Property KOSTL As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "KOSTL");

/// START_MENU
/// [CHAR] Menú inicial
Property STARTuMENU As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "STARTuMENU");

/// TIMEFM
/// [CHAR] Formato hora (salida de hora 12/24)
Property TIMEFM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TIMEFM");

Parameter XMLNAME As %String = "DEFAULTS";

Storage Default
{
<Data name="DEFAULTSState">
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
<Value>CATTKENNZ</Value>
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
<State>DEFAULTSState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.DEFAULTSS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
