---
title: Delete unlicensed or removed Microsoft Entra group users (preview)
description: This article explains how to delete unlicensed or Microsoft Entra group users who are no longer in the group from an environment in Microsoft Power Platform admin center.
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.topic: conceptual
ms.date: 04/24/2024
search.audienceType: 
  - admin
---

# Delete unlicensed or removed Microsoft Entra group members (preview)
[This article is prerelease documentation and is subject to change.]

There are different scenarios where a user’s status might be set to _disabled_, including the following scenarios:

-	When the app or license isn’t assigned to a Dataverse user. 

-	When you provision an environment without assigning a Microsoft Entra group, but you assign it to the environment later. In this case, all Dataverse users not in the Microsoft Entra group are set to disabled. 

-	When a user is removed from the Microsoft Entra group.

> [!Important]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Delete unlicensed or removed Microsoft Entra group users
There’s an organization setting which allows you to override the validation of the unlicensed or removed Microsoft group user’s active status so you can delete them.

1.	Install the [OrganizationSettingsEditor tool](environment-database-settings.md#install-the-organizationsettingseditor-tool).
1.	Locate and update the **AuthorizationSkipAadUserStateValidation** setting by running the editor.
1.	Set the option to **True**, as shown in [Override database settings](environment-database-settings.md#override-database-settings).

### Use the Delete disabled users feature

1.	Go to the Power Platform admin center.
2.	In the navigation pane, select **Environments**.
3.	Select a specific environment.
1.	Select **Settings** > **Product** > **Features**.
1.	Scroll through the list and to find the **Delete disabled users** area.
1.	Set the **Enable delete disabled users** setting to On.
1.	Select **Save**.

## Delete unlicensed or removed Microsoft Entra group users in bulk
You can delete multiple unlicensed or removed Microsoft Entra group users, using Bulk delete.

## Soft-delete unlicensed or removed Microsoft Entra group users in bulk
Soft deleted users remain in the system with a disabled status. See What happens when [a user is soft deleted]( https://learn.microsoft.com/power-platform/admin/delete-users#what-happens-when-a-user-is-soft-deleted).

1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the action bar. 
1.	Select the **Disabled users** option in the **Use saved view** dropdown.
1.	Choose **+ Add row** to add another filter condition.
1.	Select **Azure AD Object ID** with a **Contains data** condition. This filter gives you the list of removed Microsoft Entra group users who are still active.
1.	Choose **+ Add row** to add another filter condition.
1.	Select **User licensed** with an **Equals** condition of **No**. This filter gives you the list of active users without a license. 
1.	Choose **Next** and review the list of records to be soft-deleted.

    **Note:** the list of records may contain Microsoft Entra ID users who were permanently deleted from Microsoft Entra ID prior to June 2022. These users can also be deleted as unlicensed users. 
    Return to the query page and modify the filter to change the list of selected users. For example, select **+ Add row** to add an additional filter.
1.	Choose **Next**.
1.	Enter a job **name** and select a **date and time** to schedule the deletion system job.
1.	Check the **email notification** box if you want to be notified when a job is complete.
1.	Verify the query and the number of records to be deleted and choose **Run bulk delete.**

## Review the status of bulk delete job
1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Audit and logs** > **System jobs**.
1.	Select the Bulk delete job and review the Results. The results show records in the **Successes** row that should match the number of records from your  previous soft deletion system job.

### Review a Deleted user in the audit log
If you enabled [Dataverse Auditing](https://learn.microsoft.com/en-us/power-platform/admin/manage-dataverse-auditing) in the environment and in the User table, you can see the list of soft deleted users in the Audit Summary view. 

## Permanently delete unlicensed or removed Microsoft Entra group users in bulk
To permanently delete unlicensed or removed Microsoft Entra group users, the users must first be soft deleted. See other [requirements](https://learn.microsoft.com/power-platform/admin/delete-users#prerequisites) must be met before these users can be permanently deleted.

1.	In the Power Platform admin center, select an environment.
1.	Select **Settings** > **Users + Permissions** > **Users**.
1.	Select **Bulk delete** from the action bar. 
1.	Select the **Soft Deleted Users** view in the **Use saved view** dropdown.
1.	Choose **Next** and review the list of records to be permanently deleted.
1.	Choose **Next** again.
1.	Enter a **job name** and select a **date and time** to schedule the deletion system job.
1.	Check the email notification box if you want to be notified when job is completed.
1.	Verify the query and the number of records to be deleted and select **Run bulk delete**.

[Review the job results](power-platform/admin/delete-stub-users.md#review-the-status-of-bulk-delete-job ) and verify that all soft deleted unlicensed or removed Microsoft Entra group users were permanently deleted.

### See also

[Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide&preserve-view=true) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
