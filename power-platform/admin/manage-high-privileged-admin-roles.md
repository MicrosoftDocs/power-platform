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

Microsoft doesn't automatically assign the **System Administrator** role for users with these Microsoft Entra ID roles, also known as tenant admins:

- Global administrator
- Power Platform administrator
- Dynamics 365 administrator

Tenant admins can continue to sign in to Power Platform admin center, with the following privileges:

- Enable or disable tenant level settings
- View analytics information for environments
- View capacity consumption

Tenant admins can't perform activities that require direct access to Dataverse data. Examples of these activities include:

- Updating the security role for a user in an environment
- Installing apps for an environment

> [!IMPORTANT]
> Tenant admins must do another step before they can perform activities requiring access to Dataverse. They must elevate themselves to the **System Administrator** role in the environment where they need access.

## Self-elevate to the system administrator role

Currently, we only support elevation using PowerShell. Future updates will include more enhancements in the Power Platform admin center.

For more information about setting up PowerShell, see [Quick Start Web API with PowerShell and Visual Studio Code](/power-apps/developer/data-platform/webapi/quick-start-ps).

### Set up PowerShell

Install the [MSAL](https://www.powershellgallery.com/packages/MSAL.PS) PowerShell module. You only need to install the module once.

```powershell
Install-Module -Name MSAL.PS
```

> [!NOTE]
> Users who call the self-elevation API must be a global admin, Power Platform admin, or Dynamic 365 admin. Otherwise, you get an access denied message.

### Step 1: Run the script to elevate

In this script, you:

- Authenticate, using the Power Platform API.
- Build an `http` query with your environment ID.
- Call the API endpoint to request elevation.

After adding your unqiue `<environment id>`, copy and paste the script into a PowerShell console.

```powershell
# Set your environment ID
$environmentId = "<environment id>"

Import-Module MSAL.PS

# Authenticate
$AuthResult = Get-MsalToken -ClientId '49676daf-ff23-4aac-adcc-55472d4e2ce0' -Scope 'https://api.powerplatform.com/.default' 


$Headers = @{
   Authorization  = "Bearer $($AuthResult.AccessToken)"
   'Content-Type' = "application/json"
} 

$uri = "https://api.powerplatform.com/usermanagement/environments/$environmentId/user/applyAdminRole?api-version=2022-03-01-preview";

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
   
$output = $postRequestResponse | ConvertTo-Json -Depth 2 
   
Write-Host $output
```

### Step 2: Confirm the result

Upon success, you see output similar to the following output:

```powershell
"Description":  "[\"SyncMode: Default\",\"Instance XXxXxXXX-8f46-ee11-be6a-000xXxXXXXXX exists\",\"Instance XXxXxXXX-8f46-ee11-be6a-000xXxXXXXXX  in enable

d state\",\"Instance Url found
https://yourenv.crm.dynamics.com\",\"User
found in AD tenant\",\"User in enabled state in AD tenant\",\"SystemUser with Id:xXXxxXXx-1280-ee11-8179-0

00d3a59c7b7, objectId:xXXxXXXX-2f05-467f-80b4-xXxXXXXxxxXX exists in instance\"]",
```

#### Errors

You might see an error message if you don't have the right permissions.

```powershell
"Unable to assign System Administrator security role as the user is not either a Global admin, Power Platform admin, or Dynamics 365 admin. Please review your role assignments in Entra ID and try again later. For help, please reach out to your administrator."
```

### Step 3: Clean up activity

Run the [PowerShell script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/UserManagement/Microsoft.PowerPlatform.Administration.UserManagement) to remove the users from the System Administrator role after the assignment expires in PIM.

## Known limitations

- When the caller is a system administrator, the self-elevate call returns a success rather than notifying the caller that the system administrator already exists.

- The user making the call must have tenant admin. For a full list of users who meet the tenant admin criteria, see [Changes to feature support](#changes-to-feature-support)

- The elevation API can only be invoked by the user who needs to elevate their status. It doesn't support making API calls on behalf of another user for elevation purposes.

- Calls to elevate aren't logged during preview. However, logging support will be added in the future.

- The Microsoft Power Platform CoE Starter Kit no longer works and we're working on updating the kit.

- Once you elevate a user through Entra Privileged Identity Management, wait for two hours for the changes to sync from Entra to Power Platform before you sign in to Power Platform admin center.

- Role assignments through groups aren't supported. Make sure that you assign roles directly to the user.
