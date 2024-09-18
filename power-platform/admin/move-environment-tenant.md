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
The tenant-to-tenant migration feature allows the transfer of an environment from one tenant to another. This feature supports scenarios such as merging multiple tenants into one and facilitating company acquisitions. The environment does not actually move but rather is linked to another tenant. The environment still exists but is not part of the source tenant anymore. It is accessible and managed under the destination tenant. There is no user interface changes or version changes as part of this move.

## Limitations
Be aware of the following limitations.

-	**Supported environment types:** Production and sandbox only.
-	**Not Supported:** Environment types (Default, Developer, trial, teams), GCC to public clouds or vice versa.
-	Components not fully supported: Canvas app, Custom pages, Power Automate, Power Apps, Microsoft Copilot Studio, Dynamics 365 Customer voice, Omnichannel for Customer Service, Component library, Power Apps Checker App, Café X.
-	Mailboxes. If the mapped user has a mailbox in the destination tenant, then the mailbox is automatically configured during the migration. For all other users, you'll need to reconfigure the mailbox:
  -	If the same mailbox is used in the target tenant, `test@microsoft.com`, then the mailbox will be enabled by default. Before the tenant-to-tenant process, customers need to migrate/configure their mailboxes on the target tenant.
  -	If you're using the default onmicrosoft domain, `test@sourcecompanyname.onmicrosoft.com`, the post migration domain name is changed (test@targetcompanyname.onmicrosoft.com). Customers need to reconfigure the mailbox. To configure the mailbox, see Connect to Exchange Online.

## Prerequisite before proceeding with Migration
-	Create users in the target tenant. You must:
  -	Create users in Microsoft 365/Microsoft Entra ID.
  -	Assign licenses.
-	Once the users are created and enabled, the mapping file will need to be generated following the steps described later in this article.
-	If there are any solutions for Power Apps or Power Automate flows, these need to be exported from Power Apps and imported again into the new environment after the migration.
-	If Lockbox is enabled in the source tenant, be prepared to approve Lockbox request at the start of the tenant-to-tenant operation.
-	The PowerShell for Power Platform Administrators module is the recommended PowerShell module for interacting with admin capabilities. For information that helps you get started with the PowerShell for Power Platform Administrators module, see Get started with PowerShell for Power Platform Administrators.

## Pre-migration
Do the following steps for Power Apps, Power Automate, Power Virtual Agents, Power Apps Portals, and Marketing before the migration:

### Power Automate

If your flows are already defined into DATAVERSE then no additional work is required. Any Power Automate flows that should be migrated need to have their definitions added into Dataverse, so the definitions are present in the target environment.

1. Add flows into Dataverse solutions in the source environment 
   1. [Add an existing cloud flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution).
   1. This can be done in bulk by running the [Add-AdminFlowsToSolution](/powershell/module/microsoft.powerapps.administration.powershell/add-adminflowstosolution?view=pa-ps-latest) cmdlet.
      
### For Power Apps
-	Any Power Apps must be manually exported.
-	We don't support the migration of Customer Connectors, Connections, or Gateways. If you have any of these components set up, they must be manually reconfigured after the migration.

For solution aware apps:
1. For apps that are solution aware, you can go to https://make.powerapps.com/, navigate to the Solutions page, and export all apps/solutions (either individually or group them together in a single solution if they're not already)
1. Delete these solution aware apps in the environment after exporting them.

> [!Important]
> Solution aware canvas apps, custom pages, or component libraries that you don't delete from an environment before migration won't work after the migration completes.

For non-solution aware apps
1.	Go to https://make.powerapps.com, and then select **Apps**.
2.	For each app that you want to move, select **More Commands** (…), and then select **Export package (preview)**.
3.	Fill in the details required to perform the export of the app, and then select Export. Once the export completes, a download should begin. The resulting file contains the app package that was selected.
4.	Repeat these steps until all apps have been exported.

### For Power Virtual Agents
-	Any Power Virtual Agents chatbots must be manually exported.
-	Some chatbots' dependent components must be manually reconfigured during or after the migration - for example, connections, environment variables, custom connectors.

Chatbots are solution aware. You can go to https://make.powerapps.com/, navigate to the Solutions page, and export all chatbots'solutions - either individually or group them together in a single solution. For more information, see [Export and import bots using solutions](/microsoft-copilot-studio/authoring-export-import-bots?tabs=webApp).

For Power Apps Portals (must be done for each portal in the environment(s)):
1.	Sign in to the environment.
2.	Open the [Power Apps Portals admin center](/power-pages/admin/admin-overview#open-power-apps-portals-admin-center).
3.	[Delete](/power-pages/admin/delete-website) the portal.

### Prepare Generate user mapping file
To initiate the migration process, begin by creating a user mapping file for the initial environment to be transferred as described later in this article. It's essential to note that each environment requires an individual mapping file. Ensure that users are present and authorized in both the originating and destination tenants, as this is a prerequisite for a successful migration. The users' domains may vary between source and target, provided they are active. The procedure for generating the user mapping file will be outlined in this document described later in this article.

 It is important to have a user mapping file named usermapping.csv, you can use the usermapping.csv template and accurately record the details of users, including their source and destination email IDs. 
 
Ex: Template (save the file as usermapping.csv, it is case sensitive)

|Source|	Destination|
|------|-------------|
|User1@sourcetenant.com	|User2@targettenant.com|

### For Dynamics 365 Marketing:
If the Marketing app is deployed in the tenant, ensure that the necessary licenses are present in the destination tenant in order to reprovision the application once the migration is complete. Go to: [Tenant-to-tenant migration for Dynamics 365 Marketing](/dynamics365/customer-insights/journeys/tenant-to-tenant).





