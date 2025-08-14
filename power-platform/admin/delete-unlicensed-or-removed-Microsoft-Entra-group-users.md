---
title: Delete unlicensed or removed Microsoft Entra group users 
description: This article explains how to delete unlicensed or Microsoft Entra group users who are no longer in the group from an environment in Microsoft Power Platform admin center.
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

# Delete unlicensed or removed Microsoft Entra group members 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

There are different scenarios where a user’s status might be set to _disabled_, including the following scenarios:

-	When the app or license isn’t assigned to a Dataverse user. 

-	When you provision an environment without assigning a Microsoft Entra group, but you assign it to the environment later. In this case, all Dataverse users not in the Microsoft Entra group are set to disabled. 

-	When a user is removed from the Microsoft Entra group.


## Delete unlicensed or removed Microsoft Entra group users
There’s an organization setting which allows you to override the validation of the unlicensed or removed Microsoft group user’s active status so you can delete them.

1.	Install the [OrganizationSettingsEditor tool](environment-database-settings.md#install-the-organizationsettingseditor-tool).
1.	Locate and update the **AuthorizationSkipAadUserStateValidation** setting by running the editor.
1.	Set the option to **True**, as shown in [Override database settings](environment-database-settings.md#override-database-settings).

### Use the Delete disabled users feature

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Product** > **Features**.
1.	Scroll through the list and find the **Delete disabled users** area.
1.	Set the **Enable delete disabled users** setting to **On**.
1.	Select **Save**.

## Delete unlicensed or removed Microsoft Entra group users in bulk
You can delete multiple, unlicensed or removed Microsoft Entra group users using _bulk delete_.

## Soft-delete unlicensed or removed Microsoft Entra group users in bulk
_Soft-deleted_ users remain in the system with a disabled status. Learn more: [What happens when a user is soft deleted?](delete-users.md#what-happens-when-a-user-is-soft-deleted).

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the action bar. 
1.	Select the **Disabled users** option in the **Use saved view** dropdown list.
1.	Choose **+ Add row** to add another filter condition.
1.	Select **Azure AD Object ID** with a **Contains data** condition. This filter gives you the list of removed Microsoft Entra group users who are still active.
1.	Choose **+ Add row** to add another filter condition.
1.	Select **User licensed** with an **Equals** condition of **No**. This filter gives you the list of active users without a license. 
1.	Select **Next** and review the list of records to be soft-deleted.

    > [!Note]
    > The list of records may contain Microsoft Entra ID users who were permanently deleted from Microsoft Entra ID prior to June 2022. These users can also be deleted as unlicensed users. 
    Return to the query page and modify the filter to change the list of selected users. For example, select **+ Add row** to add more filters.
    
1.	Select **Next**.
1.	Enter a job **name** and select a **date and time** to schedule the deletion system job. Select **Next**.
1.	Select the email notification checkbox if you want to be notified when a job is complete. Select **Next**.
1.	Verify the query and the number of records to be deleted and select **Run bulk delete.**

## Review the status of a bulk delete job

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Audit and logs** > **System jobs**.
1.	Select a bulk delete job and review the results. The results show records in the **Successes** row that should match the number of records from your previous soft-deletion, system job.

### Review a Deleted user in the audit log

If you turned on [Dataverse auditing](manage-dataverse-auditing.md) in the environment and in the **User** table, you can see the list of soft-deleted users in the **Audit Summary** view. 

## Permanently delete unlicensed or removed Microsoft Entra group users in bulk
To permanently delete unlicensed or removed Microsoft Entra group users, the users must first be soft-deleted. See the [Prerequisites](delete-users.md#prerequisites) that must be met before these users can be permanently deleted.

1.	Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Environments**.
1.	Select a specific environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the action bar. 
1.	Select the **Soft Deleted Users** view in the **Use saved view** dropdown list.
1.	Select **Next** and review the list of records to be permanently deleted.
1.	Select **Next** again.
1.	Enter a **job name** and select a **date and time** to schedule the deletion system job. Select **Next**.
1.	Select the email notification checkbox if you want to be notified when job is completed. Select **Next**.
1.	Verify the query and the number of records to be deleted, and then select **Run bulk delete**.

[Review the job results](delete-stub-users.md#review-the-status-of-bulk-delete-job ) and verify that all soft-deleted, unlicensed or removed Microsoft Entra group users were permanently deleted.

### See also

[Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide&preserve-view=true) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
