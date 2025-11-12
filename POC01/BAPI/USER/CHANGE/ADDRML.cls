Class BAPI.USER.CHANGE.ADDRML Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDRML ]
{

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuNO");

/// SYMB_DEST
/// [CHAR] Destino simbólico
Property SYMBuDEST As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SYMBuDEST");

/// REC_TYPE
/// [CHAR] Tipo destinatario (campo actualmente no utilizado)
Property RECuTYPE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "RECuTYPE");

/// R_MAIL_CLT
/// [CHAR] Mandante RML (mail remoto, SAP, comunicación SAP)
Property RuMAILuCLT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "RuMAILuCLT");

/// R_MAIL
/// [CHAR] Nombre RML (mail remoto, comunicación R/3, R/3)
Property RuMAIL As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "RuMAIL");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: Lado opuesto conectado a un Sistema SAP
Property Ru3uUSER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDRML ];

Parameter XMLNAME As %String = "ADDRML";

Storage Default
{
<Data name="ADDRMLDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STDuNO</Value>
</Value>
<Value name="3">
<Value>SYMBuDEST</Value>
</Value>
<Value name="4">
<Value>RECuTYPE</Value>
</Value>
<Value name="5">
<Value>RuMAILuCLT</Value>
</Value>
<Value name="6">
<Value>RuMAIL</Value>
</Value>
<Value name="7">
<Value>STDuRECIP</Value>
</Value>
<Value name="8">
<Value>Ru3uUSER</Value>
</Value>
<Value name="9">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="10">
<Value>CONSNUMBER</Value>
</Value>
<Value name="11">
<Value>ERRORFLAG</Value>
</Value>
<Value name="12">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="13">
<Value>VALIDuFROM</Value>
</Value>
<Value name="14">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDRML")</DataLocation>
<DefaultData>ADDRMLDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDRML")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDRMLI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDRMLS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
