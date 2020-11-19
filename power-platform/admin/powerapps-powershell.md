---
title: PowerShell support | Microsoft Docs
description: Description of the different PowerShell cmdlets and a walkthrough of how to install and run them.
author: jimholtz
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 11/02/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# PowerShell support for Power Apps 

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

With PowerShell cmdlets for app creators and administrators, you can automate many of the monitoring and management tasks that are only possible manually today in [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc).

## Cmdlets
[Cmdlets](https://docs.microsoft.com/powershell/scripting/developer/cmdlet/cmdlet-overview) are functions written in PowerShell script language that execute commands in the Windows PowerShell environment. Running these Power Apps cmdlets will allow you to interact with your Business Application Platform without having to go through the admin portal in a web browser. You can combine these cmdlets with other PowerShell functions to write complex scripts that can optimize your workflow. Note that you can still use the cmdlets if you're not an admin on the tenant, but you will be limited to the resources you own. Cmdlets that start with the word 'Admin' are designed to be used by an administrative user account.

Cmdlets are available on the PowerShell gallery as two separate modules: 
- [Administrator](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell)
- [Maker](https://www.powershellgallery.com/packages/Microsoft.PowerApps.PowerShell) 

For information on the Power Apps admin module, see [Get started using the Power Apps admin module](https://docs.microsoft.com/powershell/powerapps/get-started-powerapps-admin) and [Microsoft.PowerApps.Administration.PowerShell](https://docs.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell).

> [!NOTE]
> **Regarding Dynamics 365 Government Community Cloud (GCC) level 2 support:**
> 
> The default endpoint is "prod". If a user wants to run a PowerShell script targeting a GCC environment, the -Endpoint parameter needs to be changed to "usgov" for GCC Moderate, or "usgovhigh" for GCC High, or "dod" for GCC DOD.
> 
> ```powershell
> Add-PowerAppsAccount -Endpoint "usgov" 
> ```

## Requirements
PowerShell in this topic requires PowerShell version 5.x. To check the version of PowerShell running on your machine, run the following command:

> ```powershell
> $PSVersionTable.PSVersion
> ```

If you have an outdated version, see [Upgrading existing Windows PowerShell](https://docs.microsoft.com/powershell/scripting/windows-powershell/install/installing-windows-powershell#upgrading-existing-windows-powershell).

> [!IMPORTANT]
> The modules described in this document, use .NET Framework. This makes it incompatible with PowerShell 6.0 and later, which uses .NET Core. 

## Installation
To run the PowerShell cmdlets for app creators, do the following:

1. Run PowerShell as an administrator.

   > [!div class="mx-imgBorder"] 
   > ![Run PowerShell as an administrator](media/open-powershell-as-admin75.png "Run PowerShell as an administrator")

2. Import the necessary modules using the following commands:

    ```powershell
    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
    Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber
    ```

    Alternatively, if you don't have admin rights on your computer, you can use the following to use these modules:

    ```powershell
    Save-Module -Name Microsoft.PowerApps.Administration.PowerShell -Path
    Import-Module -Name Microsoft.PowerApps.Administration.PowerShell
    Save-Module -Name Microsoft.PowerApps.PowerShell -Path
    Import-Module -Name Microsoft.PowerApps.PowerShell
    ```

3. If you are prompted to accept the change to *InstallationPolicy* value of the repository, accept [A] Yes to all modules by typing 'A' and pressing **Enter** for each module.

   ![Accept InstallationPolicy value](media/accept-installationpolicy-value75.png "Accept InstallationPolicy value")

4. Before accessing any of the commands, you have the option to provide your credentials using the following command. These credentials are refreshed for up to ~8 hours before you're required to sign in again to continue using the cmdlets.

    ```powershell
    # This call opens prompt to collect credentials (Azure Active Directory account and password) used by the commands 
    Add-PowerAppsAccount
    ```

    ```powershell
    # Here is how you can pass in credentials (avoiding opening a prompt)
    $pass = ConvertTo-SecureString "password" -AsPlainText -Force
    Add-PowerAppsAccount -Username user@contoso.com -Password $pass
    ```

## Power Apps cmdlets for app creators

### Prerequisite
Users with a valid Power Apps license can perform the operations in these cmdlets, but they will only have access to the resources (for example, apps, flows, etc.) that have been created or shared with them.

### Cmdlet list - Maker Cmdlets
> [!NOTE]
> We have updated some of the cmdlets function names in the latest release in order to add appropriate prefixes to prevent collisions. See the table below for an overview of what has changed.

| Purpose | Cmdlet |
| --- | --- |
| Add a canvas app to a Microsoft Dataverse solution | SetPowerAppAsSolutionAware |
| Read environments | Get-PowerAppEnvironment *(previously Get-PowerAppsEnvironment)* <br> Get-FlowEnvironment |
| Read, update, and delete a canvas app | Get-PowerApp *(previously Get-App)* <br> Remove-PowerApp *(previously Remove-App)* <br> Publish-PowerApp *(previously Publish-App)* <br> Set-AppDisplayName *(previously Set-PowerAppDisplayName)*<br> Get-PowerAppVersion *(previously Get-AppVersion)* <br> Restore-PowerAppVersion *(previously Restore-AppVersion)* |
| Read, update, and delete canvas app permissions | Get-PowerAppRoleAssignment *(previously Get-AppRoleAssignment)* <br> Set-PowerAppRoleAssignment *(previously Set-AppRoleAssignment)* <br> Remove-PowerAppRoleAssignment *(previously Remove-AppRoleAssignment)* |
| Read, update, and delete a flow | Get-Flow <br> Get-FlowRun <br> Enable-Flow <br> Disable-Flow <br> Remove-Flow |
| Read, update, and delete flow permissions | Get-FlowOwnerRole <br> Set-FlowOwnerRole <br> Remove-FlowOwnerRole |
| Read and respond to flow approvals | Get-FlowApprovalRequest <br> Get-FlowApproval <br> RespondTo-FlowApprovalRequest |
| Read and delete connections | Get-PowerAppConnection *(previously Get-Connection)* <br> Remove-PowerAppConnection *(previously Remove-Connection)* |
| Read, update, and delete connection permissions | Get-PowerAppConnectionRoleAssignment *(previously Get-ConnectionRoleAssignment)* <br> Set-PowerAppConnectionRoleAssignment *(previously Set-ConnectionRoleAssignment)* <br> Remove-PowerAppConnectionRoleAssignment *(previously Remove-ConnectionRoleAssignment)* |
| Read, and delete connectors | Get-PowerAppConnector *(previously Get-Connector)* <br> Remove-PowerAppConnector *(previously Remove-Connector)* |
| Add, read, update, and delete custom connector permissions | Get-PowerAppConnectorRoleAssignment *(previously Get-ConnectorRoleAssignment)* <br> Set-PowerAppConnectorRoleAssignment *(previously Set-ConnectorRoleAssignment)* <br> Remove-PowerAppConnectorRoleAssignment *(previously Remove-ConnectorRoleAssignment)*  |
| Read, add, and remove policy URL patterns | Get-PowerAppPolicyUrlPatterns<br />New-PowerAppPolicyUrlPatterns<br />Remove-PowerAppPolicyUrlPatterns |
| Read, register, and remove management apps | Get-PowerAppManagementApp<br /> Get-PowerAppManagementApps <br /> New-PowerAppManagementApp <br /> Remove-PowerAppManagementApp|
| Read, create, update, and import protection keys | Get-PowerAppRetrieveAvailableTenantProtectionKeys<br />Get-PowerAppGenerateProtectionKey<br /> Get-PowerAppRetrieveTenantProtectionKey<br />New-PowerAppImportProtectionKey <br /> Set-PowerAppTenantProtectionKey |


## Power Apps cmdlets for administrators

### Prerequisite
To perform the administration operations in the admin cmdlets, you'll need the following:

- A user with any of these roles, Global admins, Azure Active Directory Global admins, or Dynamics 365 admin, can access the Power Apps admin PowerShell cmdlets. These roles no longer require a Power Apps plan for administrative access to the Power Apps admin PowerShell cmdlets. However, these administrators need to sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) at least once before using the PowerShell cmdlets. If this is not done, the cmdlets will fail with an authorization error.

- [Microsoft 365 Global admin](https://docs.microsoft.com/microsoft-365/admin/add-users/about-admin-roles) or an [Azure Active Directory Global Administrator](https://docs.microsoft.com/azure/active-directory/active-directory-assign-admin-roles-azure-portal), or [Dynamics 365 admin](global-service-administrators-can-administer-without-license.md) permissions if you need to search through another user's resources. Note that Environment Admins only have access to those environments and environment resources for which they have permissions.

### Cmdlet list - Admin Cmdlets

| Purpose | Cmdlets
| --- | ---
| Read, update, delete, lock, unlock, and recover environments and Dataverse databases | New-AdminPowerAppEnvironment <br> Set-AdminPowerAppEnvironmentDisplayName <br> Get-AdminPowerAppEnvironment *(previously Get-AdminEnvironment)* <br> Remove-AdminPowerAppEnvironment *(previously Remove-AdminEnvironment)* <br>Get-AdminPowerAppSoftDeletedEnvironment</br>Recover-AdminPowerAppEnvironment<br> Copy-PowerAppEnvironment<br />Backup-PowerAppEnvironment<br /> Get-PowerAppEnvironmentBackups<br /> Restore-PowerAppEnvironment<br /> Remove-PowerAppEnvironmentBackup<br />Reset-PowerAppEnvironment<br />New-AdminPowerAppCdsDatabase <br> Get-AdminPowerAppCdsDatabaseLanguages <br> Get-AdminPowerAppCdsDatabaseCurrencies <br> Get-AdminPowerAppEnvironmentLocations <br /> Set-PowerAppLockAllEnvironments <br /> Set-PowerAppUnlockEnvironment <br /> Set-PowerAppProtectionStatus |
| Delete Dataverse database | Remove-LegacyCDSDatabase | 
| Read, update, and delete environment permissions <br><br> *These cmdlets only work today for environments that do not have a Dataverse database.* | Get-AdminPowerAppEnvironmentRoleAssignment *(previously Get-AdminEnvironmentRoleAssignment)* <br> Set-AdminPowerAppEnvironmentRoleAssignment *(previously Set-AdminEnvironmentRoleAssignment)* <br> Remove-AdminPowerAppEnvironmentRoleAssignment *(previously Remove-AdminEnvironmentRoleAssignment)* <br /> Set-AdminPowerAppEnvironmentRuntimeStat |
| Read, update, remove, and recover canvas apps | Get-AdminPowerApp *(previously Get-AdminApp)* <br> Remove-AdminPowerApp *(previously Remove-AdminApp)* <br> Get-AdminPowerAppConnectionReferences <br> Set-AdminPowerAppAsFeatured <br> Clear-AdminPowerAppAsFeatured <br> Set-AdminPowerAppAsHero <br> Clear-AdminPowerAppAsHero <br> Set-AdminPowerAppApisToBypassConsent <br> Clear-AdminPowerAppApisToBypassConsent <br> Get-AdminDeletedPowerAppsList <br> Get-AdminRecoverDeletedPowerApp |
| Read, update, and delete canvas app permissions | Get-AdminPowerAppRoleAssignment *(previously Get-AdminAppRoleAssignment)* <br> Remove-AdminPowerAppRoleAssignment *(previously Remove-AdminAppRoleAssignment)* <br> Set-AdminPowerAppRoleAssignment *(previously Set-AdminAppRoleAssignment)* <br> Set-AdminPowerAppOwner *(previously Set-AdminAppOwner)* |
| Read, update, and delete flows | Get-AdminFlow <br> Enable-AdminFlow <br> Disable-AdminFlow <br> Remove-AdminFlow <br> Remove-AdminFlowApprovals |
| Read, update, and delete flow permissions | Get-AdminFlowOwnerRole <br> Set-AdminFlowOwnerRole <br> Remove-AdminFlowOwnerRole |
| Read and delete connections | Get-AdminPowerAppConnection *(previously Get-AdminConnection)* <br> Remove-AdminPowerAppConnection *(previously Remove-AdminConnection)* |
| Read, update, and delete connection permissions | Get-AdminPowerAppConnectionRoleAssignment *(previously Get-AdminConnectionRoleAssignment)* <br> Set-AdminPowerAppEnvironmentConnectionRoleAssignment *(previously Set-AdminConnectionRoleAssignment)* <br> Remove-AdminPowerAppConnectionRoleAssignment *(previously Remove-AdminConnectionRoleAssignment)* |
| Read and delete custom connectors | Get-AdminPowerAppConnector *(previously Get-AdminConnector)* <br> Remove-AdminPowerAppConnector *(previously Remove-AdminConnector)* |
| Read, update, and delete custom connector permissions | Get-AdminPowerAppConnectorRoleAssignment *(previously Get-AdminConnectorRoleAssignment)*<br> Set-AdminPowerAppConnectorRoleAssignment *(previously Set-AdminConnectorRoleAssignment)* <br> Remove-AdminPowerAppConnectorRoleAssignment *(previously Remove-AdminConnectorRoleAssignment)* |
| Read a user's Power Apps user settings, user-app settings, and notifications | Get-AdminPowerAppsUserDetails |
| Read and delete a user's Power Automate settings, which are not visible to user, but that support flow execution | Get-AdminFlowUserDetails <br> Remove-AdminFlowUserDetails |
| Create, read, update and delete data loss prevention policies for your organization using a three-way classification - **Business**, **Non-Business**, and **Blocked**  |  Get-DlpPolicy *(previously Get-AdminDlpPolicy)* <br> New-DlpPolicy *(previously Add-AdminDlpPolicy)* <br>  Remove-DlpPolicy *(previously Remove-AdminDlpPolicy)* <br> Set-DlpPolicy *(previously Set-AdminDlpPolicy)*<br> <br> Learn more about the [Power Platform data loss prevention (DLP) SDK](data-loss-prevention-sdk.md). |
| Read, add, remove, and update tenant settings | Get-TenantSettings<br />Set-TenantSettings<br /> Get-PowerAppTenantUrlPatterns <br />New-PowerAppTenantUrlPatterns <br /> Remove-PowerAppTenantUrlPatterns <br />Get-AdminPowerAppTenantConsumedQuota|
| Read, add, and remove allowed consent/trial plans within the tenant | Remove-AllowedConsentPlans <br>Add-AllowedConsentPlans<br /> Get-AllowedConsentPlans |
| Read tenant assigned user licenses | Get-AdminPowerAppLicenses |
| Read, update, and reset the environment that Power Apps uses to save SharePoint form apps| Get-AdminPowerAppSharepointFormEnvironment <br />       Set-AdminPowerAppSharepointFormEnvironment <br /> Reset-AdminPowerAppSharepointFormEnvironment|
| Read operation status | Get-AdminPowerAppOperationStatus  |
| Read and update tenant isolation status and policy | Get-PowerAppTenantIsolationOperationStatus <br />   Get-PowerAppTenantIsolationPolicy <br /> Set-PowerAppTenantIsolationPolicy |

## Tips

- Use Get-Help 'CmdletName' to get a list of examples.

     ![Get-Help command](media/get-help-cmdlet.png "Get-Help command")

- To cycle through the possible options for input tags, click on the tab key after typing out the dash (-) character, after the cmdlet name.

Example commands:

```powershell
Get-Help Get-AdminPowerAppEnvironment
Get-Help Get-AdminPowerAppEnvironment -Examples
Get-Help Get-AdminPowerAppEnvironment -Detailed
```

## Operation examples

Below are some common scenarios that show how to use new and existing Power Apps cmdlets.

- [Environments Commands](#environments-commands)
- [Power Apps Commands](#power-apps-commands)
- [Power Automate commands](#power-automate-commands)
- [API connection commands](#api-connection-commands)
- [Data Loss Prevention (DLP) policy commands](#data-loss-prevention-dlp-policy-commands)
- [Block trial licenses commands](#block-trial-licenses-commands)

### Environments commands

Use these commands to get details on and update environments in your tenant.

#### Display a list of all environments

```powershell
Get-AdminPowerAppEnvironment
```

Returns a list of each environment across your tenant, with details of each (e.g., environment name (guid), display name, location, creator, etc).

#### Display details of your default environment

```powershell
Get-AdminPowerAppEnvironment –Default
```

Returns the details for only the default environment of the tenant.

#### Display details of a specific environment

```powershell
Get-AdminPowerAppEnvironment –EnvironmentName 'EnvironmentName'
```

**Note**: The *EnvironmentName* field is a unique identifier, which is different from the *DisplayName* (see first and second fields in the output in the following image).

![Get-AdminEnvironment command](media/get-adminenvironment.png "Get-AdminEnvironment command")

### Power Apps commands

These operations are used to read and modify Power Apps data in your tenant.

#### Display a list of all Power Apps

```powershell
Get-AdminPowerApp
```

Returns a list of all Power Apps across the tenant, with details of each (e.g., application name (guid), display name, creator, etc).

#### Display a list of all Power Apps that match the input display name

```powershell
Get-AdminPowerApp 'DisplayName'
```

Returns a list of all the Power Apps in your tenant that match the display name. 

**Note**: Use quotation characters (") around input values that contain spaces.

#### Feature an application

```powershell
Set-AdminPowerAppAsFeatured –AppName 'AppName'
```

Featured applications are grouped and pushed to the top of the list in the Power Apps mobile player.

**Note**: Like environments, the *AppName* field is a unique identifier, which is different from the *DisplayName*. If you want to perform operations based on the display name, some functions will let you use the pipeline (see next function).

#### Make an application a Hero app, using the pipeline

```powershell
Get-AdminPowerApp 'DisplayName' | Set-AdminPowerAppAsHero
```

A Hero app will appear at the top of the list in the Power Apps mobile player. There can only be one Hero app.

The pipeline (represented as the '|' character between two cmdlets) takes the output of the first cmdlet and passes it as the input value of the second, assuming the function has been written to accommodate the pipeline feature.

**Note**: an app must already be a featured app before it is changed to a hero.

#### Display the number of apps each user owns

```powershell
Get-AdminPowerApp | Select –ExpandProperty Owner | Select –ExpandProperty displayname | Group
```

You can combine native PowerShell functions with the Power Apps cmdlets to manipulate data even further. Here we use the Select function to isolate the Owner attribute (an object) from the Get-AdminApp object. We then isolate the name of the owner object by pipelining that output into another Select function. Finally, passing the second Select function output into the Group function returns a nice table that includes a count of each owner's number of apps.

![Get-AdminPowerApp command](media/get-adminpowerapp.png "Get-AdminPowerApp command")

#### Display the number of apps in each environment

```powershell
Get-AdminPowerApp | Select -ExpandProperty EnvironmentName | Group | %{ New-Object -TypeName PSObject -Property @{ DisplayName = (Get-AdminPowerAppEnvironment -EnvironmentName $_.Name | Select -ExpandProperty displayName); Count = $_.Count } }
```

![Get-AdminPowerApp environment](media/get-adminpowerapp-environment.png "Get-AdminPowerApp environment")

#### Download Power Apps user details

```powershell
Get-AdminPowerAppsUserDetails -OutputFilePath '.\adminUserDetails.txt' –UserPrincipalName 'admin@bappartners.onmicrosoft.com'
```

The above command will store the Power Apps user details (basic usage information about the input user via their user principal name) in the specified text file. It will create a new file if there is no existing file with that name, and overwrite the text file if it already exists.

#### Export a list of assigned user licenses

```powershell
Get-AdminPowerAppLicenses -OutputFilePath '<licenses.csv>'
```

Exports all the assigned user licenses (Power Apps and Power Automate) in your tenant into a tabular view .csv file. The exported file contains both self-service sign up internal trial plans as well as plans that are sourced from Azure Active Directory. The internal trial plans are not visible to admins in the Microsoft 365 admin center.

The export can take a while for tenants with a large number of Power Platform users.

#### Set logged in user as the owner of a canvas app

```powershell
Set-AdminPowerAppOwner –AppName 'AppName' -AppOwner $Global:currentSession.userId –EnvironmentName 'EnvironmentName'
```

Changes the owner role of a PowerApp to the current user, and replaces the original owner as a "can view" role type.

**Note**: The AppName and EnvironmentName fields are the unique identifiers (guids), not the display names.

#### Display a list of deleted canvas apps in an environment

```powershell
Get-AdminDeletedPowerAppsList -EnvironmentName 'EnvironmentName'
```

This displays all canvas apps that were recently deleted and may still be recovered. 

#### Recover a deleted canvas app

```powershell
Get-AdminRecoverDeletedPowerApp -AppName 'AppName' -EnvironmentName 'EnvironmentName'
```

This recovers a canvas app that is discoverable via Get-AdminDeletedPowerAppsList cmdlet. Any canvas app that isn't displayed in Get-AdminDeletedPowerAppsList isn't recoverable.

### Power Automate commands

Use these commands to view and modify data related to Power Automate.

#### Display all flows

```powershell
Get-AdminFlow
```

Returns a list of all flows in the tenant.

#### Display flow owner role details

```powershell
Get-AdminFlowOwnerRole –EnvironmentName 'EnvironmentName' –FlowName 'FlowName'
```

Returns the owner details of the specified flow.

**Note**: Like *Environments* and *PowerApps*, *FlowName* is the unique identifier (guid), which is different from the display name of the flow.

#### Display flow user details

```powershell
Get-AdminFlowUserDetails –UserId $Global:currentSession.userId
```

Returns the user details regarding flow usage. In this example we're using the user Id of the current logged in user of the PowerShell session as input.

#### Remove flow user details

```powershell
Remove-AdminFlowUserDetails –UserId 'UserId'
```

Deletes the details on a flow user completely from the Microsoft database. All flows the input user owns must be deleted before the flow user details can be purged.

**Note**: The UserId field is the Object ID of the user's Azure Active Directory record, which can be found in the [Azure Portal](https://portal.azure.com) under **Azure Active Directory** > **Users** > **Profile** > **Object ID**. You must be an admin to access this data from here.

#### Export all flows to a CSV file

```powershell
Get-AdminFlow | Export-Csv -Path '.\FlowExport.csv'
```

Exports all the flows in your tenant into a tabular view .csv file.

### API connection commands

View and manage API connections in your tenant.

#### Display all native Connections in your default environment

```powershell
Get-AdminPowerAppEnvironment -Default | Get-AdminPowerAppConnection
```

Displays a list of all API connections you have in the default environment. Native connections are found under the **Data** > **Connections** tab in the maker portal.

#### Display all custom connectors in the tenant

```powershell
Get-AdminPowerAppConnector
```

Returns a list of all custom connector details in the tenant.

### Data loss prevention (DLP) policy commands 

> [!NOTE]
> The ability to block connectors by using a three-way classification&mdash;**Business**, **Non-Business**, and **Blocked**&mdash;in addition to DLP policy UI support in the Power Platform admin center are currently in public preview. There is new DLP policy PowerShell support for three-way DLP policy classification, which is also in public preview. Legacy DLP policy support for two-way classification (**Business** and **Non-Business**), along with admin center UI and PowerShell support for two-way classification, are currently generally available and will continue to be available for the foreseeable future. More information: [Connectors documentation](https://docs.microsoft.com/connectors/)

These cmdlets control the DLP policies on your tenant.

#### Create a DLP policy

```powershell
New-DlpPolicy
```

Creates a new DLP policy for the signed-in admin's tenant.

#### Retrieve a list of of DLP objects

```powershell
Get-DlpPolicy
```

Gets policy objects for the signed-in admin's tenant.

#### Update a DLP policy

```powershell
Set-DlpPolicy
```

Updates details of the policy, such as the policy display name.

#### Remove a policy

```powershell
Remove-DlpPolicy
```

Deletes a DLP policy.

### Block trial licenses commands

Commands:

```powershell
Remove-AllowedConsentPlans
Add-AllowedConsentPlans
Get-AllowedConsentPlans
```

The allowed consent plans cmdlets can be used to add or remove access to a particular type of consent plan from a tenant. "Internal" consent plans are either trial licenses or community plans that users can sign themselves up for via Power Apps/Power Automate portals. "Ad-hoc subscription" consent plans are trial licenses that users can sign themselves up for via https://signup.microsoft.com or admins can assign to users via Azure Active Directory (Azure AD) or the Microsoft 365 admin portal. By default all types of consent plans are allowed in a tenant. A common use case for these cmdlets is if a Power Platform admin wants to block users within their tenant from the ability to assign themselves trial licenses but retain the ability to assign trial licenses on behalf of users. This can be accomplished by using the *Remove-AllowedConsentPlans -Types "Internal"* command as well as disabling the setting *AllowAdHocSubscriptions* in Azure AD. It is important to note that when using *Remove-AllowedConsentPlans* all existing plans of the specified type will be removed from all users in the tenant and will not be recoverable. In addition, it will block all further assignment of plans of that type. If, at a later time, the Power Platform admin wishes to re-enable plans of that type they can use *Add-AllowedConsentPlans*. If they want to view the current state of allowed consent plans they can use *Get-AllowedConsentPlans*.

## Questions?

If you have any comments, suggestions, or questions, post them on the [Administering Power Apps community board](https://powerusers.microsoft.com/t5/Administering-PowerApps/bd-p/Admin_PowerApps).

### See also
[Get started using the Power Apps admin module](https://docs.microsoft.com/powershell/powerapps/get-started-powerapps-admin) <br />
[Microsoft.PowerApps.Administration.PowerShell](https://docs.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell)
