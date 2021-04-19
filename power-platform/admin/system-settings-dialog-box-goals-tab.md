---
title: "System Settings Goals tab   | MicrosoftDocs"
description: System Settings Goals tab 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/10/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# System Settings Goals tab

Set the duration and frequency of the automatic rollup of goals. These settings only affect the automatic handling of all goals set in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). You can always perform a manual rollup for any goal at any time.  

<!-- legacy procedure -->
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. If you are using a Sales web application, go to **Settings** > **Administration** > **System Settings**, and then select the **Goals** tab.

   OR 

   If you are using the Sales Hub App, select the Site map icon ![Site map icon](media/site-map-icon.png "Site map icon"), then select ellipsis ![Ellipsis to open more options](media/ellipsis-more-options.png "Ellipsis to open more options") , then select **App Settings**, and then select **Goals Settings**.
  
  
|                            Settings                            |                                                                                  Description                                                                                   |
|----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Set the roll-up expiration time and the roll-up frequency.** |                                                                                                                                                                                |
|     Days after the goal end date when the rollup will stop     | Default: 30 days. Set the number of days after the ending date of a goal for customer engagement apps to stop including a goal in a rollup. |
|                  Roll-up recurrence frequency                  |                                                      Default: 24 hours. Set the number of hours between each goal rollup.                                                      |
  
### See also  
 [Administrator and Sales Manager Guide](/dynamics365/sales-enterprise/admin-guide)  
 [Progress Against Goals report](/dynamics365/customerengagement/on-premises/basics/sales-insights-reports#progress-against-goals-report)


[!INCLUDE[footer-include](../includes/footer-banner.md)]