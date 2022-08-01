$tenantId = "e56a6947-bb9a-4a6e-846a-1f118d1c3a14"
$organization = "https://dev.azure.com/frasermolyneux/"

$subscriptions = @(
    @{#spn-ado-Personal-Public-azlanding-zones
        ConnectionName   = "spn-ado-Personal-Public-azlanding-zones"
        SubscriptionName = "sub-platform-management"
        SubscriptionId   = "7760848c-794d-4a19-8cb2-52f71a21ac2b"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Owner"
                Scope = "/"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/7760848c-794d-4a19-8cb2-52f71a21ac2b"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-Personal-Public-platform-monitoring
        ConnectionName   = "spn-ado-Personal-Public-platform-monitoring"
        SubscriptionName = "sub-platform-management"
        SubscriptionId   = "7760848c-794d-4a19-8cb2-52f71a21ac2b"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/7760848c-794d-4a19-8cb2-52f71a21ac2b"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-Personal-Public-platform-connectivity
        ConnectionName   = "spn-ado-Personal-Public-platform-connectivity"
        SubscriptionName = "sub-platform-connectivity"
        SubscriptionId   = "db34f572-8b71-40d6-8f99-f29a27612144"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-Personal-Public-bicep-modules
        ConnectionName   = "spn-ado-Personal-Public-bicep-modules"
        SubscriptionName = "sub-platform-strategic"
        SubscriptionId   = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-Personal-Public-geolocation-prd
        ConnectionName   = "spn-ado-Personal-Public-geolocation-prd"
        SubscriptionName = "sub-fm-geolocation-prd"
        SubscriptionId   = "d3b204ab-7c2b-47f7-8d5a-de19e85591e7"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/d3b204ab-7c2b-47f7-8d5a-de19e85591e7"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-frontdoor-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-webapps-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-apim-prd-uksouth"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @(
            "158c047a-c907-4556-b7ef-446551a6b5f7" # Cloud application administrator
        )
    }
    @{#spn-ado-Personal-Public-geolocation-prd-webapps
        ConnectionName   = "spn-ado-Personal-Public-geolocation-prd-webapps"
        SubscriptionName = "sub-platform-strategic"
        SubscriptionId   = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-webapps-prd-uksouth"
            }
        )
        BuiltInRoles     = @(
            "158c047a-c907-4556-b7ef-446551a6b5f7" # Cloud application administrator
        )
    }
    @{#spn-ado-Personal-Public-mx-consulting-prd
        ConnectionName   = "spn-ado-Personal-Public-mx-consulting-prd"
        SubscriptionName = "sub-mx-consulting-prd"
        SubscriptionId   = "655da25d-da46-40c0-8e81-5debe2dcd024"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/655da25d-da46-40c0-8e81-5debe2dcd024"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-frontdoor-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-webapps-prd-uksouth"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-Personal-Public-mx-consulting-prd-webapps
        ConnectionName   = "spn-ado-Personal-Public-mx-consulting-prd-webapps"
        SubscriptionName = "sub-platform-strategic"
        SubscriptionId   = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-webapps-prd-uksouth"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-XtremeIdiots-Public-xtremeidiots-portal-prd
        ConnectionName   = "spn-ado-XtremeIdiots-Public-xtremeidiots-portal-prd"
        SubscriptionName = "sub-xi-portal-prd"
        SubscriptionId   = "32444f38-32f4-409f-889c-8e8aa2b5b4d1"
        AzDoProject      = "XtremeIdiots-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/32444f38-32f4-409f-889c-8e8aa2b5b4d1"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-frontdoor-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-webapps-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-apim-prd-uksouth"
            }
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-sql-prd-uksouth"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @(
            "158c047a-c907-4556-b7ef-446551a6b5f7" # Cloud application administrator
            "9360feb5-f418-4baa-8175-e2a00bac4301" # Directory Writers
        )
    }
    @{#spn-ado-XtremeIdiots-Public-xtremeidiots-portal-prd-webapps
        ConnectionName   = "spn-ado-XtremeIdiots-Public-xtremeidiots-portal-prd-webapps"
        SubscriptionName = "sub-platform-strategic"
        SubscriptionId   = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
        AzDoProject      = "XtremeIdiots-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-webapps-prd-uksouth"
            }
        )
        BuiltInRoles     = @(
            "158c047a-c907-4556-b7ef-446551a6b5f7" # Cloud application administrator
            "9360feb5-f418-4baa-8175-e2a00bac4301" # Directory Writers
        )
    }
    @{#spn-ado-Personal-Public-strategic-prd
        ConnectionName   = "spn-ado-Personal-Public-strategic-prd"
        SubscriptionName = "sub-platform-strategic"
        SubscriptionId   = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @(
            "9360feb5-f418-4baa-8175-e2a00bac4301" # Directory Writers
            "62e90394-69f5-4237-9190-012177145e10" # Global Administrator
        )
    }
    @{#spn-ado-XtremeIdiots-Public-demomanager-prd
        ConnectionName   = "spn-ado-XtremeIdiots-Public-xtremeidiots-demomanager-prd"
        SubscriptionName = "sub-xi-demomanager-prd"
        SubscriptionId   = "845766d6-b73f-49aa-a9f6-eaf27e20b7a8"
        AzDoProject      = "XtremeIdiots-Public"
        Permissions      = @(
            @{
                Role  = "Owner"
                Scope = "/subscriptions/845766d6-b73f-49aa-a9f6-eaf27e20b7a8"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @()
    }
    @{#spn-ado-XtremeIdiots-Public-devtest
        ConnectionName   = "spn-ado-XtremeIdiots-Public-devtest"
        SubscriptionName = "sub-enterprise-devtest"
        SubscriptionId   = "1b5b28ed-1365-4a48-b285-80f80a6aaa1b"
        AzDoProject      = "XtremeIdiots-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/1b5b28ed-1365-4a48-b285-80f80a6aaa1b"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @(
            "158c047a-c907-4556-b7ef-446551a6b5f7" # Cloud application administrator
            "9360feb5-f418-4baa-8175-e2a00bac4301" # Directory Writers
        )
    }
    @{#spn-ado-Personal-Public-devtest
        ConnectionName   = "spn-ado-Personal-Public-devtest"
        SubscriptionName = "sub-enterprise-devtest"
        SubscriptionId   = "1b5b28ed-1365-4a48-b285-80f80a6aaa1b"
        AzDoProject      = "Personal-Public"
        Permissions      = @(
            @{
                Role  = "Contributor"
                Scope = "/subscriptions/1b5b28ed-1365-4a48-b285-80f80a6aaa1b"
            }
            @{
                Role  = "AcrPull"
                Scope = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth/providers/Microsoft.ContainerRegistry/registries/acrmxplatformprduksouth"
            }
        )
        BuiltInRoles     = @(
            "158c047a-c907-4556-b7ef-446551a6b5f7" # Cloud application administrator
            "9360feb5-f418-4baa-8175-e2a00bac4301" # Directory Writers
        )
    }
)

$subscriptions | ForEach-Object {
    $spn = (az ad sp list --filter "displayName eq '$($_.ConnectionName)'") | ConvertFrom-Json
    if ($spn.Count -eq 0) {
        $spn = az ad sp create-for-rbac --display-name $_.ConnectionName | ConvertFrom-Json
        $env:AZURE_DEVOPS_EXT_AZURE_RM_SERVICE_PRINCIPAL_KEY = $spn.password

        az devops service-endpoint azurerm create `
            --azure-rm-service-principal-id $spn.appId `
            --azure-rm-subscription-id $_.SubscriptionId `
            --azure-rm-subscription-name $_.SubscriptionName `
            --azure-rm-tenant-id $tenantId `
            --name $_.ConnectionName `
            --organization $organization `
            --project $_.AzDoProject

        $spn = (az ad sp list --filter "displayName eq '$($_.ConnectionName)'") | ConvertFrom-Json
    }
    
    $_.Permissions | ForEach-Object {
        az role assignment create `
            --assignee $spn.appId `
            --role $_.Role `
            --scope $_.Scope
    }

    $_.BuiltInRoles | ForEach-Object {
        . "./scripts/functions/GrantRoleToPrincipal.ps1" `
            -principalId $spn.id `
            -roleDefinitionId $_
    }
}