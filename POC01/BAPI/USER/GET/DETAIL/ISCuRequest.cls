Class BAPI.USER.GET.DETAIL.ISCuRequest Extends Ens.Request [ ProcedureBlock, SqlTableName = ISCuRequest ]
{

/// CACHE_RESULTS
/// [CHAR] 
Property CACHEuRESULTS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CACHEuRESULTS");

/// USERNAME
/// [CHAR] 
Property USERNAME As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "USERNAME");

/// ACTIVITYGROUPS
/// [Relationship master side] object reference to ACTIVITYGROUPS details
Relationship ACTIVITYGROUPS As ACTIVITYGROUPSreq(XMLNAME = "ACTIVITYGROUPS") [ Cardinality = children, Inverse = ISCuRequest ];

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

/// This Request message corresponds to SAP BAPI/RFC: BAPI_USER_GET_DETAIL
Parameter BAPI As %String = "BAPI_USER_GET_DETAIL";

/// This Response message corresponds this Request 
Parameter RESPONSECLASSNAME As %String = "BAPI.USER.GET.DETAIL.ISCuResponse";

Parameter XMLNAME As %String = "ISCuRequest";

Storage Default
{
<Data name="ISCuRequestDefaultData">
<Subscript>"ISCuRequest"</Subscript>
<Value name="1">
<Value>CACHEuRESULTS</Value>
</Value>
<Value name="2">
<Value>USERNAME</Value>
</Value>
</Data>
<DefaultData>ISCuRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
