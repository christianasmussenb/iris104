Class BAPI.USER.GETLIST.ISCuRequest Extends Ens.Request [ ProcedureBlock, SqlTableName = ISCuRequest ]
{

/// MAX_ROWS
/// [INT] 
Property MAXuROWS As %String(MAXLEN = 11, TRUNCATE = 1, XMLNAME = "MAXuROWS");

/// WITH_USERNAME
/// [CHAR] 
Property WITHuUSERNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "WITHuUSERNAME");

/// RETURN
/// [Relationship master side] object reference to RETURN details
Relationship RETURN As RETURNreq(XMLNAME = "RETURN") [ Cardinality = children, Inverse = ISCuRequest ];

/// SELECTION_EXP
/// [Relationship master side] object reference to SELECTION_EXP details
Relationship SELECTIONuEXP As SELECTIONuEXPreq(XMLNAME = "SELECTIONuEXP") [ Cardinality = children, Inverse = ISCuRequest ];

/// SELECTION_RANGE
/// [Relationship master side] object reference to SELECTION_RANGE details
Relationship SELECTIONuRANGE As SELECTIONuRANGEreq(XMLNAME = "SELECTIONuRANGE") [ Cardinality = children, Inverse = ISCuRequest ];

/// USERLIST
/// [Relationship master side] object reference to USERLIST details
Relationship USERLIST As USERLISTreq(XMLNAME = "USERLIST") [ Cardinality = children, Inverse = ISCuRequest ];

/// This Request message corresponds to SAP BAPI/RFC: BAPI_USER_GETLIST
Parameter BAPI As %String = "BAPI_USER_GETLIST";

/// This Response message corresponds this Request 
Parameter RESPONSECLASSNAME As %String = "BAPI.USER.GETLIST.ISCuResponse";

Parameter XMLNAME As %String = "ISCuRequest";

Storage Default
{
<Data name="ISCuRequestDefaultData">
<Subscript>"ISCuRequest"</Subscript>
<Value name="1">
<Value>MAXuROWS</Value>
</Value>
<Value name="2">
<Value>WITHuUSERNAME</Value>
</Value>
</Data>
<DefaultData>ISCuRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
