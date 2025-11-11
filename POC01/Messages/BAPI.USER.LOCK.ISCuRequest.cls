/// Solicitud para BAPI_USER_LOCK
/// Clase que maneja las solicitudes de bloqueo de usuario SAP
Class BAPI.USER.LOCK.ISCuRequest Extends Ens.Request
{

/// Nombre de usuario
/// [CHAR] User Name - Máximo 12 caracteres
Property USERNAME As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "USERNAME");

/// Relación con detalles de RETURN
/// Lista de objetos RETURN relacionados
Property RETURN As list Of BAPI.USER.LOCK.RETURNreq;

/// Parámetro que indica el BAPI correspondiente
Parameter BAPI = "BAPI_USER_LOCK";

/// Nombre de la clase de respuesta correspondiente
Parameter RESPONSECLASSNAME = "BAPI.USER.LOCK.ISCuResponse";

/// Nombre XML del elemento
Parameter XMLNAME = "ISCuRequest";

Storage Default
{
<Data name="ISCuRequestDefaultData">
<Subscript>"ISCuRequest"</Subscript>
<Value name="1">
<Value>USERNAME</Value>
</Value>
<Value name="2">
<Value>RETURN</Value>
</Value>
</Data>
<DefaultData>ISCuRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
