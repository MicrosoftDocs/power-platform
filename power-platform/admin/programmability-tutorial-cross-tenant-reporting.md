---
title: Create cross-tenant isolation reports
description: Learn how to use the Power Platform API to create cross tenant isolation reports.
author: laneswenka
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: reference
ms.date: 08/10/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
- mihaelablendea 
---

# Tutorial: Create cross-tenant isolation reports

This tutorial demonstrates how to use the programmability tools to create cross-tenant isolation reports.

In this tutorial, learn how to:

> [!div class="checklist"]
> + Create a report
> + List all reports for the tenant
> + Fetch a single report
> + Locate the environment for a reported connection

> [!IMPORTANT]
> For more details about tenant isolation, see [Cross-tenant inbound and outbound restrictions](cross-tenant-restrictions.md).

## Create a report
Use the following information to find various ways in which you can create a new report. 

> [!NOTE]
> You can only create one report per tenant per calendar day.

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, searching for "Create a request to generate a cross-tenant connection report for a tenant, or return an existing report".  The action doesn't require any parameters.

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
Add a new action to the canvas, and search for **List cross-tenant connection reports for a tenant**. The action doesn't require any parameters.

:::image type="content" source="media/tutorial-tenantisolation-flow2.png" alt-text="List cross-tenant connection reports for a tenant screenshot.":::

# [PowerShell](#tab/PowerShell)
Use the following PowerShell script to list all available reports for your tenant.

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

Power Platform API reference: [List Cross-Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports/list-cross-tenant-connection-reports)

---

## Fetch a single report

# [Power Automate / Logic Apps](#tab/Automate)
Add a new action to the canvas, and search for **Get a cross-tenant connection report by report ID for a tenant**. Provide the report ID from earlier steps.

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

Power Platform API reference: [Get Cross-Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/get-cross-tenant-connection-report)

---

## Understand what the report contains

Each completed report includes a `connections` array. Every entry describes a cross-tenant connection observed during the reporting window and includes:

+ `tenantId`: the external tenant that the connection reaches.
+ `connectionType`: the direction of the connection, either `outbound` (from your tenant to the external tenant) or `inbound`.
+ `connectionId`: the identifier of the connection. This value matches the connection's `name` (the last segment of the connection's resource ID) in the environment where the connection lives.

> [!NOTE]
> The report logs cross-tenant connection **attempts** observed during the reporting window, not only connections that currently exist. This connection type includes attempts that were **blocked by tenant isolation** on your tenant or on the target tenant. As a result, a `connectionId` in the report might not correspond to a connection that exists in any of your environments today. You can't locate blocked connection attempts (and connections that were later deleted) by using the steps in the next section.

## Locate the environment for a reported connection

A report identifies each connection by `connectionId`, but it doesn't include the environment where the connection lives. To find the environment, enumerate the environments in your tenant, list each environment's connections, and match on the connection `name`.

Use the following PowerShell script to search your environments for a reported `connectionId`. Enumerate your environment IDs however you prefer—for example, from the [Power Platform admin center](https://aka.ms/ppac) or an environments API—and provide the `connectionId` values from the report.

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '<client id of your Microsoft Entra ID application registration>' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "******"}

# The connectionId values from the report you fetched in the previous step.
$reportConnectionIds = @('<connectionId-1>', '<connectionId-2>')

# The environments in your tenant to search.
$environmentIds = @('<environment-id-1>', '<environment-id-2>')

foreach ($environmentId in $environmentIds)
{
    try
    {
        # List the connections in the environment.
        $uri = "https://api.powerplatform.com/connectivity/environments/$environmentId/connections?api-version=2024-10-01"
        $connections = (Invoke-RestMethod -Method Get -Uri $uri -Headers $Headers).value

        foreach ($connectionId in $reportConnectionIds)
        {
            # The report's connectionId matches the connection's 'name'.
            $match = $connections | Where-Object { $_.name -eq $connectionId }
            if ($match)
            {
                Write-Host "connectionId $connectionId is in environment $environmentId (connector: $($match.properties.apiId), display name: $($match.properties.displayName))"
            }
        }
    }
    catch
    {
        Write-Host "Could not list connections for environment ${environmentId}: $($_.Exception.Message)"
    }
}
```

If a reported `connectionId` isn't found in any environment, it was most likely a blocked attempt (see the previous note) or a connection that was deleted after the report was generated.

Power Platform API reference: [List connections in an environment](/rest/api/power-platform/connectivity/connections/list-connections)

---

### Related content

[Power Platform API reference - Cross-Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports)

[Power Platform API reference - Connectivity](/rest/api/power-platform/connectivity/connections)
