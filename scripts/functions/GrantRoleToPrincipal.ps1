param (
    $principalId,
    $roleDefinitionId
)

$permissions = (az rest -m GET -u "https://graph.microsoft.com/v1.0/roleManagement/directory/roleAssignments?`$filter=principalId eq '$principalId'") | ConvertFrom-Json

if ($null -eq ($permissions.value | Where-Object { $_.roleDefinitionId -eq $roleDefinitionId })) {
    az rest -m POST --headers Content-type=application/json -u https://graph.microsoft.com/v1.0/roleManagement/directory/roleAssignments -b "{'principalId': '$principalId', 'roleDefinitionId': '$roleDefinitionId', 'directoryScopeId': '/'}" | Out-Null
}