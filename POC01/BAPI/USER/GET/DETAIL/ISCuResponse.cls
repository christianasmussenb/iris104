Class BAPI.USER.GET.DETAIL.ISCuResponse Extends Ens.Response [ ProcedureBlock, SqlTableName = ISCuResponse ]
{

/// ISCuIsOK
/// This property holds the success status of the BAPI/RFC call
Property ISCuIsOK As %Boolean(XMLNAME = "ISCuIsOK");

/// ISCuErrorMessage
/// This property holds any error message produced by the BAPI/RFC call
Property ISCuErrorMessage As %String(MAXLEN = 1024, TRUNCATE = 1, XMLNAME = "ISCuErrorMessage");

/// ADDRESS
/// [STRUCTURE] 
Property ADDRESS As ADDRESS(XMLNAME = "ADDRESS");

/// ADMINDATA
/// [STRUCTURE] 
Property ADMINDATA As ADMINDATA(XMLNAME = "ADMINDATA");

/// ALIAS
/// [STRUCTURE] 
Property ALIAS As ALIAS(XMLNAME = "ALIAS");

/// COMPANY
/// [STRUCTURE] 
Property COMPANY As COMPANY(XMLNAME = "COMPANY");

/// ACTIVITYGROUPS
/// [Relationship master side] object reference to ACTIVITYGROUPS details
Relationship ACTIVITYGROUPS As ACTIVITYGROUPS(XMLNAME = "ACTIVITYGROUPS") [ Cardinality = children, Inverse = ISCuResponse ];

/// DEFAULTS
/// [STRUCTURE] 
Property DEFAULTS As DEFAULTS(XMLNAME = "DEFAULTS");

/// ADDCOMREM
/// [Relationship master side] object reference to ADDCOMREM details
Relationship ADDCOMREM As ADDCOMREM(XMLNAME = "ADDCOMREM") [ Cardinality = children, Inverse = ISCuResponse ];

/// DESCRIPTION
/// [STRUCTURE] 
Property DESCRIPTION As DESCRIPTION(XMLNAME = "DESCRIPTION");

/// IDENTITY
/// [STRUCTURE] 
Property IDENTITY As IDENTITY(XMLNAME = "IDENTITY");

/// ISLOCKED
/// [STRUCTURE] 
Property ISLOCKED As ISLOCKED(XMLNAME = "ISLOCKED");

/// ADDPRT
/// [Relationship master side] object reference to ADDPRT details
Relationship ADDPRT As ADDPRT(XMLNAME = "ADDPRT") [ Cardinality = children, Inverse = ISCuResponse ];

/// LASTMODIFIED
/// [STRUCTURE] 
Property LASTMODIFIED As LASTMODIFIED(XMLNAME = "LASTMODIFIED");

/// ADDRFC
/// [Relationship master side] object reference to ADDRFC details
Relationship ADDRFC As ADDRFC(XMLNAME = "ADDRFC") [ Cardinality = children, Inverse = ISCuResponse ];

/// LOGONDATA
/// [STRUCTURE] 
Property LOGONDATA As LOGONDATA(XMLNAME = "LOGONDATA");

/// REF_USER
/// [STRUCTURE] 
Property REFuUSER As REFuUSER(XMLNAME = "REFuUSER");

/// ADDTLX
/// [Relationship master side] object reference to ADDTLX details
Relationship ADDTLX As ADDTLX(XMLNAME = "ADDTLX") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDTTX
/// [Relationship master side] object reference to ADDTTX details
Relationship ADDTTX As ADDTTX(XMLNAME = "ADDTTX") [ Cardinality = children, Inverse = ISCuResponse ];

/// SNC
/// [STRUCTURE] 
Property SNC As SNC(XMLNAME = "SNC");

/// ADDRML
/// [Relationship master side] object reference to ADDRML details
Relationship ADDRML As ADDRML(XMLNAME = "ADDRML") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDSMTP
/// [Relationship master side] object reference to ADDSMTP details
Relationship ADDSMTP As ADDSMTP(XMLNAME = "ADDSMTP") [ Cardinality = children, Inverse = ISCuResponse ];

/// UCLASS
/// [STRUCTURE] 
Property UCLASS As UCLASS(XMLNAME = "UCLASS");

/// ADDPAG
/// [Relationship master side] object reference to ADDPAG details
Relationship ADDPAG As ADDPAG(XMLNAME = "ADDPAG") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDTEL
/// [Relationship master side] object reference to ADDTEL details
Relationship ADDTEL As ADDTEL(XMLNAME = "ADDTEL") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDFAX
/// [Relationship master side] object reference to ADDFAX details
Relationship ADDFAX As ADDFAX(XMLNAME = "ADDFAX") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDURI
/// [Relationship master side] object reference to ADDURI details
Relationship ADDURI As ADDURI(XMLNAME = "ADDURI") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDSSF
/// [Relationship master side] object reference to ADDSSF details
Relationship ADDSSF As ADDSSF(XMLNAME = "ADDSSF") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDX400
/// [Relationship master side] object reference to ADDX400 details
Relationship ADDX400 As ADDX400(XMLNAME = "ADDX400") [ Cardinality = children, Inverse = ISCuResponse ];

Parameter XMLNAME As %String = "ISCuResponse";

Storage Default
{
<Data name="ISCuResponseDefaultData">
<Subscript>"ISCuResponse"</Subscript>
<Value name="1">
<Value>ISCuIsOK</Value>
</Value>
<Value name="2">
<Value>ISCuErrorMessage</Value>
</Value>
<Value name="3">
<Value>ADDRESS</Value>
</Value>
<Value name="4">
<Value>ADMINDATA</Value>
</Value>
<Value name="5">
<Value>ALIAS</Value>
</Value>
<Value name="6">
<Value>COMPANY</Value>
</Value>
<Value name="7">
<Value>DEFAULTS</Value>
</Value>
<Value name="8">
<Value>DESCRIPTION</Value>
</Value>
<Value name="9">
<Value>IDENTITY</Value>
</Value>
<Value name="10">
<Value>ISLOCKED</Value>
</Value>
<Value name="11">
<Value>LASTMODIFIED</Value>
</Value>
<Value name="12">
<Value>LOGONDATA</Value>
</Value>
<Value name="13">
<Value>REFuUSER</Value>
</Value>
<Value name="14">
<Value>SNC</Value>
</Value>
<Value name="15">
<Value>UCLASS</Value>
</Value>
</Data>
<DefaultData>ISCuResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
