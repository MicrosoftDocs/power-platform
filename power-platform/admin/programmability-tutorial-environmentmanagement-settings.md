---
title: Create, update, and list Environment Management Settings
description: Learn how to use programmability tools to create, update, and list Environment Management Settings.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 09/12/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Tutorial: Create, update, and list Environment Management Settings 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

This tutorial demonstrates how to use the Power Platform API (preview) to create, update, and list Environment Management Settings.

In this tutorial, learn how to:

1. [Authenticate using Power Platform API](#step-1-authenticate-using-power-platform-api).
2. [Create a new setting value](#step-2-create-a-new-setting-value).
3. [List all management setting values for the environment](#step-3-list-all-management-settings-for-the-environment).
4. [Update a setting value](#step-4-update-a-setting-value).

As an example of this scenario, a customer might want to turn on [Storage Shared Access Signature (SAS) IP restrictions](security/data-storage.md#storage-shared-access-signature-sas-ip-restriction) and logging of SAS calls.

## Step 1. Authenticate using Power Platform API

Use the following PowerShell script to authenticate using Power Platform API.

```PowerShell
Import-Module "MSAL.PS"
$AuthResult = Get-MsalToken -ClientId '49676daf-ff23-4aac-adcc-55472d4e2ce0' -Scope 'https://api.powerplatform.com/.default'
$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"}
```

## Step 2. Create a new setting value

Use the following PowerShell script to create a new setting value for Storage Shared Access Signature (SAS) IP restrictions, and the related audit logging capability. These two settings are off, but we'll update them later to turn them on.

```PowerShell
#Set your environment ID
$environmentId = "ENV_ID_HERE"

# Please uncomment the values that need to be updated
$EnvironmentManagementSettings = @{
    "EnableIpBasedStorageAccessSignatureRule" = $false
    "LoggingEnabledForIpBasedStorageAccessSignature" = $false
}

$body = $json = $EnvironmentManagementSettings | ConvertTo-Json

try 
{
    # Create the new setting value
    Write-Host "Invoking Create Management Setting for Environment $environmentId with body $body"
    $apiResponse = Invoke-WebRequest -Method Post -Uri "https://api.powerplatform.com/environmentmanagement/environments/$environmentId/settings/?api-version=2022-03-01-preview" -Headers $Headers -Body $body

    Write-Host "Operation Status: $apiResponse.StatusDescription"
} 
catch 
{
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

Learn more about the Power Platform API reference in [Environment Management Settings - Create Environment Management Settings](/rest/api/power-platform/environmentmanagement/environment-management-settings/create-environment-management-settings).

## Step 3. List all management settings for the environment

Use the following PowerShell script to list all of the previously created settings for this environment.

```PowerShell
#Set your environment ID
$environmentId = "ENV_ID_HERE"

try 
{
    # Create the new setting value
    Write-Host "Invoking List Management Settings for Environment $environmentId"
    $apiResponse = Invoke-WebRequest -Method Get -Uri "https://api.powerplatform.com/environmentmanagement/environments/$environmentId/settings/?api-version=2022-03-01-preview&$select=EnableIpBasedStorageAccessSignatureRule,LoggingEnabledForIpBasedStorageAccessSignature" -Headers $Headers

    Write-Host $apiResponse
} 
catch 
{
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

Learn more about the Power Platform API reference in [Environment Management Settings - List Environment Management Settings](/rest/api/power-platform/environmentmanagement/environment-management-settings/list-environment-management-settings).

## Step 4. Update a setting value

Use the following PowerShell script to update a previously defined setting value. In this step, you turn on the logging for Storage Shared Access Signature (SAS).

```PowerShell
#Set your environment ID
$environmentId = "ENV_ID_HERE"

# Please uncomment the values that need to be updated
$EnvironmentManagementSettings = @{
    "LoggingEnabledForIpBasedStorageAccessSignature" = $true
}

$body = $json = $EnvironmentManagementSettings | ConvertTo-Json

try 
{
    # Updating the setting value
    Write-Host "Invoking Update Management Setting for Environment $environmentId with body $body"
    $apiResponse = Invoke-WebRequest -Method Patch -Uri "https://api.powerplatform.com/environmentmanagement/environments/$environmentId/settings/?api-version=2022-03-01-preview" -Headers $Headers -Body $body

    Write-Host "Operation Status: $apiResponse.StatusDescription"
} 
catch 
{
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

Learn more about the Power Platform API reference in [Environment Management Settings - Update Environment Management Settings](/rest/api/power-platform/environmentmanagement/environment-management-settings/update-environment-management-settings).

### Related information

[Environment Management Settings](/rest/api/power-platform/environmentmanagement/environment-management-settings)
