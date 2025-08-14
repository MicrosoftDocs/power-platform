---
title: "Tutorial: Create cross-tenant isolation reports | Microsoft Docs"
description: Learn how to use the Power Platform API to create cross tenant isolation reports.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/07/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
- mihaelablendea 
---

# Tutorial: Create cross-tenant isolation reports

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

This tutorial demonstrates how to use the programmability tools to create cross-tenant isolation reports.

In this tutorial, learn how to:

> [!div class="checklist"]
> + Create a report
> + List all reports for the tenant
> + Fetch a single report

> [!IMPORTANT]
> For more details about tenant isolation, see [Cross-tenant inbound and outbound restrictions](cross-tenant-restrictions.md).

## Create a report
Use the following information to find various ways in which you can create a new report. 

> [!NOTE]
> You can only create one report per tenant per calendar day.

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, searching for "Create a request to generate a cross-tenant connection report for a tenant, or return an existing report".  There are no parameters required.

:::image type="content" source="media/tutorial-tenantisolation-flow1.png" alt-text="Cross-tenant connection report create screenshot.":::

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to create the report.

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '<client id of your Microsoft Entra ID application registration>' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"}

try 
{
    # Create a cross tenant connections report
    $tenantReportCreateResponse = Invoke-RestMethod -Method Post -Uri "https://api.powerplatform.com/governance/crossTenantConnectionReports?api-version=2022-03-01-preview" -Headers $Headers -Body ""
    $reportId = $tenantReportCreateResponse.reportId
    $reportStatus = $tenantReportCreateResponse.status

    Write-Host "Cross tenant connections report created with ID=$reportId and status=$reportStatus" 

} catch {
    # Dig into the exception to get the Response details.
    Write-Host "Response CorrelationId:" $_.Exception.Response.Headers["x-ms-correlation-id"]
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($result)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd();

        Write-Host $responseBody
}
```

Power Platform API reference: [Create Cross-Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/create-cross-tenant-connection-report)

---

## List all reports for the tenant

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, searching for "List cross-tenant connection reports for a tenant".  There are no parameters required.

:::image type="content" source="media/tutorial-tenantisolation-flow2.png" alt-text="List cross-tenant connection reports for a tenant screenshot.":::

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to list all of the available reports for your tenant.

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '<client id of your Microsoft Entra ID application registration>' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"}

try 
{
     # Get all available cross tenant connections reports for a tenant
    $tenantListReportResponse = Invoke-RestMethod -Method Get -Uri "https://api.powerplatform.com/governance/crossTenantConnectionReports?api-version=2022-03-01-preview" -Headers $Headers
    $report = $tenantListReportResponse | ConvertTo-Json -Depth 3 
    Write-Host $report 

} catch {
    # Dig into the exception to get the Response details.
    Write-Host "Response CorrelationId:" $_.Exception.Response.Headers["x-ms-correlation-id"]
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($result)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd();

        Write-Host $responseBody
}
```

Power Platform API reference: [Get Cross-Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/get-cross-tenant-connection-report)

---

## Fetch a single report

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, searching for "Get a cross-tenant connection report by report ID for a tenant".  Provide the report ID from prior steps.

:::image type="content" source="media/tutorial-tenantisolation-flow3.png" alt-text="Get a cross-tenant connection report by report ID for a tenant screenshot.":::

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to fetch a single report for your tenant about connections used within the tenant.

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '<client id of your Microsoft Entra ID application registration>' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"}

try 
{
   # Get one cross tenant connections report for a tenant
    $tenantListReportResponse = Invoke-RestMethod -Method Get -Uri "https://api.powerplatform.com/governance/crossTenantConnectionReports/{$reportId}?api-version=2022-03-01-preview" -Headers $Headers
    $report = $tenantListReportResponse | ConvertTo-Json -Depth 2 
    Write-Host $report
    Write-Host "" 

} catch {
    # Go through the exception to get the Response details.
    Write-Host "Response CorrelationId:" $_.Exception.Response.Headers["x-ms-correlation-id"]
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($result)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd();

        Write-Host $responseBody
}
```

Power Platform API reference: [List Cross-Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports/list-cross-tenant-connection-reports)

---

### Related content

[Power Platform API reference - Cross-Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports)
