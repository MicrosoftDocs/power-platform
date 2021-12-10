---
title: "Migrate an environment to a different tenant"
description: "Learn about the impact of moving an environment from one tenant to another. Review the prerequisites and considerations before submitting a request." 
ms.custom: ""
ms.date: 12/10/2021
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
# Tenant-to-tenant migration

## Move an environment to a different tenant

You can use the tenant-to-tenant migration feature to request an environment in one tenant be moved to another tenant. This feature enables customers to support the following cases:

- Consolidate multiple tenants under one tenant
- Support acquisition from Company A to Company B

You need to [submit a support request](get-help-support.md) to initiate tenant-to-tenant migration. 

There are no user interface changes or version changes as part of this move. You can move one or multiple environments. Once complete, your environment(s) will appear in your new tenant.

> [!IMPORTANT]
> If moving individual environments from one tenant to another requires a geographical region change, your tenant becomes a multiregional tenant. Regional features are enabled in the Power Platform admin center by support team. More information: [Geo to geo migrations](geo-to-geo-migrations.md).

> 
> You might need to reconfigure some applications and settings after tenant-to-tenant migration, such as Microsoft Dynamics 365 for Outlook, server-side sync, SharePoint integration, or others.
>
> Geographical region changes are not supported into or out of US GCC, US GCC High, US DoD, OCE, IND, or China.

### Supported applications and platforms

| Supported | Not fully supported<sup>*</sup> |
|-------------------------|-------------------------|
| <ul></br><li>Dataverse</li></br><li>Dynamics apps</li></br></ul> | <ul></br><li>Power Apps</li></br><li>Power Automate</li></br><li>Power Virtual Agent</li></br></ul> |

<sup>*</sup>There may be potential data loss during migration and additional steps required. [Confirm if any of the solutions below are installed in the environments to be migrated, as these may require additional steps either from you or Support.](#confirm-if-any-of-the-solutions-below-are-installed-in-the-environments-to-be-migrated-as-these-may-require-additional-steps-either-from-you-or-support)

### Supported environment types

| Supported | Not supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production environment</li></br><li>Migrating sandbox environment</li></br><li>Migrating tenants from GCC to GCC</li></br><li>One or multiple environments</li></br></ul> | <ul></br><li>Migrating default environment</li></br><li>Migrating teams environment</li></br><li>Migrating trial environment</li></br><li>Migrating demo environment</li></br><li>Migrating  developer environment</li></br><li>Migrating tenants from GCC to another geo or from another geo to GCC</li></ul> |

### Migration flow
Once a migration request is submitted, the support team is engaged to review the request manually. Below is the list of steps performed during the entire migration process.

#### [Image](#tab/image)

:::image type="content" source="media/migration-flow.png" alt-text="Migration flow":::

#### [Table](#tab/table)

<table>
  <tr>
    <td>Submit request<br>|<br>v </td>
    <td colspan="5"></td>
  </tr>
  <tr>
    <td>Verify prerequisites<br>--></td>
    <td>Migrate environment<br>--></td>
    <td>User mapping and sync<br>--></td>
    <td>Post migration<br>--></td>
    <td>Migration completed</td>
  </tr>
</table>

---

### Prerequisites:

If you don't have a paid subscription of Dynamics 365 or Power Apps in the destination tenant, you'll need to create one. You might need to purchase a new subscription, or convert a trial to paid, if not already done.

Depending on how many source environments you're migrating, you'll need to create a temporary environment or environments in the destination tenant. The source environment type and destination environment type—production vs non-production (sandbox)—must match. The users to be migrated from one tenant to another need to be created on the target tenant as well.

The destination tenant needs an equal or higher number of active user licenses and equal or greater storage as the source tenant.

When your environment is moved from one tenant to another within the same region, the URL does not change. In order to perform this operation, you'll need to answer some questions including:

- What is the source tenant domain and its region? (Example: EMEA, NA, APAC)
- What is the destination tenant domain and its region? (Example: EMEA, NA, APAC)
- Does the destination tenant have a valid Dynamics 365 subscription with enough seats for all the users to be mapped? The users to be provided in the mapping file will need to be active and licensed both in the source and target environments.
- Does the destination tenant have enough available user licenses?
- Does the destination tenant have enough storage available for the environments being migrated?
- For production environments, we need to migrate a sandbox copy of it first. Do you have sufficient capacity to provision a copy of your production environment to proceed with this test? 

You'll also need to provide the following information:

- The environments to be migrated from the source tenant.
- The destination environments in the target tenant. These environments in the target tenant will act as placeholders and will be replaced with the source instance in the migration process. Make sure that these target environments are enabled for Dynamics 365 apps.
- The user mapping file for the first environment to be migrated. Each environment will need to have a separate mapping file. Please note that the users need to exist in both the source and target tenants, and need to be licensed and enabled in the environments in order for the migration to succeed. They can have different source and target domains as long as they are active. 

### Steps to be performed by a global admin, Dynamics 365 admin, or Power Platform admin

1. Be authorized to perform the migration.
2. Create the Dynamics 365 destination environments (if they're not already created) in the target tenant.
3. If we'll be moving a production environment, we first need to migrate a sandbox copy. In that case, we'll also need a new environment in the source tenant so we can copy the production environment into the new environment.
4. Create users in the destination environments in the target tenant. You must:
   1. Create users in Microsoft 365/Azure AD.
   2. Assign licenses.
5. Once the users are created and enabled, the mapping file will need to be generated following the steps <a href="#steps-to-create-the-mapping-file">described later in this topic</a>.
6. If there are any solutions for Power Apps or Power Automate flows, these need to be exported from the [Power Apps maker portal](https://make.powerapps.com) and imported again into the new environment after the migration.

### Confirm if any of the solutions below are installed in the environments to be migrated, as these may require additional steps either from you or Support:
 
- Power Apps or Power Automate
- Dynamics 365 Customer Voice
- Power Apps portals
- Power Apps Checker App
- Café X
- Forms Pro
- SharePoint
- Mailboxes (If the mapped user has a mailbox in the destination environment, then the mailbox is automatically provisioned during the migration. For all other users, you will need to reconfigure the mailbox.)
- Dynamics 365 Marketing 

### Steps to create the mapping file
 
For full access users:
1. Access the source environment.
2. Use Advanced Find (![Screen shot of Advanced Find button.](../admin/media/advanced-find-button2.png "Screen shot of Advanced Find button")) and look for users.
3. Select **Use Saved View** > **Full Access Users**, and then select **Edit Columns**.
4. Remove all columns except **Full Name**.
5. Select **Add Columns** > **Windows Live ID**.
6. Select **OK** > **Results** to see the list of full access users.
7. Select all the records, select **Export Users** in the ribbon, and then choose **Static Worksheet (Page only)**.
8. Follow steps 1-7 above for the destination environment. You should now have two separate Excel sheets—one for source and one for target.
9. Open the files for editing.
10.	Starting with the source Excel sheet, copy the records under the **Windows Live ID** column into Notepad. Do not copy the header.
11.	Save the Notepad file.
12.	Next, enter the destination Windows Live ID (UPNs) in the same Notepad document to the right of the corresponding Source UPN, separating Source and Destination UPNs by a comma (,). 

    Example: <br />
    user001@source.com,user001@destination.com<br />
    user002@source.com,user002@destination.com<br />
    user003@source.com,user003@destination.com

13.	Save the file as a CSV.

For administrative access users: 
1. Access the source environment.
2. Use Advanced Find (![Screen shot of Advanced Find button.](../admin/media/advanced-find-button2.png "Screen shot of Advanced Find button")) and look for users.
3. Select **Use Saved View** > **Administrative Access Users**, and then select **Results** to see the list of administrative access users.
4. If you decide not to include any of these users, skip the following steps. Otherwise, to include these users in mapping:
   1. Find the corresponding users in the destination tenant.
   2. Make sure a valid Dynamics 365 license is assigned to the destination user in the destination tenant.
      Note: If the destination user is not assigned any license, the migration will fail.
   3. Save the CSV file which has both full access users and administrative access users mapped.

### Do the following steps for Power Apps, Power Automate, Power Apps portals, and Marketing before and after the migration: 

#### For Power Apps and Power Automate: 

-	Any Power Apps and Power Automate flows must be manually exported. 
-	We do not support the migration of Customer Connectors, Connections, or Gateways. If you have any of these components set up, they must be manually reconfigured after the migration. 

##### For apps which are solution aware

Before the migration: 
1. For apps which are solution aware, you can go to https://make.powerapps.com/, navigate to the Solutions page, and export all apps/solutions (either individually or group them together in a single solution if they're not already)

After the migration: 
1. Select the new environment from https://make.powerapps.com/ and navigate to the Solutions page.
2. Select **Import** and use the file selector to pick the packages exported from the above steps.
3. Confirm that the import was successfully completed by checking the solution contents in the target environment. 

##### For apps which are not solution aware

Before the migration: 
1. Go to https://make.powerapps.com, and then select **Apps**.
2. For each app that you want to move, select **More Commands** (…), and then select **Export package (preview)**. 
3. Fill in the details required to perform the export of the app, and then select **Export**. Once the export completes, a download should begin. The resulting file contains the app package that was selected. 
4. Repeat these steps until all apps have been exported. 

After the migration: 
1. Go to https://make.powerapps.com.
2. Select the new environment from the environment picker in the upper-right.
3. Select **Apps**.
4. Select **Import canvas app**.
5. Upload the app package file.
6. Complete all of the import option selections, and then select **Import**.
7. Repeat these steps until all apps have been imported. 

#### For Power Apps portals (must be done for each portal in the environment(s)): 
              
Before the migration: 
1. Sign in to the environment.
2. Open the [Power Apps portals admin center](/powerapps/maker/portals/admin/admin-overview#open-power-apps-portals-admin-center).
3. [Reset](/powerapps/maker/portals/admin/reset-portal) the portal.

After the migration: 
1. Sign in to the environment.
2. Open the [Power Apps portals admin center](/powerapps/maker/portals/admin/admin-overview#open-power-apps-portals-admin-center).
3. Provision the portal with the same portal type and language.

> [!NOTE]
> The following configurations are not preserved by the portal reset and must be configured again in the new portal. 

#### For Dynamics 365 Marketing:

If the Marketing app is deployed in the tenant, ensure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Go to: [Tenant-to-tenant migration for Dynamics 365 Marketing](/dynamics365/marketing/tenant-to-tenant).

### Post-migration

After moving environments to another tenant:

- The [organization ID (OrgID)](determine-org-id-name.md) in the target tenant cannot be set to the same organization ID as in the source tenant. This is not supported.
- The environment URL, organization ID (OrgID), and the name do not change.
- The source environment will not be accessible.
- Security group mapping is handled as part of the manual tenant-to-tenant migration process. At the very least, a security group replacement (or removal) will be needed because the security group won't exist with the same organization ID in the new Azure AD tenant.

## How the move works

You'll be provided with a list of pre- and post-requisites for your migration as part of the support request raised. The following table describes what Microsoft does before, during, and after your move.


| |Before the move:<br/>Notification   |During the move:<br/>Cut-over  |After the move:<br/>Notification and support |
|---------|---------|---------|---------|
|**What Microsoft does**   |Your support representative or account manager will work with you to request a move and schedule it.         |Cut-over for the migration takes several hours, depending on the number of users and the amount of data. During this period, the environment is not accessible, so the cut-over should be scheduled during the evening or over a weekend.<br/><br/>There is a step that will require your involvement, which is to provide a user mapping file. This is requested in advance so that we can validate the users being moved before the migration takes place.         |You will be alerted by email or telephone when your environment is migrated to the new tenant.<br/><br/>After the tenant migration is complete, your support representative or account manager will assist you in contacting billing to cancel and/or credit your previous subscription, if needed.         |

We will adhere to the terms of the [Service Level Agreement for Microsoft Online Services](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.

## Frequently asked questions

### Are background operations enabled during tenant-to-tenant migration?
Administration mode is enabled during tenant-to-tenant migration, therefore background operations don't run. Go to: [Administration mode - Power Platform](admin-mode.md)

### Can we migrate all users from the source to the destination environment?
We can migrate all source users to the destination environment only if users exist in the destination environment. For example:

user001@source.com,user001@destination.com <br />
user002@source.com,user002@destination.com        


[!INCLUDE[footer-include](../includes/footer-banner.md)]
