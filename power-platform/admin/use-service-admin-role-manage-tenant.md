---
title: "Use the service admin role to manage your tenant   | MicrosoftDocs"
description: Use the service admin role to manage your tenant 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/16/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use the service admin role to manage your tenant 

To help you administer model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Dynamics 365 Customer Service, you can assign users to manage model-driven apps in Dynamics 365 at the tenant level without having to assign the more powerful [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] global admin privileges.  
  
 Users with the service admin role can:  
  
- Sign in to and manage multiple environments. If an environment uses a security group, a service administrator would need to be added to the security group in order to manage that environment.  
  
- Perform admin functions in model-driven apps in Dynamics 365 because they have the system admin role. The service admin must be assigned a license.  
  
A service admin cannot do functions restricted to the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] global admin such as manage user accounts, manage subscriptions, access settings for [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] apps like [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] or [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
> [!NOTE]
> The service admin can manage environments of version 8.1 ([!INCLUDE[pn_crm_8_1_0_online](../includes/pn-crm-8-1-0-online.md)]) or later.  
  
 ![Service admin](../admin/media/dynamics-365-service-admin.png "Service admin")  
  
 Here's a matrix of what's available with the various [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] roles.  
  
|Office 365 role / feature|Backup & restore|Sandbox copy|Configure new environments|Manage an environment|Add licenses|Access support requests|Access Service health|Access Message center|  
|--------------------------------|----------------------|------------------|-----------------------------|------------------------|-------------------------------|---------------------------------|-----------------------------|---------------------------|---------------------------|  
|Office 365 global admin|Yes|Yes|Yes|Yes|Yes|Yes|Yes|Yes|  
|Exchange admin|n/a|n/a|n/a|n/a|n/a|n/a|Yes|Yes|  
|Office 365 service admin|No|No|No|No|No|Yes|Yes|Yes|  
|Office 365 user|No|No|No|No|No|No|No|No|  
|Service admin|Yes|Yes|Yes|Yes|No|Yes|Yes|Yes| 
|License administrator|No|No|No|No|Yes|No|No|No|  

> [!NOTE]
> For information on email approval, see [Approve email](connect-exchange-online.md#approve-email).

### See also  

