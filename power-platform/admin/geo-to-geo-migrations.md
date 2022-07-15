---
title: "Geo to geo migrations  | MicrosoftDocs"
description: Geo to geo migrations
author: matapg007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/13/2022
ms.subservice: admin
ms.author: matgupta 
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Geo to geo migrations

We continue to open new datacenter regions for business services, and to add datacenters to existing regions.  

 The Geo Migration feature will allow customers to move their environments in a single tenant from one region to another. There are no user-interface changes or version changes as part of this move. In the case of an environment residing in an [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment in a single tenant, moving the environment doesn't move the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment; they are separate services. Your environment will still appear in your tenant alongside the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment.  

> [!IMPORTANT]
> - Support for geo migration is limited and generally not available.
> - To request a regional migration, please contact your account manager or see [Technical Support](get-help-support.md).
> - After making a request, expect at least 10 days for the migration to be completed.  
> - Geo migrations are not supported into or out of US GCC, US GCC High, OCE, IND, or China.
> - The Dynamics 365 Marketing app does not support geo migration, due to component dependencies. For more information, see [Manage your Dynamics 365 Marketing instances](/dynamics365/marketing/manage-marketing-instances).
> - Geo migration is not supported for Microsoft Dataverse for Teams environments.
> - Dataverse organization linked to a Finance and Operations organization is not supported.

### Supported environment types

| Supported | Not supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production environment</li></br><li>Migrating sandbox environment</li></br></ul> | <ul></br><li>Migrating default environment</li></br><li>Migrating Dataverse for Teams environment</li></br><li>Migrating trial environment</li></br><li>Migrating demo environment</li></br><li>Migrating developer environment</li></br><li>Migrating environment from GCC to another geo or from another geo to GCC</li></ul> |

## Impact of migrating  
 Moving an environment to a different region changes your tenant to be multiregional - enabling regional features in the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)].  

> [!IMPORTANT]
> Once an environment is moved to the new region, prior backups of that environment are no longer available.

 The other significant change is to your organization URL. Each of the regional datacenters has a unique identifier in the URL. When your organization is moved from one regional datacenter to another this identifier will change. For example:  

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

 For example, if your existing organization URL is https://myorg.crm<strong>5</strong>.dynamics.com and you request it to be moved to Australia, the new organization URL will be https://myorg.crm<strong>6</strong>.dynamics.com.  

 You'll need to update any direct references to your organization URL.  

> [!NOTE]
>  Organization URLs must be unique. If your organization name has already been reserved in the destination datacenter, it won't be available. In the unlikely event this happens, we will work with you to decide how to proceed.  

See [Where your data is located](https://www.microsoft.com/trust-center/privacy/data-location).  

 The following topics have information that could be helpful to understand the move process:  

- [New datacenter regions](new-datacenter-regions.md)  
- [About Microsoft Cloud Australia](about-microsoft-cloud-australia.md)  
- [About Microsoft Cloud Canada](about-microsoft-cloud-canada.md)  
- [About the Microsoft Cloud Germany datacenter](about-microsoft-cloud-germany.md)
- [About Microsoft Cloud Japan](about-microsoft-cloud-japan.md)  
- [About Microsoft Cloud India](about-microsoft-cloud-india.md)  

## How the move works  
 You'll be provided with a list of prerequisites and post-requisites for your migration. The following table describes what [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] does before, during, and after your move. 

|   |    Before the move   |  During the move | After the move |
|-----|------|---|----|
| **What Microsoft does** | Notification <br /><br /> Your support representative or Account Manager will work with you to request a move and scheduling. | Cut-over <br /><br /> Cut-over times for each service depend on the number of users and the amount of data. This step can take 1 to 6 hours for smaller organizations, but may take up to 48 hours for large organizations. The cut-over is done during the evening or over a weekend.<br /><br /> There is a step that will require your involvement, which is to re-enter the encryption key. This can happen at a time that suits you but the migration process will be on hold until you complete this action. | Notification and support <br /><br /> You will be alerted by email or telephone when your environment is migrated to the new datacenter.<br /><br /> After your geo has migrated you can perform the post requisite steps - primarily changing your new URLs with any associated plugins or services. |

 We will adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.  

### See also  



[!INCLUDE[footer-include](../includes/footer-banner.md)]
