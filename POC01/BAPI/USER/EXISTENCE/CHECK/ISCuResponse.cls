Class BAPI.USER.EXISTENCE.CHECK.ISCuResponse Extends Ens.Response [ ProcedureBlock, SqlTableName = ISCuResponse ]
{

/// ISCuIsOK
/// This property holds the success status of the BAPI/RFC call
Property ISCuIsOK As %Boolean(XMLNAME = "ISCuIsOK");

/// ISCuErrorMessage
/// This property holds any error message produced by the BAPI/RFC call
Property ISCuErrorMessage As %String(MAXLEN = 1024, TRUNCATE = 1, XMLNAME = "ISCuErrorMessage");

/// RETURN
/// [STRUCTURE] 
Property RETURN As RETURN(XMLNAME = "RETURN");

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
<Value>RETURN</Value>
</Value>
</Data>
<DefaultData>ISCuResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
