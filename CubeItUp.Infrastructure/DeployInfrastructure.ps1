param (
    [string]$environment
)
$environmentPrefix = 'd'
if ($environment == 'production') {
    $environmentPrefix = 'p'
}

$ResourceGroupName = $environmentPrefixCubeItUpRg

#Create resource group
New-AzResourceGroup -Name $ResourceGroupName -Location "West Europe"

#Deploy app service plan
New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile 'ArmTemplates/AppServicePlan/Template.json'

C:\Repos\cubeitup\CubeItUp.Infrastructure\DeployInfrastructure.ps1