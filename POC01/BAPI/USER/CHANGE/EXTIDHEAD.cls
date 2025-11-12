Class BAPI.USER.CHANGE.EXTIDHEAD Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = EXTIDHEAD ]
{

Parameter XMLNAME As %String = "EXTIDHEAD";

Storage Default
{
<Data name="EXTIDHEADDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^BAPI.USER.CHANGE.EXTIDHEADD</DataLocation>
<DefaultData>EXTIDHEADDefaultData</DefaultData>
<IdLocation>^BAPI.USER.CHANGE.EXTIDHEADD</IdLocation>
<IndexLocation>^BAPI.USER.CHANGE.EXTIDHEADI</IndexLocation>
<StreamLocation>^BAPI.USER.CHANGE.EXTIDHEADS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
