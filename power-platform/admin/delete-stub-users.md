---
title: Delete stub users from an environment 
description: This article shows how to delete stub users from an environment in Microsoft Power Platform admin center.
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.topic: concept-article
ms.date: 08/27/2024
search.audienceType: 
  - admin
---

# Delete stub users from an environment 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Stub user records are created as placeholder records in the user table. They're created to allow records to be imported from external systems during migration of those applications. Stub user records are created with a _disabled_ status and assigned with a security role. These users can’t log into the Dataverse environment. For more information, see [How stub users are created](create-users.md#how-stub-users-are-created). You can delete these stub users from the user table.


## Delete disabled status stub users

Complete the following steps to turn on the **Delete disabled users** feature.

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Product** > **Features**.
1.	Scroll through the list and to find the **Delete disabled users** area.
1.	Set the **Enable delete disabled users** setting to **On**.
1.	Select **Save**.

### Soft delete stub users

_Soft deleted users_ remain in the system with a disabled status. Learn more: [What happens when a user is soft deleted?](delete-users.md#what-happens-when-a-user-is-soft-deleted)

You can manually [soft delete a stub user](delete-users.md#option-a-soft-delete-users-from-the-disabled-users-view).

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Disabled Users** from the **Filter** list.
1.	Enter the stub user in the **Search** box.
1.	Select the user. 
1.	Select the **Delete** button to delete the user in the environment.

### Permanently delete stub users

To permanently delete stub users, the stub users must first be soft deleted. These [Prerequisites](delete-users.md#prerequisites) must be met before a user can be permanently deleted.

To manually permanently delete a stub user, complete the following steps.

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Disabled Users** from the **Filter** list.
1.	Enter the stub user in the **Search** box.
1.	Select the user, and then select **Delete Permanently**. 
1.	Select **Delete** to delete the user from the environment.

## Bulk delete stub users
You can delete multiple stub users using _bulk delete_.  Soft-deleted users remain in the system with a disabled status. Learn more: [What happens when a user is soft deleted?](delete-users.md#what-happens-when-a-user-is-soft-deleted)

To soft delete stub users in bulk, complete the following steps.
1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the command bar. 
1.	Select the **Stub users** option from the **Use saved view** dropdown list.
1.	Select **Next** and review the list of records to be soft deleted.
   
    > [!Note]
    > The list of records may contain Microsoft Entra ID users who were permanently deleted from Microsoft Entra ID prior to June 2022. These users can also be deleted as stub users. Select the **Back** button to return to the query page and modify the filter to change the list of selected users. For example, select **+ Add row** to add an additional filter.
  
1.	Select **Next**.
1.	Enter a **job name** and select a **date and time** to schedule the deletion system job. Select **Next**.
1.	Select the email notification checkbox if you want to be notified when a job is completed. Select **Next**.
1.	Verify the query and the number of records to be deleted, and then select **Run bulk delete**.

## Review the status of bulk delete job
1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Audit and logs** > **System jobs**.
1.	Select the bulk delete job and review the results. The results show records in the **Successes** row that should match the number of records from your previous soft deletion system job.
Review a deleted user in the audit log.

    If you enabled [Dataverse auditing](manage-dataverse-auditing.md) in the environment and in the **User** table, you can see the list of soft deleted users in the **Audit Summary** view. 

## Permanently delete stub users in bulk
To permanently delete stub users, the stub users must first be soft deleted. These [Prerequisites](delete-users.md#prerequisites) must be met before stub users can be permanently deleted.

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the command bar. 
1.	Select the **Soft Deleted Users** view in the **Use saved view** dropdown list.
1.	Select **Next** and review the list of records to be permanently deleted.
1.	Select **Next** again.
1.	Enter a **job name** and select a **date and time** to schedule the deletion system job. Select **Next**.
1.	Select the email notification checkbox if you want to be notified when a job is completed. Select **Next**.
1.	Verify the query and the number of records to be deleted, and then select **Run bulk delete**.

[Review the job results](delete-stub-users.md#review-the-status-of-bulk-delete-job) and verify that all soft deleted stub users were permanently deleted.

### See also

[Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide&preserve-view=true) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
