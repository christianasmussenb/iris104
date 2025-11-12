Class BAPI.USER.CHANGE.UCLASSX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = UCLASSX ]
{

/// UCLASS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property UCLASS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "UCLASS");

/// UCLASSSYS
/// [CHAR] Indicador de modificaciones de tablas
Property UCLASSSYS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "UCLASSSYS");

Parameter XMLNAME As %String = "UCLASSX";

Storage Default
{
<Data name="UCLASSXState">
<Value name="1">
<Value>UCLASS</Value>
</Value>
<Value name="2">
<Value>UCLASSSYS</Value>
</Value>
</Data>
<State>UCLASSXState</State>
<StreamLocation>^BAPI.USER.CHANGE.UCLASSXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
