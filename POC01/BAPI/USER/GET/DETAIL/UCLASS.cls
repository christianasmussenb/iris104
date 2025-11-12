Class BAPI.USER.GET.DETAIL.UCLASS Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = UCLASS ]
{

/// LIC_TYPE
/// [CHAR] ID para tipos de usuario del sistema SAP
Property LICuTYPE As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "LICuTYPE");

/// SPEC_VERS
/// [CHAR] Asignación a versión especial
Property SPECuVERS As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "SPECuVERS");

/// COUNTRY_SURCHARGE
/// [BCD] Medición sistema: Recargo país 3 posiciones
Property COUNTRYuSURCHARGE As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "COUNTRYuSURCHARGE");

/// SUBSTITUTE_FROM
/// [DATE] Suplente de fecha
Property SUBSTITUTEuFROM As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "SUBSTITUTEuFROM");

/// SUBSTITUTE_UNTIL
/// [DATE] Suplente hasta fecha
Property SUBSTITUTEuUNTIL As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "SUBSTITUTEuUNTIL");

/// SYSID
/// [CHAR] Nombre sistema SAP
Property SYSID As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "SYSID");

/// CLIENT
/// [CHAR] Mandante
Property CLIENT As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "CLIENT");

/// BNAME_CHARGEABLE
/// [CHAR] Usuarios sujetos a pago
Property BNAMEuCHARGEABLE As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "BNAMEuCHARGEABLE");

Parameter XMLNAME As %String = "UCLASS";

Storage Default
{
<Data name="UCLASSState">
<Value name="1">
<Value>LICuTYPE</Value>
</Value>
<Value name="2">
<Value>SPECuVERS</Value>
</Value>
<Value name="3">
<Value>COUNTRYuSURCHARGE</Value>
</Value>
<Value name="4">
<Value>SUBSTITUTEuFROM</Value>
</Value>
<Value name="5">
<Value>SUBSTITUTEuUNTIL</Value>
</Value>
<Value name="6">
<Value>SYSID</Value>
</Value>
<Value name="7">
<Value>CLIENT</Value>
</Value>
<Value name="8">
<Value>BNAMEuCHARGEABLE</Value>
</Value>
</Data>
<State>UCLASSState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.UCLASSS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
