Class BAPI.USER.GET.DETAIL.EXTIDHEAD Extends (%Persistent, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, SqlTableName = EXTIDHEAD ]
{

Parameter XMLNAME As %String = "EXTIDHEAD";

Storage Default
{
<Data name="EXTIDHEADDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^BAPI.USER.GET.DE2965.EXTIDHEADD</DataLocation>
<DefaultData>EXTIDHEADDefaultData</DefaultData>
<IdLocation>^BAPI.USER.GET.DE2965.EXTIDHEADD</IdLocation>
<IndexLocation>^BAPI.USER.GET.DE2965.EXTIDHEADI</IndexLocation>
<StreamLocation>^BAPI.USER.GET.DE2965.EXTIDHEADS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
