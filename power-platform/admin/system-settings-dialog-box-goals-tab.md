---
title: "System Settings Goals tab"
description: Legacy System Settings Goals tab in Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: admin
ms.date: 09/11/2025
ms.author: sericks
search.audienceType: 
  - admin
---
# System Settings Goals tab

<!-- Cannot find PPAC or modern D365 Sales equivalent.-->

Set the duration and frequency of the automatic rollup of goals. These settings only affect the automatic handling of all goals set in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). You can always perform a manual rollup for any goal at any time.  

<!-- legacy procedure -->
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. If you are using a Sales web application, go to **Settings** > **Administration** > **System Settings**, and then select the **Goals** tab.

   OR 

   If you are using the Sales Hub App, select the Site map icon ![Site map icon](media/site-map-icon.png "Site map icon"), then select ellipsis ![Ellipsis to open more options](media/ellipsis-more-options.png "Ellipsis to open more options") , then select **App Settings**, and then select **Goals Settings**.
  
  
|    Settings    |   Description     |
|-------------------|-----------------|
| **Set the roll-up expiration time and the roll-up frequency.** |  |
|     Days after the goal end date when the rollup will stop     | Set the number of days after the ending date of a goal for model-driven apps in Dynamics 365 to stop including a goal in a rollup. <br>**Default**: 30 days.|
|   Roll-up recurrence frequency    |   Set the number of hours between each goal rollup. <br>**Default**: 24 <br>**Limits**: Must be greater than or equal to 24 hours                                                    |
  
### See also  
 [Administrator and Sales Manager Guide](/dynamics365/sales-enterprise/admin-guide)  
 [Progress Against Goals report](/dynamics365/customerengagement/on-premises/basics/sales-insights-reports#progress-against-goals-report)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
