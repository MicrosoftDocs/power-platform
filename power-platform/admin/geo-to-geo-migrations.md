---
title: Geo-to-geo migrations
description: Move your environment in a single tenant from one region to another with the Geo Migration feature.
author: matapg007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/01/2024
ms.subservice: admin
ms.author: matgupta 
ms.reviewer: sericks
contributors: 
    - brsova
    - ProfessorKendrick
    - - LaurentPepin
search.audienceType: 
  - admin
---

# Geo-to-geo migrations

We continue to open new datacenter regions for business services, and to add datacenters to existing regions.  

The Geo Migration feature allows customers to move their environments in a single tenant from one region to another. There are no user-interface changes or version changes as part of this move. In the case of an environment residing in an [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment in a single tenant, moving the environment doesn't move the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment; they're separate services. Your environment still appears in your tenant alongside the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment.  

> [!IMPORTANT]
> - Support for geo migration is limited and generally not available.
> - To request a regional migration, please contact your account manager or see [Technical Support](get-help-support.md).
> - After making a request, expect at least 10 days for the migration to be completed.  
> - Geo migrations are not supported into or out of US GCC, US GCC High, or China.
> - Geo migrations are restricted into or out of OCE or IND.
> - The Dynamics 365 Marketing app does not support geo migration, due to component dependencies. For more information, see [Manage your Dynamics 365 Marketing instances](/dynamics365/marketing/manage-marketing-instances). If installed, the Dynamics 365 Marketing app must be uninstalled prior to the migration.
> - Geo migration is not supported for Microsoft Dataverse for Teams environments.
> - Dataverse organization linked to a finance and operations organization is not supported.
> - There are important and critical preparation steps mentioned below that need to be performed for Power Apps/Power Automate, etc. prior to the geo migration. If these steps are missed, it is difficult to recover Power Apps/Power Automate solutions.

### Supported environment types

| Supported | Not supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production environment</li></br><li>Migrating sandbox environment</li></br></ul> | <ul></br><li>Migrating default environment</li></br><li>Migrating Dataverse for Teams environment</li></br><li>Migrating trial environment</li></br><li>Migrating demo environment</li></br><li>Migrating developer environment</li></br><li>Migrating environment from GCC to another geo or from another geo to GCC</li></ul> |

## Impact of migrating  
Moving an environment to a different region changes your tenant to be multiregional - enabling regional features in the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)].  

> [!IMPORTANT]
> Once an environment is moved to the new region, prior backups of that environment are no longer available.

The other significant change is to your organization URL. Each of the regional datacenters has a unique identifier in the URL. When your organization is moved from one regional datacenter to another this identifier changes. For example:  

- South America (LATAM/SAM) = .crm2.dynamics.com  
- Canada (CAN) = .crm3.dynamics.com  
- Europe, Middle East, Africa (EMEA) = .crm4.dynamics.com  
- Asia Pacific (APAC) = *.crm5.dynamics.com  
- Australia (OCE) = *.crm6.dynamics.com
- Germany (GER) = *.crm16.dynamics.com 
- Japan (JPN) = *.crm7.dynamics.com  
- India (IND) = *.crm8.dynamics.com 
- United Kingdom (UK) = *.crm11.dynamics.com  
- United Arab Emirates (UAE) = *.crm15.dynamics.com 

For example, if your existing organization URL is `https://myorg.crm`<strong>5</strong>.dynamics.com and you request it to be moved to Australia, the new organization URL will be `https://myorg.crm`<strong>6</strong>.dynamics.com.  

You need to update any direct references to your organization URL.  

> [!NOTE]
> Organization URLs must be unique. If your organization name has already been reserved in the destination datacenter, it won't be available. In the unlikely event this happens, we work with you to decide how to proceed.  

See [Where your data is located](https://www.microsoft.com/trust-center/privacy/data-location).  

The following topics have information that could be helpful to understand the move process:  

- [New datacenter regions](new-datacenter-regions.md)  
- [About Microsoft Cloud Australia](about-microsoft-cloud-australia.md)  
- [About Microsoft Cloud Canada](about-microsoft-cloud-canada.md)  
- [About the Microsoft Cloud Germany datacenter](about-microsoft-cloud-germany.md)
- [About Microsoft Cloud Japan](about-microsoft-cloud-japan.md)  
- [About Microsoft Cloud India](about-microsoft-cloud-india.md)  

### Do the following steps for Power Apps, Power Automate, Microsoft Copilot Studio, Power Apps portals, and marketing before and after the migration: 

#### For Power Apps and Power Automate: 

-	Any Power Apps and Power Automate flows must be manually exported prior to the date and time arranged for performing the Geo-to-Geo migration.
-	We don't support the migration of customer connectors, connections, or gateways. If you have any of these components set up, they must be manually reconfigured after the migration. 

##### For apps that are solution-aware

Before the migration: 
1. For apps that are solution-aware, you can go to https://make.powerapps.com/, navigate to the **Solutions** page, and export all apps/solutions either individually or group them together into a single solution (if they're not already).
2. Once the canvas apps have been exported, delete the apps in the environment.

> [!IMPORTANT]
> Solution-aware canvas apps, custom pages, or component libraries that you don't delete from an environment before migration are left in an inoperable state after the migration completes. You can't play, edit, or export them. You must delete them to unblock any further solution updates.

After the migration: 
1. Select the new environment from https://make.powerapps.com/ and navigate to the **Solutions** page.
2. Select **Import**,                and use the file selector to pick the packages exported from the above steps.
3. Confirm that the import was successfully completed by checking the solution contents in the target environment. 

##### For apps which aren't solution-aware

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

#### For Microsoft Copilot Studio: 

-	Any Microsoft Copilot Studio chatbots must be manually exported. 
-	Some chatbots' dependent components must be manually reconfigured during or after the migration - for example, connections, environment variables, custom connectors. 

Before the migration: 
1. Chatbots are solution-aware. You can go to https://make.powerapps.com/, navigate to the **Solutions** page, and export all chatbots'solutions - either individually or group them together in a single solution. For more information, see [Export and import bots using solutions](/power-virtual-agents/authoring-export-import-bots).

After the migration: 
1. Select the new environment from https://make.powerapps.com/, and navigate to the **Solutions** page.
2. Select **Import**, and use the file selector to pick the packages exported from the above steps.
3. Confirm that the import was successfully completed by checking the solution contents in the target environment. 

#### For Power Apps portals (must be done for each portal in the environments): 
              
Before the migration: 
1. Sign in to the environment.
2. Open the [Power Apps portals admin center](/powerapps/maker/portals/admin/admin-overview#open-power-apps-portals-admin-center).
3. [Reset](/powerapps/maker/portals/admin/reset-portal) the portal.

After the migration: 
1. Sign in to the environment.
2. Open the [Power Apps portals admin center](/powerapps/maker/portals/admin/admin-overview#open-power-apps-portals-admin-center).
3. Provision the portal with the same portal type and language.

#### For Dynamics 365 Marketing app:
The Dynamics 365 Marketing app doesn't support geo migration, due to component dependencies. For more information, see [Manage your Dynamics 365 Marketing instances](/dynamics365/marketing/manage-marketing-instances). If installed, the app must be uninstalled prior to the migration.

Before the migration: 

1. Follow the [Uninstall Dynamics 365 Marketing](/dynamics365/marketing/uninstall-marketing) guide to uninstall Marketing app from the environment.


## How the move works  
You are provided with a list of prerequisites and post-requisites for your migration. The following table describes what [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] does before, during, and after your move. 

|   |    Before the move   |  During the move | After the move |
|-----|------|---|----|
| **What Microsoft does** | Notification <br /><br /> Your support representative or Account Manager works with you to request a move and scheduling. | Cut-over <br /><br /> Cut-over times for each service depend on the number of users and the amount of data. This step can take 1 to 6 hours for smaller organizations, but may take up to 48 hours for large organizations. The cut-over is done during the evening or over a weekend. | Notification and support <br /><br /> You'll be alerted by email or telephone when your environment is migrated to the new datacenter.<br /><br /> After your geo has migrated you can perform the post requisite steps, primarily changing your new URLs with any associated plugins or services. |

We adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.  

### Related information

[!INCLUDE[footer-include](../includes/footer-banner.md)]
