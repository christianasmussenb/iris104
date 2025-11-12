Class BAPI.USER.GET.DETAIL.LASTMODIFIED Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = LASTMODIFIED ]
{

/// MODDATE
/// [DATE] Fecha de modificación
Property MODDATE As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "MODDATE");

/// MODTIME
/// [TIME] Hora de la modificación
Property MODTIME As %String(MAXLEN = 6, TRUNCATE = 1, XMLNAME = "MODTIME");

/// MODIFIER
/// [CHAR] Modificado por
Property MODIFIER As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "MODIFIER");

Parameter XMLNAME As %String = "LASTMODIFIED";

Storage Default
{
<Data name="LASTMODIFIEDState">
<Value name="1">
<Value>MODDATE</Value>
</Value>
<Value name="2">
<Value>MODTIME</Value>
</Value>
<Value name="3">
<Value>MODIFIER</Value>
</Value>
</Data>
<State>LASTMODIFIEDState</State>
<StreamLocation>^BAPI.USER.GET2965.LASTMODIFIEDS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
