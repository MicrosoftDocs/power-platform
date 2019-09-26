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

To help you administer [!INCLUDE[pn_dyn_365_online](../includes/pn-crm-online.md)], you can assign users to manage [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] at the tenant level without having to assign the more powerful [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] global admin privileges.  
  
 Users with the [!INCLUDE[pn_dyn_365_online](../includes/pn-crm-online.md)] service admin role can:  
  
- Sign in to and manage  multiple [!INCLUDE[pn_dyn_365_online](../includes/pn-crm-online.md)] environments. If an environment uses a security group, a service administrator would need to be added to the security group in order to manage that environment.  
  
- Perform admin functions in [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] because they have the [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] system admin role. The service admin must be assigned a [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] license.  
  
A [!INCLUDE[pn_dyn_365_online](../includes/pn-crm-online.md)] service admin cannot do functions restricted to the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] global admin such as manage user accounts, manage subscriptions, access settings for [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] apps like [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] or [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
> [!NOTE]
> The [!INCLUDE[pn_dyn_365_online](../includes/pn-crm-online.md)] service admin can manage environments of version 8.1 ([!INCLUDE[pn_crm_8_1_0_online](../includes/pn-crm-8-1-0-online.md)]) or later.  
  
 ![Dynamics 365 service admin](../admin/media/dynamics-365-service-admin.png "Dynamics 365 service admin")  
  
 Here's a matrix of what's available with the various [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] roles.  
  
|Office 365 role / feature|Backup & restore|Sandbox copy|Configure new environments|Manage an environment|Add Dynamics 365 apps licenses|Access support requests|Access Service health|Access Message center|  
|--------------------------------|----------------------|------------------|-----------------------------|------------------------|-------------------------------|---------------------------------|-----------------------------|---------------------------|---------------------------|  
|Office 365 global admin|Yes|Yes|Yes|Yes|Yes|Yes|Yes|Yes|  
|Exchange admin|n/a|n/a|n/a|n/a|n/a|n/a|Yes|Yes|  
|Office 365 service admin|No|No|No|No|No|Yes|Yes|Yes|  
|Office 365 user|No|No|No|No|No|No|No|No|  
|Dynamics 365 service admin|Yes|Yes|Yes|Yes|No|Yes|Yes|Yes| 
|License administrator|No|No|No|No|Yes|No|No|No|  

> [!NOTE]
> For information on email approval, see [Approve email](connect-exchange-online.md#approve-email).

### See also  

