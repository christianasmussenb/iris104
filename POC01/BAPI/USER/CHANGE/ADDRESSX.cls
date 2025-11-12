Class BAPI.USER.CHANGE.ADDRESSX Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = ADDRESSX ]
{

/// PERS_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PERSuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PERSuNO");

/// ADDR_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADDRuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADDRuNO");

/// TITLE_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TITLEuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TITLEuP");

/// FIRSTNAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FIRSTNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FIRSTNAME");

/// LASTNAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LASTNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LASTNAME");

/// BIRTH_NAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BIRTHuNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BIRTHuNAME");

/// MIDDLENAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property MIDDLENAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "MIDDLENAME");

/// SECONDNAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SECONDNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SECONDNAME");

/// FULLNAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FULLNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FULLNAME");

/// FULLNAME_X
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FULLNAMEuX As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FULLNAMEuX");

/// TITLE_ACA1
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TITLEuACA1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TITLEuACA1");

/// TITLE_ACA2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TITLEuACA2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TITLEuACA2");

/// PREFIX1
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PREFIX1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PREFIX1");

/// PREFIX2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PREFIX2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PREFIX2");

/// TITLE_SPPL
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TITLEuSPPL As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TITLEuSPPL");

/// NICKNAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NICKNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NICKNAME");

/// INITIALS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property INITIALS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "INITIALS");

/// NAMEFORMAT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NAMEFORMAT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NAMEFORMAT");

/// NAMCOUNTRY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NAMCOUNTRY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NAMCOUNTRY");

/// LANGU_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGUuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUuP");

/// LANGUP_ISO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGUPuISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUPuISO");

/// SORT1_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SORT1uP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SORT1uP");

/// SORT2_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SORT2uP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SORT2uP");

/// DEPARTMENT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DEPARTMENT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DEPARTMENT");

/// FUNCTION
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FUNCTION As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FUNCTION");

/// BUILDING_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BUILDINGuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BUILDINGuP");

/// FLOOR_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FLOORuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FLOORuP");

/// ROOM_NO_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ROOMuNOuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ROOMuNOuP");

/// INITS_SIG
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property INITSuSIG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "INITSuSIG");

/// INHOUSE_ML
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property INHOUSEuML As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "INHOUSEuML");

/// COMM_TYPE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property COMMuTYPE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COMMuTYPE");

/// TITLE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TITLE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TITLE");

/// NAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NAME");

/// NAME_2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NAMEu2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NAMEu2");

/// NAME_3
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NAMEu3 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NAMEu3");

/// NAME_4
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property NAMEu4 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "NAMEu4");

/// C_O_NAME
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CuOuNAME As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CuOuNAME");

/// CITY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CITY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CITY");

/// DISTRICT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DISTRICT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DISTRICT");

/// CITY_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CITYuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CITYuNO");

/// DISTRCT_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DISTRCTuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DISTRCTuNO");

/// CHCKSTATUS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property CHCKSTATUS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "CHCKSTATUS");

/// POSTL_COD1
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POSTLuCOD1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POSTLuCOD1");

/// POSTL_COD2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POSTLuCOD2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POSTLuCOD2");

/// POSTL_COD3
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POSTLuCOD3 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POSTLuCOD3");

/// PO_BOX
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POuBOX As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuBOX");

/// PO_BOX_CIT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POuBOXuCIT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuBOXuCIT");

/// PBOXCIT_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PBOXCITuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PBOXCITuNO");

/// DELIV_DIS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DELIVuDIS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DELIVuDIS");

/// TRANSPZONE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TRANSPZONE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TRANSPZONE");

/// STREET
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STREET As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STREET");

/// STREET_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STREETuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STREETuNO");

/// STR_ABBR
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STRuABBR As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STRuABBR");

/// HOUSE_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property HOUSEuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOUSEuNO");

/// HOUSE_NO2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property HOUSEuNO2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOUSEuNO2");

/// STR_SUPPL1
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STRuSUPPL1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STRuSUPPL1");

/// STR_SUPPL2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STRuSUPPL2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STRuSUPPL2");

/// STR_SUPPL3
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property STRuSUPPL3 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "STRuSUPPL3");

/// LOCATION
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LOCATION As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LOCATION");

/// BUILDING
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BUILDING As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BUILDING");

/// FLOOR
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FLOOR As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FLOOR");

/// ROOM_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ROOMuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ROOMuNO");

/// COUNTRY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property COUNTRY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTRY");

/// COUNTRYISO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property COUNTRYISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTRYISO");

/// LANGU
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGU As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGU");

/// LANGU_ISO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGUuISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUuISO");

/// REGION
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property REGION As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "REGION");

/// SORT1
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SORT1 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SORT1");

/// SORT2
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property SORT2 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "SORT2");

/// TIME_ZONE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TIMEuZONE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TIMEuZONE");

/// TAXJURCODE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TAXJURCODE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TAXJURCODE");

/// ADR_NOTES
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property ADRuNOTES As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "ADRuNOTES");

/// TEL1_NUMBR
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TEL1uNUMBR As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TEL1uNUMBR");

/// TEL1_EXT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TEL1uEXT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TEL1uEXT");

/// FAX_NUMBER
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FAXuNUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FAXuNUMBER");

/// FAX_EXTENS
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property FAXuEXTENS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "FAXuEXTENS");

/// E_MAIL
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property EuMAIL As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "EuMAIL");

/// BUILD_LONG
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property BUILDuLONG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "BUILDuLONG");

/// REGIOGROUP
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property REGIOGROUP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "REGIOGROUP");

/// HOME_CITY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property HOMEuCITY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOMEuCITY");

/// HOMECITYNO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property HOMECITYNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOMECITYNO");

/// PCODE1_EXT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PCODE1uEXT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PCODE1uEXT");

/// PCODE2_EXT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PCODE2uEXT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PCODE2uEXT");

/// PCODE3_EXT
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property PCODE3uEXT As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "PCODE3uEXT");

/// PO_W_O_NO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POuWuOuNO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuWuOuNO");

/// PO_BOX_REG
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POuBOXuREG As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuBOXuREG");

/// POBOX_CTRY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POBOXuCTRY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POBOXuCTRY");

/// PO_CTRYISO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POuCTRYISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuCTRYISO");

/// DONT_USE_S
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DONTuUSEuS As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DONTuUSEuS");

/// DONT_USE_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DONTuUSEuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DONTuUSEuP");

/// HOUSE_NO3
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property HOUSEuNO3 As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "HOUSEuNO3");

/// LANGU_CR_P
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGUuCRuP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUuCRuP");

/// LANGUCPISO
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property LANGUCPISO As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "LANGUCPISO");

/// PO_BOX_LOBBY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property POuBOXuLOBBY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "POuBOXuLOBBY");

/// DELI_SERV_TYPE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DELIuSERVuTYPE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DELIuSERVuTYPE");

/// DELI_SERV_NUMBER
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property DELIuSERVuNUMBER As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "DELIuSERVuNUMBER");

/// COUNTY_CODE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property COUNTYuCODE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTYuCODE");

/// COUNTY
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property COUNTY As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "COUNTY");

/// TOWNSHIP_CODE
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TOWNSHIPuCODE As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TOWNSHIPuCODE");

/// TOWNSHIP
/// [CHAR] Información modificación sobre campo datos útiles corresp.
Property TOWNSHIP As %String(MAXLEN = 1, TRUNCATE = 1, XMLNAME = "TOWNSHIP");

Parameter XMLNAME As %String = "ADDRESSX";

Storage Default
{
<Data name="ADDRESSXState">
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
</Data>
<State>ADDRESSXState</State>
<StreamLocation>^BAPI.USER.CHANGE.ADDRESSXS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
