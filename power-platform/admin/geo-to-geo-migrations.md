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
    - LaurentPepin
    - bfok123
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
> - There are important and critical preparation steps mentioned [below](#geo-to-geo-migration-steps) that need to be performed for Power Apps/Power Automate, etc. prior to the geo migration. If these steps are missed, it is difficult to recover Power Apps/Power Automate solutions.

### Supported environment types

| Supported | Not supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production environment</li></br><li>Migrating sandbox environment</li></br></ul> | <ul></br><li>Migrating default environment</li></br><li>Migrating Dataverse for Teams environment</li></br><li>Migrating trial environment</li></br><li>Migrating demo environment</li></br><li>Migrating developer environment</li></br><li>Migrating environment from GCC to another geo or from another geo to GCC</li></ul> |

## Impact of migrating
- Backups for the environment undergoing geo-to-geo migration will no longer available.
- Your organization URL will be changed. Each of the regional datacenters has a unique identifier in the URL. When your organization is moved from one regional datacenter to another this identifier changes. See [New datacenter regions](new-datacenter-regions.md).
- Your environment ID will be changed to a new globally unique identifier.

> [!NOTE]
> Organization URLs must be unique. If your organization domain name has already been reserved in the destination datacenter, it won't be available. In the unlikely event this happens, we work with you to decide how to proceed.  

## Geo-to-geo migration steps
> [!IMPORTANT]
> As support for geo-to-geo migration is limited, many Power Platform components, Dynamics 365 applications, and environment administration settings are impacted. It is vital for you to follow this section to retain functionality of certain features.

### For environment administration features
#### Before geo-to-geo migration
- [Managed environment](admin/managed-environment-overview.md#managed-environments-overview) status and associated settings will be lost (e.g. Admin Digest, Environment Routing). Take note of the managed environment status and associated settings so that you can re-apply these settings after geo-to-geo migration.
- Enterprise policy link state and associated properties will be lost (e.g. [customer-managed keys](./customer-managed-key.md), [Virtual Network](./vnet-support-overview.md)). Take note of any enterprise policies linked to the environment so that you can re-link the enterprise policies after geo-to-geo migration.
- [Lockbox](./about-lockbox.md) requests for the environment undergoing G2G will be lost or broken. If Microsoft Support needs access to your environment after geo-to-geo migration, a new Lockbox request must be created.
- [Data Loss Prevention (DLP) policies](wp-data-loss-prevention.md) that either include or exclude the environment undergoing geo-to-geo migration will no longer apply to the environment. Take note of the DLP policies which apply to the environment so that you can re-apply the policies after geo-to-geo migration.
- The environment undergoing geo-to-geo migration will be removed from its [environment group](./environment-groups.md). Take note of the environment group which the environment is in so that you can re-add the environment to the environment group after geo-to-geo migration.
- [Pay-as-you-go](./pay-as-you-go-overview.md) will be lost for the environment undergoing geo-to-geo migration. Take note of any Pay-as-you-go billing policies assigned to the environment that you would like to retain after geo-to-geo migration.
- [Currency allocations](./capacity-add-on.md) will be lost for the environment undergoing geo-to-geo migration. Take note of any currency allocations for the environment which you would like to retain after geo-to-geo migration.

#### After geo-to-geo migration
- [Re-enable managed environments](./managed-environment-enable.md) and re-save managed environment settings as necessary.
- Re-link enterprise policies to the environment as necessary, e.g. [virtual network](./vnet-support-setup-configure.md#configure-your-power-platform-environment), [customer-managed keys](./customer-managed-key.md#manage-environments-encryption)
- Work with Microsoft Support to recreate Lockbox request(s) for the environment as necessary.
- [Re-apply DLP policies](./prevent-data-loss.md) to the environment as necessary.
- [Re-add the environment to an environment group](./environment-groups.md#add-environments-to-your-environment-group) as necessary.
- [Re-apply Pay-as-you-go billing policies](./pay-as-you-go-set-up.md#second-link-an-azure-subscription-to-an-environment) to the environment as necessary.
- [Repeat currency allocations](./capacity-add-on.md) for the environment as necessary.

### For components that are in solutions
#### Before geo-to-geo migration
All solutions must [be exported](/power-apps/maker/data-platform/export-solutions) if they contain any of the below components which do not support geo-to-geo migration:
> [!NOTE]
> Managed solutions cannot be exported, but [ALM best practices](/power-platform/alm/overview-alm) ensure all managed solutions you own will have an associated unmanaged solution which you can export as a managed solution.
- Canvas apps
- Custom pages
- Component libraries
- Custom connectors
- Dataflows
- Environment variables using Data Type "Data source"
- Connection references
- Chatbots

#### After geo-to-geo migration
Complete the steps below in order:
1. Chatbots must be deleted. They will be recreated upon solution import in the next step.
2. All solutions which were exported before geo-to-geo migration must [be imported](/power-apps/maker/data-platform/import-update-export-solutions).
     - When prompted about **Connections**, make sure to **Review and adjust all connections** and recreate connections as necessary
     - When prompted about **Environment variables**, make sure environment variables are configured correctly
4. For Power Pages sites, [delete the website host](/power-pages/admin/delete-website) then [reactivate the site](/power-pages/admin/reactivate-website).
5. For dataflows, depending on your connection, you may need to edit the dataflow and [reconfigure the connection](/power-query/dataflows/data-sources?tabs=power-bi-service#connect-to-a-data-source).
6. Cloud flows must be [re-enabled](/power-automate/disable-flow#turn-on-a-flow) to restore functionality.

### For components that are not in solutions
In general, it is recommended to create and add all components to solutions, and many components are added to a solution by default. However, if you still have components that are not in a solution, many of these components can be migrated by following the below steps.

> [!NOTE]
> - [On-premises gateways](./admin/wp-onpremises-gateway.md) cannot be migrated and must be manually reconfigured after geo-to-geo migration.
> - Connections cannot be migrated and must be manually recreated after geo-to-geo migration. However, for connections which are used by canvas apps, cloud flows, or any solution-aware components, you will be prompted to reconfigure them as part of the import processes for each of these components.

#### Custom connectors
[Custom connectors](/connectors/custom-connectors/) that are not in solutions are not supported for geo-to-geo migration, but can be downloaded as an OpenAPI JSON file then recreated using the OpenAPI JSON file after geo-to-geo migration.

##### Before geo-to-geo migration
1. Navigate to [https://make.powerautomate.com/](https://make.powerautomate.com/)
2. Navigate to the **Custom Connectors** page
3. Click on the download button next to the custom connector you would like to download. This will download an OpenAPI JSON file to your device.

##### After geo-to-geo migration
1. Navigate to [https://make.powerautomate.com/](https://make.powerautomate.com/)
2. Navigate to the **Custom Connectors** page
3. Click on **New custom connector**
4. Click on **Import an OpenAPI file** and select the OpenAPI JSON file which was downloaded above.

#### Canvas apps
Canvas apps can exist outside of solutions. In order to retain canvas apps, they must be exported before geo-to-geo migration then imported after geo-to-geo migration.

##### Before geo-to-geo migration
[Export the canvas apps](/power-apps/maker/canvas-apps/export-import-app#exporting-a-canvas-app-package) that are not in solutions.

##### After geo-to-geo migration
[Import the canvas apps](/power-apps/maker/canvas-apps/export-import-app#importing-a-canvas-app-package) which were exported above.

#### Cloud flows
Cloud flows can exist outside of solutions. In order to retain cloud flows, they must be exported before geo-to-geo migration then imported after geo-to-geo migration.

##### Before geo-to-geo migration
[Export the cloud flows](/power-automate/export-import-flow-non-solution#export-a-flow-package) that are not in solutions.

##### After geo-to-geo migration
[Import the cloud flows](/power-automate/export-import-flow-non-solution#import-a-flow) which were exported above.

### Dynamics 365 applications
If you use any of the below Dynamics 365 apps, you will need to take the following actions to retain functionality after geo-to-geo migration.

#### Dataverse Accelerator
##### After geo-to-geo migration
Uninstall the app using [PAC CLI](developer/cli/introduction.md) with the below commands:
```
pac solution delete --solution-name msdyn_DataverseAcceleratorApp --environment <environment URL>
pac solution delete --solution-name DataverseAccelerator --environment <environment URL>
pac solution delete --solution-name DataverseAccelerator_Anchor --environment <environment URL>
```

After uninstallation, [re-install the app](/power-apps/maker/data-platform/dataverse-accelerator/dataverse-accelerator#install-the-dataverse-accelerator) via Power Platform admin center.

#### Project for the Web
##### After geo-to-geo migration
Project for the Web will be reprovisioned automatically when navigating to [https://project.microsoft.com/](https://project.microsoft.com/). Your existing plans will still remain intact.

#### Dynamics 365 Marketing Application (Customer Insights - Journeys)
##### Before geo-to-geo migration
Follow the [Uninstall Dynamics 365 Marketing](/dynamics365/customer-insights/journeys/uninstall) guide to uninstall Marketing app from the environment.

##### After geo-to-geo migration
[Reinstall the Dynamics 365 Marketing app](/dynamics365/customer-insights/journeys/setup) via Power Platform admin center.

### Desktop applications
If you use any of the below Power Platform desktop applications, you will need to take the following actions to retain functionality after geo-to-geo migration.

#### Power Automate machine runtime
##### After geo-to-geo migration
If you've selected the environment undergoing geo-to-geo migration as your machine environment in the Power Automate machine runtime application, you will need to reselect the environment in the Power Automate machine runtime app after geo-to-geo migration.

## How the move works  
You should follow the above steps before and after geo-to-geo migration. The following table describes what [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] does before, during, and after the geo-to-geo migration. 

|   |    Before the move   |  During the move | After the move |
|-----|------|---|----|
| **What Microsoft does** | Notification <br /><br /> Your support representative or Account Manager works with you to request a move and scheduling. | Cut-over <br /><br /> Cut-over times for each service depend on the number of users and the amount of data. This step can take 1 to 6 hours for smaller organizations, but may take up to 48 hours for large organizations. The cut-over is done during the evening or over a weekend. | Notification and support <br /><br /> You'll be alerted by email or telephone when your environment is migrated to the new datacenter.<br /><br /> After your geo has migrated you can perform the post migration steps. |

We adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.  

### Related information

[!INCLUDE[footer-include](../includes/footer-banner.md)]
