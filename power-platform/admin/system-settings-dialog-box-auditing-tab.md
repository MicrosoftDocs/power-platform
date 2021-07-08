---
title: "System Settings Auditing tab  | MicrosoftDocs"
description: System Settings Auditing tab 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# System Settings Auditing tab

Enable auditing to track changes to your organization's data and maintain a log of changes. 
  
## Open the System Settings dialog box 
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** (![Settings](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Administration**.
 
4. Select **System Settings**, and then select the **Auditing** tab.  
    
|      Setting |     Description    |
|--------------------|---------------------|
| Start Auditing   | Default: Off. Start or stop auditing.    |
| Audit user access | Default: Off. If enabled, customer engagement apps (such as Dynamics 365 Sales and Customer Service) track when the user started accessing customer engagement apps and whether or not the user accessed the application by using the web application or Dynamics 365 for Outlook.  |  
| Start Read Auditing | Default: Off. Logs will be sent to the [Microsoft 365 Security and Compliance Center](https://protection.office.com/homepage). |

<!--
| Audit user access  | If enabled, customer engagement apps, such as Dynamics 365 Sales and Customer Service, tracks when the user started accessing customer engagement apps and whether or not the user accessed the application by using the web application or [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]. | 
-->

Specify to audit specific areas of the product, as described in the following table. 

|Auditing area|Enable the start of auditing for these entities|  
|-------------------|-----------------------------------------------------|  
|**Enable Auditing in the following areas**||
|Common Entities|Account, Contact, Lead, Marketing List, Product, Quick Campaign, Report, Sales Literature, Security Role, and User|  
|Sales Entities|Competitor, Invoice, Opportunity, Order, and Quote|  
|Marketing Entities|Campaign|  
|Customer Service Entities|Article, Case, Client Feedback, Contract, and Service|  
  
### See also  
 [Audit data and user activity](/powerapps/developer/common-data-service/audit-user-access)


[!INCLUDE[footer-include](../includes/footer-banner.md)]