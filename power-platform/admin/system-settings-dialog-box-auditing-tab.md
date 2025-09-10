---
title: "System Settings Auditing tab"
description: Explains the environment settings available on the System Settings Auditing tab in Power Platform.
author: Mattp123
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/10/2025
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# System Settings Auditing tab

> [!IMPORTANT]
> This article describes how to use the classic settings experience for managing auditing. For information about the current experience, go to [Manage Dataverse auditing](manage-dataverse-auditing.md).

Enable auditing to track changes to your organization's data and maintain a log of changes. 
  
## Open the System Settings dialog box 
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Administration**.
 
4. Select **System Settings**, and then select the **Auditing** tab.  
    
|      Setting |     Description    |
|--------------------|---------------------|
| Start Auditing   | Default: Off. Start or stop auditing.    |
| Audit user access | Default: Off. If enabled, customer engagement apps (such as Dynamics 365 Sales and Customer Service) track when the user started accessing customer engagement apps and whether or not the user accessed the application by using the web application or Dynamics 365 for Outlook.  |  
| Start Read Auditing | Default: Off. Logs will be sent to the [Microsoft 365 Security and Compliance Center](https://protection.office.com/homepage). |

> [!NOTE]
> Enabling the **Start Read Auditing** setting is only applicable to [production environments and a Microsoft/Office 365 E1 or greater license](/power-platform/admin/enable-use-comprehensive-auditing). It also requires [enabling the table's auditing settings for **Single record auditing** and **Multiple record auditing**](/power-platform/admin/enable-use-comprehensive-auditing#enable-auditing).

Specify to audit specific areas of the product, as described in the following table. 

|Auditing area|Enable the start of auditing for these entities|  
|-------------------|-----------------------------------------------------|  
|**Enable Auditing in the following areas**||
|Common Entities|Account, Contact, Lead, Marketing List, Product, Quick Campaign, Report, Sales Literature, Security Role, and User|  
|Sales Entities|Competitor, Invoice, Opportunity, Order, and Quote|  
|Marketing Entities|Campaign|  
|Customer Service Entities|Article, Case, Client Feedback, Contract, and Service|  
  
### See also

[Dataverse developer guide: Configure auditing](/power-apps/developer/data-platform/auditing/configure)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
