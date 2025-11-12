Class BAPI.USER.GET.DETAIL.ACTIVITYGROUPSreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ACTIVITYGROUPSreq ]
{

/// AGR_NAME
/// [CHAR] Nombre del rol
Property AGRuNAME As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "AGRuNAME");

/// FROM_DAT
/// [DATE] Fecha generación de menú
Property FROMuDAT As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "FROMuDAT");

/// TO_DAT
/// [DATE] Fecha generación de menú
Property TOuDAT As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "TOuDAT");

/// AGR_TEXT
/// [CHAR] Descripción de rol
Property AGRuTEXT As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "AGRuTEXT");

/// ORG_FLAG
/// [CHAR] Indicador: Asignación indirecta del usuario del rol
Property ORGuFLAG As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "ORGuFLAG");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = ACTIVITYGROUPS ];

Parameter XMLNAME As %String = "ACTIVITYGROUPS";

Storage Default
{
<Data name="ACTIVITYGROUPSreqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AGRuNAME</Value>
</Value>
<Value name="3">
<Value>FROMuDAT</Value>
</Value>
<Value name="4">
<Value>TOuDAT</Value>
</Value>
<Value name="5">
<Value>AGRuTEXT</Value>
</Value>
<Value name="6">
<Value>ORGuFLAG</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.GET.DETAIL.ISCuRequest.ACTIVITYGROUPS")</DataLocation>
<DefaultData>ACTIVITYGROUPSreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET2965.ISCuRequestC("ACTIVITYGROUPS")</IdLocation>
<IndexLocation>^BAPI.USER2965.ACTIVITYGROE9A5I</IndexLocation>
<StreamLocation>^BAPI.USER2965.ACTIVITYGROE9A5S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
