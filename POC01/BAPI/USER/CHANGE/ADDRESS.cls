Class BAPI.USER.CHANGE.ADDRESS Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDRESS ]
{

/// PERS_NO
/// [CHAR] Número de persona
Property PERSuNO As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "PERSuNO");

/// ADDR_NO
/// [CHAR] Nº dirección
Property ADDRuNO As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "ADDRuNO");

/// TITLE_P
/// [CHAR] Texto de tratamiento
Property TITLEuP As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "TITLEuP");

/// FIRSTNAME
/// [CHAR] Nombre
Property FIRSTNAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "FIRSTNAME");

/// LASTNAME
/// [CHAR] Apellido
Property LASTNAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "LASTNAME");

/// BIRTH_NAME
/// [CHAR] Apellido de soltera de la persona
Property BIRTHuNAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "BIRTHuNAME");

/// MIDDLENAME
/// [CHAR] Segundo nombre de la persona
Property MIDDLENAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "MIDDLENAME");

/// SECONDNAME
/// [CHAR] Segundo apellido de la persona
Property SECONDNAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "SECONDNAME");

/// FULLNAME
/// [CHAR] Nombre completo de la persona
Property FULLNAME As %String(MAXLEN = 80, TRUNCATE = 1, XMLNAME = "FULLNAME");

/// FULLNAME_X
/// [CHAR] Status del campo "Nombre completo" (NAME_TEXT)
Property FULLNAMEuX As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FULLNAMEuX");

/// TITLE_ACA1
/// [CHAR] Título académico: Forma escrita
Property TITLEuACA1 As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "TITLEuACA1");

/// TITLE_ACA2
/// [CHAR] 2º título académico: forma escrita
Property TITLEuACA2 As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "TITLEuACA2");

/// PREFIX1
/// [CHAR] Prefijo del nombre
Property PREFIX1 As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "PREFIX1");

/// PREFIX2
/// [CHAR] 2º prefijo del nombre
Property PREFIX2 As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "PREFIX2");

/// TITLE_SPPL
/// [CHAR] Complemento nombre, p.ej. título nobiliario (forma escrita)
Property TITLEuSPPL As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "TITLEuSPPL");

/// NICKNAME
/// [CHAR] Apodo o nombre de pila de la persona
Property NICKNAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "NICKNAME");

/// INITIALS
/// [CHAR] Inicial del segundo nombre o iniciales de la persona
Property INITIALS As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "INITIALS");

/// NAMEFORMAT
/// [CHAR] Formato para la edición del nombre
Property NAMEFORMAT As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "NAMEFORMAT");

/// NAMCOUNTRY
/// [CHAR] País para regla de edición del nombre
Property NAMCOUNTRY As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "NAMCOUNTRY");

/// LANGU_P
/// [CHAR] Clave de idioma
Property LANGUuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUuP");

/// LANGUP_ISO
/// [CHAR] Código de idioma SAP de dos cifras
Property LANGUPuISO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "LANGUPuISO");

/// SORT1_P
/// [CHAR] Concepto de búsqueda 1
Property SORT1uP As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "SORT1uP");

/// SORT2_P
/// [CHAR] Concepto de búsqueda 2
Property SORT2uP As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "SORT2uP");

/// DEPARTMENT
/// [CHAR] Departamento
Property DEPARTMENT As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "DEPARTMENT");

/// FUNCTION
/// [CHAR] Función
Property FUNCTION As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "FUNCTION");

/// BUILDING_P
/// [CHAR] Edificio (número o sigla)
Property BUILDINGuP As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "BUILDINGuP");

/// FLOOR_P
/// [CHAR] Planta del edificio
Property FLOORuP As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "FLOORuP");

/// ROOM_NO_P
/// [CHAR] Número de edificio y de sala
Property ROOMuNOuP As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "ROOMuNOuP");

/// INITS_SIG
/// [CHAR] Denominación breve para correspondencia
Property INITSuSIG As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "INITSuSIG");

/// INHOUSE_ML
/// [CHAR] Código de correo interno
Property INHOUSEuML As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "INHOUSEuML");

/// COMM_TYPE
/// [CHAR] Forma de comunicación (clave) (Business Address Services)
Property COMMuTYPE As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "COMMuTYPE");

/// TITLE
/// [CHAR] Texto de tratamiento
Property TITLE As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "TITLE");

/// NAME
/// [CHAR] Nombre 1
Property NAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "NAME");

/// NAME_2
/// [CHAR] Nombre 2
Property NAMEu2 As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "NAMEu2");

/// NAME_3
/// [CHAR] Nombre 3
Property NAMEu3 As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "NAMEu3");

/// NAME_4
/// [CHAR] Nombre 4
Property NAMEu4 As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "NAMEu4");

/// C_O_NAME
/// [CHAR] Nombre c/o
Property CuOuNAME As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "CuOuNAME");

/// CITY
/// [CHAR] Población
Property CITY As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "CITY");

/// DISTRICT
/// [CHAR] Distrito
Property DISTRICT As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "DISTRICT");

/// CITY_NO
/// [CHAR] Codificación de población para fichero de población y calle
Property CITYuNO As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "CITYuNO");

/// DISTRCT_NO
/// [CHAR] Codificación del distrito para fichero de población y calle
Property DISTRCTuNO As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "DISTRCTuNO");

/// CHCKSTATUS
/// [CHAR] Status verif.resp.fichero población
Property CHCKSTATUS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CHCKSTATUS");

/// POSTL_COD1
/// [CHAR] Código postal de la población
Property POSTLuCOD1 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "POSTLuCOD1");

/// POSTL_COD2
/// [CHAR] Código postal del apartado
Property POSTLuCOD2 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "POSTLuCOD2");

/// POSTL_COD3
/// [CHAR] Código postal de la empresa (en caso de clientes import.)
Property POSTLuCOD3 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "POSTLuCOD3");

/// PO_BOX
/// [CHAR] Apartado
Property POuBOX As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "POuBOX");

/// PO_BOX_CIT
/// [CHAR] Población del apartado
Property POuBOXuCIT As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "POuBOXuCIT");

/// PBOXCIT_NO
/// [CHAR] Codificación población rel.apartado correos (fichero pobl.)
Property PBOXCITuNO As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "PBOXCITuNO");

/// DELIV_DIS
/// [CHAR] Distrito postal (no soportado)
Property DELIVuDIS As %String(MAXLEN = 15, TRUNCATE = 1, XMLNAME = "DELIVuDIS");

/// TRANSPZONE
/// [CHAR] Zona de transporte donde se efectúan las entregas
Property TRANSPZONE As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "TRANSPZONE");

/// STREET
/// [CHAR] Calle
Property STREET As %String(MAXLEN = 60, TRUNCATE = 1, XMLNAME = "STREET");

/// STREET_NO
/// [CHAR] Codificación de la calle para fichero de población y calle
Property STREETuNO As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "STREETuNO");

/// STR_ABBR
/// [CHAR] Abreviación denominación de calle (no soportado)
Property STRuABBR As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "STRuABBR");

/// HOUSE_NO
/// [CHAR] Nº (edificio)
Property HOUSEuNO As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "HOUSEuNO");

/// HOUSE_NO2
/// [CHAR] Suplemento al número de casa
Property HOUSEuNO2 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "HOUSEuNO2");

/// STR_SUPPL1
/// [CHAR] Calle 2
Property STRuSUPPL1 As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "STRuSUPPL1");

/// STR_SUPPL2
/// [CHAR] Calle 3
Property STRuSUPPL2 As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "STRuSUPPL2");

/// STR_SUPPL3
/// [CHAR] Calle 4
Property STRuSUPPL3 As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "STRuSUPPL3");

/// LOCATION
/// [CHAR] Calle 5
Property LOCATION As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "LOCATION");

/// BUILDING
/// [CHAR] Anterior: edificio (número o sigla)
Property BUILDING As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "BUILDING");

/// FLOOR
/// [CHAR] Planta del edificio
Property FLOOR As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "FLOOR");

/// ROOM_NO
/// [CHAR] Número de edificio y de sala
Property ROOMuNO As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "ROOMuNO");

/// COUNTRY
/// [CHAR] Clave de país
Property COUNTRY As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Código ISO del país
Property COUNTRYISO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// LANGU
/// [CHAR] Clave de idioma
Property LANGU As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGU");

/// LANGU_ISO
/// [CHAR] Código de idioma SAP de dos cifras
Property LANGUuISO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "LANGUuISO");

/// REGION
/// [CHAR] Región (estado, provincia, distrito)
Property REGION As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "REGION");

/// SORT1
/// [CHAR] Concepto de búsqueda 1
Property SORT1 As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "SORT1");

/// SORT2
/// [CHAR] Concepto de búsqueda 2
Property SORT2 As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "SORT2");

/// TIME_ZONE
/// [CHAR] Huso horario de la dirección
Property TIMEuZONE As %String(MAXLEN = 6, TRUNCATE = 1, XMLNAME = "TIMEuZONE");

/// TAXJURCODE
/// [CHAR] Domicilio fiscal
Property TAXJURCODE As %String(MAXLEN = 15, TRUNCATE = 1, XMLNAME = "TAXJURCODE");

/// ADR_NOTES
/// [CHAR] Comentarios referentes a la dirección
Property ADRuNOTES As %String(MAXLEN = 50, TRUNCATE = 1, XMLNAME = "ADRuNOTES");

/// TEL1_NUMBR
/// [CHAR] Primer número teléfono: Prefijo + número
Property TEL1uNUMBR As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "TEL1uNUMBR");

/// TEL1_EXT
/// [CHAR] Primer número teléfono: Extensión
Property TEL1uEXT As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "TEL1uEXT");

/// FAX_NUMBER
/// [CHAR] Primer nº de fax: Prefijo + conexión
Property FAXuNUMBER As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "FAXuNUMBER");

/// FAX_EXTENS
/// [CHAR] Primer nº fax: extensión
Property FAXuEXTENS As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "FAXuEXTENS");

/// E_MAIL
/// [CHAR] Dirección de correo electrónico
Property EuMAIL As %String(MAXLEN = 241, TRUNCATE = 1, XMLNAME = "EuMAIL");

/// BUILD_LONG
/// [CHAR] Edificio (número o sigla)
Property BUILDuLONG As %String(MAXLEN = 20, TRUNCATE = 1, XMLNAME = "BUILDuLONG");

/// REGIOGROUP
/// [CHAR] Agrupación estructura regional
Property REGIOGROUP As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "REGIOGROUP");

/// HOME_CITY
/// [CHAR] Lugar de residencia (diferente de población cód.postal)
Property HOMEuCITY As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "HOMEuCITY");

/// HOMECITYNO
/// [CHAR] Codificación lugar resid.dif.p.fichero poblaciones/calles
Property HOMECITYNO As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "HOMECITYNO");

/// PCODE1_EXT
/// [CHAR] Ampliación p.cód.postal población, p. ej., cód.postal +4+2
Property PCODE1uEXT As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "PCODE1uEXT");

/// PCODE2_EXT
/// [CHAR] Ampliación p.código postal apartado (no soportado)
Property PCODE2uEXT As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "PCODE2uEXT");

/// PCODE3_EXT
/// [CHAR] Ampl.p.código postal clientes importantes (no soportado)
Property PCODE3uEXT As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "PCODE3uEXT");

/// PO_W_O_NO
/// [CHAR] Indicador: Datos del apartado del correos sin número
Property POuWuOuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuWuOuNO");

/// PO_BOX_REG
/// [CHAR] Región del apartado (estado federal, land, provincia, etc.)
Property POuBOXuREG As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "POuBOXuREG");

/// POBOX_CTRY
/// [CHAR] País relativo al apartado de correos
Property POBOXuCTRY As %String(MAXLEN = 3, TRUNCATE = 1, XMLNAME = "POBOXuCTRY");

/// PO_CTRYISO
/// [CHAR] Código ISO del país
Property POuCTRYISO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "POuCTRYISO");

/// DONT_USE_S
/// [CHAR] Indicador de destinatario desconocido en dirección calle
Property DONTuUSEuS As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "DONTuUSEuS");

/// DONT_USE_P
/// [CHAR] Indicador destinatario desconocido en apartado postal
Property DONTuUSEuP As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "DONTuUSEuP");

/// HOUSE_NO3
/// [CHAR] Ámbito números (no soportado)
Property HOUSEuNO3 As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "HOUSEuNO3");

/// LANGU_CR_P
/// [CHAR] Idioma original al crear registro de direcciones
Property LANGUuCRuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUuCRuP");

/// LANGUCPISO
/// [CHAR] Código de idioma SAP de dos cifras
Property LANGUCPISO As %String(MAXLEN = 2, TRUNCATE = 1, XMLNAME = "LANGUCPISO");

/// PO_BOX_LOBBY
/// [CHAR] Estación de apartado de correos (PO Box Lobby)
Property POuBOXuLOBBY As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "POuBOXuLOBBY");

/// DELI_SERV_TYPE
/// [CHAR] Clase del servicio de entrega
Property DELIuSERVuTYPE As %String(MAXLEN = 4, TRUNCATE = 1, XMLNAME = "DELIuSERVuTYPE");

/// DELI_SERV_NUMBER
/// [CHAR] Número del servicio de entrega
Property DELIuSERVuNUMBER As %String(MAXLEN = 10, TRUNCATE = 1, XMLNAME = "DELIuSERVuNUMBER");

/// COUNTY_CODE
/// [CHAR] Código de área circular para área circular
Property COUNTYuCODE As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "COUNTYuCODE");

/// COUNTY
/// [CHAR] Distrito (US: County)
Property COUNTY As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "COUNTY");

/// TOWNSHIP_CODE
/// [CHAR] Código de ciudad para ciudad
Property TOWNSHIPuCODE As %String(MAXLEN = 8, TRUNCATE = 1, XMLNAME = "TOWNSHIPuCODE");

/// TOWNSHIP
/// [CHAR] Ciudad
Property TOWNSHIP As %String(MAXLEN = 40, TRUNCATE = 1, XMLNAME = "TOWNSHIP");

/// XPCPT
/// [CHAR] Indicador de conclusión del objetivo de utilización
Property XPCPT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "XPCPT");

Parameter XMLNAME As %String = "ADDRESS";

Storage Default
{
<Data name="ADDRESSState">
<Value name="1">
<Value>PERSuNO</Value>
</Value>
<Value name="2">
<Value>ADDRuNO</Value>
</Value>
<Value name="3">
<Value>TITLEuP</Value>
</Value>
<Value name="4">
<Value>FIRSTNAME</Value>
</Value>
<Value name="5">
<Value>LASTNAME</Value>
</Value>
<Value name="6">
<Value>BIRTHuNAME</Value>
</Value>
<Value name="7">
<Value>MIDDLENAME</Value>
</Value>
<Value name="8">
<Value>SECONDNAME</Value>
</Value>
<Value name="9">
<Value>FULLNAME</Value>
</Value>
<Value name="10">
<Value>FULLNAMEuX</Value>
</Value>
<Value name="11">
<Value>TITLEuACA1</Value>
</Value>
<Value name="12">
<Value>TITLEuACA2</Value>
</Value>
<Value name="13">
<Value>PREFIX1</Value>
</Value>
<Value name="14">
<Value>PREFIX2</Value>
</Value>
<Value name="15">
<Value>TITLEuSPPL</Value>
</Value>
<Value name="16">
<Value>NICKNAME</Value>
</Value>
<Value name="17">
<Value>INITIALS</Value>
</Value>
<Value name="18">
<Value>NAMEFORMAT</Value>
</Value>
<Value name="19">
<Value>NAMCOUNTRY</Value>
</Value>
<Value name="20">
<Value>LANGUuP</Value>
</Value>
<Value name="21">
<Value>LANGUPuISO</Value>
</Value>
<Value name="22">
<Value>SORT1uP</Value>
</Value>
<Value name="23">
<Value>SORT2uP</Value>
</Value>
<Value name="24">
<Value>DEPARTMENT</Value>
</Value>
<Value name="25">
<Value>FUNCTION</Value>
</Value>
<Value name="26">
<Value>BUILDINGuP</Value>
</Value>
<Value name="27">
<Value>FLOORuP</Value>
</Value>
<Value name="28">
<Value>ROOMuNOuP</Value>
</Value>
<Value name="29">
<Value>INITSuSIG</Value>
</Value>
<Value name="30">
<Value>INHOUSEuML</Value>
</Value>
<Value name="31">
<Value>COMMuTYPE</Value>
</Value>
<Value name="32">
<Value>TITLE</Value>
</Value>
<Value name="33">
<Value>NAME</Value>
</Value>
<Value name="34">
<Value>NAMEu2</Value>
</Value>
<Value name="35">
<Value>NAMEu3</Value>
</Value>
<Value name="36">
<Value>NAMEu4</Value>
</Value>
<Value name="37">
<Value>CuOuNAME</Value>
</Value>
<Value name="38">
<Value>CITY</Value>
</Value>
<Value name="39">
<Value>DISTRICT</Value>
</Value>
<Value name="40">
<Value>CITYuNO</Value>
</Value>
<Value name="41">
<Value>DISTRCTuNO</Value>
</Value>
<Value name="42">
<Value>CHCKSTATUS</Value>
</Value>
<Value name="43">
<Value>POSTLuCOD1</Value>
</Value>
<Value name="44">
<Value>POSTLuCOD2</Value>
</Value>
<Value name="45">
<Value>POSTLuCOD3</Value>
</Value>
<Value name="46">
<Value>POuBOX</Value>
</Value>
<Value name="47">
<Value>POuBOXuCIT</Value>
</Value>
<Value name="48">
<Value>PBOXCITuNO</Value>
</Value>
<Value name="49">
<Value>DELIVuDIS</Value>
</Value>
<Value name="50">
<Value>TRANSPZONE</Value>
</Value>
<Value name="51">
<Value>STREET</Value>
</Value>
<Value name="52">
<Value>STREETuNO</Value>
</Value>
<Value name="53">
<Value>STRuABBR</Value>
</Value>
<Value name="54">
<Value>HOUSEuNO</Value>
</Value>
<Value name="55">
<Value>HOUSEuNO2</Value>
</Value>
<Value name="56">
<Value>STRuSUPPL1</Value>
</Value>
<Value name="57">
<Value>STRuSUPPL2</Value>
</Value>
<Value name="58">
<Value>STRuSUPPL3</Value>
</Value>
<Value name="59">
<Value>LOCATION</Value>
</Value>
<Value name="60">
<Value>BUILDING</Value>
</Value>
<Value name="61">
<Value>FLOOR</Value>
</Value>
<Value name="62">
<Value>ROOMuNO</Value>
</Value>
<Value name="63">
<Value>COUNTRY</Value>
</Value>
<Value name="64">
<Value>COUNTRYISO</Value>
</Value>
<Value name="65">
<Value>LANGU</Value>
</Value>
<Value name="66">
<Value>LANGUuISO</Value>
</Value>
<Value name="67">
<Value>REGION</Value>
</Value>
<Value name="68">
<Value>SORT1</Value>
</Value>
<Value name="69">
<Value>SORT2</Value>
</Value>
<Value name="70">
<Value>TIMEuZONE</Value>
</Value>
<Value name="71">
<Value>TAXJURCODE</Value>
</Value>
<Value name="72">
<Value>ADRuNOTES</Value>
</Value>
<Value name="73">
<Value>TEL1uNUMBR</Value>
</Value>
<Value name="74">
<Value>TEL1uEXT</Value>
</Value>
<Value name="75">
<Value>FAXuNUMBER</Value>
</Value>
<Value name="76">
<Value>FAXuEXTENS</Value>
</Value>
<Value name="77">
<Value>EuMAIL</Value>
</Value>
<Value name="78">
<Value>BUILDuLONG</Value>
</Value>
<Value name="79">
<Value>REGIOGROUP</Value>
</Value>
<Value name="80">
<Value>HOMEuCITY</Value>
</Value>
<Value name="81">
<Value>HOMECITYNO</Value>
</Value>
<Value name="82">
<Value>PCODE1uEXT</Value>
</Value>
<Value name="83">
<Value>PCODE2uEXT</Value>
</Value>
<Value name="84">
<Value>PCODE3uEXT</Value>
</Value>
<Value name="85">
<Value>POuWuOuNO</Value>
</Value>
<Value name="86">
<Value>POuBOXuREG</Value>
</Value>
<Value name="87">
<Value>POBOXuCTRY</Value>
</Value>
<Value name="88">
<Value>POuCTRYISO</Value>
</Value>
<Value name="89">
<Value>DONTuUSEuS</Value>
</Value>
<Value name="90">
<Value>DONTuUSEuP</Value>
</Value>
<Value name="91">
<Value>HOUSEuNO3</Value>
</Value>
<Value name="92">
<Value>LANGUuCRuP</Value>
</Value>
<Value name="93">
<Value>LANGUCPISO</Value>
</Value>
<Value name="94">
<Value>POuBOXuLOBBY</Value>
</Value>
<Value name="95">
<Value>DELIuSERVuTYPE</Value>
</Value>
<Value name="96">
<Value>DELIuSERVuNUMBER</Value>
</Value>
<Value name="97">
<Value>COUNTYuCODE</Value>
</Value>
<Value name="98">
<Value>COUNTY</Value>
</Value>
<Value name="99">
<Value>TOWNSHIPuCODE</Value>
</Value>
<Value name="100">
<Value>TOWNSHIP</Value>
</Value>
<Value name="101">
<Value>XPCPT</Value>
</Value>
</Data>
<State>ADDRESSState</State>
<StreamLocation>^BAPI.USER.CHANGE.ADDRESSS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
