---
title: "System Settings dialog box - Goals tab for Dynamics 365 apps | MicrosoftDocs"
description: ""
keywords: 
ms.date: 10/09/2018
ms.service:
  - crm-online
ms.topic: article
applies_to:
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
ms.assetid: 14c34660-19df-40cb-bf84-3878dcfa3787
author: jimholtz
ms.author: jimholtz
manager: annbe
ms.reviewer: 
ms.suite: 
ms.tgt_pltfrm: 
caps.latest.revision: 12
---

# System Settings dialog box - Goals tab

Set the duration and frequency of the automatic rollup of goals. These settings only affect the automatic handling of all goals set in Dynamics 365. You can always perform a manual rollup for any goal at any time.  

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. If you are using a Sales web application, go to **Settings** > **Administration** > **System Settings**, and then select the **Goals** tab.

   OR

   If you are using the Sales Hub App, select the Site map icon ![Site map icon](../sales-enterprise/media/site-map-icon.png "Site map icon"), then select ellipsis ![Ellipsis to open more options](../sales-enterprise/media/ellipsis-more-options.png "Ellipsis to open more options") , then select **App Settings**, and then select **Goals Settings**.
  
  
|                            Settings                            |                                                                                  Description                                                                                   |
|----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Set the roll-up expiration time and the roll-up frequency.** |                                                                                                                                                                                |
|     Days after the goal end date when the rollup will stop     | Default: 30 days. Set the number of days after the ending date of a goal for [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] to stop including a goal in a rollup. |
|                  Roll-up recurrence frequency                  |                                                      Default: 24 hours. Set the number of hours between each goal rollup.                                                      |
  
### See also  
 [Administrator and Sales Manager Guide](../sales-enterprise/admin-guide.md)  
 [Progress Against Goals report](../basics/sales-insights-reports.md#BKMK_ProgressGoals)
