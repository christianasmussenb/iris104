Class POC01.PROD01 Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="POC01.PROD01" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="POC01.API.UserManagementService" Category="" ClassName="POC01.API.UserManagementService" PoolSize="1" Enabled="true" Foreground="false" Comment="REST API Service para gestión de usuarios" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="POC01.Services.JavaGatewayService" Category="" ClassName="POC01.Services.JavaGatewayService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Port">55558</Setting>
  </Item>
  <Item Name="POC01.Services.JavaGatewayMYSISSService" Category="" ClassName="POC01.Services.JavaGatewayMYSISSService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Port">55559</Setting>
  </Item>
  <Item Name="POC01.BO.SAPOperation" Category="" ClassName="EnsLib.SAP.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="JavaGatewayConfigItemName">POC01.Services.JavaGatewayService</Setting>
    <Setting Target="Host" Name="SAPClient">600</Setting>
    <Setting Target="Host" Name="SAPCredentials">CNETuser</Setting>
    <Setting Target="Host" Name="SAPGWHost">cnetdev</Setting>
    <Setting Target="Host" Name="SAPGWServ">3300</Setting>
    <Setting Target="Host" Name="SAPHost">cnetdev</Setting>
    <Setting Target="Host" Name="SAPLanguage">ES</Setting>
    <Setting Target="Host" Name="SAPMSHost">cnetdev</Setting>
    <Setting Target="Host" Name="SAPR3Name">CNQ</Setting>
    <Setting Target="Host" Name="SAPSystemNumber">00</Setting>
    <Setting Target="Host" Name="SAPTraceLevel">1</Setting>
  </Item>
  <Item Name="POC01.BP.GetUserListBP" Category="" ClassName="POC01.BP.GetUserListBP" PoolSize="1" Enabled="true" Foreground="false" Comment="Business Process para obtener lista de usuarios SAP" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="POC01.BP.CheckUserExistenceBP" Category="" ClassName="POC01.BP.CheckUserExistenceBP" PoolSize="1" Enabled="true" Foreground="false" Comment="Business Process para verificar existencia de usuario SAP" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="POC01.BP.LockUserBP" Category="" ClassName="POC01.BP.LockUserBP" PoolSize="1" Enabled="true" Foreground="false" Comment="Business Process para bloquear usuario SAP" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="POC01.BP.UnlockUserBP" Category="" ClassName="POC01.BP.UnlockUserBP" PoolSize="1" Enabled="true" Foreground="false" Comment="Business Process para desbloquear usuario SAP" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
