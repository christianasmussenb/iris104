Class BAPI.USER.CHANGE.DESCRIPTION Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = DESCRIPTION ]
{

/// RESPONSIBLE
/// [CHAR] Responsable de la cuenta de usuario técnica
Property RESPONSIBLE As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "RESPONSIBLE");

/// TECHDESC
/// [CHAR] Descripción de la cuenta técnica de usuario
Property TECHDESC As %String(MAXLEN = 80, TRUNCATE = 1, XMLNAME = "TECHDESC");

Parameter XMLNAME As %String = "DESCRIPTION";

Storage Default
{
<Data name="DESCRIPTIONState">
<Value name="1">
<Value>RESPONSIBLE</Value>
</Value>
<Value name="2">
<Value>TECHDESC</Value>
</Value>
</Data>
<State>DESCRIPTIONState</State>
<StreamLocation>^BAPI.USER.CHANGE.DESCRIPTIONS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
