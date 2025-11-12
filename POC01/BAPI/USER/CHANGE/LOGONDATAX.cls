Class BAPI.USER.CHANGE.LOGONDATAX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = LOGONDATAX ]
{

/// GLTGV
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property GLTGV As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "GLTGV");

/// GLTGB
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property GLTGB As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "GLTGB");

/// USTYP
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property USTYP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "USTYP");

/// CLASS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CLASS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CLASS");

/// ACCNT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ACCNT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ACCNT");

/// TZONE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TZONE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TZONE");

/// LTIME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LTIME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LTIME");

/// BCODE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BCODE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BCODE");

/// CODVN
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CODVN As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CODVN");

/// PASSCODE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PASSCODE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PASSCODE");

/// CODVC
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CODVC As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CODVC");

/// PWDSALTEDHASH
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PWDSALTEDHASH As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PWDSALTEDHASH");

/// CODVS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CODVS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CODVS");

/// SECURITY_POLICY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SECURITYuPOLICY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SECURITYuPOLICY");

Parameter XMLNAME As %String = "LOGONDATAX";

Storage Default
{
<Data name="LOGONDATAXState">
<Value name="1">
<Value>GLTGV</Value>
</Value>
<Value name="2">
<Value>GLTGB</Value>
</Value>
<Value name="3">
<Value>USTYP</Value>
</Value>
<Value name="4">
<Value>CLASS</Value>
</Value>
<Value name="5">
<Value>ACCNT</Value>
</Value>
<Value name="6">
<Value>TZONE</Value>
</Value>
<Value name="7">
<Value>LTIME</Value>
</Value>
<Value name="8">
<Value>BCODE</Value>
</Value>
<Value name="9">
<Value>CODVN</Value>
</Value>
<Value name="10">
<Value>PASSCODE</Value>
</Value>
<Value name="11">
<Value>CODVC</Value>
</Value>
<Value name="12">
<Value>PWDSALTEDHASH</Value>
</Value>
<Value name="13">
<Value>CODVS</Value>
</Value>
<Value name="14">
<Value>SECURITYuPOLICY</Value>
</Value>
</Data>
<State>LOGONDATAXState</State>
<StreamLocation>^BAPI.USER.CHANGE.LOGONDATAXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
