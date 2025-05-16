---
title: "System Settings Reporting tab | MicrosoftDocs"
description: Configure reporting settings for model-driven apps with the System Settings Reporting tab 
author: sericks007

ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/15/2025
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---

# System Settings Reporting tab

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Use the settings on this page to configure the reporting settings for model-driven apps in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).

<!-- legacy procedure -->

## Open the Reporting System Settings dialog box 

1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  

    Check your security role  

   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  

   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  

2. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Administration**.

4. Select **System Settings** > **Reporting** tab.  

|                     Settings                     |                                                                                                                                                                                                                                                                                                                                                                 Description                                                                                                                                                                                                                                                                                                                                                                  |
|--------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|          **Specify report categories**           |                                                                                                                                                                                     Default categories:<br /><br /> -   Sales reports<br />-   Service reports<br />-   Marketing reports<br />-   Administrative reports<br />**Note:**  If you add a new category or change existing categories, you should also change the default views available for the Report record type. Otherwise, users won't have a way to see all reports in the new categories.                                                                                                                                                                                     |
|                  Default value                   |                                                                                                                                                                                                                                                                                                                                               Unassigned. Select the default report category.                                                                                                                                                                                                                                                                                                                                                |
| **Set whether users can embed Power BI visuals** |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|      Allow Power BI visualization embedding      | Lets users embed [!INCLUDE[pn_power_bi_for_office_365_long](../includes/pn-power-bi-for-office-365-long.md)] visualizations on their personal dashboards.  A [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualization is a snapshot of the user's data, such as a chart, map, or aggregate number. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Add or edit Power BI visualizations on your dashboard](/powerapps/user/add-powerbi-dashboards). <br /><br />Default value: No. Users cannot embed [!INCLUDE[pn_power_bi_for_office_365_short](../includes/pn-power-bi-for-office-365-short.md)] visualizations on their personal dashboards. |

### See also

 [Use Power BI](/powerapps/user/find-admin)
 [System Settings dialog box - General tab](../admin/system-settings-dialog-box-general-tab.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
