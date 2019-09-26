---
title: "System Settings dialog box - Reporting tab for Dynamics 365 for Dynamics 365 apps  | MicrosoftDocs"
description: System Settings dialog box - Reporting tab for Dynamics 365 for Dynamics 365 apps
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# System Settings dialog box - Reporting tab

Use the settings on this page to configure reporting settings for model-driven apps in Dynamics 365. 

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)]  

## Open the Reporting System Settings dialog box (if it’s not already open)  

1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. [!INCLUDE[proc_settings_administration](../includes/proc-settings-administration.md)]  

3. Choose **System Settings** > **Reporting** tab.  

|                     Settings                     |                                                                                                                                                                                                                                                                                                                                                                 Description                                                                                                                                                                                                                                                                                                                                                                  |
|--------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|          **Specify report categories**           |                                                                                                                                                                                     Default categories:<br /><br /> -   Sales reports<br />-   Service reports<br />-   Marketing reports<br />-   Administrative reports **Note:**  If you add a new category or change existing categories, you should also change the default views available for the Report record type. Otherwise, users won't have a way to see all reports in the new categories.                                                                                                                                                                                     |
|                  Default value                   |                                                                                                                                                                                                                                                                                                                                               Unassigned. Select the default report category.                                                                                                                                                                                                                                                                                                                                                |
| **Set whether users can embed Power BI visuals** |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|      Allow Power BI visualization embedding      | Lets users embed [!INCLUDE[pn_power_bi_for_office_365_long](../includes/pn-power-bi-for-office-365-long.md)] visualizations on their personal dashboards.  A [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualization is a snapshot of the user's data, such as a chart, map, or aggregate number. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Add or edit Power BI visualizations on your dashboard](/dynamics365/customer-engagement/basics/add-edit-power-bi-visualizations-dashboard.md). <br /><br />Default value: No. Users cannot embed [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualizations on their personal dashboards. |

### See also  
 [Use Power BI with Microsoft Dynamics 365 apps](/dynamics365/customer-engagement/basics/find-administrator-support.md)   
 [System Settings dialog box - General tab](../admin/system-settings-dialog-box-general-tab.md)
