---
title: Tenant-to-tenant migrations 
description: Learn about the impact of migrating an environment from one tenant to another. 
ms.date: 09/19/2024
ms.topic: conceptual
author: matapg007
contributors:
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
The tenant-to-tenant migration feature allows you to transfer an environment from one tenant to another. This feature supports scenarios such as merging multiple tenants into one and facilitating company acquisitions. The environment doesn't actually _move_, but rather is _linked_ to another tenant. The environment still exists but isn't part of the source tenant anymore. It's accessible and managed under the destination tenant. There are no user interface changes or version changes as part of this move.

## Before you get started
Be aware of the following notes before you get started with a tenant-to-tenant migration.

-	**Supported environment types:** Production and sandbox only.
-	**Not supported environment types:** Default, developer, trial, and teams environment types and Government Community Cloud (GCC) to public clouds or vice versa.
-	A Dataverse organization linked to a finance and operations organization cannot be migrated to a different tenant.
-	You might need to reconfigure some applications and settings after tenant-to-tenant migration, such as Microsoft Dynamics 365 for Outlook, server-side sync, SharePoint or others.
-	Components not fully supported include canvas apps, custom pages, Power Automate, Power Apps, Microsoft Copilot Studio, Dynamics 365 Customer voice, Omnichannel for Customer Service, component library.
-	**There are additional steps required for Power Apps, Power Automate, Pages & Copilot studio** called out later in Premigration and post migrations steps.
-	Once users are created and configured, you must [create a mapping file](#create-user-mapping-file), which is described later in this article.
-	If the mapped user has a mailbox in the destination tenant, then the mailbox is automatically configured during the migration. For all other users, you need to reconfigure the mailbox.
  -	If the same mailbox is used in the target tenant, `test@microsoft.com`, then the mailbox is used by default. Before the tenant-to-tenant migration, customers need to migrate and configure their mailboxes on the target tenant.
  -	If you're using the default onmicrosoft domain, `test@sourcecompanyname.onmicrosoft.com`, the post migration domain name is changed 
 to `test@targetcompanyname.onmicrosoft.com`. Customers need to reconfigure the mailbox. To configure the mailbox, see [Connect to Exchange Online](connect-exchange-online.md).

## Prerequisites
Be sure that you complete the following prerequisites before you start the migration process.

-	Create users in the target tenant. You must:
  -	Create users in Microsoft 365 and Microsoft Entra ID.
  -	Assign licenses.
- you must have Power platform admin or dynamics admin privileges to perform migration.
-	The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. Learn more at [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

## Preparation process
Complete the following procedures for Power Automate, Power Apps, Copilot Studio, Power Pages, and Dynamics 365 for Marketing before the migration. You also must create a user mapping file.

### Prepare Power Automate

If your flows are already defined in Dataverse, then no extra work is required. 

Any Power Automate flows that should be migrated need to have their definitions added into Dataverse solutions in the source environment. Learn more about this in [Add an existing cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution). This can be done in bulk by running the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution?view=pa-ps-latest) cmdlet.
      
### Prepare Power Apps
Any Power Apps must be manually exported. We don't support the migration of customer connectors, connections, or gateways. If you have any of these components set up, they must be manually reconfigured after the migration.

#### For solution-aware apps:
1. For apps that are solution aware, go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all apps and solutions. You can export them individually or group them together in a single solution, if they're not already.
1. Delete these solution-aware apps in the environment after exporting them.
2. Apps belonging to managed solutions can only be deleted by deleting the solution.
3. Apps that are in unmanaged solution, can be deleted by “Delete from this environment”	 

    > [!Important]
    > Solution-aware canvas apps, custom pages, or component libraries that you don't delete from an environment before migration won't work after the migration completes.

#### For apps that aren't solution-aware:
1.	Go to [Power Apps](https://make.powerapps.com), and then select **Apps**.
1.	For each app that you want to move, select **More Commands** (…), and then select **Export package (preview)**.
1.	Enter the details required to perform the export of the app, and then select **Export**. Once the export completes, a download begins.

  	  The resulting file contains the app package that was selected.
  	
1.	Repeat these steps until all apps have been exported.
1.	Delete these non-solution aware apps from the environment

An admin can also view/delete Canvas Apps from the list on the admin portal:
1.	Go to https://admin.powerplatform.microsoft.com, and then select the environment.
2.	Under the resources action, click ‘Power Apps’ to view and delete them.


### Prepare Copilot Studio
Any Copilot Studio chatbots must be manually exported. Some dependent components of chatbots must be manually reconfigured during or after the migration. For example, connections, environment variables, and custom connectors must be manually reconfigured during or after the migration.

Chatbots are solution-aware. Go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all chatbot solutions, either individually or group them together in a single solution. Learn more in [Export and import bots using solutions](/microsoft-copilot-studio/authoring-export-import-bots?tabs=webApp).

### Prepare Power Pages 
The following steps must be done for each website in an environment.

1.	Sign in to the environment.
2.	Open the [admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
3.	[Delete](/power-pages/admin/delete-website) the website.

### Prepare Dynamics 365 Marketing
If the Dynamics 365 Marketing app is deployed in the tenant, be sure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Learn more in [Tenant-to-tenant migration for Dynamics 365 Marketing](/dynamics365/customer-insights/journeys/tenant-to-tenant).

### Create user mapping file
Create a user mapping file for the source environment to be transferred to the target environment. It's essential to note that each environment requires an individual mapping file. Be sure that users are present and authorized in both the originating and destination tenants, as this is required for a successful migration. The users' domains may vary between source and target, provided they're active.

1. Create a user mapping file named **usermapping.csv**.

   > [!Note]
   > The file name is case sensative. Make sure records are comma seperated not semicolon.
  
1. Accurately record the details of users, including their source and destination email IDs.Also make sure there are no extra space before and after header. Your mapping file should look to the following example:

    |Source|	Destination|
    |------|-------------|
    |SourceUser@sourcetenant.com	|DestinationUser@targettenant.com|

For full access users:

1. Access the source environment.
2. Use Advanced Find (Screen shot of Advanced Find button.) and look for users.
3. Select Use Saved View > Full Access Users, and then select Edit Columns.
4. Remove all columns except Full Name.
5. Select Add Columns > Windows Live ID.
6. Select OK > Results to see the list of full access users.
7. Select all the records, select Export Users in the ribbon, and then choose Static Worksheet.
8. Follow steps 1-7 above for the destination tenant, if possible. You should now have two separate Excel sheets—one for source and one for target tenant.
9. Open the files for editing.
10. Starting with the source Excel sheet, copy the records under the Windows Live ID column into Notepad. Don't copy the header.
11. Save the Notepad file.
12. Next, enter the destination Windows Live ID (UPNs) in the same Notepad document to the right of the corresponding Source UPN, separating Source and Destination UPNs by a comma (,).
Example:
  user001@source.com, user001@destination.com
  user002@source.com, user002@destination.com
  user003@source.com, user003@destination.com
13. Save the file as a CSV.

For administrative access users:

1. Access the source environment.
2. Use Advanced Find (Screen shot of Advanced Find button.) and look for users.
3. Select Use Saved View > Administrative Access Users, and then select Results to see the list of administrative access users.
4. If you decide not to include any of these users, skip the following steps. Otherwise, to include these users in mapping:
  Find the corresponding users in the destination tenant.
  Make sure a valid Dynamics 365 license is assigned to the destination user in the destination tenant. Note: If the destination user isn't assigned any license, the migration fails.
  Save the CSV file that has both full access users and administrative access users mapped.

## Migration
Before processing with migration make sure you have reviewed and completed the preparetion process. Now you can process to complete the following sections to migrate.

### Install PowerShell for Power Platform administrators (Both Source and Target Admins) 
The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, go to [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md) and [Installing PowerShell for Power Platform Administrators](powershell-installation.md).

Install or update the necessary module by using one of the following commands:

```PowerShell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Update-Module -Name Microsoft.PowerApps.Administration.PowerShell
```

### Install Azure PowerShell on Windows (Both Source and Target Admins)

The Az PowerShell module is a rollup module. Installing the Az PowerShell module downloads the generally available modules and makes their cmdlets available for use. Learn more at [Install Azure PowerShell on Windows](/powershell/azure/install-azps-windows?view=azps-11.6.0&tabs=powershell&pivots=windows-psgallery).

Use the Install-Module cmdlet to install the Az PowerShell module:

```PowerShell
Install-Module -Name Az -Repository PSGallery -Force
```

### Sign into Microsoft Power Platform (Both Source and Target Admins)

Sign into Microsoft Power Platform. This step allows administrators to authenticate and access the Power Platform environment.
```PowerShell
Add-PowerAppsAccount -Endpoint prod
```

### Submit migration request (Source Admin)
To initiate a tenant-to-tenant migration, the source tenant's Dynamics 365 or Power Platform administrator must submit a request to the target tenant using the following command and provide the environment name ID and tenant ID.

You must have Power Platform administrator or Dynamics 365 administrator credentials to complete this step. 

```PowerShell
TenantToTenant-SubmitMigrationRequest –EnvironmentName {EnvironmentId} -TargetTenantID {TenantID}
```
### View and approve migration request (Target Admin)
The admin of the destination tenant should run the following command to see all the migration requests and status. The admin can review all the migration requests and options to approve or reject. 

```PowerShell
Add-PowerAppsAccount -Endpoint prod

TenantToTenant-ViewMigrationRequest - TenantID{Target admin should provide targetTenantID (self) to view list of requests pending for approval}

TenantToTenant-ManageMigrationRequest -RequestId {RequestID from above command to approve or deny}
Enter approval status for RequestId {RequestId} (0 for Reject, 1 for Approve)
```
Once a request is approved, the admin of the destination tenant can notify the admin of the source tenant to proceed with the next step of the migration.

### Generate a shared access signature (SAS) URL (Source Admin)
This step involves creating the SAS URL, which is utilized later for uploading the user mapping file. Execute the following PowerShell command, substituting **EnvironmentId** with the actual environment ID:

```PowerShell
GenerateResourceStorage-PowerAppEnvironment –EnvironmentName {EnvironmentId}
```

#### Sample output

```PowerShell
Code        :
Description :
Headers     :
Error       :
Errors      :
Internal    : @{sharedAccessSignature=https://dynamics.blob.core.windows.net/20240604t000000z73e18df430fe40059290dsddc25d783?sv=2018-03-28&sr=c&si=SASpolicyXXRRRX}
```

### Upload the user mapping file (Source Admin)
The next step involves transferring the user mapping file to the previously established SAS URL. To accomplish this, execute the following commands in Windows PowerShell ISE, ensuring that the parameters **SASUri** and **FileToUpload** contain the appropriate information about your environment. This step is crucial for uploading mapping of the users accurately in the system.

> [!Note]
> The installation of the Az module is required to run the script mentioned. Complete the following steps with Windows PowerShell ISE.

```Windows PowerShell ISE
$SASUri ="Update the SAS Uri from previous step”
$Uri = [System.Uri] $SASUri
 
$storageAccountName = $uri.DnsSafeHost.Split(".")[0]
$container = $uri.LocalPath.Substring(1)
$sasToken = $uri.Query
 
# File to upload
# Please note file name should be usermapping.csv (case sensitive) with comma seperated values.
$fileToUpload = 'C:\filelocation\usermapping.csv'
 
# Create a storage context
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -SasToken $sasToken
 
# Upload the file to Azure Blob Storage
Set-AzStorageBlobContent -File $fileToUpload -Container $container -Context $storageContext -Force
```

### Prepare the environment migration (Source Admin)
The following step involves conducting comprehensive validations to ensure that every user listed in the user mapping file is verified and currently active within the target tenant. 

```PowerShell
TenantToTenant-PrepareMigration 
-EnvironmentName {EnvironmentId} 
-TargetTenantId {TargetTenantId} 
-ReadOnlyUserMappingFileContainerUri {SasUri}
```

> [!Note]
> While passing the **SASUri** value, you must provide the parameter as below:
> `**https://dynamics.blob.core.windows.net/20240604t000000z73e18df430fe40059290dsddc25d783**`

#### Sample output

```PowerShell
Code        : 202
Description : Accepted
```
This step's duration varies depending on the number of users in the user mapping file. You can monitor the progress of this step by using the **TenantToTenant-GetStatus** command, provided below.

### Check status
```PowerShell
TenantToTenant-GetStatus -EnvironmentName {EnvironmentId}
```
#### Sample output
•	Validate Tenant To Tenant Migration: Running 
•	Validate Tenant To Tenant Migration: Succeeded
•	Validation Failed, Errors are updated on the blob here: SASURI

### Error and how to resolve them 
- **The User mapping file provided for Tenant To Tenant migration is invalid**. Please check if the usermapping file name is correct and usermapping file is comma seperated.
- Line '{line numbers}' have the same '{emailID}'--- Please make sure we do not have any duplicate entries.
- Invalid Email Format '{emailid}' -- Make sure email format is correct testuser@tenantdomain.com
- Target on line '{linenumber}' is same as source emailId. -- Make sure Destination Email is different from Source Email
- Each line must have exactly two columns: '{line numbers}' -- Make sure each row has only 2 columns source and destination remove extra comma if any

  After fixing user mapping errors you need to reupload the usermapping file using same SAS URI.
  
### Download the error report
If there are any errors in the user mapping, there's an option to download the error report. This can be done by using the following commands that use the SAS URI from the previous step and the desired location to download the error report.

Complete the following steps with Windows PowerShell ISE.

Import the required module

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
Fix the issues in the user mapping file.
Re-upload the file using the same or new SAS URL.

After successfully completing Prepare the environment migration setps now you may proceed with next step to migrate environment.Next step you can perform within next 7 days and after that you may have to start with "Prepare the environment migration"

## Migrate the environment

```PowerShell
TenantToTenant-MigratePowerAppEnvironment
-EnvironmentName {EnvironmentId}
-TargetTenantId {TargetTenantId}
```
### Get status 

```PowerShell
TenantToTenant-GetStatus -EnvironmentName {EnvironmentId}
```

#### Sample output

•	Migrate Environment: Running
•	Migrate Environment: Succeeded

## Post-migration process
After moving environments to another tenant:

-	The environment URL, organization ID (OrgID), and the name don't change.
-	The source environment will not have Dataverse.
-	Users not included in the mapping file won't be migrated and mapped post-migration.

Complete the following procedures for Power Automate, Power Apps, Copilot Studio, Power Pages, and Dynamics 365 Marketing after the migration.

### Post-migration process for Power Automate
After the migration has completed, step through the **Review components** section as a checklist to get flows and other components adjusted and activated. Key steps:
    1. Create connections for all connection references.
    1. Start all flows, including starting child flows before parent flows.
    1. For any HTTP triggered flows, retrieve the new URL and place it in any calling apps or flows to refresh those references.

### Post-migration process for Power Apps

#### For solution aware apps:
1. Select the new environment from [Power Apps](https://make.powerapps.com) and navigate to the **Solutions** page.
1. Select **Import** and use the file selector to select the packages exported from the above step.
1. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

#### For apps that aren't solution-aware:
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

### Post-migration process for Dynamics 365 Marketing:
If the Dynamics 365 Marketing app is deployed in the tenant, ensure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Learn more at [Tenant-to-tenant migration for Dynamics 365 Marketing](/dynamics365/customer-insights/journeys/tenant-to-tenant).

### Frequently asked questions
**Are background operations enabled during tenant-to-tenant migration?**
Administration mode is enabled during tenant-to-tenant migration, therefore background operations don't run. Go to: Administration mode - Power Platform

**Can we migrate all users of the Dataverse organization?**
We can migrate all users of the Dataverse organization only if users exist in the destination tenant. For example:

user001@source.com, user001@destination.com
user002@source.com, user002@destination.com
