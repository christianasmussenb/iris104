Class BAPI.USER.CHANGE.ADDX400 Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDX400 ]
{

/// STD_NO
/// [CHAR] Dirección remitente estándar en esta clase comunicación
Property STDuNO As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "STDuNO");

/// COUNTRY
/// [CHAR] Clave de país X.400
Property COUNTRY As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// ADM_DOM
/// [CHAR] Dominio para gestión X.400
Property ADMuDOM As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ADMuDOM");

/// PRIV_DOM
/// [CHAR] Dominio privado X.400
Property PRIVuDOM As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "PRIVuDOM");

/// ORGANIZATN
/// [CHAR] Organización X.400
Property ORGANIZATN As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ORGANIZATN");

/// ORG_UNIT_1
/// [CHAR] Unidad de organización X.400 1
Property ORGuUNITu1 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ORGuUNITu1");

/// ORG_UNIT_2
/// [CHAR] Unidad de organización X.400 2
Property ORGuUNITu2 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ORGuUNITu2");

/// ORG_UNIT_3
/// [CHAR] Unidad de organización X.400 3
Property ORGuUNITu3 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ORGuUNITu3");

/// ORG_UNIT_4
/// [CHAR] Unidad de organización X.400 4
Property ORGuUNITu4 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ORGuUNITu4");

/// LASTNAME
/// [CHAR] Apellido X.400
Property LASTNAME As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "LASTNAME");

/// FIRSTNAME
/// [CHAR] Nombre de pila X.400
Property FIRSTNAME As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "FIRSTNAME");

/// INITIALS
/// [CHAR] Iniciales X.400
Property INITIALS As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "INITIALS");

/// GENERATION
/// [CHAR] Generación X.400
Property GENERATION As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "GENERATION");

/// X_121_ADDR
/// [CHAR] Dirección de red X.121 X.400
Property Xu121uADDR As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "Xu121uADDR");

/// TERM_ID
/// [CHAR] ID terminal X.400
Property TERMuID As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "TERMuID");

/// TERM_TYPE
/// [CHAR] Tipo de terminal X.400
Property TERMuTYPE As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "TERMuTYPE");

/// UANID
/// [CHAR] ID numérico para user agent X.400
Property UANID As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "UANID");

/// DDA_TYPE1
/// [CHAR] Domain Defined Attribute X.400, type 1
Property DDAuTYPE1 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuTYPE1");

/// DDA_VALUE1
/// [CHAR] Domain Defined Attribute X.400, value 1
Property DDAuVALUE1 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuVALUE1");

/// DDA_TYPE2
/// [CHAR] Domain Defined Attribute X.400, type 2
Property DDAuTYPE2 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuTYPE2");

/// DDA_VALUE2
/// [CHAR] Domain Defined Attribute X.400, value 2
Property DDAuVALUE2 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuVALUE2");

/// DDA_TYPE3
/// [CHAR] Domain Defined Attribute X.400, type 3
Property DDAuTYPE3 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuTYPE3");

/// DDA_VALUE3
/// [CHAR] Domain Defined Attribute X.400, value 3
Property DDAuVALUE3 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuVALUE3");

/// DDA_TYPE4
/// [CHAR] Domain Defined Attribute X.400, type 4
Property DDAuTYPE4 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuTYPE4");

/// DDA_VALUE4
/// [CHAR] Domain Defined Attribute X.400, value 4
Property DDAuVALUE4 As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "DDAuVALUE4");

/// STD_RECIP
/// [CHAR] Ind.: El receptor es receptor estándar para este número
Property STDuRECIP As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "STDuRECIP");

/// R_3_USER
/// [CHAR] Indicador: Lado opuesto conectado a un Sistema SAP
Property Ru3uUSER As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "Ru3uUSER");

/// TXT_ENCODE
/// [CHAR] Codificación deseada de datos de texto (X.400)
Property TXTuENCODE As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "TXTuENCODE");

/// TNEF
/// [CHAR] Ind.: Destinatario puede recibir codific.TNEF mediante X.400
Property TNEF As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "TNEF");

/// HOME_FLAG
/// [CHAR] Dirección destinatario en esta cl.comunicación (vínc.correo)
Property HOMEuFLAG As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "HOMEuFLAG");

/// CONSNUMBER
/// [NUM] Número actual
Property CONSNUMBER As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "CONSNUMBER");

/// ERRORFLAG
/// [CHAR] Indicador: Registro no se ha tratado
Property ERRORFLAG As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "ERRORFLAG");

/// FLG_NOUSE
/// [CHAR] Indicador: Sin utilización de este número de comunicación
Property FLGuNOUSE As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "FLGuNOUSE");

/// VALID_FROM
/// [CHAR] Datos de comunicación: Válido de (AAAAMMDDHHMMSS)
Property VALIDuFROM As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "VALIDuFROM");

/// VALID_TO
/// [CHAR] Datos de comunicación: Válido a (AAAAMMDDHHMMSS)
Property VALIDuTO As %String(MAXLEN = 5, TRUNCATE = 1, XMLNAME = "VALIDuTO");

/// ISCuResponse
/// [Relationship many side] object reference to the response message
Relationship ISCuResponse As ISCuResponse(XMLNAME = "ISCuResponse") [ Cardinality = parent, Inverse = ADDX400 ];

Parameter XMLNAME As %String = "ADDX400";

Storage Default
{
<Data name="ADDX400DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STDuNO</Value>
</Value>
<Value name="3">
<Value>COUNTRY</Value>
</Value>
<Value name="4">
<Value>COUNTRYISO</Value>
</Value>
<Value name="5">
<Value>ADMuDOM</Value>
</Value>
<Value name="6">
<Value>PRIVuDOM</Value>
</Value>
<Value name="7">
<Value>ORGANIZATN</Value>
</Value>
<Value name="8">
<Value>ORGuUNITu1</Value>
</Value>
<Value name="9">
<Value>ORGuUNITu2</Value>
</Value>
<Value name="10">
<Value>ORGuUNITu3</Value>
</Value>
<Value name="11">
<Value>ORGuUNITu4</Value>
</Value>
<Value name="12">
<Value>LASTNAME</Value>
</Value>
<Value name="13">
<Value>FIRSTNAME</Value>
</Value>
<Value name="14">
<Value>INITIALS</Value>
</Value>
<Value name="15">
<Value>GENERATION</Value>
</Value>
<Value name="16">
<Value>Xu121uADDR</Value>
</Value>
<Value name="17">
<Value>TERMuID</Value>
</Value>
<Value name="18">
<Value>TERMuTYPE</Value>
</Value>
<Value name="19">
<Value>UANID</Value>
</Value>
<Value name="20">
<Value>DDAuTYPE1</Value>
</Value>
<Value name="21">
<Value>DDAuVALUE1</Value>
</Value>
<Value name="22">
<Value>DDAuTYPE2</Value>
</Value>
<Value name="23">
<Value>DDAuVALUE2</Value>
</Value>
<Value name="24">
<Value>DDAuTYPE3</Value>
</Value>
<Value name="25">
<Value>DDAuVALUE3</Value>
</Value>
<Value name="26">
<Value>DDAuTYPE4</Value>
</Value>
<Value name="27">
<Value>DDAuVALUE4</Value>
</Value>
<Value name="28">
<Value>STDuRECIP</Value>
</Value>
<Value name="29">
<Value>Ru3uUSER</Value>
</Value>
<Value name="30">
<Value>TXTuENCODE</Value>
</Value>
<Value name="31">
<Value>TNEF</Value>
</Value>
<Value name="32">
<Value>HOMEuFLAG</Value>
</Value>
<Value name="33">
<Value>CONSNUMBER</Value>
</Value>
<Value name="34">
<Value>ERRORFLAG</Value>
</Value>
<Value name="35">
<Value>FLGuNOUSE</Value>
</Value>
<Value name="36">
<Value>VALIDuFROM</Value>
</Value>
<Value name="37">
<Value>VALIDuTO</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("BAPI.USER.CHANGE.ISCuResponse.ADDX400")</DataLocation>
<DefaultData>ADDX400DefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.ISCuResponseC("ADDX400")</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.ADDX400I</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.ADDX400S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
