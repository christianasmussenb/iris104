Class BAPI.USER.GET.DETAIL.ADDPRTreq Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDPRTreq ]
{

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "STDuNO");

/// PRINT_DEST
/// [CHAR] SPOOL: Dispositivo de salida
Property PRINTuDEST As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "PRINTuDEST");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuRequest
/// [Relationship detail side] object reference to the request message
Relationship ISCuRequest As ISCuRequest(XMLNAME = "ISCuRequest") [ Cardinality = parent, Inverse = ADDPRT ];

Parameter XMLNAME As %String = "ADDPRT";

Storage Default
{
<Data name="ADDPRTreqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STDuNO</Value>
</Value>
<Value name="3">
<Value>PRINTuDEST</Value>
</Value>
<Value name="4">
<Value>STDuRECIP</Value>
</Value>
<Value name="5">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="6">
<Value>CONSNUMBER</Value>
</Value>
<Value name="7">
<Value>ERRORFLAG</Value>
</Value>
<Value name="8">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="9">
<Value>VALIDuFROM</Value>
</Value>
<Value name="10">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.GET.DETAIL.ISCuRequest.ADDPRT")</DataLocation>
<DefaultData>ADDPRTreqDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET2965.ISCuRequestC("ADDPRT")</IdLocation>
<IndexLocation>^BAPI.USER.GET.DE2965.ADDPRTreqI</IndexLocation>
<StreamLocation>^BAPI.USER.GET.DE2965.ADDPRTreqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
