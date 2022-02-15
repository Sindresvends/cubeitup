param (
    [ValidateSet("dev", "prod")]
    [string]$environment
)
$environmentPrefix = "d"
if ($environment -eq "prod") {
    $environmentPrefix = "p"
}

######naming resources, all resources should use resourcePrefix######
$resourcePrefix = $environmentPrefix + "ciu"
$resourceGroupName = $resourcePrefix + "rg"

################Cosmos Db############################################
$cosmosDbAccountName = $resourcePrefix + "account"
$cosmosDbName = $resourcePrefix + "db"
$cosmosDbContainer = $resourcePrefix + "container"

##############Container app##########################################
$containerAppEnvironmentName = $resourcePrefix + "en"

#Create resource group
New-AzResourceGroup -Name $resourceGroupName -Location "west europe" -Force
#az group create -l westeurope -n $resourceGroupName


#Deploy app service plan
#az deployment group create --resource-group $resourceGroupName --template-file CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Template.json

#Deploy cosmos db
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "../CubeItUpInfrastructure/ArmTemplates/CosmosDb/template.json" -Force
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile "../CubeItUpInfrastructure/ArmTemplates/ContainerApp/template.json" -Force `
    -environmentName $containerAppEnvironmentName
