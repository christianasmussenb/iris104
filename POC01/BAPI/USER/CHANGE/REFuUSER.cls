Class BAPI.USER.CHANGE.REFuUSER Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = REF_USER ]
{

/// REF_USER
/// [CHAR] Nombre de usuario en el maestro de usuarios
Property REFuUSER As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "REFuUSER");

Parameter XMLNAME As %String = "REF_USER";

Storage Default
{
<Data name="REFuUSERState">
<Value name="1">
<Value>REFuUSER</Value>
</Value>
</Data>
<State>REFuUSERState</State>
<StreamLocation>^BAPI.USER.CHANGE.REFuUSERS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
