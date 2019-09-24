---
title: "System Settings dialog box - Auditing tab for Dynamics 365 apps | MicrosoftDocs"
ms.custom: 
ms.date: 10/30/2017
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
ms.assetid: 97b968aa-18d0-4ada-8c80-0975d61f844a
caps.latest.revision: 21
author: jimholtz
ms.author: jimholtz
manager: brycho
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# System Settings dialog box - Auditing tab

Enable auditing to track changes to your organization’s data and maintain a log of changes. 

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)]  
  
## Open the System Settings dialog box (if it’s not already open)  
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. [!INCLUDE[proc_settings_administration](../includes/proc-settings-administration.md)]  
  
3. Choose **System Settings** > **Auditing** tab.  
  
|      Settings      |                                                                                                                                                                  Description                                                                                                                                                                   |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Audit Settings** |                                                                                                                                                                                                                                                                                                                                                |
|   Start Auditing   |                                                                                                                                                            Start or stop auditing.                                                                                                                                                             |
| Audit user access  | If enabled, [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps tracks when the user started accessing [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps and whether or not the user accessed the application by using the web application or [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]. |
  
Specify to audit specific areas of the product, as described in the following table.  
  
|Auditing area|Enable the start of auditing for these entities|  
|-------------------|-----------------------------------------------------|  
|**Enable Auditing in the following areas**||
|Common Entities|Account, Contact, Lead, Marketing List, Product, Quick Campaign, Report, Sales Literature, Security Role, and User|  
|Sales Entities|Competitor, Invoice, Opportunity, Order, and Quote|  
|Marketing Entities|Campaign|  
|Customer Service Entities|Article, Case, Client Feedback, Contract, and Service|  
  
### See also  
 [Audit data and user activity](/dynamics365/customer-engagement/developer/audit-user-access.md)
