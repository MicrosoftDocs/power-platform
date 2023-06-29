---
title: "Recover database space by deleting audit logs  | MicrosoftDocs"
description: Recover database space by deleting audit logs
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/05/2022
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Recover database space by deleting audit logs

When you enable auditing, customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), store the change history for transactions in the form of audit logs in the database. You can delete the old or unwanted logs to clean up the database space.  
  
> [!CAUTION]
>  When you delete an audit log, you can no longer view the audit history for the period covered by that audit log.  
  
1. Make sure that you have the System Administrator permission.
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Audit and logs** > **Audit Log Management**.  
  
4. Select the oldest audit log. Then, on the command bar, choose **Delete Logs**.  
  
5. In the confirmation message, choose **OK**.  
  
   > [!NOTE]
   >  You can only delete the oldest audit log in the system. To delete more than one audit log, continue to delete the oldest audit log until you have deleted enough logs.  
  
### See also

[Manage Dataverse auditing](manage-dataverse-auditing.md)<br />
[Dataverse developer guide: Delete audit data](/power-apps/developer/data-platform/auditing/delete-audit-data)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
