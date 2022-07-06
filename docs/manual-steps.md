# Manual Steps

* Create a new `Service Connection` within the Azure DevOps project scoped to the top-level management group
* Grant the service principal permissions:

```powershell
    az role assignment create --scope '/' --role 'Owner' --assignee-object-id $(az ad sp list --display-name 'frasermolyneux-Personal-Public-tenant-mgmt-root' --query '[].{id:id}' -o tsv) --assignee-principal-type ServicePrincipal
```
