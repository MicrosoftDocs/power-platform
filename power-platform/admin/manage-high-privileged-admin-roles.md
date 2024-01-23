---
title: " Use Entra Privileged Identity Management in Power Platform admin center to manage high-privileged admin roles  | MicrosoftDocs"
description: Use Microsoft Entra Privileged Identity Management to manage high-privileged admin roles.
author: srpoduri 
ms.subservice: admin
ms.author: srpoduri 
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
contributors: srpoduri
ms.topic: conceptual
ms.date: 01/22/2024
search.audienceType: admin
---

# Manage admin roles with Microsoft Entra Privileged Identity Management

With Microsoft Entra Privileged Identity Management (PIM), you can manage high-privileged admin roles in the Power Platform admin center.

## Prerequisites

- Remove old System Administrator role assignments in your environments.

  You can use PowerShell scripts, provided by Microsoft, to inventory and remove unwanted users from the System Administrator role in one or more Power Platform environments.

- Respond to the Private Preview request through [Microsoft Forms](https://forms.office.com/r/3Mp38A0TDA).

  Wait for confirmation from the Product Group, confirming the feature is enabled on your tenant.

## Changes to feature support

- Microsoft doesn't automatically assign the _System Administrator_ role for users with these Entra ID roles, also known as _tenant admins_:
  - Global Administrator
  - Power Platform Administrator
  - Dynamics 365 Administrator

- Tenant admins can continue to sign in to PPAC. These privileges include:
  - Enabling or disabling tenant level settings
  - Viewing analytics information for environments
  - Viewing capacity consumption

- Tenant admins can't perform activities that require direct access to Dataverse data.

  Examples of these activities include:
  - Updating the security role for a user in an environment
  - Installing apps into the environment

  > [!IMPORTANT]
  > Tenant admins must do another step before they can perform activities requiring access to Dataverse. They must elevate themselves to the _System Administrator_ role in the environment where they need access.

## Self-elevate to the System Administrator role

Currently, we only support elevation, using PowerShell. Future updates will include more enhancements in PPAC.

> [!NOTE]
> Users who call the self-elevation API must be a:
> - Global admin,
> - Power Platform admin, or
> - D365 admin
>
> All _other_ users who call the API get an access denied message.

### Step 1: Authenticate using Power Platform API

#### Prerequisite

Install the [MSAL](https://www.powershellgallery.com/packages/MSAL.PS) PowerShell module:

```powershell

Install-Module MSAL.PS
```

You only need to install the module once.

#### Authenticate

```powershell
Import-Module MSAL.PS

$AuthResult = Get-MsalToken -ClientId '49676daf-ff23-4aac-adcc-55472d4e2ce0' -Scope 'https://api.powerplatform.com/.default' 

$Headers = @{Authorization = "Bearer $($AuthResult.AccessToken)"} 
```

### Step 2: Build the `http` query with the environment endpoint

```powershell
$Headers.Add('Content-Type', 'application/json') 

$uri = "https://api.powerplatform.com/usermanagement/environments/<environment id>/user/applyAdminRole?api-version=2022-03-01-preview"; 
```

### Step 3: Call the API endpoint to request elevation

```powershell
try { 

$postRequestResponse = Invoke-RestMethod -Method Post -Headers $Headers -Uri $uri 

} 

catch { 

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

$output = $postRequestResponse| ConvertTo-Json -Depth 2 

Write-Host $output 
```

### Step 4: Clean up activity

Run the [PowerShell command](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/UserManagement/Microsoft.PowerPlatform.Administration.UserManagement#remove-role-assignments-from-given-list-of-users) `Remove-RoleAssignmentFromUsers` to remove users from the System Administrator role after the assignment expires in PIM.

## Known limitations

- If the user is already a System Administrator, the call to self-elevate returns a success instead of informing the caller that the user already exists as a System Administrator.

- Calling user must be a tenant admin. Refer to the [Changes to feature support](#changes-to-feature-support) section for a full list of users who meet the tenant admin criteria.

- Calling user can only elevate themselves. You can't call the elevation API on-behalf of another user.

- Calls to elevate aren't logged during the Private Preview. However, logging support will be added in the future.

- If you're using the CoE Starter kit, the kit no longer works. However, the CoE Starter kit will be updated in the future.

- Once you elevate a user through Azure/Entra PIM, wait for two hours for the changes to sync from AAD/Entra to Power Platform before logging in to PPAC.

- Role assignments through Groups aren't currently supported. Be sure to assign roles directly to the user.
