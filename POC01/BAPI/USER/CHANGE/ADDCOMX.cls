Class BAPI.USER.CHANGE.ADDCOMX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDCOMX ]
{

/// ADTEL
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADTEL As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADTEL");

/// ADFAX
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADFAX As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADFAX");

/// ADTTX
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADTTX As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADTTX");

/// ADTLX
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADTLX As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADTLX");

/// ADSMTP
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADSMTP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADSMTP");

/// ADRML
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADRML As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADRML");

/// ADX400
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADX400 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADX400");

/// ADRFC
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADRFC As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADRFC");

/// ADPRT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADPRT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADPRT");

/// ADSSF
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADSSF As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADSSF");

/// ADURI
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADURI As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADURI");

/// ADPAG
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADPAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADPAG");

/// ADCOMREM
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADCOMREM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADCOMREM");

Parameter XMLNAME As %String = "ADDCOMX";

Storage Default
{
<Data name="ADDCOMXState">
<Value name="1">
<Value>ADTEL</Value>
</Value>
<Value name="2">
<Value>ADFAX</Value>
</Value>
<Value name="3">
<Value>ADTTX</Value>
</Value>
<Value name="4">
<Value>ADTLX</Value>
</Value>
<Value name="5">
<Value>ADSMTP</Value>
</Value>
<Value name="6">
<Value>ADRML</Value>
</Value>
<Value name="7">
<Value>ADX400</Value>
</Value>
<Value name="8">
<Value>ADRFC</Value>
</Value>
<Value name="9">
<Value>ADPRT</Value>
</Value>
<Value name="10">
<Value>ADSSF</Value>
</Value>
<Value name="11">
<Value>ADURI</Value>
</Value>
<Value name="12">
<Value>ADPAG</Value>
</Value>
<Value name="13">
<Value>ADCOMREM</Value>
</Value>
</Data>
<State>ADDCOMXState</State>
<StreamLocation>^BAPI.USER.CHANGE.ADDCOMXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
