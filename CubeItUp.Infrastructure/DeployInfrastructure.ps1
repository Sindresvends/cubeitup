param (
    [string]$environment
)
$environmentPrefix = "d"
if ($environment -eq "production") {
    $environmentPrefix = "p"
}

$ResourceGroupName = $environmentPrefix + "CubeItUpRg"

#Create resource group
New-AzResourceGroup -Name $ResourceGroupName -Location "West Europe"

#Deploy app service plan
New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile 'ArmTemplates/AppServicePlan/Template.json'