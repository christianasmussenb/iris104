/// Clase de solicitud para servicios de usuario BAPI
/// Extiende Ens.Request para manejo de mensajes en Ensemble
Class BAPI.Services.UserServicesReq Extends Ens.Request
{

/// Nombre de usuario para la solicitud
Property USERNAME As %String;

Storage Default
{
<Data name="UserServicesReqDefaultData">
<Subscript>"UserServicesReq"</Subscript>
<Value name="1">
<Value>USERNAME</Value>
</Value>
</Data>
<DefaultData>UserServicesReqDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
