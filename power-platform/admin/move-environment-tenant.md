---
title: "Migrate an environment to a different tenant"
description: "Learn about the impact of moving an environment from one tenant to another. Review the prerequisites and considerations before submitting a request." 
ms.custom: ""
ms.date: 11/29/2021
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: ""
ms.assetid: 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Tenant to tenant migration

## Move an environment to a different tenant

You can use the tenant-to-tenant migration feature to request to have an environment in one tenant moved to another tenant. This feature enables customers to support the following cases:

- Consolidate multiple tenants under one tenant
- Support acquisition from Company A to Company B

You need to [submit a support request](get-help-support.md) to initiate tenant-to-tenant migration. 

There are no user-interface changes or version changes as part of this move. You can move one or multiple environments. Once complete, your environment(s) will appear in your new tenant.

> [!IMPORTANT]
> When moving individual environments from one tenant to another, if that requires a geographical region change, your tenant becomes a multiregional tenant. Regional features are enabled in the Power Platform admin center.
> 
> You might need to reconfigure some applications and settings after tenant to tenant migration such as Microsoft Dynamics 365 for Outlook, server-side sync, SharePoint integration, etc.
>
> Geographical region changes are not supported into or out of US GCC, US GCC High, US DoD, or China.

### Applications and platform supported

| Supported | Not fully supported<sup>*</sup> |
|-------------------------|-------------------------|
| <ul></br><li>Dataverse</li></br><li>Dynamics apps</li></br></ul> | <ul></br><li>Power Apps</li></br><li>Power Automate</li></br><li>Power Virtual Agent</li></br></ul> |

<sup>*</sup>There could be potential data loss during migration.

### Supported environment types

| Supported | Not Supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production environment</li></br><li>Migrating sandbox environment</li></br><li>Migrating tenants from GCC to GCC</li></br><li>One or multiple environments</li></br></ul> | <ul></br><li>Migrating default environment</li></br><li>Migrating teams environment</li></br><li>Migrating trial environment</li></br><li>Migrating demo environment</li></br><li>Migrating tenants from GCC to another geo or from another geo to GCC</li></br></ul> |

### Migration flow
Once a migration request is submitted, the support team is engaged to review the migration request manually. Below are the list of steps performed during the entire migration process.

# [Image](#tab/image)

:::image type="content" source="media/migration-flow.png" alt-text="Migration flow":::

# [Table](#tab/table)

<table>
  <tr>
    <td>Submit request<br>|<br>v </td>
    <td colspan="5"></td>
  </tr>
  <tr>
    <td>Pre-verification<br>--></td>
    <td>Change environment's mapping<br>--></td>
    <td>User mapping and sync<br>--></td>
    <td>Publish destination environment<br>--></td>
    <td>Disable source environment</td>
  </tr>
</table>

---

### Prerequisite:

If you do not have a paid subscription in the destination tenant, then you'll need to create one. You might need to purchase a new subscription in the destination tenant (or convert a trial to paid), if not already done.

Depending on how many source environments you are migrating, you'll need to create a temporary environment or environments in the destination tenant. The source environment type and destination environment type must match (production vs non-production (sandbox)). The users to be migrated from one tenant to another need to be created on the target tenant as well.

The destination tenant needs an equal or higher number of active user licenses, environment licenses for the environments being migrated, and equal or greater storage as the source tenant.

When your environment is moved from one tenant to another within the same region, the URL does not change. In order to perform this operation, you'll need to provide some information, such as:

- What is the source tenant domain and its region? (example: EMEA, NA, APAC)
- What is the destination tenant domain and its region? (example: EMEA, NA, APAC)
- Does the destination tenant have a valid Dynamics 365 subscription with enough seats for all the users to be mapped? The users to be provided in the mapping file will need to be active and licensed both in the source and target environments.
- Does the destination tenant have enough available user licenses?
- Does the destination tenant have enough environment licenses?
- Does the destination tenant have enough storage available for the environments being migrated?
- For production environments, we need to migrate a sandbox copy of it first. Do you have sufficient capacity to provision a copy of your production environment to proceed with this test? 
- Provide the environments to be migrated from the source tenant.
- Provide the destination environments in the target tenant. These environments in the target tenant will act as a placeholder and will be replaced with the source instance in the migration process. Make sure that these target environments are enabled for Dynamics 365 apps.
- Provide the user mapping file for the first environment to be migrated. Each environment will need to have a separate mapping file. Please note, that the users need to exist both in source and target tenants, and they will need to be licensed and enabled in the environments in order for the migration to succeed. They can have different source and target domains, as long as they are active. 

## Steps to be performed by a Global Admin, Dynamics 365 admin, or Power Platform Admin

1. Be authorized to perform the migration.
2. Create the Dynamics 365 destination environments (if they are not already created) in the target tenant.
3. If we will be moving a production environment, we first need to migrate a sandbox copy. In that case, we'll also need a new environment in the source tenant so we can copy the production environment into the new environment.
4. Create users in the destination environments in the target tenant, which include:
   1. Create users in Microsoft 365/Azure AD.
   2. Assign licenses.
   3.	Assign security roles in the environments.
   4.	Provision user mailboxes in the destination tenant.
4. Once the users are created and enabled, the mapping file will need to be generated (following the steps mentioned previously).
5. If there are any Power Apps or Power Automate Flows solutions, these need to be exported from the [Power Apps admin center](https://make.powerapps.com), and imported again in the new environment after the migration.

## Confirm if any of the solutions below are installed in the environments to be migrated, as these may require additional steps, either from Support or from you:
 
1.	Power Apps or Power Automate
2.	Dynamics 365 Customer Voice
3.	Power Pages
4.	Café X
5.	Forms Pro
6.	SharePoint
7.	Mailboxes (if the mapped user has a mailbox in the destination environment, then the mailbox is automatically provisioned during the migration. For all the other users, you will need to reconfigure the mailbox)
8.	Marketing 

## Steps to create the mapping file:
 
Full Access Users:
1.	Access the source instance
2.	Open Advanced Find window and look for Users
3.	Use saved view: Full Access Users and Edit Columns
4.	Remove all columns except Full Name
5.	Add columns: Windows Live ID
6.	Click Ok and display all the results
7.	Select all the records, click on "Export Users" in the ribbon and choose "Static Worksheet (Page only)"
8.	Perform the same steps above for the destination instance. You should now have two separate Excel sheets (one for source, one for target)
9.	Open the files for editing
10.	Starting with the source Excel sheet, copy the records under Windows Live ID column into Notepad (do not copy header)
11.	Save the Notepad file
12.	Next, enter destination "Windows Live ID" (UPNs) in the same Notepad document to the right of the corresponding Source UPN, separating Source and Destination UPNs by a comma (,). 

Example below: 
user001@source.com,user001@destination.com
user002@source.com,user002@destination.com        
user003@source.com,user003@destination.com

13.	Save file as CSV

For Administrative access users: 
1.   Use Saved View: Administrative access users to see the list of administrative access users
2.   If you decide not to include any of these users, ignore below steps
3.   If you decide to include these users in mapping:
 
-	 Find the corresponding users in the destination tenant
-	 Make sure a valid dynamics license is assigned to the destination user in destination tenant
PS: If the destination user is not assigned any license, the migration will fail
-  If the destination user is not assigned any license, the migration will fail
- Save the CSV file which has both ‘Full access users’ and ‘Administrative access users’ mapped

## These are the steps that need to be executed on customer’s side for Power Apps, Power Automate, Portals and Marketing application, before the migrations are started: 

## 1.	For Portals (must be done for each portal in the environment(s)): 
              
Before the migration: 
-	Login to the environment
-	Open Portals administration page
-	Reset the portal (reference: https://docs.microsoft.com/en-us/dynamics365/customer-engagement/portals/reset-portal)

After the migration: 
-	Login to the environment
-	Open Portals administration page
-	Provision portal with the same portal type and language

Note: the following configurations are not preserved by the reset portal and if used have to be configured again in the new portal. 

## 2.	For Power Apps and Power Automate: 

-	Any Power Apps and Flows must be manually exported. 
-	We do not support the migration of Customer Connectors, Connections and Gateways, so if you do have any of these components setup, these must be manually reconfigured again after the migration. 

| For apps which are solution aware
Before the migration: 
-	For apps which are solution aware, you can go to https://web.powerapps.com/, navigate to the Solutions page, and export all apps/solutions (either individually or group them all together in a single solution, if they are not already)

After the migration: 
-	Select the new environment from https://web.powerapps.com/ and navigate to the Solutions page
-	Select “Import” button and use the file selector to pick the packages exported from the above steps
-	Confirm that the import was successfully completed by checking the solution contents in the target environment. 

| For apps which are not solution aware
Before the migration: 
-	Go to https://web.powerapps.com/, navigate to the Apps page
-	For each app that you want to move, click the “…” menu button and select “Export package (preview)” 
-	Fill the details required to perform the export of the app and click “Export”. Once the export completes, a download should begin. The resulting file contains the app package that was selected. 
-	Repeat these steps until all apps have been exported. 

After the migration: 
-	Select the new environment from the environment picker in the top right
-	Navigate to the 'Apps' page on the left side
-	Select the 'Import package (preview)' button
-	Upload the app package file from the upload step
-	Complete all of the import option selections and press 'Import'
-	Repeat these steps until all apps have been imported. 



## 3.	For Marketing application:

If there’s Marketing application deployed in the tenant, you’ll need to also ensure that the needed licenses are present in the destination tenant in order to reprovision the application once the migration is completed. 

Public documentation: https://docs.microsoft.com/en-us/dynamics365/marketing/tenant-to-tenant 


## Post Migration

After moving environments to another tenant:

- The environment ID in the target tenant cannot be set to the same environment ID as in the source tenant. This is not supported.
- The environment URL, environment ID, and the name do not change.
- The source environment will not be accessible.
- Security group mapping is handled as part of the manual tenant-to-tenant migration process. At the very least, a replacement (or removal) will be needed because the security group won't exist with the same ID in the new Azure AD tenant.

## How the move works

You’ll be provided with a list of prerequisites and post-requisites for your migration as part of the support request raised. The following table describes what Microsoft does before, during, and after your move.


| |Before the move<br/>Notification   |During the move<br/>Cut-over  |After the move<br/>Notification and support |
|---------|---------|---------|---------|
|**What Microsoft does**   |Your support representative or Account Manager will work with you to request a move and schedule it.         |Cut-over for the migration takes several hours, depending on the number of users and the amount of data. During this period, the environment is not accessible, so the cut-over should be scheduled during the evening or over a weekend.<br/><br/>There is a step that will require your involvement, which is to provide a User Mapping File. This is requested in advance so that we can validate the users being moved before the migration takes place.         |You will be alerted by email or telephone when your environment is migrated to the new tenant.<br/><br/>After the tenant migration is complete, your support representative or Account Manager will assist you to contact with billing to cancel and/or credit your previous subscription, if needed.         |

We will adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.

## Frequently asked questions

## Are background operations in setting enabled during T2T migration ?
Administration mode is enabled during T2T migration so background operations don’t run. [Administration mode - Power Platform ](https://docs.microsoft.com/en-us/power-platform/admin/admin-mode)

## Can we migrate all users from the source to the destination environment?
We can migrate all source users to destination only if users exist in the destination environment. For example:

user001@source.com,user001@destination.com <br />
user002@source.com,user002@destination.com        


[!INCLUDE[footer-include](../includes/footer-banner.md)]
