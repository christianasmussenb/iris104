Class BAPI.USER.GETLIST.ISCuResponse Extends Ens.Response [ ProcedureBlock, SqlTableName = ISCuResponse ]
{

/// ISCuIsOK
/// This property holds the success status of the BAPI/RFC call
Property ISCuIsOK As %Boolean(XMLNAME = "ISCuIsOK");

/// ISCuErrorMessage
/// This property holds any error message produced by the BAPI/RFC call
Property ISCuErrorMessage As %String(MAXLEN = 1024, TRUNCATE = 1, XMLNAME = "ISCuErrorMessage");

/// ROWS
/// [INT] 
Property ROWS As %String(MAXLEN = 11, TRUNCATE = 1, XMLNAME = "ROWS");

/// USERLIST
/// [Relationship master side] object reference to USERLIST details
Relationship USERLIST As USERLIST(XMLNAME = "USERLIST") [ Cardinality = children, Inverse = ISCuResponse ];

/// SELECTION_RANGE
/// [Relationship master side] object reference to SELECTION_RANGE details
Relationship SELECTIONuRANGE As SELECTIONuRANGE(XMLNAME = "SELECTIONuRANGE") [ Cardinality = children, Inverse = ISCuResponse ];

/// SELECTION_EXP
/// [Relationship master side] object reference to SELECTION_EXP details
Relationship SELECTIONuEXP As SELECTIONuEXP(XMLNAME = "SELECTIONuEXP") [ Cardinality = children, Inverse = ISCuResponse ];

/// RETURN
/// [Relationship master side] object reference to RETURN details
Relationship RETURN As RETURN(XMLNAME = "RETURN") [ Cardinality = children, Inverse = ISCuResponse ];

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
<Value>ROWS</Value>
</Value>
</Data>
<DefaultData>ISCuResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
