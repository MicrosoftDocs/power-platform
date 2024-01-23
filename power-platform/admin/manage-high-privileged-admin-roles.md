---
title: "Use Entra Privileged Identity Management in Power Platform admin center to manage high-privileged admin roles  | MicrosoftDocs"
description: Use Microsoft Entra Privileged Identity Management to manage high-privileged admin roles.
author: srpoduri 
ms.subservice: admin
ms.author: sripod 
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
contributors: srpoduri
ms.topic: conceptual
ms.date: 01/22/2024
search.audienceType: admin
---

# Manage admin roles with Microsoft Entra Privileged Identity Management (preview)

[This article is prerelease documentation and is subject to change.]

Use Microsoft Entra Privileged Identity Management (PIM) to manage high-privileged admin roles in the Power Platform admin center.

## Prerequisites

- Remove old system administrator role assignments in your environments. You can use PowerShell scripts to inventory and remove unwanted users from the **System Administrator** role in one or more Power Platform environment.

- Respond to the preview request through [Microsoft Forms](https://forms.office.com/r/3Mp38A0TDA). Then wait for confirmation from Microsoft, confirming the feature is enabled on your tenant.

## Changes to feature support

Microsoft doesn't automatically assign the **System Sdministrator** role for users with these Entra ID roles, also known as tenant admins:
- Global administrator
- Power Platform administrator
- Dynamics 365 administrator

Tenant admins can continue to sign in to Power Platform admin center, witht the following privileges:
- Enable or disable tenant level settings
- View analytics information for environments
- View capacity consumption

Tenant admins can't perform activities that require direct access to Dataverse data. Examples of these activities include:
- Updating the security role for a user in an environment
- Installing apps for an environment

> [!IMPORTANT]
> Tenant admins must do another step before they can perform activities requiring access to Dataverse. They must elevate themselves to the **System Administrator** role in the environment where they need access.

## Self-elevate to the system administrator role

Currently, we only support elevation, using PowerShell. Future updates will include more enhancements in Power Platform admin center.

> [!NOTE]
> Users who call the self-elevation API must be a global admin, Power Platform admin, or Dynamic 365 admin; Otherwise you'll get an access denied message.

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

Run the [PowerShell command](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/UserManagement/Microsoft.PowerPlatform.Administration.UserManagement#remove-role-assignments-from-given-list-of-users) `Remove-RoleAssignmentFromUsers` to remove users from the **System Administrator** role after the assignment expires in Privileged Identity Management (PIM).

## Known limitations

- When the caller is a system administrator, the self-elevate call returns a success rather than notifying the caller that the system administrator already exists.

- The user making the call must have tenant admint. For a full list of users who meet the tenant admin criteria, see [Changes to feature support](#changes-to-feature-support)

- The elevation API can only be invoked by the user who needs to elevate their status. It doesn't support making API calls on behalf of another user for elevation purposes.

- Calls to elevate aren't logged during preview. However, logging support will be added in the future.

- The Microsoft Power Platform CoE Starter Kit no longer works and we're working on updating the kit.

- Once you elevate a user through Entra Privileged Identity Management, wait for two hours for the changes to sync from Entra to Power Platform before you sign in to Power Platform admin center.

- Role assignments through groups aren't supported. Make sure that you assign roles directly to the user.
