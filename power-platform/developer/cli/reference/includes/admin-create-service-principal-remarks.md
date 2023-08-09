### Remarks

<!-- Also in power-platform\alm\devops-build-tools.md -->

When successful, four columns are displayed:

- Power Platform TenantId
- Application ID
- Client Secret (in clear text)
- Expiration

For example:

```powershell
PS C:\>pac admin create-service-principal --environment d3fcc479-0122-e7af-9965-bde57f69ee1d
Connected as admin@M365x57236226.onmicrosoft.com
Successfully assigned user adde6d52-9582-4932-a43a-beca5d182301 to environment d3fcc479-0122-e7af-9965-bde57f69eeld with security role System Administrator
Tenant ID                            Application ID                       Client Secret                           Expiration
2b0463ed-efd7-419d-927d-a9dca49d899c adde6d52-9582-4932-a43a-beca5d182301 beY8Q~JBZ~CBDgIKKBjbZ3g6BofKzoZkYj23Hbf 7/31/2024 4:27:03 PM
```