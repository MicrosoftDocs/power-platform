---
title: "Tutorial: Manage tenant isolation policy (preview) | Microsoft Docs"
description: Learn how to use the Power Platform API (preview) to manage tenant isolation policy.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 08/03/2023
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Manage tenant isolation policy (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This tutorial demonstrates how to use the Power Platform API (preview) to manage tenant isolation policy.

In this tutorial, learn how to:

1.	Authenticate with Power Platform API and related tools.
2.	Create a report. 
3.	List all reports for the tenant.
4.	Fetch a single report.

In this example scenario, a customer is looking to enable tenant isolation for their production tenant. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - The host name and data contracts are subject to change by the time the endpoints become generally available.  At that time, this article will be updated with the final endpoint details.

## Choose a tool that can authenticate with Power Platform API
The following section provides details on getting connected to the Power Platform programmatically. This tutorial includes using a generic PowerShell example.  More tools and software development kits (SDKs) are coming for Power Platform API that are directly built on top of the API and have full parity.  When those tools become available this tutorial will be updated.

# [Generic PowerShell](#tab/pshell)
### Get authenticated
Using PowerShell, you can easily get authenticated with Power Platform API using the following script:

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '49676daf-ff23-4aac-adcc-55472d4e2ce0' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"}
```
---

## Create a report. 
Retrieve the (PROVIDE CUSTOMER EXAMPLE).

# [Generic PowerShell](#tab/pshell)
### Create a report via Invoke-RestMethod
Using the below script you can create a new tenant isolation report.  Note that you can only create one report per tenant per calendar day.  

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
---

## List all reports for the tenant
Now we will list all of the available reports for your tenant.

# [Generic PowerShell](#tab/pshell)
### List all reports using Invoke-RestMethod
Let's list all of the available reports for your tenant.

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
---

## Fetch a single report
Now we will fetch a single report for your tenant.

# [Generic PowerShell](#tab/pshell)
### Fetch a single report
Now we will fetch the details of a single report.  This will provide information about the connections used within your tenant.

```PowerShell
try 
{
   # Get one cross tenant connections report for a tenant
    $tenantListReportResponse = Invoke-RestMethod -Method Get -Uri "https://api.powerplatform.com/governance/crossTenantConnectionReports/{$reportId}?api-version=2022-03-01-preview" -Headers $Headers
    $report = $tenantListReportResponse | ConvertTo-Json -Depth 2 
    Write-Host $report
    Write-Host "" 

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
---
