Class POC01.BP.CheckUserExistenceBP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='BAPI.USER.EXISTENCE.CHECK.ISCuRequest' response='Ens.StringResponse' height='2000' width='2000' >
<context>
<property name='SAPResponse' type='BAPI.USER.EXISTENCE.CHECK.ISCuResponse' instantiate='0' />
</context>
<sequence xend='200' yend='650' >

<!-- Paso 1: Validar que el username no esté vacío -->
<if name='Validate Username' condition='request.USERNAME = ""' xpos='200' ypos='250' xend='200' yend='400' >
<annotation><![CDATA[Verificar que se proporcionó un username]]></annotation>

<!-- Username vacío -->
<true>
<code name='Return Error' xpos='65' ypos='300' >
<annotation><![CDATA[Devolver error de validación]]></annotation>
<![CDATA[
 // Crear respuesta de error
 Set json = {}
 Set json.success = 0
 Set json.exists = 0
 Set json.error = "USERNAME es requerido"
 
 // Crear respuesta
 Set response = ##class(Ens.StringResponse).%New()
 Set response.StringValue = json.%ToJSON()
 
 // Log del error
 $$$LOGERROR("USERNAME vacío en CheckUserExistence")
]]>
</code>
</true>

<!-- Username válido, continuar -->
<false>

<!-- Paso 2: Llamar a SAP Operation -->
<call name='Call SAP Operation' target='POC01.BO.SAPOperation' async='0' xpos='335' ypos='300' >
<annotation><![CDATA[Ejecutar BAPI_USER_EXISTENCE_CHECK en SAP]]></annotation>
<request type='BAPI.USER.EXISTENCE.CHECK.ISCuRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='BAPI.USER.EXISTENCE.CHECK.ISCuResponse' >
<assign property="context.SAPResponse" value="callresponse" action="set" />
</response>
</call>

</false>

</if>

<!-- Paso 3: Procesar respuesta de SAP (solo si se llamó) -->
<if name='Check If SAP Called' condition='$IsObject(context.SAPResponse)' xpos='200' ypos='450' xend='200' yend='600' >
<annotation><![CDATA[Verificar si se realizó la llamada a SAP]]></annotation>

<true>

<!-- Verificar si la llamada fue exitosa -->
<if name='Check SAP Response' condition='context.SAPResponse.ISCuIsOK = 1' xpos='335' ypos='500' xend='335' yend='600' >
<annotation><![CDATA[Verificar si SAP respondió correctamente]]></annotation>

<!-- Respuesta exitosa -->
<true>
<code name='Process Success Response' xpos='470' ypos='550' >
<annotation><![CDATA[Procesar respuesta exitosa]]></annotation>
<![CDATA[
 // Crear respuesta JSON
 Set json = {}
 Set json.success = 1
 Set json.exists = 1
 Set json.username = request.USERNAME
 
 // Verificar el tipo de respuesta RETURN
 If $IsObject(context.SAPResponse.RETURN) {
     Set json.message = context.SAPResponse.RETURN.MESSAGE
 } Else {
     Set json.message = "Usuario existe en SAP"
 }
 
 // Crear respuesta
 Set response = ##class(Ens.StringResponse).%New()
 Set response.StringValue = json.%ToJSON()
 
 // Log informativo
 $$$LOGINFO("Usuario "_request.USERNAME_" existe en SAP")
]]>
</code>
</true>

<!-- Usuario no existe o error -->
<false>
<code name='Process Not Found Response' xpos='200' ypos='550' >
<annotation><![CDATA[Usuario no encontrado o error]]></annotation>
<![CDATA[
 // Crear respuesta JSON
 Set json = {}
 Set json.success = 1
 Set json.exists = 0
 Set json.username = request.USERNAME
 
 // Agregar mensaje de error si existe
 If context.SAPResponse.ISCuErrorMessage '= "" {
     Set json.message = context.SAPResponse.ISCuErrorMessage
 } Else {
     Set json.message = "Usuario no existe en SAP"
 }
 
 // Crear respuesta
 Set response = ##class(Ens.StringResponse).%New()
 Set response.StringValue = json.%ToJSON()
 
 // Log informativo
 $$$LOGINFO("Usuario "_request.USERNAME_" no existe en SAP")
]]>
</code>
</false>

</if>

</true>

</if>

</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
