$tenantId = "e56a6947-bb9a-4a6e-846a-1f118d1c3a14"
$organization = "https://dev.azure.com/frasermolyneux/"

$subscriptions = @(
    @{
        ConnectionName = "spn-ado-Personal-Public-geolocation-prd"
        SubscriptionName = "sub-fm-geolocation-prd"
        SubscriptionId = "d3b204ab-7c2b-47f7-8d5a-de19e85591e7"
        AzDoProject = "Personal-Public"
        Workload = "geolocation-prd"
        Permissions = @(
            @{
                Role = "Contributor"
                Scope = "/subscriptions/d3b204ab-7c2b-47f7-8d5a-de19e85591e7"
            }
        )
    }
    @{
        ConnectionName = "spn-ado-Personal-Public-strategic-prd"
        SubscriptionName = "sub-platform-strategic"
        SubscriptionId = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
        AzDoProject = "Personal-Public"
        Workload = "strategic-prd"
        Permissions = @(
            @{
                Role = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43"
            }
        )
    }
)

$subscriptions | ForEach-Object {
    $spn = az ad sp create-for-rbac --display-name $_.ConnectionName | ConvertFrom-Json

    $_.Permissions | ForEach-Object {
        az role assignment create `
            --assignee $spn.appId `
            --role $_.Role `
            --scope $_.Scope
    }

    $env:AZURE_DEVOPS_EXT_AZURE_RM_SERVICE_PRINCIPAL_KEY=$spn.password

    $serviceEndpoints = az devops service-endpoint list --organization $organization --project $_.AzDoProject | ConvertFrom-Json
    $existing = $serviceEndpoints | Where-Object{$_.authorization.parameters.serviceprincipalid -eq $spn.appId}

    if ($null -eq $existing) {
        az devops service-endpoint azurerm create `
        --azure-rm-service-principal-id $spn.appId `
        --azure-rm-subscription-id $_.SubscriptionId `
        --azure-rm-subscription-name $_.SubscriptionName `
        --azure-rm-tenant-id $tenantId `
        --name $_.ConnectionName `
        --organization $organization `
        --project $_.AzDoProject
    }
}