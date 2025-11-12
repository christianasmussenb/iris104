Class BAPI.USER.EXISTENCE.CHECK.ISCuRequest Extends Ens.Request [ ProcedureBlock, SqlTableName = ISCuRequest ]
{

/// USERNAME
/// [CHAR] 
Property USERNAME As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "USERNAME");

/// This Request message corresponds to SAP BAPI/RFC: BAPI_USER_EXISTENCE_CHECK
Parameter BAPI As %String = "BAPI_USER_EXISTENCE_CHECK";

/// This Response message corresponds this Request 
Parameter RESPONSECLASSNAME As %String = "BAPI.USER.EXISTENCE.CHECK.ISCuResponse";

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
