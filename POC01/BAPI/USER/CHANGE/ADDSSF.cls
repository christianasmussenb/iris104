Class BAPI.USER.CHANGE.ADDSSF Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDSSF ]
{

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "STDuNO");

/// DUMMY
/// [CHAR] Indicador de una posición
Property DUMMY As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "DUMMY");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// RFCDEST
/// [CHAR] Destino lógico (será indicado al llamar la función)
Property RFCDEST As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "RFCDEST");

/// SSFIDSHORT
/// [CHAR] Campo SSFID p.representación en dynpro
Property SSFIDSHORT As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDSHORT");

/// SSF_NS
/// [CHAR] Denom.área de nombres SSF
Property SSFuNS As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFuNS");

/// SSF_PROF
/// [CHAR] Perfil SSF
Property SSFuPROF As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFuPROF");

/// SSFIDPART1
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART1 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART1");

/// SSFIDPART2
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART2 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART2");

/// SSFIDPART3
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART3 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART3");

/// SSFIDPART4
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART4 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART4");

/// SSFIDPART5
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART5 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART5");

/// SSFIDPART6
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART6 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART6");

/// SSFIDPART7
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART7 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART7");

/// SSFIDPART8
/// [CHAR] SSF nombre firmante/destinatario: Parte 1 - 8
Property SSFIDPART8 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART8");

/// SSFIDPART9
/// [CHAR] SSF nombre firmante/destinatario: Parte 9
Property SSFIDPART9 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "SSFIDPART9");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDSSF ];

Parameter XMLNAME As %String = "ADDSSF";

Storage Default
{
<Data name="ADDSSFDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STDuNO</Value>
</Value>
<Value name="3">
<Value>DUMMY</Value>
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
<Value>RFCDEST</Value>
</Value>
<Value name="8">
<Value>SSFIDSHORT</Value>
</Value>
<Value name="9">
<Value>SSFuNS</Value>
</Value>
<Value name="10">
<Value>SSFuPROF</Value>
</Value>
<Value name="11">
<Value>SSFIDPART1</Value>
</Value>
<Value name="12">
<Value>SSFIDPART2</Value>
</Value>
<Value name="13">
<Value>SSFIDPART3</Value>
</Value>
<Value name="14">
<Value>SSFIDPART4</Value>
</Value>
<Value name="15">
<Value>SSFIDPART5</Value>
</Value>
<Value name="16">
<Value>SSFIDPART6</Value>
</Value>
<Value name="17">
<Value>SSFIDPART7</Value>
</Value>
<Value name="18">
<Value>SSFIDPART8</Value>
</Value>
<Value name="19">
<Value>SSFIDPART9</Value>
</Value>
<Value name="20">
<Value>ERRORFLAG</Value>
</Value>
<Value name="21">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="22">
<Value>VALIDuFROM</Value>
</Value>
<Value name="23">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDSSF")</DataLocation>
<DefaultData>ADDSSFDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDSSF")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDSSFI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDSSFS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
