---
title: "View and take action on bulk deletion jobs  | MicrosoftDocs"
description: View and take action on bulk deletion jobs
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/15/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# View and take action on bulk deletion jobs

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

You can view the status of, pause, postpone, and resume a system job that you created using **Bulk Record Deletion**.  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Data management** > **Bulk deletion**.  
  
3. In the **Bulk Record Deletion** window, you can perform the actions described in the following table.  
  
   |To|Do this|  
   |--------|-------------|  
   |View status|Look in the **Status Reason** column.|  
   |View detailed status, including success and failure information|Select the bulk-deletion job.|  
   |View queries submitted for deletion|Select the bulk-deletion job, and then under **Information**, choose **Properties**.|  
   |Review the errors|Select the bulk-deletion job, and then under **Related**, choose **Failures**.|  
   |Pause a bulk-deletion job|1.  Select the bulk-deletion job, and then on the Actions menu, choose **Pause**.<br />2.  When the confirmation message appears, choose **OK**. **Note:**  Bulk deletion jobs of fewer than 1,000 records cannot be paused.|  
   |Postpone a bulk-deletion job|1.  Select the bulk-deletion job, and then on the Actions menu, choose **Postpone**.<br />2.  When the confirmation message appears, choose **OK**.|  
   |Resume a bulk-deletion job|1.  Select the bulk-deletion job, and then on the Actions menu, choose **Resume**.<br />2.  When the confirmation message appears, choose **OK**.|  
   |Cancel a bulk-deletion job|1.  Select the bulk-deletion job, and then on the Actions menu, choose **Cancel**.<br />2.  When the confirmation message appears, choose **OK**.|  
   |Modify recurrence of a bulk-delete job|1.  Select the bulk-deletion job, and then on the Actions menu, choose **Modify Recurrence**.<br />2.  If you select the **Run this job after every** check box, specify the interval after which you want the bulk-deletion job to run, and then choose **OK**.<br /><br /> If you select the **Run this job after every** check box when you create a bulk-deletion job, the job becomes recurring and is moved to the **Recurring Bulk Deletion System Jobs** view. You can only change the recurrence for these recurring bulk-deletion jobs.|  
  
### See also  
 [Delete bulk records](delete-bulk-records.md)
