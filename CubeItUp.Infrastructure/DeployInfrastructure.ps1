param (
    [string]$environment
)
$environmentPrefix = "d"
if ($environment -eq "production") {
    $environmentPrefix = "p"
}
Install-Module -Name Az -AllowClobber -force
$ResourceGroupName = $environmentPrefix + "CubeItUpRg"

#Create resource group
New-AzResourceGroup -Name $ResourceGroupName -Location "West Europe"

#Deploy app service plan
New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile 'CubeItUp.Infrastructure/ArmTemplates/AppServicePlan/Template.json'