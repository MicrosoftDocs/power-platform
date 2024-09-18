---
title: Tenant-to-tenant migrations 
description: Learn about the impact of migrating an environment from one tenant to another. 
ms.date: 09/18/2024
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
The tenant-to-tenant migration feature allows you to transfer an environment from one tenant to another. This feature supports scenarios such as merging multiple tenants into one and facilitating company acquisitions. The environment doesn't actually _move_, but rather is _linked_ to another tenant. The environment still exists but is not part of the source tenant anymore. It is accessible and managed under the destination tenant. There is no user interface changes or version changes as part of this move.

## Before you get started
Be aware of the following notes before you get started with a tenant-to-tenant migration.

-	**Supported environment types:** Production and sandbox only.
-	**Not Supported:** Default, developer, trial, and teams environment types and Government Community Cloud (GCC) to public clouds or vice versa.
-	Components not fully supported include canvas apps, custom pages, Power Automate, Power Apps, Microsoft Copilot Studio, Dynamics 365 Customer voice, Omnichannel for Customer Service, component library, Power Apps Checker App, and Café X.
-	Once users are created and configured, you must generate a mapping file, which is described later in this article.
-	If the mapped user has a mailbox in the destination tenant, then the mailbox is automatically configured during the migration. For all other users, you'll need to reconfigure the mailbox.
  -	If the same mailbox is used in the target tenant, `test@microsoft.com`, then the mailbox is used by default. Before the tenant-to-tenant migration, customers need to migrate and configure their mailboxes on the target tenant.
  -	If you're using the default onmicrosoft domain, `test@sourcecompanyname.onmicrosoft.com`, the post migration domain name is changed 
 to `test@targetcompanyname.onmicrosoft.com`. Customers need to reconfigure the mailbox. To configure the mailbox, see [Connect to Exchange Online](connect-exchange-online.md).

## Prerequisites
Be sure that you complete the following prerequisites before you start the migration process.

-	Create users in the target tenant. You must:
  -	Create users in Microsoft 365 and Microsoft Entra ID.
  -	Assign licenses.
-	If Lockbox is turned on in the source tenant, be prepared to approve a Lockbox request at the start of the tenant-to-tenant operation.
-	The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. Learn more at [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md).

## Pre-migration process
Complete the following procedures for Power Automate, Power Apps, Copilot Studio, Power Pages, and Dynamics 365 for Marketing before the migration. You also must generate a mapping file.

### Power Automate

If your flows are already defined in Dataverse, then no additional work is required. 

Any Power Automate flows that should be migrated need to have their definitions added in Dataverse in the source environment. Learn more about this in [Add an existing cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution). This can be done in bulk by running the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution?view=pa-ps-latest) cmdlet.
      
### Power Apps
Any Power Apps must be manually exported. We don't support the migration of customer connectors, connections, or gateways. If you have any of these components set up, they must be manually reconfigured after the migration.

#### For solution-aware apps:
1. For apps that are solution aware, go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all apps and solutions. You can export them individually or group them together in a single solution, if they're not already.
1. Delete these solution-aware apps in the environment after exporting them.

    > [!Important]
    > Solution-aware canvas apps, custom pages, or component libraries that you don't delete from an environment before migration won't work after the migration completes.

#### For apps that aren't solution-aware:
1.	Go to [Power Apps](https://make.powerapps.com), and then select **Apps**.
1.	For each app that you want to move, select **More Commands** (…), and then select **Export package (preview)**.
1.	Enter the details required to perform the export of the app, and then select **Export**. Once the export completes, a download begins.

  	  The resulting file contains the app package that was selected.
  	
1.	Repeat these steps until all apps have been exported.

### Copilot Studio
Any Copilot Studio chatbots must be manually exported. Some dependent components of chatbots must be manually reconfigured during or after the migration. For example, connections, environment variables, and custom connectors must be manually reconfigured during or after the migration.

Chatbots are solution-aware. Go to [Power Apps](https://make.powerapps.com), navigate to the **Solutions** page, and export all chatbot solutions, either individually or group them together in a single solution. Learn more in [Export and import bots using solutions](/microsoft-copilot-studio/authoring-export-import-bots?tabs=webApp).

### Power Pages 
The following steps must be done for each website in an environment.

1.	Sign in to the environment.
2.	Open the [Power Apps Portals admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
3.	[Delete](/power-pages/admin/delete-website) the website.

### Dynamics 365 Marketing:
If the Dynamics 365 Marketing app is deployed in the tenant, be sure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Learn more in [Tenant-to-tenant migration for Dynamics 365 Marketing](/dynamics365/customer-insights/journeys/tenant-to-tenant).

### Create user mapping file
Create a user mapping file for the source environment to be transferred to the target environment. It's essential to note that each environment requires an individual mapping file. Be sure that users are present and authorized in both the originating and destination tenants, as this is required for a successful migration. The users' domains may vary between source and target, provided they are active.

1. Create a user mapping file named **usermapping.csv**.

   > [!Note]
   > The file name is case sensative.
  
1. Accurately record the details of users, including their source and destination email IDs. Your mapping file should look to the following example:

    |Source|	Destination|
    |------|-------------|
    |SourceUser@sourcetenant.com	|DestinationUser@targettenant.com|

## Migration
Install necessary PowerShell modules.

### Install PowerShell for Power Platform administrators
The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, see [Get started with PowerShell for Power Platform Administrators](powershell-getting-started.md) and [Installing PowerShell for Power Platform Administrators](powershell-installation.md).

Import or update the necessary module by using one of the following commands:

```PowerShell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Update-Module -Name Microsoft.PowerApps.Administration.PowerShell
```

#### Install Azure PowerShell on Windows

The Az PowerShell module is a rollup module. Installing the Az PowerShell module downloads the generally available modules and makes their cmdlets available for use. Learn more at [Install Azure PowerShell on Windows](/powershell/azure/install-azps-windows?view=azps-11.6.0&tabs=powershell&pivots=windows-psgallery).

Use the Install-Module cmdlet to install the Az PowerShell module:

```PowerShell
Install-Module -Name Az -Repository PSGallery -Force
```

#### Submit Migration request
To initiate a tenant-to-tenant migration, the source tenant's D365 or Power platform administrator must submit request to target tenant using below command and provide environment name ID and tenant ID.

You must have Power Platform Administrator or Dynamics 365 Administrator) enter credential of source user who is running the step. 

```PowerShell
TenantToTenant-SubmitMigrationRequest –EnvironmentName {EnvironmentId} -TargetTenantID {TenantID}
```

Destination tenant admin should run below command to see all the migration request and status. They can review all the migration requests and options to approve or reject. 

Once request is approved, they can notify source admin to proceed with the next step of migration.

```PowerShell
TenantToTenant-ApproveMigration 
Enter the sourceEnvironmentId you want to approve:
```

#### Generate SAS URL
This initial step involves creating the SAS URI, which will be utilized later for uploading the user mapping file. Execute the following PowerShell command, substituting {EnvironmentId} with the actual environment ID:

```PowerShell
GenerateResourceStorage-PowerAppEnvironment –EnvironmentName {EnvironmentId}
```

##### Sample output

```PowerShell
Code        :
Description :
Headers     :
Error       :
Errors      :
Internal    : @{sharedAccessSignature=https://dynamics.blob.core.windows.net/20240604t000000z73e18df430fe40059290dsddc25d783?sv=2018-03-28&sr=c&si=SASpolicyXXRRRX}
```

#### Upload the user mapping file 
The next step involves transferring the user mapping file to the previously established SAS URL. To accomplish this, execute the following commands in Windows PowerShell ISE, ensuring that the parameters 'SASUri' and 'FileToUpload' are correctly highlighted. This step is crucial for uploading mapping of the users accurately in the system.

> [!Note]
> The installation of the Az module is required to run the script mentioned in the preparation for migration step.

```PowerShell
$SASUri ="Update the SAS Uri from previous step”
$Uri = [System.Uri] $SASUri
 
$storageAccountName = $uri.DnsSafeHost.Split(".")[0]
$container = $uri.LocalPath.Substring(1)
$sasToken = $uri.Query
 
# File to upload
$fileToUpload = 'C:\filelocation\usermapping.csv'
 
# Create a storage context
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -SasToken $sasToken
 
# Upload the file to Azure Blob Storage
Set-AzStorageBlobContent -File $fileToUpload -Container $container -Context $storageContext -Force
```

#### Prepare the environment migration
The subsequent step involves conducting comprehensive validations to ensure that every user listed in the user mapping file is verified and currently active within the target tenant. 

```PowerShell
TenantToTenant-PrepareMigration 
-EnvironmentName {EnvironmentId} 
-TargetTenantId {TargetTenantId} 
-ReadOnlyUserMappingFileContainerUri {SasUri}
```

> [!Note]
> While passing SASUri value you need to provide until container name as below:
> https://dynamics.blob.core.windows.net/20240604t000000z73e18df430fe40059290dsddc25d783?

##### Sample output

```PowerShell
Code        : 202
Description : Accepted
```

This step's duration will vary depending on the number of users in the user mapping file. You can monitor the progress of this step by using the “TenantToTenant-GetStatus” command provided below.

```PowerShell
TenantToTenant-GetStatus -EnvironmentName {EnvironmentId}
```

###### Sample output
•	Validate Tenant To Tenant Migration: Running 
•	Validate Tenant To Tenant Migration: Succeeded
•	Validation Failed, Errors are updated on the blob here: SASURI

Once you have successfully completed this step, move on to the next one to initiate the migration process. If there are any errors in the user mapping, there is an option to download the error report. This can be done by using the command provided below, using the SAS URI from the previous step and the desired location to download failure report.

Complete the following steps with Windows PowerShell ISE.

1. Import the required module

```PowerShell
Import-Module Az.Storage
```
    
1. Define the SAS URI of the blob

```PowerShell
$sasUri = " Update the SAS Uri from previous step "
```

1. Define the path where the blob will be downloaded

```PowerShell
$destinationPath = "C:\Downloads\Failed\"
```
 
1. Split the SAS URI on the '?' character to separate the URL and the SAS token

```PowerShell
$url, $sasToken = $sasUri -split '\?', 2
```

1. Extract the container name from the URL

```PowerShell
$containerName = $url.Split('/')[3]
```
1. Extract the storage account name from the URL

```PowerShell
$storageAccountName = $url.Split('/')[2].Split('.')[0]
```
1. Create a context for the storage account

```PowerShell
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -SasToken $sasToken
```
 
1. Download the blob

```PowerShell
Get-AzStorageBlobContent -Blob "usermapping.csv" -Container $containerName -Destination $destinationPath -Context $storageContext 
```

## Migrate the environment

```PowerShell
TenantToTenant-MigratePowerAppEnvironment
-EnvironmentName {EnvironmentId}
-TargetTenantId {TargetTenantId}
-GuestAdminUserEmail {Guest User in Target Tenant}
```

### Get status 

```PowerShell
TenantToTenant-GetStatus -EnvironmentName {EnvironmentId}
```


### Sample output

•	Migrate Environment: Running
•	Migrate Environment: Succeeded

## Post-migration
After moving environments to another tenant:

-	The environment URL, organization ID (OrgID), and the name don't change.
-	The source environment won't be accessible.
-	Users not included in the mapping file won't be migrated and mapped post migration.

Do the following steps for Power Apps, Power Automate, Power Virtual Agents, Power Apps Portals, and Marketing after the migration.


### For Power Automate:
1. After the copy has completed, step through the Review components section as a checklist to get flows and other components adjusted and activated. Key steps:
    1. Create connections for all connection references
    1. Start all flows, including starting child flows before parent flows
    1. For any HTTP triggered flows, retrieve the new URL, and place it in any calling apps or flows to refresh those references.
1. Note that if flows in the source environment were left on, then they should be turned off as flows in the target environment are turned on.

### For Power Apps:

For solution aware apps:
1. Select the new environment from https://make.powerapps.com/ and navigate to the Solutions page.
1. Select Import and use the file selector to pick the packages exported from the above steps.
1. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

For non-solution aware apps:
1. Go to https://make.powerapps.com.
1. Select the new environment from the environment picker in the upper-right.
1. Select Apps.
1. Select Import canvas app.
1. Upload the app package file.
1. Complete all of the import option selections, and then select Import.
1. Repeat these steps until all apps have been imported.

### For Power Virtual Agents:
1. Select the new environment from https://make.powerapps.com/ and navigate to the Solutions page.
1. Select Import and use the file selector to pick the packages exported from the above steps.
1. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

### For Power Apps Portals (must be done for each portal in the environment(s)):
1. Sign in to the environment.
1. Open the Power Apps Portals admin center.
1. Provision the portal with the same portal type and language.

### For Dynamics 365 Marketing:
If the Marketing app is deployed in the tenant, ensure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Go to: Tenant-to-tenant migration for Dynamics 365 Marketing.


