Class BAPI.USER.CHANGE.LOGONDATA Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = LOGONDATA ]
{

/// GLTGV
/// [DATE] Usuario válido desde
Property GLTGV As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "GLTGV");

/// GLTGB
/// [DATE] Usuario válido hasta
Property GLTGB As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "GLTGB");

/// USTYP
/// [CHAR] Tipo de usuario
Property USTYP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "USTYP");

/// CLASS
/// [CHAR] Grupo de usuarios en actualización maestro de usuarios
Property CLASS As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "CLASS");

/// ACCNT
/// [CHAR] ID de cuenta
Property ACCNT As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "ACCNT");

/// TZONE
/// [CHAR] Huso horario
Property TZONE As %String(MAXLEN = 6, TRUNCATE = 1, XMLNAME = "TZONE");

/// LTIME
/// [TIME] Hora última entrada al sistema
Property LTIME As %String(MAXLEN = 6, TRUNCATE = 1, XMLNAME = "LTIME");

/// BCODE
/// [BYTE] Control clave de acceso
Property BCODE As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "BCODE");

/// CODVN
/// [CHAR] Vers.cód.algoritmo control clave acceso (sistemas antiguos)
Property CODVN As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CODVN");

/// PASSCODE
/// [BYTE] Valor control clave acceso (SHA1, 160 bit)
Property PASSCODE As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "PASSCODE");

/// CODVC
/// [CHAR] Vers.cód.algoritmo valor control clave acceso(sist.nuevos)
Property CODVC As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CODVC");

/// PWDSALTEDHASH
/// [CHAR] Valor control clave acceso (diversos algoritmos y cifrados)
Property PWDSALTEDHASH As %String(MAXLEN = 255, TRUNCATE = 1, XMLNAME = "PWDSALTEDHASH");

/// CODVS
/// [CHAR] Vers.cód.algoritmo valor control clave acceso(sist.nuevos)
Property CODVS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CODVS");

/// SECURITY_POLICY
/// [CHAR] Security Policy Name
Property SECURITYuPOLICY As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "SECURITYuPOLICY");

Parameter XMLNAME As %String = "LOGONDATA";

Storage Default
{
<Data name="LOGONDATAState">
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
<State>LOGONDATAState</State>
<StreamLocation>^BAPI.USER.CHANGE.LOGONDATAS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
