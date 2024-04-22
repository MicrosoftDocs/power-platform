---
title: Delete stub users from an environment 
description: This article shows how to delete stub users from an environment in Microsoft Power Platform Admin center.
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.topic: conceptual
ms.date: 04/16/2024
search.audienceType: 
  - admin
---

# Delete stub users from an environment (Preview)
Stub user records are created as placeholder records in the user table. The records are typically imported from external systems during migration of those applications. The stub user records are created with a disabled status and assigned with a security role. These users can’t log into the Dataverse environment. For more information, see [how stub users are created](https://learn.microsoft.com/power-platform/admin/create-users#how-stub-users-are-created).

The stub users who are still active in the Microsoft Entra ID can be converted and activated as Dataverse users by mapping the stub users to the Microsoft Entra ID user. For stub users who are no longer in Microsoft Entra ID, they remain in disabled status. These disabled status stub [users can be deleted.](https://learn.microsoft.com/power-platform/admin/delete-users#delete-users-in-power-platform)

## How to delete disabled status stub users

Enable the Delete disabled users feature:
1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Product** > **Features**.
1.	Scroll through the list and to find the **Delete disabled users** area.
1.	Set the **Enable delete disabled users** setting to On.
1.	Select **Save**.

### Soft delete stub users

Soft deleted users remain in the system with a disabled status. See What happens when [a user is soft deleted](https://learn.microsoft.com/power-platform/admin/delete-users#what-happens-when-a-user-is-soft-deleted). 
You can manually [soft delete a stub user](https://learn.microsoft.com/power-platform/admin/delete-users#option-a-soft-delete-users-from-the-disabled-users-view).

1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select the **Disabled Users** in the **Filter**.
1.	Enter the stub user in the Search box.
1.	Select the user. 
1.	Select the **Delete** button to delete the user in the environment.

### Permanently delete stub users

To permanently delete stub users, the stub users must first be soft deleted. See other [requirements](https://learn.microsoft.com/power-platform/admin/delete-users#prerequisites) must be met before user can be permanently deleted.

You can manually permanently delete a stub user. 
1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select the **Disabled Users** in the **Filter**.
1.	Enter the stub user in the Search box.
1.	Select the user, then choose **Delete Permanently**. 
1.	Select **Delete** button to delete the user in the environment.

## Bulk delete stub users
You can delete multiple stub users using Bulk delete.  Soft deleted users remain in the system with a disabled status. See What happens when [a user is soft deleted]( https://learn.microsoft.com/power-platform/admin/delete-users#what-happens-when-a-user-is-soft-deleted).

Soft delete stub users in bulk.
1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the action bar. 
1.	Select the **Stub users** option in the **Use saved view** dropdown.
1.	Choose **Next** and review the list of records to be soft deleted.
   
**Note:** the list of records may contain Microsoft Entra ID users who were permanently deleted from Microsoft Entra ID prior to June 2022. These users can also be deleted as stub users. Choose the Back button to return to the query page and modify the filter to change the list of selected users. For example, select + Add row to add an additional filter.
1.	Choose **Next**.
1.	Enter a **job name** and select a **date and time** to schedule the deletion system job.
1.	Check the email notification box if you want to be notified when a job is completed.
1.	Verify the query and the number of records to be deleted and choose **Run bulk delete**.

## Review the status of bulk delete job
1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **System jobs**.
1.	Select the Bulk delete job and review the Results. The results show records in the **Successes** row that should match the number of records from your  previous soft deletion system job.
Review a Deleted user in the audit log
If you enabled [Dataverse Auditing](https://learn.microsoft.com/en-us/power-platform/admin/manage-dataverse-auditing) in the environment and in the User table, you can see the list of soft deleted users in the Audit Summary view. 

## Permanently delete stub users in bulk.
To permanently delete stub users, the stub users must first be soft deleted. See other [requirements](https://learn.microsoft.com/power-platform/admin/delete-users#prerequisites) must be met before stub users can be permanently deleted.

1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the action bar. 
1.	Select the **Soft Deleted Users** view in the **Use saved view** dropdown.
1.	Choose **Next** and review the list of records to be permanently deleted.
1.	Choose **Next** again.
1.	Enter a **job name** and select a **date and time** to schedule the deletion system job.
1.	Check the email notification box if you want to be notified when job is completed.
1.	Verify the query and the number of records to be deleted and select **Run bulk delete**.

[Review the job results](power-platform/admin/delete-stub-users.md#review-the-status-of-bulk-delete-job ) and verify that all soft deleted stub users were permanently deleted.

### See also

[Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide&preserve-view=true) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
