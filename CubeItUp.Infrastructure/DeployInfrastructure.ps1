param (
    [string]$environment
)
$environmentPrefix = "d"
if ($environment -eq "production") {
    $environmentPrefix = "p"
}
#Install-Module -Name Az -AllowClobber -force
#Install-Module -Name Az.Resources -AllowClobber -force

######naming resources, all resources should use resourcePrefix######
$resourcePrefix = $environmentPrefix + "ciu"
$resourceGroupName = $resourcePrefix + "rg"

#Dir
#cd ..
#dir
#cd CubeItUpInfrastructure
#dir
#cd ArmTemplates
#dir
#cd CosmosDb
#dir

#cosmos db
$cosmosDbAccountName = $resourcePrefix + "account"
$cosmosDbName = $resourcePrefix + "db"
$cosmosDbContainer = $resourcePrefix + "container"

######################################################################

#Create resource group
New-AzResourceGroup -Name $resourceGroupName -Location "west europe"
#az group create -l westeurope -n $resourceGroupName


#Deploy app service plan
#az deployment group create --resource-group $resourceGroupName --template-file CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Template.json

#Deploy cosmos db
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "CubeItUpInfrastructure/ArmTemplates/CosmosDb/template.json"
#-accountName $cosmosDbAccountName
#az deployment group create --resource-group $ResourceGroupName --template-file ../CubeItUpInfrastructure/ArmTemplates/CosmosDb/template.json 
#--parameters "{ \"location\": { \"value\": \"westus\" } }"

