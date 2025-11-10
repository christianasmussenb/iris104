/// Clase de respuesta para servicios de usuario BAPI
/// Extiende Ens.Response para manejo de respuestas en Ensemble
Class BAPI.Services.UserServicesRes Extends Ens.Response
{

/// Respuesta del servicio
Property Respuesta As %String;

Storage Default
{
<Data name="UserServicesResDefaultData">
<Subscript>"UserServicesRes"</Subscript>
<Value name="1">
<Value>Respuesta</Value>
</Value>
</Data>
<DefaultData>UserServicesResDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
