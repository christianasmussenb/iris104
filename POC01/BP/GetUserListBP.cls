Class POC01.BP.GetUserListBP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='BAPI.USER.GETLIST.ISCuRequest' response='Ens.StringResponse' height='2000' width='2000' >
<context>
<property name='SAPResponse' type='BAPI.USER.GETLIST.ISCuResponse' instantiate='0' />
<property name='UserCount' type='%Integer' initialexpression='0' />
</context>
<sequence xend='200' yend='850' >

<!-- Paso 1: Asignar parámetros del request -->
<assign name="Set MAX_ROWS" property="request.MAXuROWS" value="request.MAXuROWS" action="set" xpos='200' ypos='250'>
<annotation><![CDATA[Pasar parámetro MAXuROWS si viene en el request]]></annotation>
</assign>

<assign name="Set WITH_USERNAME" property="request.WITHuUSERNAME" value="&quot;X&quot;" action="set" xpos='200' ypos='300'>
<annotation><![CDATA[Incluir nombre de usuario en respuesta]]></annotation>
</assign>

<!-- Paso 2: Llamar a SAP Operation -->
<call name='Call SAP Operation' target='POC01.BO.SAPOperation' async='0' xpos='200' ypos='350' >
<annotation><![CDATA[Ejecutar BAPI_USER_GETLIST en SAP]]></annotation>
<request type='BAPI.USER.GETLIST.ISCuRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='BAPI.USER.GETLIST.ISCuResponse' >
<assign property="context.SAPResponse" value="callresponse" action="set" />
</response>
</call>

<!-- Paso 3: Verificar si la llamada fue exitosa -->
<if name='Check SAP Response' condition='context.SAPResponse.ISCuIsOK = 1' xpos='200' ypos='450' xend='200' yend='750' >
<annotation><![CDATA[Verificar si SAP respondió correctamente]]></annotation>

<!-- Respuesta exitosa -->
<true>
<code name='Process Success Response' xpos='335' ypos='550' >
<annotation><![CDATA[Transformar respuesta SAP a JSON]]></annotation>
<![CDATA[
 // Inicializar respuesta JSON
 Set json = {}
 Set json.success = 1
 Set json.count = 0
 Set userArray = []
 
 // Procesar lista de usuarios
 Set userCount = 0
 Set key = ""
 For {
     Set user = context.SAPResponse.USERLIST.GetNext(.key)
     Quit:key=""
     
     // Crear objeto usuario
     Set userObj = {}
     Set userObj.username = user.USERNAME
     Set userObj.firstname = user.FIRSTNAME
     Set userObj.lastname = user.LASTNAME
     Set userObj.fullname = user.FULLNAME
     
     // Agregar a array
     Do userArray.%Push(userObj)
     Set userCount = userCount + 1
 }
 
 // Agregar datos al JSON
 Set json.data = userArray
 Set json.count = userCount
 
 // Crear respuesta con el JSON
 Set response = ##class(Ens.StringResponse).%New()
 Set response.StringValue = json.%ToJSON()
 
 // Log informativo
 $$$LOGINFO("Lista de usuarios obtenida: "_userCount_" usuarios")
]]>
</code>
</true>

<!-- Respuesta con error -->
<false>
<code name='Process Error Response' xpos='65' ypos='550' >
<annotation><![CDATA[Manejar error de SAP]]></annotation>
<![CDATA[
 // Crear respuesta de error
 Set json = {}
 Set json.success = 0
 Set json.error = context.SAPResponse.ISCuErrorMessage
 Set json.count = 0
 Set json.data = []
 
 // Crear respuesta con el JSON de error
 Set response = ##class(Ens.StringResponse).%New()
 Set response.StringValue = json.%ToJSON()
 
 // Log del error
 $$$LOGERROR("Error en BAPI_USER_GETLIST: "_context.SAPResponse.ISCuErrorMessage)
]]>
</code>
</false>

</if>

</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
