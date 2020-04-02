---
title: "System Settings Auditing tab  | MicrosoftDocs"
description: System Settings Auditing tab 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/30/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# System Settings Auditing tab

Enable auditing to track changes to your organization's data and maintain a log of changes. 
  
## Open the System Settings dialog box (if it's not already open)  
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Product** > **Features**. Review the settings under **Auditing**. 
    
|      Settings      |                                                                                                                                                                  Description                                                                                                                                                                   |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Audit Settings** |                                                                                                                                                                                                                                                                                                                                                |
|   Start Auditing   |                                                                                                                                                            Start or stop auditing.                                                                                                                                                             |
| Audit user access  | If enabled, model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, tracks when the user started accessing model-driven apps in Dynamics 365 and whether or not the user accessed the application by using the web application or [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]. |
  
Specify to audit specific areas of the product, as described in the following table.  
  
|Auditing area|Enable the start of auditing for these entities|  
|-------------------|-----------------------------------------------------|  
|**Enable Auditing in the following areas**||
|Common Entities|Account, Contact, Lead, Marketing List, Product, Quick Campaign, Report, Sales Literature, Security Role, and User|  
|Sales Entities|Competitor, Invoice, Opportunity, Order, and Quote|  
|Marketing Entities|Campaign|  
|Customer Service Entities|Article, Case, Client Feedback, Contract, and Service|  
  
### See also  
 [Audit data and user activity](https://docs.microsoft.com/powerapps/developer/common-data-service/audit-user-access)
