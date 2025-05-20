---
title: Tenant-to-tenant migrations 
description: Learn about the impact of migrating an environment from one tenant to another. 
ms.date: 05/13/2025
ms.topic: concept-article
author: matapg007
contributors:
  - SatishKumarkannanMs
  - val-bc 
  - brsova
  - ImadYanni
  - bevans 
  - LaurentPepin 
ms.subservice: admin
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin

---

# Tenant-to-tenant migrations

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
The tenant-to-tenant migration feature allows you to transfer an environment from one tenant to another. This feature supports scenarios such as merging multiple tenants into one and facilitating company acquisitions. The environment doesn't actually _move_, but rather is _linked_ to another tenant. The environment still exists but isn't part of the source tenant anymore. It's accessible and managed under the destination tenant. There are no user interface changes or version changes as part of this move.

## Before you get started
Be aware of the following before starting a tenant-to-tenant migration.

> [!Note]
> Tenant-to-tenant migrations will be supported on Managed Environments in the future.

* **Supported environment types**: Production and sandbox only.
* **Not supported environment types**: Default, developer, trial, and Teams environment types aren't supported. Government Community Cloud (GCC) to public clouds and vice versa aren't supported.
* Components not supported include Dynamics 365 Customer Voice, Omnichannel for Customer Service, component library, Dynamics 365 Customer Insights - Journeys, and Dynamics 365 Customer Insights - Data.
* Specific steps required for Power Apps, Power Automate, Power Pages, and Microsoft Copilot Studio are called out in the premigration and post-migration steps.
* A Dataverse organization linked to a finance and operations organization can't be migrated to a different tenant.
* You might need to reconfigure some applications and settings after tenant-to-tenant migration, such as Dynamics 365 for Outlook, server-side sync, SharePoint, and others.
* Once users are created and configured, you must [create a user mapping file](#create-a-user-mapping-file), which is described later in this article.
* If the mapped user has a mailbox in the destination tenant, then the mailbox is automatically configured during the migration. For all other users, you need to reconfigure the mailbox.
  * If the same mailbox is used in the target tenant, `test@microsoft.com`, then the mailbox is used by default. Before the tenant-to-tenant migration, customers need to migrate and configure their mailboxes on the target tenant.
  * If you're using the default onmicrosoft domain, `test@sourcecompanyname.onmicrosoft.com`, the post-migration domain name is changed to `test@targetcompanyname.onmicrosoft.com`. Customers need to reconfigure the mailbox. Learn more about configuring the mailbox in [Connect to Exchange Online](connect-exchange-online.md).

## Prerequisites
Be sure to complete the following prerequisites before you start the migration process:

* Create users in the target tenant, including:
  * Create users in Microsoft 365 and Microsoft Entra ID.
  * Assign licenses.
* You must have admin privileges with Power Platform or Dynamics 365 to perform the migration.
* The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. Learn more in [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

## Preparation process
Complete the following procedures for Power Automate, Power Apps, Copilot Studio, and Power Pages before the migration. You also must create a user mapping file.

### Prepare Power Automate

If your flows are already defined in Dataverse, then no extra work is required. 

Any Power Automate flows that should be migrated need to have their definitions added into Dataverse solutions in the source environment. Learn more in [Add an existing cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution). This can be done in bulk by running the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution?view=pa-ps-latest&preserve-view=true) cmdlet.
      
### Prepare Power Apps
Any Power Apps must be manually exported. We don't support the migration of customer connectors, connections, or gateways. If you have any of these components set up, they must be manually reconfigured after the migration.

#### For solution-aware apps
1. For apps that are solution aware, go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all apps and solutions. You can export them individually or group them together in a single solution, if they're not already.
1. Delete these solution-aware apps in the environment after exporting them.
1. Apps belonging to managed solutions can only be deleted by deleting the solution.
1. Apps that are in an unmanaged solution can be deleted by using the **Delete from this environment** option.	 

    > [!Important]
    > Solution-aware canvas apps, custom pages, or component libraries that you don't delete from an environment before migration won't work after the migration completes.

#### For apps that aren't solution aware
1.	Go to [Power Apps](https://make.powerapps.com), and then select **Apps**.
1.	For each app that you want to move, select **More Commands** and then select **Export package (preview)**.
1.	Enter the details required to perform the export of the app, and then select **Export**. Once the export completes, a download begins.

  	  The resulting file contains the app package that was selected.
  	
1.	Repeat these steps until all apps have been exported.
1.	Delete these nonsolution-aware apps from the environment.

An admin can also view or delete canvas apps from the list in the admin portal by completing the following steps:

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and then select the environment from **Manage**.
2.	Under the **Resources** action, select **Power Apps** to view and delete them.

### Prepare Copilot Studio
Any Copilot Studio chatbots must be manually exported. Some dependent components of chatbots must be manually reconfigured during or after the migration. For example, connections, environment variables, and custom connectors must be manually reconfigured during or after the migration.

Chatbots are solution aware. Go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all chatbot solutions, either individually or grouped together in a single solution. Learn more in [Export and import bots using solutions](/microsoft-copilot-studio/authoring-export-import-bots?tabs=webApp).

### Prepare Power Pages 
The following steps must be done for each website in an environment:

1.	Sign in to the environment.
2.	Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
3.	[Delete](/power-pages/admin/delete-website) the website.

### Create a user mapping file
Create a user mapping file for the source environment to be transferred to the target environment. It's essential to note that each environment requires an individual mapping file. Be sure that users are present and authorized in both the originating and destination tenants, as this is required for a successful migration. The users' domains may vary between source and target, provided they're active.

1. Create a user mapping file named **usermapping.csv**.

   > [!Note]
   > The file name is case sensitive. Make sure records are separated by a comma, not a semicolon.
  
1. Accurately record the details of users, including their source and destination email IDs. Make sure there are no extra spaces before and after the header. Your mapping file should look like the following example:

    |Source|	Destination|
    |------|-------------|
    |`SourceUser@sourcetenant.com`	|`DestinationUser@targettenant.com`|

#### For full access users

1. Access the source environment.
1. Use **Advanced Find** to look for users.
1. Select **Use Saved View** > **Full Access Users**, and then select **Edit Columns**.
1. Remove all columns except the **Full Name** column.
1. Select **Add Columns** > **Windows Live ID**.
1. Select **OK** > **Results** to see the list of full access users.
1. Select all the records, select **Export Users** in the ribbon, and then choose **Static Worksheet**.
1. Follow steps 1-7 above for the destination tenant, if possible. You should now have two separate Excel sheets: one for the source and one for the target tenant.
1. Open the Excel files for editing.
1. Starting with the source Excel sheet, copy the records under the **Windows Live ID** column into Notepad. Don't copy the header.
1. Save the Notepad file.
1. Enter the destination Windows Live ID (UPNs) in the same Notepad document to the right of the corresponding source UPN. Be sure to separate source and destination UPNs with a comma (,).

    Example:
      - `user001@source.com`, `user001@destination.com`
      - `user002@source.com`, `user002@destination.com`
      - `user003@source.com`, `user003@destination.com`

1. Save as a CSV file.

#### For administrative access users

1. Access the source environment.
1. Use **Advanced Find** to look for users.
1. Select **Use Saved View** > **Administrative Access Users**, and then select **Results** to see the list of administrative access users.
1. If you decide not to include any of these users, skip the following steps. Otherwise, to include these users in the mapping file, do the following:
    1. Find the corresponding users in the destination tenant.
    1. Make sure a valid license is assigned to the destination user in the destination tenant.
       > [!Note]
       >  If the destination user isn't assigned any license, the migration fails.
    
    1. Save the CSV file that has both full access users and administrative access users mapped.

## Migration
Before proceeding with the migration, make sure you review and complete the preparation process. After you've completed the preparation process, complete the following sections to migrate.

### Install PowerShell for Power Platform Administrators (both source and target admins) 
The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, go to [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md) and [Installing PowerShell for Power Platform Administrators](powershell-installation.md).

Install or update the necessary module by using one of the following commands:

```PowerShell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Update-Module -Name Microsoft.PowerApps.Administration.PowerShell
```

### Install Azure PowerShell on Windows (both source and target admins)

The Azure PowerShell module is a rollup module. Installing the Azure PowerShell module downloads the generally available modules and makes their cmdlets available for use. Learn more in [Install Azure PowerShell on Windows](/powershell/azure/install-azps-windows?view=azps-11.6.0&tabs=powershell&pivots=windows-psgallery&preserve-view=true).

Use the Install-Module cmdlet to install the Azure PowerShell module:

```PowerShell
Install-Module -Name Az -Repository PSGallery -Force
```

### Sign in to Microsoft Power Platform (both source and target admins)

Sign in to Microsoft Power Platform. This step allows administrators to authenticate and access the Power Platform environment.

```PowerShell
Add-PowerAppsAccount
```

### Submit migration request (source admin)
To initiate a tenant-to-tenant migration, the source tenant's Dynamics 365 or Power Platform administrator must submit a request to the target tenant using the following command and provide the environment name ID and tenant ID.

You must have Power Platform administrator or Dynamics 365 administrator credentials to complete this step. 

```PowerShell
TenantToTenant-SubmitMigrationRequest –EnvironmentName {EnvironmentId} -TargetTenantID {TenantID}
```
You can view the status and MigrationID using the following command:

```PowerShell
TenantToTenant-ViewMigrationRequest
```
> [!Note]
> Record the MigrationID, which is used in further migration commands.
> Source Tenant MigrationID is different from Destination Tenant MigrationID.

### View and approve migration request (target admin)
The admin of the destination tenant should run the following command to see all the migration requests and status. The admin can review all the migration requests and options to approve or reject. 

```PowerShell
Add-PowerAppsAccount

TenantToTenant-ViewApprovalRequest

TenantToTenant-ManageMigrationRequest -MigrationId {MigrationId from above command to approve or deny}
```
Once a request is approved, the admin of the destination tenant can notify the admin of the source tenant to proceed with the next step of the migration.

### Upload the user mapping file (source admin)
This step involves creating the SAS URL, which is used later for uploading the user mapping file. Run the following PowerShell command, substituting **EnvironmentId** with the actual environment ID and **FileLocation** with the actual file location.

> [!Note]
> While passing the **FileLocation** value, you must provide the parameter with the usermapping file name (usermapping.csv):
> `C:\Filelocation\usermapping.csv`.

```PowerShell
TenantToTenant-UploadUserMappingFile –EnvironmentName {EnvironmentId} -UserMappingFilePath {FileLocation}
```

Be sure to copy the value of the **Read Only UserMapping File ContainerUri** returned by the command. This SAS URI is required as the **-ReadOnlyUserMappingFileContainerUri** parameter in the **TenantToTenant-PrepareMigration** command.

### Prepare the environment migration (source admin)
The following step involves conducting comprehensive validations to ensure that every user listed in the user mapping file is verified and currently active within the target tenant. 

MigrationId can be viewed using the "TenantToTenant-ViewMigrationRequest" command in the source tenant.

```PowerShell
TenantToTenant-PrepareMigration 
-MigrationId {MigrationId} 
-TargetTenantId {TargetTenantId} 
-ReadOnlyUserMappingFileContainerUri {SasUri}
```

> [!Note]
> While passing the **SASUri** value, you must provide the parameter like this:
> `https://dynamics.blob.core.windows.net/20240604t000000z73e18df430fe40059290dsddc25d783`.

#### Sample output

```PowerShell
Code        : 202
Description : Accepted
```
This step's duration varies depending on the number of users in the user mapping file. You can monitor the progress of this step by using the **TenantToTenant-GetStatus** command, provided below.

### Check status (source admin)

```PowerShell
TenantToTenant-GetMigrationStatus -MigrationId {MigrationId}
```

#### Sample output
-	Validate Tenant To Tenant Migration: Running 
-	Validate Tenant To Tenant Migration: Succeeded
-	Validation Failed, Errors are updated on the blob here: SASURI

### Errors and how to resolve them 
- If you receive an error that says, **The User mapping file provided for Tenant To Tenant migration is invalid**, check if the user mapping file name is correct and that the user mapping file has a comma to separate values.
- **Line '{line numbers}' have the same '{emailID}'**: Make sure there aren't any duplicate entries.
- **Invalid Email Format '{emailid}'**: Make sure the email format is correct for `testuser@tenantdomain.com`.
- **Target on line '{linenumber}' is same as source emailId**: Make sure the **Destination Email** is different from the **Source Email**.
- **Each line must have exactly two columns: '{line numbers}'**: Make sure each row has only two columns: the source and destination columns. Remove any extra commas.

After fixing user mapping errors, you need to reupload the user mapping file using the same SAS URI.
  
### Download the error report (source admin)
If any errors are in the user mapping file, there's an option to download an error report. This can be done by directly copying and pasting the **SasUrl** provided in the **Tenant-To-Tenant-GetMigrationStatus** command to your internet browser or by using the following commands that use the SAS URI from the previous step to check status and the desired location to download the error report.

Complete the following steps:

1. Run the following command with Windows PowerShell ISE.

    ```Windows PowerShell ISE
    Import-Module Az.Storage 
    # Define the SAS URI of the blob
    $sasUri = " Update the SAS Uri from previous step "
    # Define the path where the blob will be downloaded
    $destinationPath = "C:\Downloads\Failed\"
    # Split the SAS URI on the '?' character to separate the URL and the SAS token
    $url, $sasToken = $sasUri -split '\?', 2
    $containerName = $url.Split('/')[3]
    $storageAccountName = $url.Split('/')[2].Split('.')[0]
    $storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -SasToken $sasToken
    Get-AzStorageBlobContent -Blob "usermapping.csv" -Container $containerName -Destination $destinationPath -Context $storageContext 
    ```
1. Fix the issues in the user mapping file.
1. Reupload the file using the steps in [Upload the user mapping file (source admin)](#upload-the-user-mapping-file-source-admin).

After successfully completing the [Prepare the environment migration (source admin)](#prepare-the-environment-migration-source-admin), you may proceed with the [Migrate the environment (source admin)](#migrate-the-environment-source-admin) procedure to migrate the environment. Perform the migration within the next seven days. If you don't complete the migration in the next seven days, you must start the [Prepare the environment migration (source admin)](#prepare-the-environment-migration-source-admin) procedure again.

## Migrate the environment (source admin)
The **MigrationId** can be viewed using the **TenantToTenant-ViewMigrationRequest** command in the source tenant.

```PowerShell
TenantToTenant-MigratePowerAppEnvironment
-MigrationId {MigrationId}
-TargetTenantId {TargetTenantId}
-SecurityGroupId {SecurityGroupId}
```
### Get status (source admin)

```PowerShell
TenantToTenant-GetMigrationStatus -MigrationId {MigrationId}
```

#### Sample output

-	Migrate Environment: Running
-	Migrate Environment: Succeeded

> [!Note]
> If you encounter any issues running the above commands, [submit a support request](get-help-support.md) to get help.

## Post-migration process
After moving environments to another tenant:

-	The environment URL, organization ID (OrgID), and the name don't change.
-	The source environment doesn't have Dataverse.
-	Users not included in the mapping file won't be migrated and mapped post-migration.

Complete the following procedures for Power Automate, Power Apps, Copilot Studio, and Power Pages.

### Post-migration process for Power Automate
After the migration has completed, step through the **Review components** section as a checklist to get flows and other components adjusted and activated. The key steps are:

1. Create connections for all connection references.
1. Start all flows, including starting child flows before parent flows.
1. For any HTTP triggered flows, retrieve the new URL and place it in any calling apps or flows to refresh those references.

### Post-migration process for Power Apps

#### For solution-aware apps
1. Select the new environment from [Power Apps](https://make.powerapps.com) and navigate to the **Solutions** page.
1. Select **Import** and use the file selector to select the packages exported from the above step.
1. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

#### For apps that aren't solution aware
1. Go to [Power Apps](https://make.powerapps.com).
1. Select the new environment from the environment dropdown list.
1. Select **Apps**.
1. Select **Import canvas app**.
1. Upload the app package file.
1. Complete all of the import option selections, and then select **Import**.
1. Repeat these steps until all apps have been imported.

### Post-migration process for Copilot Studio
1. Select the new environment from [Power Apps](https://make.powerapps.com) and navigate to the **Solutions** page.
1. Select **Import** and use the file selector to select the packages exported from the above step.
1. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

### Post-migration process for Power Pages 
The following steps must be completed for each website in the environment.

1. Sign in to the environment.
1. Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
1. Provision the website with the same portal type and language.

After completing all of the above steps and the migration, you may validate the environment in the target tenant. Later, you can delete the source environment in the Power Platform admin center.

### Frequently asked questions

#### Are background operations enabled during tenant-to-tenant migration?

Administration mode is enabled during tenant-to-tenant migration, therefore background operations don't run. Learn more in [Administration mode](admin-mode.md).

#### Can we migrate all users of the Dataverse organization?

We can migrate all users of the Dataverse organization only if users exist in the destination tenant. For example:

`user001@source.com`, `user001@destination.com`

`user002@source.com`, `user002@destination.com`

#### What environments are supported for migration?

Only production and sandbox environments are supported. Default, developer, trial, and Teams environments aren't supported.

#### Will the environment physically move to the new tenant?

No. The environment remains in place, but the Dataverse organization is moved to the destination tenant. It's no longer part of the source tenant and is managed under the new environment in the destination tenant.

#### Are there any components that aren't fully supported?

Leaern more in [Before you get started](#before-you-get-started) to understand which components are supported and which components aren't supported.

#### What happens to mailbox configurations?

If the mapped user (mentioned in the user mapping file) has a mailbox in the destination tenant, it's automatically configured. Otherwise, manual reconfiguration is required.

#### How do I initiate a migration?

The source tenant’s Dynamics 365 or Power Platform admin must submit a request using PowerShell commands with the environment name, ID, and tenant ID. Refer to the commands above.

#### Is there a self-serve UI option?

No, currently we don't support the Power Platform admin center UI for tenant-to-tenant migration. It can only be done by PowerShell.
