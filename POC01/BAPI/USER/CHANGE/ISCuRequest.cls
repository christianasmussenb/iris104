Class BAPI.USER.CHANGE.ISCuRequest Extends Ens.Request [ ProcedureBlock, SqlTableName = ISCuRequest ]
{

/// ADDCOMX
/// [STRUCTURE] 
Property ADDCOMX As ADDCOMX(XMLNAME = "ADDCOMX");

/// ADDRESS
/// [STRUCTURE] 
Property ADDRESS As ADDRESS(XMLNAME = "ADDRESS");

/// ADDRESSX
/// [STRUCTURE] 
Property ADDRESSX As ADDRESSX(XMLNAME = "ADDRESSX");

/// ALIAS
/// [STRUCTURE] 
Property ALIAS As ALIAS(XMLNAME = "ALIAS");

/// ALIASX
/// [STRUCTURE] 
Property ALIASX As ALIASX(XMLNAME = "ALIASX");

/// BACK_DISTRIBUTION
/// [STRUCTURE] 
Property BACKuDISTRIBUTION As BACKuDISTRIBUTION(XMLNAME = "BACKuDISTRIBUTION");

/// COMPANY
/// [STRUCTURE] 
Property COMPANY As COMPANY(XMLNAME = "COMPANY");

/// COMPANYX
/// [STRUCTURE] 
Property COMPANYX As COMPANYX(XMLNAME = "COMPANYX");

/// DEFAULTS
/// [STRUCTURE] 
Property DEFAULTS As DEFAULTS(XMLNAME = "DEFAULTS");

/// DEFAULTSX
/// [STRUCTURE] 
Property DEFAULTSX As DEFAULTSX(XMLNAME = "DEFAULTSX");

/// DESCRIPTION
/// [STRUCTURE] 
Property DESCRIPTION As DESCRIPTION(XMLNAME = "DESCRIPTION");

/// DESCRIPTIONX
/// [STRUCTURE] 
Property DESCRIPTIONX As DESCRIPTIONX(XMLNAME = "DESCRIPTIONX");

/// EXTIDSX
/// [STRUCTURE] 
Property EXTIDSX As EXTIDSX(XMLNAME = "EXTIDSX");

/// GENERATE_PWD
/// [CHAR] 
Property GENERATEuPWD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "GENERATEuPWD");

/// GROUPSX
/// [STRUCTURE] 
Property GROUPSX As GROUPSX(XMLNAME = "GROUPSX");

/// LOGONDATA
/// [STRUCTURE] 
Property LOGONDATA As LOGONDATA(XMLNAME = "LOGONDATA");

/// LOGONDATAX
/// [STRUCTURE] 
Property LOGONDATAX As LOGONDATAX(XMLNAME = "LOGONDATAX");

/// PARAMETERX
/// [STRUCTURE] 
Property PARAMETERX As PARAMETERX(XMLNAME = "PARAMETERX");

/// PASSWORD
/// [STRUCTURE] 
Property PASSWORD As PASSWORD(XMLNAME = "PASSWORD");

/// PASSWORDX
/// [STRUCTURE] 
Property PASSWORDX As PASSWORDX(XMLNAME = "PASSWORDX");

/// PRODUCTIVE_PWD
/// [CHAR] 
Property PRODUCTIVEuPWD As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PRODUCTIVEuPWD");

/// REF_USER
/// [STRUCTURE] 
Property REFuUSER As REFuUSER(XMLNAME = "REFuUSER");

/// REF_USERX
/// [STRUCTURE] 
Property REFuUSERX As REFuUSERX(XMLNAME = "REFuUSERX");

/// SNC
/// [STRUCTURE] 
Property SNC As SNC(XMLNAME = "SNC");

/// SNCX
/// [STRUCTURE] 
Property SNCX As SNCX(XMLNAME = "SNCX");

/// UCLASS
/// [STRUCTURE] 
Property UCLASS As UCLASS(XMLNAME = "UCLASS");

/// UCLASSX
/// [STRUCTURE] 
Property UCLASSX As UCLASSX(XMLNAME = "UCLASSX");

/// USERNAME
/// [CHAR] 
Property USERNAME As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "USERNAME");

/// ADDCOMREM
/// [Relationship master side] object reference to ADDCOMREM details
Relationship ADDCOMREM As ADDCOMREMreq(XMLNAME = "ADDCOMREM") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDFAX
/// [Relationship master side] object reference to ADDFAX details
Relationship ADDFAX As ADDFAXreq(XMLNAME = "ADDFAX") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDPAG
/// [Relationship master side] object reference to ADDPAG details
Relationship ADDPAG As ADDPAGreq(XMLNAME = "ADDPAG") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDPRT
/// [Relationship master side] object reference to ADDPRT details
Relationship ADDPRT As ADDPRTreq(XMLNAME = "ADDPRT") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDRFC
/// [Relationship master side] object reference to ADDRFC details
Relationship ADDRFC As ADDRFCreq(XMLNAME = "ADDRFC") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDRML
/// [Relationship master side] object reference to ADDRML details
Relationship ADDRML As ADDRMLreq(XMLNAME = "ADDRML") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDSMTP
/// [Relationship master side] object reference to ADDSMTP details
Relationship ADDSMTP As ADDSMTPreq(XMLNAME = "ADDSMTP") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDSSF
/// [Relationship master side] object reference to ADDSSF details
Relationship ADDSSF As ADDSSFreq(XMLNAME = "ADDSSF") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDTEL
/// [Relationship master side] object reference to ADDTEL details
Relationship ADDTEL As ADDTELreq(XMLNAME = "ADDTEL") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDTLX
/// [Relationship master side] object reference to ADDTLX details
Relationship ADDTLX As ADDTLXreq(XMLNAME = "ADDTLX") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDTTX
/// [Relationship master side] object reference to ADDTTX details
Relationship ADDTTX As ADDTTXreq(XMLNAME = "ADDTTX") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDURI
/// [Relationship master side] object reference to ADDURI details
Relationship ADDURI As ADDURIreq(XMLNAME = "ADDURI") [ Cardinality = children, Inverse = ISCuRequest ];

/// ADDX400
/// [Relationship master side] object reference to ADDX400 details
Relationship ADDX400 As ADDX400req(XMLNAME = "ADDX400") [ Cardinality = children, Inverse = ISCuRequest ];

/// This Request message corresponds to SAP BAPI/RFC: BAPI_USER_CHANGE
Parameter BAPI As %String = "BAPI_USER_CHANGE";

/// This Response message corresponds this Request 
Parameter RESPONSECLASSNAME As %String = "BAPI.USER.CHANGE.ISCuResponse";

Parameter XMLNAME As %String = "ISCuRequest";

Storage Default
{
<Data name="ISCuRequestDefaultData">
<Subscript>"ISCuRequest"</Subscript>
<Value name="1">
<Value>ADDCOMX</Value>
</Value>
<Value name="2">
<Value>ADDRESS</Value>
</Value>
<Value name="3">
<Value>ADDRESSX</Value>
</Value>
<Value name="4">
<Value>ALIAS</Value>
</Value>
<Value name="5">
<Value>ALIASX</Value>
</Value>
<Value name="6">
<Value>BACKuDISTRIBUTION</Value>
</Value>
<Value name="7">
<Value>COMPANY</Value>
</Value>
<Value name="8">
<Value>COMPANYX</Value>
</Value>
<Value name="9">
<Value>DEFAULTS</Value>
</Value>
<Value name="10">
<Value>DEFAULTSX</Value>
</Value>
<Value name="11">
<Value>DESCRIPTION</Value>
</Value>
<Value name="12">
<Value>DESCRIPTIONX</Value>
</Value>
<Value name="13">
<Value>EXTIDSX</Value>
</Value>
<Value name="14">
<Value>GENERATEuPWD</Value>
</Value>
<Value name="15">
<Value>GROUPSX</Value>
</Value>
<Value name="16">
<Value>LOGONDATA</Value>
</Value>
<Value name="17">
<Value>LOGONDATAX</Value>
</Value>
<Value name="18">
<Value>PARAMETERX</Value>
</Value>
<Value name="19">
<Value>PASSWORD</Value>
</Value>
<Value name="20">
<Value>PASSWORDX</Value>
</Value>
<Value name="21">
<Value>PRODUCTIVEuPWD</Value>
</Value>
<Value name="22">
<Value>REFuUSER</Value>
</Value>
<Value name="23">
<Value>REFuUSERX</Value>
</Value>
<Value name="24">
<Value>SNC</Value>
</Value>
<Value name="25">
<Value>SNCX</Value>
</Value>
<Value name="26">
<Value>UCLASS</Value>
</Value>
<Value name="27">
<Value>UCLASSX</Value>
</Value>
<Value name="28">
<Value>USERNAME</Value>
</Value>
</Data>
<DefaultData>ISCuRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
