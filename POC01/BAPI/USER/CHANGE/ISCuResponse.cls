Class BAPI.USER.CHANGE.ISCuResponse Extends Ens.Response [ ProcedureBlock, SqlTableName = ISCuResponse ]
{

/// ISCuIsOK
/// This property holds the success status of the BAPI/RFC call
Property ISCuIsOK As %Boolean(XMLNAME = "ISCuIsOK");

/// ISCuErrorMessage
/// This property holds any error message produced by the BAPI/RFC call
Property ISCuErrorMessage As %String(MAXLEN = 1024, TRUNCATE = 1, XMLNAME = "ISCuErrorMessage");

/// GENERATED_PASSWORD
/// [STRUCTURE] 
Property GENERATEDuPASSWORD As GENERATEDuPASSWORD(XMLNAME = "GENERATEDuPASSWORD");

/// ADDCOMREM
/// [Relationship master side] object reference to ADDCOMREM details
Relationship ADDCOMREM As ADDCOMREM(XMLNAME = "ADDCOMREM") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDPRT
/// [Relationship master side] object reference to ADDPRT details
Relationship ADDPRT As ADDPRT(XMLNAME = "ADDPRT") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDRFC
/// [Relationship master side] object reference to ADDRFC details
Relationship ADDRFC As ADDRFC(XMLNAME = "ADDRFC") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDTLX
/// [Relationship master side] object reference to ADDTLX details
Relationship ADDTLX As ADDTLX(XMLNAME = "ADDTLX") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDTTX
/// [Relationship master side] object reference to ADDTTX details
Relationship ADDTTX As ADDTTX(XMLNAME = "ADDTTX") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDRML
/// [Relationship master side] object reference to ADDRML details
Relationship ADDRML As ADDRML(XMLNAME = "ADDRML") [ Cardinality = children, Inverse = ISCuResponse ];

/// ADDSMTP
/// [Relationship master side] object reference to ADDSMTP details
Relationship ADDSMTP As ADDSMTP(XMLNAME = "ADDSMTP") [ Cardinality = children, Inverse = ISCuResponse ];

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
<Value>GENERATEDuPASSWORD</Value>
</Value>
</Data>
<DefaultData>ISCuResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
