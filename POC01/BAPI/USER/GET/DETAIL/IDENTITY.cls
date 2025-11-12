Class BAPI.USER.GET.DETAIL.IDENTITY Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = IDENTITY ]
{

/// IDENTITY_UUID
/// [CHAR] API identidad: ID único para identidad (36 caráct.)
Property IDENTITYuUUID As %String(MAXLEN = 36, TRUNCATE = 1, XMLNAME = "IDENTITYuUUID");

/// BPPERSON
/// [CHAR] IC-APIs: ID único para interlocutor comercial (carácter 36)
Property BPPERSON As %String(MAXLEN = 36, TRUNCATE = 1, XMLNAME = "BPPERSON");

Parameter XMLNAME As %String = "IDENTITY";

Storage Default
{
<Data name="IDENTITYState">
<Value name="1">
<Value>IDENTITYuUUID</Value>
</Value>
<Value name="2">
<Value>BPPERSON</Value>
</Value>
</Data>
<State>IDENTITYState</State>
<StreamLocation>^BAPI.USER.GET.DETAIL.IDENTITYS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
