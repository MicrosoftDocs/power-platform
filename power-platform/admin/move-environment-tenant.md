---
title: Tenant-to-tenant migrations 
description: Learn about the impact of migrating an environment from one tenant to another. 
ms.date: 02/13/2026
ms.topic: concept-article
author: gakulka 
contributors:
  - SatishKumarkannanMs
  - val-bc 
  - brsova
  - ImadYanni
  - bevans 
  - LaurentPepin 
ms.contributors:
  - ralinga
  - gakulka
ms.subservice: admin
ms.author: gakulka
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Tenant-to-tenant migrations
The tenant-to-tenant migration feature allows you to transfer an environment from one tenant to another. This feature supports scenarios such as merging multiple tenants into one and facilitating company acquisitions. The environment doesn't actually _move_, but rather is _linked_ to another tenant. The environment still exists but isn't part of the source tenant anymore. It's accessible and managed under the destination tenant. There are no user interface changes or version changes as part of this move.

## Before you get started
Be aware of the following considerations before starting a tenant-to-tenant migration.

> [!NOTE]
> Tenant-to-tenant migrations will support Managed Environments in the future.

* **Supported environment types**: Only production and sandbox environments are supported.
* **Unsupported environment types**: Default, developer, trial, and Teams environments aren't supported. Government Community Cloud (GCC) to public clouds and vice versa are also not supported.
* The following components aren't supported: Dynamics 365 Customer Voice, Omnichannel for Customer Service, component library, Dynamics 365 Customer Insights - Journeys, and Dynamics 365 Customer Insights - Data.
* Specific steps required for Power Apps, Power Automate, Power Pages, and Microsoft Copilot Studio are called out in the premigration and post-migration steps.
* A Dataverse organization linked to a finance and operations organization can't be migrated to a different tenant.
* You might need to reconfigure some applications and settings after tenant-to-tenant migration, such as Dynamics 365 for Outlook, server-side sync, SharePoint, and others.
* Once you create and configure users, you must [create a user mapping file](#create-a-user-mapping-file), which is described later in this article.
* If the mapped user has a mailbox in the destination tenant, then the mailbox is automatically configured during the migration. For all other users, you need to reconfigure the mailbox.
  * If the same mailbox is used in the target tenant, `test@microsoft.com`, then the mailbox is used by default. Before the tenant-to-tenant migration, customers need to migrate and configure their mailboxes on the target tenant.
  * If you're using the default onmicrosoft domain, `test@sourcecompanyname.onmicrosoft.com`, the post-migration domain name is changed to `test@targetcompanyname.onmicrosoft.com`. Customers need to reconfigure the mailbox. For more information about configuring the mailbox, see [Connect to Exchange Online](connect-exchange-online.md).

## Prerequisites
Complete the following prerequisites before you start the migration process:

* Create users in the target tenant, including:
  * Create users in Microsoft 365 and Microsoft Entra ID.
  * Assign licenses.
* You must have admin privileges with Power Platform or Dynamics 365 to perform the migration.
* The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For more information, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

## Preparation process
Complete the following procedures for Power Automate, Power Apps, Copilot Studio, and Power Pages before the migration. You also must create a user-mapping file.

### Prepare Power Automate

If you already defined your flows in Dataverse, then no extra work is required. 

Add the definitions of any Power Automate flows that you want to migrate into Dataverse solutions in the source environment. For more information, see [Add an existing cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution). You can run the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution?view=pa-ps-latest&preserve-view=true) cmdlet to add these definitions in bulk.
      
### Prepare Power Apps
Any Power Apps must be manually exported. We don't support the migration of customer connectors, connections, or gateways. If you have any of these components set up, they must be manually reconfigured after the migration.

#### For solution-aware apps
1. For solution-aware apps, go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all apps and solutions. You can export them individually or group them together in a single solution, if they're not already.
1. Delete these solution-aware apps in the environment after exporting them.
1. You can only delete apps belonging to managed solutions by deleting the solution.
1. You can delete apps that are in an unmanaged solution by using the **Delete from this environment** option.	 

    > [!Important]
    > If you don't delete solution-aware canvas apps, custom pages, or component libraries from an environment before migration, they won't work after migration.

#### For apps that aren't solution aware
1.	Go to [Power Apps](https://make.powerapps.com), and then select **Apps**.
1.	For each app that you want to move, select **More Commands** and then select **Export package (preview)**.
1.	Enter the details required to perform the export of the app, and then select **Export**. Once the export completes, a download begins.

  	  The resulting file contains the app package that you selected.
  	
1.	Repeat these steps until you export all apps.
1.	Delete these nonsolution-aware apps from the environment.

An admin can also view or delete canvas apps from the list in the admin portal by completing the following steps:

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and then select the environment from **Manage**.
1.	Under the **Resources** action, select **Power Apps** to view and delete them.

### Prepare Copilot Studio
You must manually export any Copilot Studio chatbots. You must also manually reconfigure some dependent components of chatbots during or after the migration. For example, you must manually reconfigure connections, environment variables, and custom connectors during or after the migration.

Chatbots are solution aware. Go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all chatbot solutions, either individually or grouped together in a single solution. For more information, see [Export and import bots using solutions](/microsoft-copilot-studio/authoring-export-import-bots?tabs=webApp).

### Prepare Power Pages 
Complete the following steps for each website in an environment:

1.	Sign in to the environment.
1.	Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
1.	[Delete](/power-pages/admin/delete-website) the website.

### Create a user-mapping file
Create a user-mapping file for the source environment to transfer to the target environment. Each environment requires an individual mapping file. Make sure users are present and authorized in both the originating and destination tenants for a successful migration. The users' domains can vary between source and target, as long as they're active.

1. Create a user-mapping file named **usermapping.csv**.

   > [!NOTE]
   > The file name is case sensitive. Make sure records are separated by a comma, not a semicolon.
  
1. Accurately record the details of users, including their source and destination email IDs. Make sure there are no extra spaces before and after the header. Your mapping file should look like the following example:

    |Source|Destination|
    |------|-------------|
    |`SourceUser@sourcetenant.com`	|`DestinationUser@targettenant.com`|

#### For full access users

1. Sign in to the source environment.
1. Use **Advanced Find** to look for users.
1. Select **Use Saved View** > **Full Access Users**, and then select **Edit Columns**.
1. Remove all columns except the **Full Name** column.
1. Select **Add Columns** > **Windows Live ID**.
1. Select **OK** > **Results** to see the list of full access users.
1. Select all the records, select **Export Users** in the ribbon, and then choose **Static Worksheet**.
1. Follow steps 1-7 for the destination tenant, if possible. You should now have two separate Excel sheets: one for the source and one for the target tenant.
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

1. Sign in to the source environment.
1. Use **Advanced Find** to look for users.
1. Select **Use Saved View** > **Administrative Access Users**, and then select **Results** to see the list of administrative access users.
1. If you decide not to include any of these users, skip the following steps. Otherwise, to include these users in the mapping file, do the following steps:
    1. Find the corresponding users in the destination tenant.
    1. Make sure a valid license is assigned to the destination user in the destination tenant.
       > [!NOTE]
       >  If the destination user isn't assigned any license, the migration fails.
    
    1. Save the CSV file that has both full access users and administrative access users mapped.


## Migrate using Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. 
1. In the **Environments** page, select the environment that you want to move. Tenant-to-tenant moves support sandbox and production environments with Dataverse.
1. In the command bar, select **Move environment**. The **Request tenant to tenant move** pane appears.
1. Enter the destination tenant ID in the **Target tenant ID** box and select **Submit request**.

    The destination tenant receives the migration request for approval. A pending request banner appears on the **Environments** page.

### Migration requests list
Notification banners appear at the top of the **Environments** page when:

- You have a [request to approve as a destination tenant](#request-to-approve-as-destination-tenant).
- You submitted a [request to review as a source tenant](#request-to-review-as-source-tenant).

#### Request to approve as destination tenant

1. Select **Review moves** on the banner.
1. A panel opens with a list of migration requests to review for approval.

    You can search for a migration request by using the environment ID or request status.

1. Select the environment ID to approve or reject the request.
1. Review the request and approve or reject it.

> [!NOTE]
> Requests expire after seven days.

#### Request to review as source tenant

1. Select **Review moves** on the banner.
1. A panel opens with a list of migration requests you submitted.

    You can search for a migration request by using the environment ID or request status.

### Migration preparation after approval

After the migration request is approved, a banner with the **Begin move** button appears on the environment's details page.

:::image type="content" source="media/move-environment-tenant/beginmovebanner.jpg" alt-text="Screenshot of the environment's details page with green approval banner, Begin move and Cancel move buttons.":::

1. Select **Begin move** to open the **Get ready for this tenant-to-tenant move** panel, which displays the pre-move steps. The **Move environment** button in the command bar also opens this panel.

    :::image type="content" source="media/move-environment-tenant/prevaldationmovepanel.jpg" alt-text="Screenshot of the Get ready for this tenant-to-tenant move pane showing pre-move steps.":::

1. Upload the user-mapping file for validation. The file must be named **usermapping.csv**.
1. After you upload the file, select **Validate**. This action triggers a validation lifecycle operation. Wait until the operation is complete.

#### When validation fails

If the validation operation fails, a banner with a **Download errors** button appears. Download the error file, fix the issues in the user-mapping file, and revalidate by using the steps mentioned earlier.

:::image type="content" source="media/move-environment-tenant/downloadusermappingerrfile.jpg" alt-text="Screenshot of the Environments page showing error banner with Download errors button.":::

#### When validation succeeds

After validation succeeds, a banner with the **Move environment** button appears on the environment's details page.

1. Select **Move environment** to open the **Move this environment to another tenant** panel. You can revalidate by using a new user mapping file.
1. Review the pre-move steps and select the check box to confirm that you completed the pre-move steps.

    :::image type="content" source="media/move-environment-tenant/postvalidationmovepanel.jpg" alt-text="Screenshot of the move environment panel showing target tenant ID, user mapping upload, pre-move steps checkbox, and Move environment button.":::

1. Select **Move environment** to move the environment. This action triggers the move environment lifecycle operation. Wait until the operation is complete.

### Move completion

After the move operation completes:

TEST

- The process moves the Dataverse organization from the source tenant to the destination tenant.
- The source tenant keeps the environment but without the Dataverse organization.
- The process creates a new environment in the destination tenant with the same name as the source environment and includes the moved Dataverse organization.

### Cancel move
You can cancel the move at any time between submitting the request and completing the environment move. Select the **Cancel move** button on the banner to open the **Cancel move** dialog and cancel the move.

## Migrate using PowerShell
Before proceeding with the migration, make sure you review and complete the preparation process. After you complete the preparation process, follow the steps in the following sections to migrate.

### Install PowerShell for Power Platform Administrators (both source and target admins) 
The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md) and [Installing PowerShell for Power Platform Administrators](powershell-installation.md).

Install or update the necessary module by using one of the following commands:

```PowerShell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Update-Module -Name Microsoft.PowerApps.Administration.PowerShell
```

### Install Azure PowerShell on Windows (both source and target admins)

The Azure PowerShell module is a rollup module. When you install the Azure PowerShell module, it downloads the generally available modules and makes their cmdlets available for use. For more information, see [Install Azure PowerShell on Windows](/powershell/azure/install-azps-windows?view=azps-11.6.0&tabs=powershell&pivots=windows-psgallery&preserve-view=true).

Use the Install-Module cmdlet to install the Azure PowerShell module:

```PowerShell
Install-Module -Name Az -Repository PSGallery -Force
```

### Sign in to Microsoft Power Platform (both source and target admins)

Sign in to Microsoft Power Platform. By signing in, administrators can authenticate and access the Power Platform environment.

```PowerShell
Add-PowerAppsAccount
```

### Submit migration request (source admin)
To start a tenant-to-tenant migration, the source tenant's Dynamics 365 or Power Platform administrator must submit a request to the target tenant. Use the following command and provide the environment name ID and tenant ID.

You must have Power Platform administrator or Dynamics 365 administrator credentials to complete this step. 

```PowerShell
TenantToTenant-SubmitMigrationRequest –EnvironmentName {EnvironmentId} -TargetTenantID {TenantID}
```
To view the status and MigrationID, use the following command:

```PowerShell
TenantToTenant-ViewMigrationRequest
```
> [!NOTE]
> Record the MigrationID, which you use in further migration commands.
> Source Tenant MigrationID is different from Destination Tenant MigrationID.

### View and approve migration request (target admin)
The admin of the destination tenant runs the following command to see all the migration requests and their status. The admin can review all the migration requests and choose to approve or reject them. 

```PowerShell
Add-PowerAppsAccount

TenantToTenant-ViewApprovalRequest

TenantToTenant-ManageMigrationRequest -MigrationId {MigrationId from above command to approve or deny}
```
Once the admin approves a request, they can notify the admin of the source tenant to proceed with the next step of the migration.

### Upload the user-mapping file (source admin)
This step creates the SAS URL. You use this URL later to upload the user-mapping file. Run the following PowerShell command, replacing **EnvironmentId** with the actual environment ID and **FileLocation** with the actual file location.

> [!NOTE]
> When you pass the **FileLocation** value, you must include the usermapping file name (usermapping.csv) in the parameter:
> `C:\Filelocation\usermapping.csv`.

```PowerShell
TenantToTenant-UploadUserMappingFile –EnvironmentName {EnvironmentId} -UserMappingFilePath {FileLocation}
```

Copy the value of the **Read Only UserMapping File ContainerUri** returned by the command. Use this SAS URI as the **-ReadOnlyUserMappingFileContainerUri** parameter in the **TenantToTenant-PrepareMigration** command.

### Prepare the environment migration (source admin)
This step runs comprehensive validations to ensure that every user listed in the user-mapping file is verified and currently active in the target tenant. 

You can view MigrationId by using the "TenantToTenant-ViewMigrationRequest" command in the source tenant.

```PowerShell
TenantToTenant-PrepareMigration 
-MigrationId {MigrationId} 
-TargetTenantId {TargetTenantId} 
-ReadOnlyUserMappingFileContainerUri {SasUri}
```

> [!NOTE]
> Provide the **SASUri** value from the output of the **TenantToTenant-UploadUserMappingFile** command.

#### Sample output

```PowerShell
Code        : 202
Description : Accepted
```
The duration of this step varies depending on the number of users in the user-mapping file. You can monitor the progress of this step by using the **TenantToTenant-GetStatus** command, provided in the following section.

### Check status (source admin)

```PowerShell
TenantToTenant-GetMigrationStatus -MigrationId {MigrationId}
```

#### Sample output
-	Validate Tenant To Tenant Migration: Running 
-	Validate Tenant To Tenant Migration: Succeeded
-	Validation Failed, Errors are updated on the blob here: SASURI

### Errors and how to resolve them 
- If you receive an error that says, **The User mapping file provided for Tenant To Tenant migration is invalid**, check if the user-mapping file name is correct and that the user-mapping file has a comma to separate values.
- **Line '{line numbers}' have the same '{email ID}'**: Make sure there aren't any duplicate entries.
- **Invalid Email Format '{email ID}'**: Make sure the email format is correct for `testuser@tenantdomain.com`.
- **Target on line '{line number}' is same as source email ID**: Make sure the **Destination Email** is different from the **Source Email**.
- **Each line must have exactly two columns: '{line numbers}'**: Make sure each row has only two columns: the source and destination columns. Remove any extra commas.

After fixing user-mapping errors, reupload the user-mapping file by using the same SAS URI.
  
### Download the error report (source admin)
If the user-mapping file contains errors, you can download an error report. To do this, directly copy and paste the **SasUrl** provided in the **Tenant-To-Tenant-GetMigrationStatus** command to your internet browser. Or, use the following commands that use the SAS URI from the previous step to check status and the desired location to download the error report.

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
1. Fix the issues in the user-mapping file.
1. Reupload the file by using the steps in [Upload the user mapping file (source admin)](#upload-the-user-mapping-file-source-admin).

After you successfully complete the [Prepare the environment migration (source admin)](#prepare-the-environment-migration-source-admin), you can continue with the [Migrate the environment (source admin)](#migrate-the-environment-source-admin) procedure to migrate the environment. Perform the migration within the next seven days. If you don't complete the migration in the next seven days, you must start the [Prepare the environment migration (source admin)](#prepare-the-environment-migration-source-admin) procedure again.

## Migrate the environment (source admin)
Use the **TenantToTenant-ViewMigrationRequest** command in the source tenant to view the **MigrationId**.

```PowerShell
TenantToTenant-MigratePowerAppEnvironment
-MigrationId {MigrationId}
-TargetTenantId {TargetTenantId}
```
### Get status (source admin)

```PowerShell
TenantToTenant-GetMigrationStatus -MigrationId {MigrationId}
```

#### Sample output

-	Migrate Environment: Running
-	Migrate Environment: Succeeded

> [!NOTE]
> If you encounter any problems running the preceding commands, [submit a support request](get-help-support.md) for help.

## Post-migration process
After moving environments to another tenant:

-	The environment URL, organization ID (OrgID), and the name stay the same.
-	The source environment doesn't include Dataverse.
-	Users not in the mapping file aren't migrated or mapped after migration.

Complete the following procedures for Power Automate, Power Apps, Copilot Studio, and Power Pages.

### Post-migration process for Power Automate

After the migration finishes, review the imported components and perform the following steps to ensure flows and other assets work correctly:

1. Create or map connections for all connection references.
    - Open the solution in the target environment.
    - Go to the connection references and reauthenticate or link each one to an existing connection.
1. Enable all flows.
    - Imported flows are turned off by default.
    - Start any child flows before enabling parent flows that call them to avoid errors.
1. Update HTTP trigger URLs.
    - HTTP-triggered flows generate a new URL after import.
    - Update any calling apps, parent flows, or external systems to use the new URL.

### Post-migration process for Power Apps

#### For solution-aware apps
1. Select the new environment from [Power Apps](https://make.powerapps.com) and go to the **Solutions** page.
1. Select **Import** and use the file selector to select the packages exported from the preceding step.
1. Confirm that the import was successful by checking the solution contents of the migrated environment.

#### For apps that aren't solution aware
1. Go to [Power Apps](https://make.powerapps.com).
1. Select the new environment from the environment dropdown list.
1. Select **Apps**.
1. Select **Import canvas app**.
1. Upload the app package file.
1. Complete all of the import option selections, and then select **Import**.
1. Repeat these steps until all apps are imported.

### Post-migration process for Copilot Studio
1. Select the new environment from [Power Apps](https://make.powerapps.com) and go to the **Solutions** page.
1. Select **Import** and use the file selector to select the packages exported from the preceding step.
1. Confirm that the import was successful by checking the solution contents of the migrated environment.

### Post-migration process for Power Pages 
Complete the following steps for each website in the environment.

1. Sign in to the environment.
1. Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
1. Provision the website with the same portal type and language.

After you complete all of the preceding steps and the migration, you can validate the environment in the target tenant. Later, you can delete the source environment in the Power Platform admin center.

### Frequently asked questions

#### Are background operations enabled during tenant-to-tenant migration?

Background operations don't run during tenant-to-tenant migration because administration mode is enabled. For more information, see [Administration mode](admin-mode.md).

#### Can all users of the Dataverse organization be migrated?

You can migrate all users of the Dataverse organization only if the users exist in the destination tenant. For example:

`user001@source.com`, `user001@destination.com`

`user002@source.com`, `user002@destination.com`

#### What environments are supported for migration?

Only production and sandbox environments are supported. Default, developer, trial, and Teams environments aren't supported.

#### Will the environment physically move to the new tenant?

No. The environment remains in place, but the Dataverse organization moves to the destination tenant. It's no longer part of the source tenant and is managed under the new environment in the destination tenant. Data that is stored in Dataverse is still stored in the environment in your tenant. You should delete the orphan environment when the tenant-to-tenant move is completed and it's confirmed that the data is no longer needed in the source tenant.
#### Are there any components that aren't fully supported?

For more information about which components are supported and which components aren't supported, see [Before you get started](#before-you-get-started).

#### What happens to mailbox configurations?

If the mapped user (mentioned in the user-mapping file) has a mailbox in the destination tenant, it's automatically configured. Otherwise, manual reconfiguration is required.

#### How do I initiate a migration?

The source tenant’s Dynamics 365 or Power Platform admin must submit a request by using PowerShell commands with the environment name, ID, and tenant ID. Refer to the commands earlier in this article.

#### Is there a self-serve UI option?
Yes. After the `TenantToTenant-SubmitMigrationRequest –EnvironmentName {EnvironmentId} -TargetTenantID {TenantID}` is approved in the target tenant, a UI option to move the environment is available in the environment page.







