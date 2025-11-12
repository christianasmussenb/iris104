Class BAPI.USER.GETLIST.USERLIST Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = USERLIST ]
{

/// USERNAME
/// [CHAR] Nombre de usuario en el maestro de usuarios
Property USERNAME As %String(MAXLEN = 80, TRUNCATE = 1, XMLNAME = "USERNAME");

/// FIRSTNAME
/// [CHAR] Nombre
Property FIRSTNAME As %String(MAXLEN = 80, TRUNCATE = 1, XMLNAME = "FIRSTNAME");

/// LASTNAME
/// [CHAR] Apellido
Property LASTNAME As %String(MAXLEN = 80, TRUNCATE = 1, XMLNAME = "LASTNAME");

/// FULLNAME
/// [CHAR] Nombre completo de la persona
Property FULLNAME As %String(MAXLEN = 80, TRUNCATE = 1, XMLNAME = "FULLNAME");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = USERLIST ];

Parameter XMLNAME As %String = "USERLIST";

Storage Default
{
<Data name="USERLISTDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>USERNAME</Value>
</Value>
<Value name="3">
<Value>FIRSTNAME</Value>
</Value>
<Value name="4">
<Value>LASTNAME</Value>
</Value>
<Value name="5">
<Value>FULLNAME</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.GETLIST.ISCuResponse.USERLIST")</DataLocation>
<DefaultData>USERLISTDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET2155.ISCuResponseC("USERLIST")</IdLocation>
<IndexLocation>^BAPI.USER.GETLIST.USERLISTI</IndexLocation>
<StreamLocation>^BAPI.USER.GETLIST.USERLISTS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
