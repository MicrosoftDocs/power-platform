---
title: "Geo to geo migrations  | MicrosoftDocs"
description: Geo to geo migrations
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/25/2020
ms.author: jimholtz
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

 The Geo Migration feature will allow customers to move their environments in a single tenant from one region to another. There are no user-interface changes or version changes as part of this move. In the case of an environment residing in an [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment in a single tenant, moving the Microsoft Dataverse environment doesn't move the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment; they are separate services. Your environment will still appear in your tenant alongside the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] environment.  

> [!IMPORTANT]
> - Support for geo migration is limited and generally not available.
> - To request a regional migration, please contact your account manager or see [Technical Support](get-help-support.md).  
> - Geo migrations are not supported into or out of US GCC, US GCC High, or China.
> - The Dynamics 365 Marketing app does not support geo migration, due to component dependencies. For more information, see [Manage your Dynamics 365 Marketing instances](https://docs.microsoft.com/dynamics365/marketing/manage-marketing-instances).
> - Geo migration is not supported for Microsoft Dataverse for Teams environments.

## Impact of migrating  
 Moving an environment to a different region changes your tenant to be multiregional - enabling regional features in the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)].  

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

 [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Direct sign in](sign-in-office-365-apps.md#BKMK_directsignin) and [Discover the URL for your organization using the Web API](https://docs.microsoft.com/powerapps/developer/common-data-service/webapi/discover-url-organization-web-api)

 For example, if your existing organization URL is https://myorg.crm<strong>5</strong>.dynamics.com and you request it to be moved to Australia, the new organization URL will be https://myorg.crm<strong>6</strong>.dynamics.com.  

 You'll need to update any direct references to your organization URL.  

> [!NOTE]
>  Organization URLs must be unique. If your organization name has already been reserved in the destination datacenter, it won't be available. In the unlikely event this happens, we will work with you to decide how to proceed.  

 To see the datacenter regions, go to [Where is my data?](https://o365datacentermap.azurewebsites.net/) and then click **Select Your Region**.  

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

