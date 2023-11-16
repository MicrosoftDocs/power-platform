---
title: "Tutorial: Create cross tenant isolation reports (preview) | Microsoft Docs"
description: Learn how to use the Power Platform API (preview) to create cross tenant isolation reports (preview).
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 10/13/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
contributors:
- mihaelablendea 
---

# Tutorial: Create cross tenant isolation reports (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This tutorial demonstrates how to use the Power Platform API (preview) to create cross tenant isolation reports.

In this tutorial, learn how to:

1. [Authenticate using Power Platform API](#step-1-authenticate-using-power-platform-api)
1. [Create a report](#step-2-create-a-report)
1. [List all reports for the tenant](#step-3-list-all-reports-for-the-tenant)
1. [Fetch a single report](#step-4-fetch-a-single-report)

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - The host name and the data contracts might change during this feature preview period.
> - For more details about tenant isolation, see [Cross-tenant inbound and outbound restrictions](cross-tenant-restrictions.md).

## Step 1. Authenticate using Power Platform API

Use the following PowerShell script to authenticate using Power Platform API.

> [!NOTE]
> Only users with Global administrator and Power Platform administrator Entra ID roles have permission to run the tenant isolation impact report.

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '49676daf-ff23-4aac-adcc-55472d4e2ce0' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"}
```

## Step 2. Create a report

Use the following PowerShell script to create the report.

> [!NOTE]
> You can only create one report per tenant per calendar day.

```PowerShell
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

Power Platform API reference: [Create Cross Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/create-cross-tenant-connection-report)

## Step 3. List all reports for the tenant

Use the following PowerShell script to list all of the available reports for your tenant.

```PowerShell
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

Power Platform API reference: [Get Cross Tenant Connection Report](/rest/api/power-platform/governance/cross-tenant-connection-reports/get-cross-tenant-connection-report)

## Step 4. Fetch a single report

Use the following PowerShell script to fetch a single report for your tenant about connections used within the tenant.

```PowerShell
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

Power Platform API reference: [List Cross Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports/list-cross-tenant-connection-reports)

### See also

[Power Platform API reference - Cross Tenant Connection Reports](/rest/api/power-platform/governance/cross-tenant-connection-reports)
