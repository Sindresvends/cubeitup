param (
    [string]$environment
)
$environmentPrefix = "d"
if ($environment -eq "production") {
    $environmentPrefix = "p"
}
Install-Module -Name Az -AllowClobber -force
Install-Module -Name Az.Resources -AllowClobber -force
$ResourceGroupName = $environmentPrefix + "CubeItUpRg"
Write-Host $ResourceGroupName
Write-Host $environment
Write-Host $environmentPrefix
#dir
#cd $(Pipeline.Workspace)
#dir
#cd CubeItUpInfrastructure
#dir
#Create resource group
#New-AzResourceGroup -Name $ResourceGroupName -Location "West Europe"
az group create -l westeurope -n $ResourceGroupName

#Deploy app service plan
#New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile '../CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Template.json' -TemplateParameterFile '../CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Parameters.json'
az deployment group create --resource-group $ResourceGroupName --template-file ../CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Template.json --parameters ../CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Parameters.json
