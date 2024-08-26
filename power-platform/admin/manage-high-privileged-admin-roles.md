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
ms.date: 08/07/2024
search.audienceType: admin

---

# Manage admin roles with Microsoft Entra Privileged Identity Management

Use Microsoft Entra Privileged Identity Management (PIM) to manage high-privileged admin roles in the Power Platform admin center.

## Prerequisites

- Remove old system administrator role assignments in your environments. You can use [PowerShell scripts](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/UserManagement/Microsoft.PowerPlatform.Administration.UserManagement) to inventory and remove unwanted users from the **System Administrator** role in one or more Power Platform environments.

## Changes to feature support

Microsoft no longer automatically assigns the **System Administrator** role to users with global or service level admin roles such as Power Platform Administrator and Dynamics 365 Administrator.

These admins can continue to sign in, to the Power Platform admin center, with these privileges:

- Enable or disable tenant level settings
- View analytics information for environments
- View capacity consumption

These admins can't perform activities that require direct access to Dataverse data without a license. Examples of these activities include:

- Updating the security role for a user in an environment
- Installing apps for an environment

> [!IMPORTANT]
> Global admins, Power Platform admins, and Dynamics 365 service administrators must complete another step before they can perform activities requiring access to Dataverse. They must elevate themselves to the **System Administrator** role in the environment where they need access. All elevation actions are logged to Microsoft Purview.

## Known limitations

- When using the API, you'll notice that if the caller is a system administrator, the self-elevate call returns a success rather than notifying the caller that the system administrator already exists.

- The user making the call must have the tenant admin role assigned. For a full list of users who meet the tenant admin criteria, see [Changes to feature support](#changes-to-feature-support)

- If you're a Dynamics 365 administrator and the environment is protected by a security group, you must be a member of the security group. This rule doesn't apply to users with the global administrator or Power Platform administrator roles.

- The elevation API can only be invoked by the user who needs to elevate their status. It doesn't support making API calls on behalf of another user for elevation purposes.

- A workaround is available for customers using the Microsoft Power Platform CoE Starter Kit. See [PIM Issue and Workaround #8119](https://github.com/microsoft/coe-starter-kit/issues/8119) for more information and details.

- Role assignments through groups aren't supported. Make sure that you assign roles directly to the user.

## Self-elevate to the system administrator role

We support elevation using either PowerShell or through an intuitive experience in Power Platform admin center.

> [!NOTE]
> Users who attempt to self-elevate must be a Global admin, Power Platform admin, or Dynamics 365 admin. The user interface in Power Platform admin center isn't available for users with other Entra ID admin roles and attempting to self-elevate through the PowerShell API returns an error.

### Self-elevate through PowerShell
#### Set up PowerShell

Install the [MSAL](https://www.powershellgallery.com/packages/MSAL.PS) PowerShell module. You only need to install the module once.

```powershell
Install-Module -Name MSAL.PS
```

For more information about setting up PowerShell, see [Quick Start Web API with PowerShell and Visual Studio Code](/power-apps/developer/data-platform/webapi/quick-start-ps).


#### Step 1: Run the script to elevate

In this PowerShell script, you:

- Authenticate, using the Power Platform API.
- Build an `http` query with your environment ID.
- Call the API endpoint to request elevation.

##### Add your environment ID

1. Get your **Environment ID** from the **Environments** tab of the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/).

1. Add your unique `<environment id>` to the script.

##### Run the script

Copy and paste the script into a PowerShell console.

```powershell
# Set your environment ID
$environmentId = "<your environment id>"

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

#### Step 2: Confirm the result

Upon success, you see an output similar to the following output. Look for `"Code": "UserExists"` as evidence that you successfully elevated your role.

```powershell
{
  "errors": [],
  "information": [
    {
      "Subject": "Result",
      "Description": "[\"SyncMode: Default\",\"Instance df12c345-7b56-ee10-8bc5-6045bd005555 exists\",\"Instance df85c664-7b78-ee11-8bc5-6045bd005555 in enabled state\",\"Instance Url found https://orgc1234567.crm.dynamics.com\",\"User found in AD tenant\",\"User in enabled state in AD tenant\",\"SystemUser with Id:11fa11ab-4f75-ee11-9999-6045bd12345a, objectId:d111c55c-aab2-8888-86d4-ece1234f11e6 exists in instance\"]",
      "Code": "UserExists"
    },
    { ... }
}
```

##### Errors

You might see an error message if you don't have the right permissions.

```powershell
"Unable to assign System Administrator security role as the user is not either a Global admin, Power Platform admin, or Dynamics 365 admin. Please review your role assignments in Entra ID and try again later. For help, please reach out to your administrator."
```

#### Step 3: Clean up activity

Run [Remove-RoleAssignmentFromUsers](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/UserManagement/Microsoft.PowerPlatform.Administration.UserManagement#remove-role-assignments-from-given-list-of-users) to remove users from the System Administrator security role after the assignment expires in PIM.

- `-roleName`: "System Administrator" or another role
- `-usersFilePath`: Path to CSV file with list of user principal names (one per line)
- `-environmentUrl`: Found at [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com/)
- `-processAllEnvironments`: (Optional) Process all your environments
- `-geo`: A valid GEO
- `-outputLogsDirectory`: Path where log files are written

##### Example script

```powershell
Remove-RoleAssignmentFromUsers
-roleName "System Administrator" 
-usersFilePath "C:\Users\<My-Name>\Desktop\<names.csv>"
-environmentUrl "<my-name>-environment.crm.dynamics.com"
# Or, include all your environments
-processAllEnvironments $true
-geo "NA"
-outputLogsDirectory "C:\Users\<My-Name>\Desktop\<log-files>"
```

### Self-elevate through Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the left side panel, select **Environments**.
1. Select the checkmark next to your environment.
1. Select **Membership** in the command bar to request self-elevation.
1. The **System Administrators** pane is displayed. Add yourself to the system administrator role by selecting **Add me**.

   :::image type="content" source="media/self-elevate-membership-menu.png" alt-text="Use the Membership menu option to request self-elevation.":::
