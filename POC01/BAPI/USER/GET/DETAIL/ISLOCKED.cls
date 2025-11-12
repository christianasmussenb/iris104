Class BAPI.USER.GET.DETAIL.ISLOCKED Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ISLOCKED ]
{

/// WRNG_LOGON
/// [CHAR] Status bloqueo usuario
Property WRNGuLOGON As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "WRNGuLOGON");

/// LOCAL_LOCK
/// [CHAR] Status bloqueo usuario
Property LOCALuLOCK As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOCALuLOCK");

/// GLOB_LOCK
/// [CHAR] Status bloqueo usuario
Property GLOBuLOCK As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "GLOBuLOCK");

/// NO_USER_PW
/// [CHAR] Status bloqueo usuario
Property NOuUSERuPW As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NOuUSERuPW");

Parameter XMLNAME As %String = "ISLOCKED";

Storage Default
{
<Data name="ISLOCKEDState">
<Value name="1">
<Value>WRNGuLOGON</Value>
</Value>
<Value name="2">
<Value>LOCALuLOCK</Value>
</Value>
<Value name="3">
<Value>GLOBuLOCK</Value>
</Value>
<Value name="4">
<Value>NOuUSERuPW</Value>
</Value>
</Data>
<State>ISLOCKEDState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.ISLOCKEDS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
