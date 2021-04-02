Param (
    [Parameter(Mandatory = $true)]
    [String] $SubscriptionId
)
$role = Get-AzRoleDefinition "Virtual Machine Contributor"
$role.Id = $null
$role.Name = "My Custom Role"
$role.Description = "My Custom Role"
$role.Actions.Clear()
$role.Actions.Add("Microsoft.Storage/*/read")
$role.Actions.Add("Microsoft.Network/*/read")
$role.Actions.Add("Microsoft.Compute/*/read")
$role.Actions.Add("Microsoft.Authorization/*/read")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add("/subscriptions/$SubscriptionId")
New-AzRoleDefinition -Role $role