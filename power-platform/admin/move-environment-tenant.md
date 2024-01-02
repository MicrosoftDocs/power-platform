---
title: "Migrate an environment to a different tenant"
description: "Learn about the impact of migrating an environment from one tenant to another. Review the prerequisites and considerations before submitting a request." 
ms.date: 06/07/2023
ms.topic: conceptual
author: matapg007
contributors:
  - ImadYanni
  - bevans 
  - LaurentPepin 
ms.subservice: admin
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Tenant-to-tenant migration 

## Migrate an environment to a different tenant

You can use the tenant-to-tenant migration feature to request an environment in one tenant be moved<sup>*</sup> to another tenant. This feature enables customers to support the following cases:

- Consolidate multiple tenants under one tenant
- Support acquisition from Company A to Company B

<sup>*</sup>The environment isn't physically moved but instead is associated with another tenant. The environment still exists but is no longer under the source tenant. It's available and managed under the destination tenant.

You need to [submit a support request](get-help-support.md) to initiate tenant-to-tenant migration. 

There are no user interface changes or version changes as part of this move. You can move one or multiple environments. Once complete, your environment(s) will appear in your new tenant.

> [!IMPORTANT]
> - If moving individual environments from one tenant to another requires a geographical region change, your tenant becomes a multiregional tenant. Regional features are enabled in the Power Platform admin center by support team. More information: [Geo to geo migrations](geo-to-geo-migrations.md). 
> - You might need to reconfigure some applications and settings after tenant-to-tenant migration, such as Microsoft Dynamics 365 for Outlook, server-side sync, SharePoint or others.
> - Geographical region changes aren't supported into or out of US GCC, US GCC High, US DoD, OCE, IND, or China.
> - Existing source database backups won't be migrated to destination tenant.
> - A Dataverse organization linked to a finance and operations organization cannot be migrated to a different tenant.
> - Tenant to tenant migration is subject to [Customer Lockbox](about-lockbox.md#enable-the-lockbox-policy) when enabled in the source tenant.

### Supported applications and platforms

| Supported | Not fully supported<sup>*</sup> |
|-------------------------|-------------------------|
| <ul><li>Dataverse</li><li>Dynamics 365 apps</li></ul> | <ul><li>Canvas app</li><li>[Component library](/power-apps/maker/canvas-apps/component-library)</li><li>[Custom pages](/power-apps/maker/model-driven-apps/model-app-page-overview)</li><li>Power Automate</li><li>Power Virtual Agents</li><li>[Dynamics 365 Customer Voice](/dynamics365/customer-voice/cv-faq#i-migrated-my-microsoft-dataverse-environment-from-one-tenant-to-another-but-i-dont-see-my-existing-projects-when-i-login-to-dynamics-365-customer-voice-in-the-new-tenant)</li><li>Omnichannel for Customer Service</li> </ul> |

<sup>*</sup>There may be potential data loss during migration and additional steps required. [Confirm if any of the solutions below are installed in the environments to be migrated, as these may require additional steps either from you or Support.](#confirm-if-any-of-the-solutions-below-are-installed-in-the-environments-to-be-migrated-as-these-may-require-additional-steps-either-from-you-or-support)

### Supported environment types

| Supported | Not supported |
|-------------------------|-------------------------|
| <ul><li>Migrating production environment</li><li>Migrating sandbox environment</li><li>Migrating tenants from GCC to GCC</li><li>One or multiple environments</li></ul> | <ul><li>Migrating default environment</li><li>Migrating teams environment</li><li>Migrating trial environment</li><li>Migrating demo environment</li><li>Migrating  developer environment</li><li>Migrating tenants from GCC to another geo or from another geo to GCC</li><li>Migrating a Dataverse organization linked to a finance and operations organization</li></ul> |

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

If you don't have a paid subscription of Dynamics 365, Power Apps, or Power Virtual Agents in the destination tenant, you'll need to create one. You might need to purchase a new subscription, or convert a trial subscription to paid subscription, if not already done.

The destination tenant needs an equal or higher number of active user licenses and equal or greater storage as the source tenant.

When your environment is moved from one tenant to another within the same region, the URL doesn't change. In order to perform this operation, you'll need to answer some questions including:

- What is the source tenant domain and its region? (Example: EMEA, NA, APAC)
- What is the destination tenant domain and its region? (Example: EMEA, NA, APAC)
- Does the destination tenant have a valid Dynamics 365 subscription with enough seats for all the users to be mapped? The users to be provided in the mapping file will need to be active and licensed both in the source and target tenants.
- Does the destination tenant have enough available user licenses?
- Does the destination tenant have enough storage available for the environments being migrated?
- Before migrating production environments (or environments with potential business impact), sandbox copy migrations need to be performed first. The goal of these migrations using copies of the important production environments is to allow validation of the migrated environments before proceeding with the business critical environments migrations. Do you have sufficient capacity to provision a copy of your production environment to proceed with this test? For instructions on how to copy an environment, go to [Copy an environment](copy-environment.md).

You'll also need to provide the following information:

- The environments to be migrated from the source tenant.
- The user mapping file for the first environment to be migrated. Each environment will need to have a separate mapping file. Note that the users need to exist in both the source and target tenants, and need to be licensed and enabled in the environments in order for the migration to succeed. They can have different source and target domains as long as they're active.
- The security group object ID in the target tenant to assign to each environment, if a security group should be assigned. The target tenant security group object ID will be assigned during the migration if it's provided. If not provided, the security group can be assigned from the Power Platform admin center after the migration is completed.

### Steps to be performed by a global admin, Dynamics 365 admin, or Power Platform admin

1. Be authorized to perform the migration.
3. A migration with a sandbox copy should be executed and validated by all parties prior to planning the migration of a business critical environment. In that case, we'll also need a new environment in the source tenant so we can copy the business critical environment into the new environment and perform the test migration.
4. Create users in the target tenant. You must:
   1. Create users in Microsoft 365/Microsoft Entra ID.
   2. Assign licenses.
5. Once the users are created and enabled, the mapping file will need to be generated following the steps <a href="#steps-to-create-the-mapping-file">described later in this article</a>.
6. If there are any solutions for Power Apps or Power Automate flows, these need to be exported from [Power Apps](https://make.powerapps.com) and imported again into the new environment after the migration.
7. If Lockbox is enabled in the source tenant, be prepared to approve Lockbox request at the start of the tenant to tenant operation.

### Confirm if any of the solutions below are installed in the environments to be migrated, as these may require additional steps either from you or Support:
 
- Power Apps or Power Automate
- Power Virtual Agents
- Dynamics 365 Customer Voice
  - Tenant to tenant migration is not supported for [Dynamics 365 Customer Voice](/dynamics365/customer-voice/cv-faq#i-migrated-my-microsoft-dataverse-environment-from-one-tenant-to-another-but-i-dont-see-my-existing-projects-when-i-login-to-dynamics-365-customer-voice-in-the-new-tenant). Projects and surveys must be recreated after the migration.
- Power Apps Portals
- Power Apps Checker App
- Café X
- Dynamics 365 Marketing 
- Mailboxes. If the mapped user has a mailbox in the destination tenant, then the mailbox is automatically configured during the migration. For all other users, you'll need to reconfigure the mailbox:
  1. If the same mailbox is used in the target tenant (test@microsoft.com), then the mailbox will be enabled by default. Before the tenant-to-tenant process, customers need to migrate/configure their mailboxes on the target tenant.
  2. If you're using the default onmicrosoft domain (test@sourcecompanyname.onmicrosoft.com), the post migration domain name is changed (test@targetcompanyname.onmicrosoft.com). Customers need to reconfigure the mailbox. To configure the mailbox, see [Connect to Exchange Online](connect-exchange-online.md).

### Steps to create the mapping file
 
For full access users:
1. Access the source environment.
2. Use Advanced Find (![Screen shot of Advanced Find button.](../admin/media/advanced-find-button2.png "Screen shot of Advanced Find button")) and look for users.
3. Select **Use Saved View** > **Full Access Users**, and then select **Edit Columns**.
4. Remove all columns except **Full Name**.
5. Select **Add Columns** > **Windows Live ID**.
6. Select **OK** > **Results** to see the list of full access users.
7. Select all the records, select **Export Users** in the ribbon, and then choose **Static Worksheet**. 
8. Follow steps 1-7 above for the destination tenant, if possible. You should now have two separate Excel sheets—one for source and one for target tenant.
9. Open the files for editing.
10.	Starting with the source Excel sheet, copy the records under the **Windows Live ID** column into Notepad. Don't copy the header.
11.	Save the Notepad file.
12.	Next, enter the destination Windows Live ID (UPNs) in the same Notepad document to the right of the corresponding Source UPN, separating Source and Destination UPNs by a comma (,). 

    Example: <br />
    user001@source.com, user001@destination.com<br />
    user002@source.com, user002@destination.com<br />
    user003@source.com, user003@destination.com

13.	Save the file as a CSV.

For administrative access users: 
1. Access the source environment.
2. Use Advanced Find (![Screen shot of Advanced Find button.](../admin/media/advanced-find-button2.png "Screen shot of Advanced Find button")) and look for users.
3. Select **Use Saved View** > **Administrative Access Users**, and then select **Results** to see the list of administrative access users.
4. If you decide not to include any of these users, skip the following steps. Otherwise, to include these users in mapping:
   1. Find the corresponding users in the destination tenant.
   2. Make sure a valid Dynamics 365 license is assigned to the destination user in the destination tenant.
      Note: If the destination user isn't assigned any license, the migration will fail.
   3. Save the CSV file that has both full access users and administrative access users mapped.

### Do the following steps for Power Apps, Power Automate, Power Virtual Agents, Power Apps Portals, and Marketing before and after the migration: 

#### For Power Apps and Power Automate: 

-	Any Power Apps and Power Automate flows must be manually exported. 
-	We don't support the migration of Customer Connectors, Connections, or Gateways. If you have any of these components set up, they must be manually reconfigured after the migration. 

##### For solution aware apps

Before the migration: 
1. For apps that are solution aware, you can go to https://make.powerapps.com/, navigate to the Solutions page, and export all apps/solutions (either individually or group them together in a single solution if they're not already)
2. Delete these solution aware apps in the environment after exporting them.

> [!IMPORTANT]
> Solution aware canvas apps, custom pages, or component libraries that you don't delete from an environment before migration won't work after the migration completes.

After the migration: 
1. Select the new environment from https://make.powerapps.com/ and navigate to the Solutions page.
2. Select **Import** and use the file selector to pick the packages exported from the above steps.
3. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

##### For non-solution aware apps

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

#### For Power Virtual Agents: 

-	Any Power Virtual Agents chatbots must be manually exported. 
-	Some chatbots' dependent components must be manually reconfigured during or after the migration - for example, connections, environment variables, custom connectors. 

Before the migration: 
1. Chatbots are solution aware. You can go to https://make.powerapps.com/, navigate to the Solutions page, and export all chatbots'solutions - either individually or group them together in a single solution. For more information, see [Export and import bots using solutions](/power-virtual-agents/authoring-export-import-bots).

After the migration: 
1. Select the new environment from https://make.powerapps.com/ and navigate to the Solutions page.
2. Select **Import** and use the file selector to pick the packages exported from the above steps.
3. Confirm that the import was successfully completed by checking the solution contents of the migrated environment.

#### For Power Apps Portals (must be done for each portal in the environment(s)): 
              
Before the migration: 
1. Sign in to the environment.
2. Open the [Power Apps Portals admin center](/powerapps/maker/portals/admin/admin-overview#open-power-apps-portals-admin-center).
3. [Reset](/powerapps/maker/portals/admin/reset-portal) the portal.

After the migration: 
1. Sign in to the environment.
2. Open the [Power Apps Portals admin center](/powerapps/maker/portals/admin/admin-overview#open-power-apps-portals-admin-center).
3. Provision the portal with the same portal type and language.

#### For Dynamics 365 Marketing:

If the Marketing app is deployed in the tenant, ensure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Go to: [Tenant-to-tenant migration for Dynamics 365 Marketing](/dynamics365/marketing/tenant-to-tenant).

### Post-migration

After moving environments to another tenant:

- The environment URL, organization ID (OrgID), and the name don't change.
- The source environment won't be accessible.
- Users not included in the mapping file won't be migrated and mapped post migration.

## How the move works

You'll be provided with a list of pre- and post-requisites for your migration as part of the support request raised. The following table describes what Microsoft does before, during, and after your move.


| |Before the move:<br/>Notification   |During the move:<br/>Cut-over  |After the move:<br/>Notification and support |
|---------|---------|---------|---------|
|**What Microsoft does**   |Your support representative or account manager will work with you to request a move and schedule it.         |Cut-over for the migration takes several hours, depending on the number of users. During this period, the environment isn't accessible by the users, so the cut-over should be scheduled during the evening or over a weekend.<br/><br/>There's a step that will require your involvement, which is to provide a user mapping file. This is requested in advance so that we can validate the users being moved before the migration takes place.         |You'll be alerted by email or telephone when your environment is migrated to the new tenant.<br/><br/>After the tenant migration is complete, your support representative or account manager will assist you in contacting billing to cancel and/or credit your previous subscription, if needed.         |

We'll adhere to the terms of the [Service Level Agreement for Microsoft Online Services](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.

## Frequently asked questions

### Are background operations enabled during tenant-to-tenant migration?
Administration mode is enabled during tenant-to-tenant migration, therefore background operations don't run. Go to: [Administration mode - Power Platform](admin-mode.md)

### Can we migrate all users of the Dataverse organization?
We can migrate all users of the Dataverse organization only if users exist in the destination tenant. For example:

user001@source.com, user001@destination.com <br />
user002@source.com, user002@destination.com        


[!INCLUDE[footer-include](../includes/footer-banner.md)]