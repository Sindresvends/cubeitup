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

#Create resource group
az group create -l westeurope -n $ResourceGroupName

#Deploy app service plan
az deployment group create --resource-group $ResourceGroupName --template-file ../CubeItUpInfrastructure/ArmTemplates/AppServicePlan/Template.json
