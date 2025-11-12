Class BAPI.USER.UNLOCK.ISCuRequest Extends Ens.Request [ ProcedureBlock, SqlTableName = ISCuRequest ]
{

/// USERNAME
/// [CHAR] 
Property USERNAME As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "USERNAME");

/// RETURN
/// [Relationship master side] object reference to RETURN details
Relationship RETURN As RETURNreq(XMLNAME = "RETURN") [ Cardinality = children, Inverse = ISCuRequest ];

/// This Request message corresponds to SAP BAPI/RFC: BAPI_USER_UNLOCK
Parameter BAPI As %String = "BAPI_USER_UNLOCK";

/// This Response message corresponds this Request 
Parameter RESPONSECLASSNAME As %String = "BAPI.USER.UNLOCK.ISCuResponse";

Parameter XMLNAME As %String = "ISCuRequest";

Storage Default
{
<Data name="ISCuRequestDefaultData">
<Subscript>"ISCuRequest"</Subscript>
<Value name="1">
<Value>USERNAME</Value>
</Value>
</Data>
<DefaultData>ISCuRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
