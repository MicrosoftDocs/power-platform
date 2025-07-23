---
title: Geo-to-geo migrations
description: Move your environment in a single tenant from one region to another with the Geo Migration feature.
author: matapg007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 12/01/2024
ms.subservice: admin
ms.author: matgupta 
ms.reviewer: sericks
contributors: 
    - amiyapatr-zz
    - brsova
    - LaurentPepin
    - bfok123
search.audienceType: 
  - admin
---

# Geo-to-geo migrations

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

We continue to open new datacenter regions for business services, and to add datacenters to existing regions.

The Geo Migration feature allows customers to move their environments in a single tenant from one region to another. There are no user-interface changes or version changes as part of this move. If the environment resides in an [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment in a single tenant, moving the environment doesn't move the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment; they're separate services. Your environment still appears in your tenant alongside the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment.  

> [!IMPORTANT]
> - Support for geo migration is limited and generally not available.
> - To request a regional migration, contact your account manager or go to [Technical Support](get-help-support.md).
> - After making a request, expect at least 10 days for the migration process to complete.  
> - Geo migrations aren't supported into or out of US GCC, US GCC High, or China.
> - Geo migrations are restricted into or out of OCE or IND.
> - There are important and critical preparation steps mentioned in the [Geo-to-geo migration steps](#geo-to-geo-migration-steps) section that need to be performed for Power Apps or Power Automate prior to the geo migration. If these steps are missed, it's difficult to recover Power Apps or Power Automate solutions.

### Supported environment types

| Supported | Not supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production environment</li></br><li>Migrating sandbox environment</li></br></ul> | <ul></br><li>Migrating default environment</li></br><li>Migrating Dataverse for Teams environment</li></br><li>Migrating trial environment</li></br><li>Migrating demo environment</li></br><li>Migrating developer environment</li></br><li>Migrating environment from GCC to another geo or from another geo to GCC</li></ul> |

## Impact of migrating
- Backups for the environment undergoing geo-to-geo migration are no longer available.
- Your organization URL is changed. Each of the regional datacenters has a unique identifier in the URL. When your organization is moved from one regional datacenter to another, this identifier changes. Learn more at [New datacenter regions](new-datacenter-regions.md).
- Your environment ID is changed to a new globally, unique identifier.

> [!NOTE]
> Organization URLs must be unique. If your organization, domain name has already been reserved in the destination datacenter, it isn't available. In the unlikely event this happens, we will work with you to decide how to proceed.  

## Geo-to-geo migration steps
> [!IMPORTANT]
> As support for geo-to-geo migration is limited, many Power Platform components, Dynamics 365 applications, and environment, administration settings are impacted. It's vital for you to follow this section to retain functionality of certain features.

### For environment, administration features
#### Before geo-to-geo migration
- Environment settings (for example, [feature settings](./settings-features.md), [Generative AI features](./geographical-availability-copilot.md), [privacy and security settings](./settings-privacy-security.md)) are set back to their default values after geo-to-geo migration. Take note of any environment settings you need to reconfigure after migration.
- [Managed environment](managed-environment-overview.md#managed-environments-overview) status and associated settings are lost (for example, Admin Digest, Environment Routing). Take note of the managed environment status and associated settings so you can reapply these settings after geo-to-geo migration.
- Enterprise policy link state and associated properties are lost (for example, [customer-managed keys](./customer-managed-key.md), [Virtual Network](./vnet-support-overview.md)). Take note of any enterprise policies linked to the environment so you can relink the enterprise policies after geo-to-geo migration.
- [Lockbox](./about-lockbox.md) requests for the environment undergoing G2G are lost or broken. If Microsoft Support needs access to your environment after geo-to-geo migration, you must create a new Lockbox request.
- [Data Loss Prevention (DLP) policies](wp-data-loss-prevention.md) that either include or exclude the environment undergoing geo-to-geo migration no longer apply to the environment. Take note of the DLP policies that apply to the environment so that you can reapply the policies after geo-to-geo migration.
- The environment undergoing geo-to-geo migration is removed from its [environment group](./environment-groups.md). Take note of the environment group so you can read the environment to the environment group after geo-to-geo migration.
- [Pay-as-you-go](./pay-as-you-go-overview.md) is lost for the environment undergoing geo-to-geo migration. Take note of any Pay-as-you-go billing policies assigned to the environment that you would like to retain after geo-to-geo migration.
- [Currency allocations](./capacity-add-on.md) is lost for the environment undergoing geo-to-geo migration. Take note of any currency allocations for the environment that you would like to retain after geo-to-geo migration.

#### After geo-to-geo migration
- Reconfigure environment settings as necessary.
- [Reenable managed environments](./managed-environment-enable.md) and resave managed environment settings as necessary.
- Relink enterprise policies to the environment as necessary. For example, [virtual network](./vnet-support-setup-configure.md#configure-your-power-platform-environment), [customer-managed keys](./customer-managed-key.md#manage-environments-encryption)
- Work with Microsoft Support to recreate Lockbox requests for the environment as necessary.
- [Reapply DLP policies](./prevent-data-loss.md) to the environment as necessary.
- [Readd the environment to an environment group](./environment-groups.md#add-environments-to-your-environment-group) as necessary.
- [Reapply pay-as-you-go plan](./pay-as-you-go-set-up.md#link-an-azure-subscription-to-an-environment) to the environment as necessary.
- [Repeat currency allocations](./capacity-add-on.md) for the environment as necessary.

### For components that are in solutions
#### Before geo-to-geo migration
1. [Export all solutions](/power-apps/maker/data-platform/export-solutions) if they contain any of the following components that don't support geo-to-geo migration:

> [!NOTE]
> Managed solutions aren't exported, but [ALM best practices](/power-platform/alm/overview-alm) ensure all managed solutions you own have an associated unmanaged solution that you can export as a managed solution.

- Canvas apps
- Custom pages
- Component libraries
- Custom connectors
- Dataflows
- Environment variables using data type "Data source"
- Connection references
- Chatbots

1. Delete all canvas apps, custom pages, and component libraries in the solutions you exported in step 1.

> [!IMPORTANT]
> Solution-aware canvas apps, custom pages, and component libraries that you don't delete from the environment before geo-to-geo migration are left in an inoperable state after the migration completes. You can't play, edit, or export them. You must delete them to unblock any further solution updates. They're restored upon solution import after geo-to-geo migration.

#### After geo-to-geo migration

Complete these steps in order:

1. Delete Chatbots. They're recreated upon solution import in the next step.
1. [Import all solutions](/power-apps/maker/data-platform/import-update-export-solutions) that were exported before geo-to-geo migration.
     - When prompted about **Connections**, make sure to **Review and adjust all connections** and recreate connections, as necessary.
     - When prompted about **Environment variables**, make sure environment variables are configured correctly.
1. For Power Pages sites, [delete the website host](/power-pages/admin/delete-website) then [reactivate the site](/power-pages/admin/reactivate-website).
1. For dataflows, depending on your connection, you might need to edit the dataflow and [reconfigure the connection](/power-query/dataflows/data-sources?tabs=power-bi-service#connect-to-a-data-source).
1. Cloud flows must be [reenabled](/power-automate/disable-flow#turn-on-a-flow) to restore functionality.

### For components that aren't in solutions
In general, it's recommended to create and add all components to solutions, and many components are added to a solution, by default. However, if you still have components that aren't in a solution, many of these components can be migrated with the following steps.

> [!NOTE]
> - [On-premises gateways](wp-onpremises-gateway.md) can't be migrated and must be manually reconfigured after geo-to-geo migration.
> - Connections can't be migrated and must be manually recreated after geo-to-geo migration. However, for connections used by canvas apps, cloud flows, or any solution-aware components, you're prompted to reconfigure them as part of the import processes for each of these components.

#### Custom connectors
[Custom connectors](/connectors/custom-connectors/) that aren't in solutions aren't supported for geo-to-geo migration. They can be downloaded as an OpenAPI JSON file, then recreated using the OpenAPI JSON file after geo-to-geo migration.

##### Before geo-to-geo migration
1. Open [Power Automate](https://make.powerautomate.com/).
1. Navigate to the **Custom Connectors** page.
1. Select the **Download** button next to the custom connector you want to download. This downloads an OpenAPI JSON file to your device.

##### After geo-to-geo migration
1. Open [Power Automate](https://make.powerautomate.com/).
1. Navigate to the **Custom Connectors** page.
1. Select **New custom connector**.
1. Select **Import an OpenAPI file** and select the OpenAPI JSON file that was downloaded in the **Before geo-to-geo migration** section.

#### Canvas apps
Canvas apps can exist outside of solutions. In order to retain canvas apps, they must be exported before geo-to-geo migration, and then imported after geo-to-geo migration.

##### Before geo-to-geo migration
[Export the canvas apps](/power-apps/maker/canvas-apps/export-import-app#exporting-a-canvas-app-package) that aren't in solutions.

##### After geo-to-geo migration
[Import the canvas apps](/power-apps/maker/canvas-apps/export-import-app#importing-a-canvas-app-package) that were exported in the **Before geo-to-geo migration** section.

#### Cloud flows
Cloud flows can exist outside of solutions. In order to retain cloud flows, they must be exported before geo-to-geo migration, and then imported after geo-to-geo migration.

##### Before geo-to-geo migration
[Export the cloud flows](/power-automate/export-import-flow-non-solution#export-a-flow-package) that aren't in solutions.

##### After geo-to-geo migration
[Import the cloud flows](/power-automate/export-import-flow-non-solution#import-a-flow) that were exported in the **Before geo-to-geo migration** section.

### Dynamics 365 applications
If you use any of the following Dynamics 365 apps, you need to take the following actions to retain functionality after geo-to-geo migration.

#### Dataverse Accelerator
##### After geo-to-geo migration
Uninstall the app using [PAC CLI](../developer/cli/introduction.md) with these commands:
```
pac solution delete --solution-name msdyn_DataverseAcceleratorApp --environment <environment URL>
pac solution delete --solution-name DataverseAccelerator --environment <environment URL>
pac solution delete --solution-name DataverseAccelerator_Anchor --environment <environment URL>
```

After uninstallation, [reinstall the app](/power-apps/maker/data-platform/dataverse-accelerator/dataverse-accelerator#install-the-dataverse-accelerator) through the Power Platform admin center.

#### Project for the web
##### After geo-to-geo migration
Project for the web is reprovisioned automatically when navigating to [Get started with Project](https://project.microsoft.com/). Your existing plans still remain intact.

#### Dynamics 365 marketing application (Customer Insights - Journeys)
##### Before geo-to-geo migration
Uninstall the Dynamics 365 marketing application using the following guide: [Uninstall Dynamics 365 Marketing](/dynamics365/customer-insights/journeys/uninstall).

##### After geo-to-geo migration
[Reinstall the Dynamics 365 marketing app](/dynamics365/customer-insights/journeys/setup) through the Power Platform admin center.

### Desktop applications
If you use any of the following Power Platform desktop applications, take the following actions to retain functionality after geo-to-geo migration.

#### Power Automate machine runtime
##### After geo-to-geo migration
If you selected the environment that's being migrated as your machine environment in the Power Automate machine runtime application, reselect the environment in the app after geo-to-geo migration.

## How the move works
You should follow the above steps before and after geo-to-geo migration. The following table describes what [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] does before, during, and after the geo-to-geo migration. 

|   |    Before the move   |  During the move | After the move |
|-----|------|---|----|
| **What Microsoft does** | Notification <br /><br /> Your support representative or Account Manager works with you to request a move and schedule it. | Cut-over <br /><br /> Cut-over times for each service depend on the number of users and the amount of data. This step can take 1 to 6 hours for smaller organizations, but might take up to 48 hours for large organizations. The cut-over is done during the evening or over a weekend. | Notification and support <br /><br /> You are alerted by email or telephone when your environment is migrated to the new datacenter.<br /><br /> After your environment migrates, you can perform the post migration steps. |

We adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
