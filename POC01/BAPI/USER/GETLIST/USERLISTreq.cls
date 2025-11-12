Class BAPI.USER.GETLIST.USERLISTreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = USERLISTreq ]
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

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = USERLIST ];

Parameter XMLNAME As %String = "USERLIST";

Storage Default
{
<Data name="USERLISTreqDefaultData">
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
<DataLocation>{%%PARENT}("BAPI.USER.GETLIST.ISCuRequest.USERLIST")</DataLocation>
<DefaultData>USERLISTreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GETLIST.ISCuRequestC("USERLIST")</IdLocation>
<IndexLocation>^BAPI.USER.GETLIST.USERLISTreqI</IndexLocation>
<StreamLocation>^BAPI.USER.GETLIST.USERLISTreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
