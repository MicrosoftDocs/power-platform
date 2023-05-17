---
title: "Delete users from environments | MicrosoftDocs"
description: Information about deleting users
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.topic: conceptual
ms.date: 05/17/2023
search.audienceType: 
  - admin
---
# Delete users from environment

This article covers the various levels and methods of user deletion in Microsoft Power Platform that involves the following: Microsoft 365 admin center, Azure Active Directory (Azure AD), and Power Platform admin center.

Watch this video for a detailed walkthrough of how to delete users from your environment:

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE5ddyh]

## Delete users in Microsoft 365 admin center

Admins must use the Microsoft 365 admin center to delete users:

1. Sign in to [Microsoft 365 admin center](https://admin.microsoft.com/).

1. Select **Users** > [**Active users**](https://go.microsoft.com/fwlink/p/?linkid=834822) page.

1. Select the names of the users you want to delete, and then select **Delete user**.

Although you deleted the user's account, you're still paying for the license. To stop paying for the license, follow the procedures in [Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide&preserve-view=true). Or, you can assign the license to another user. It won't be assigned to anyone automatically.

### About deleted users

When a user is deleted from the Microsoft 365 admin center, the user isn't removed from environments in which they're active. Instead, the user's status is set to **Disabled** in Power Platform.

The following lists the scenarios when a user is deleted:

- If the user is in the environment and has a status of **Enabled**, the status will be updated to **Disabled**.
- If the user is in the environment and has a status of **Disabled**, the status remains as **Disabled**.
- If the user isn't present in the environment, no action is taken.

It can take from 30 minutes to 6 hours for a user's status to be updated in an environment after the user is deleted from the Microsoft 365 admin center. If you need to update the user status immediately, you can follow the steps in [User diagnostics](troubleshooting-user-needs-read-write-access-organization.md#user-diagnostics) to see what needs to be done to restore the user.

> [!div class="mx-imgBorder"]
> ![Run diagnostics results.](media/run-diagnostics.png "Run diagnostics results")

> [!NOTE]
> A user deleted from the Microsoft 365 admin center is put on the **Deleted user** list for thirty days and can be restored as mentioned in next section.

### Restore deleted users

1. In the [Microsoft 365 admin center](https://admin.microsoft.com/), go to the **Users** > [**Deleted users**](https://go.microsoft.com/fwlink/p/?linkid=834822) page.

2. Select the name of the user you want to re-enable, select **Restore user**, and then proceed through various pages.

3. Reassign licenses as needed to the user in the Microsoft 365 admin center.

> [!NOTE]
> You can restore deleted users up to 30 days after deletion. When a deleted user is restored and a license is reassigned, the user's status is set to **Enabled** in the respective Power Platform environments in which the user was disabled.

## Permanently delete users in Azure AD

After the thirty-day window from the date you delete users in the Microsoft 365 admin center, the user account is permanently deleted in Azure AD by an automatic deletion process. 

If you want to permanently delete the user manually without waiting for thirty days when the user account is automatically deleted, you can do so by using the Azure AD option in the Azure portal by following the instructions here: [Permanently delete a user](/azure/active-directory/fundamentals/active-directory-users-restore#permanently-delete-a-user).

## Delete users in Power Platform

Users deleted from the [Microsoft 365 admin center](https://admin.microsoft.com/) can remain in Power Platform environments with a **Disabled** status. These users can be deleted permanently from Power Platform environments. Deleting users from Power Platform environments goes through the similar deletion stages as in Azure AD. When you first delete the user in the Power Platform environment, the disabled user is first *soft deleted*, and then you can *permanently delete* the user.

> [!IMPORTANT]
> - Not all users with a **Disabled** status can be deleted. A user can be in a **Disabled** status in Power Platform environment and still be active in Azure AD. The user can be in this disabled state when the license was removed or the user was removed from the security group of the environment. The user can also be disabled by updating the **Status** field. Customizing the User form by allowing the Status field to be updated is required.

### View the list of disabled users

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. In the top menu bar, select **Manage users in Dynamics 365**.

4. From the drop-down menu, select **Disabled users**.

### Disabled Azure AD user stages

<table>
<thead>
  <tr>
    <th>Stage</th>
    <th colspan="2">Microsoft 365 admin center</th>
    <th colspan="4">Power Platform admin center</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td></td>
    <td>Action</td>
    <td>State</td>
    <td>User state</td>
    <td>Action</td>
    <td>User delete</td>
    <td>Content</td>
  </tr>
  <tr>
    <td>1a</td>
    <td>Admin deletes user</td>
    <td>Soft deleted​   </td>
    <td>Disabled​</td>
    <td>User management process disables the user and updates the UPN, email, etc.</td>
    <td>Not allowed - Delete button is hidden </td>
    <td>User is soft deleted in Azure AD and can be restored. Once restored, the user is automatically reactivated in Dataverse.</td>
  </tr>
  <tr>
    <td>1b</td>
    <td>Admin restores user</td>
    <td>Active</td>
    <td>Active</td>
    <td>User management process activates user and restores UPN</td>
    <td>Not allowed - Delete button is hidden​ </td>
    <td>N/A </td>
  </tr>
  <tr>
    <td>2</td>
    <td>Admin permanently deletes user​ </td>
    <td>Hard deleted – user no longer exists in Azure AD</td>
    <td>Disabled</td>
    <td>User Details should check if user exists in Azure AD, and if user doesn’t exist, delete is allowed</td>
    <td>Allowed – Delete button is visible​ </td>
    <td>User is hard deleted in Azure AD and can't be restored. User can now be soft deleted in Dataverse.</td>
  </tr>
  <tr>
    <td>3</td>
    <td></td>
    <td></td>
    <td>Disabled</td>
    <td>Dataverse admin deletes the user </td>
    <td>Allowed – Delete button is visible</td>
    <td>User is soft deleted in Dataverse. User can now be permanently deleted in Dataverse.</td>
  </tr>
  <tr>
    <td>4</td>
    <td></td>
    <td></td>
    <td>Disabled</td>
    <td>Dataverse admin permanently deletes the user </td>
    <td>Allowed – Permanently Delete button is visible​</td>
    <td>User is deleted in Dataverse. User no longer exists in Dataverse, all references to the user in Dataverse in the Audit logs show ‘Not available’.</td>
  </tr>
</tbody>
</table>

### Soft delete users in Power Platform

At the Azure AD soft deleted stage, the user can't be deleted in Power Platform because the user can be restored from the [Microsoft 365 admin center](https://admin.microsoft.com/). When the user is restored, the user is automatically restored in Power Platform environments with an **Enabled** status and the above fields are reset back to its original state.

To soft delete a user in a Power Platform environment, the user must first be deleted permanently in Azure AD. This applies to regular users and not the [application users](manage-application-users.md#create-an-application-user) or [stub users](create-users.md#how-stub-users-are-created). Users deleted from the [Microsoft 365 admin center](https://admin.microsoft.com/) are deleted permanently after 30-days or they can be [permanently deleted](#permanently-delete-users-in-azure-ad) manually.

There are two ways to soft delete users.

#### Option A: Soft delete users from the Disabled users view

1. Permanently delete the user in Azure Active Directory. Go to [Permanently delete users in Azure AD](#permanently-delete-users-in-azure-ad) earlier in this article.

2. In the Power Platform admin center, select an environment.

3. Select **Settings** > **Users + permissions** > **Users**.

4. In the top menu bar, select **Manage users in Dynamics 365**.

5. From the drop-down menu, select **Disabled users**.

6. Select a user from the list.

7. On the User Form, choose the **Delete** button.

The user still exists in the environment as disabled and continues to show in the Disabled Users list. To permanently delete from the environment, go to [Permanently delete users in Power Platform](#permanently-delete-users-in-power-platform) later in this article.

#### Option B: View and soft delete disabled users who were permanently deleted from Azure AD

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. From the top menu bar, select **Filter**.

   :::image type="content" source="media/filteruser.png" alt-text="Select Filter from the top menu.":::

4. From the drop-down menu, select **Users not in AAD but exist in the environment**.

5. Select the disabled user you want to delete.

6. On the User Form, select **Delete**.

7. Select **Refresh list** to update the list and confirm deletion.

> [!NOTE]
> All records that are owned by the soft deleted user must first be reassigned to another user before the user record can be permanently deleted. You can reassign the records from the same **User details** panel under the **Manager** section.

### What happens when a user is soft deleted?

- The user record still exists in the environment and continues to have a **Disabled** status.
- The user can't be restored.
- The user's security role is unassigned.
- The user is removed from all teams.
- The user's queue, profile, business unit entity map, shared records (principal object access), principal entity business unit map, and system user principal records are deleted.

#### Audit log after user is soft deleted

The name of the deleted user continues to show in the audit log records where the user was the creator or modifier of the record.

### Permanently delete users in Power Platform

You can delete and remove users with disabled status in Power Platform. You may want to delete users with disabled status because of the following reasons: 

- They are no longer active in the tenant
- They moved out of the environment’s security group
- They no longer have a license to use the application
- To comply with regulatory compliance, such as GDPR

#### Prerequisites

- The user must already be soft deleted. See [Soft delete users in Power Platform](#soft-delete-users-in-power-platform) earlier in this article.
- All records owned by the user must be reassigned to another user. User records can be reassigned from the [User settings page](users-settings.md).
- You must have turned on the **Delete disabled users (preview)** > **Enable delete disabled users** feature setting for your environment using the Power Platform admin center. More information: [Manage feature settings](settings-features.md).

#### How to permanently delete users

1. In the [Power Platform admin center](https://aka.ms/ppac), select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. From the top menu bar, select **Filter**.

   :::image type="content" source="media/filteruser.png" alt-text="Select Filter from the top menu.":::

4. From the drop-down menu, select **Users not in AAD and soft deleted in the environment**.

5. Select a soft deleted user to delete the user permanently in the Power Platform environment. Only users who were soft deleted can be deleted permanently.

6. On the user form, select **Delete**.

7. Select **Refresh list** to update the list and confirm deletion.

#### Audit log after user is permanently deleted

Once permanently deleted, the name of the deleted user no longer shows in the audit log records when the user was the owner, creator, or modifier of the record. For the record owner, the name is replaced with  **Record Unavailable** in these audit records. For the record creator or modifier, the name is replaced with  **No Name** in these audit records.

#### Created by and Modified by name

Once permanently deleted, the name of the deleted user no longer shows in the **Created by** and the **Modified by** fields for records that the deleted user created and for records that the deleted user last modified. These fields will show **No Name** and if you clicked on it, you will see a message that the 'Record is unavailable'. The deleted user's systemuserid is still in these records.

## Bulk delete users in Power Platform

Users with a disabled status can be deleted, in bulk, using the [Remove a large amount of specific, targeted data with bulk deletion](delete-bulk-records.md) article. You can create bulk delete jobs to [soft delete](#soft-delete-users-in-power-platform) and to [permanently delete users](#permanently-delete-users-in-power-platform).

### To soft delete users in Power Platform in bulk

1. In the [Power Platform admin center](https://aka.ms/ppac), select an environment.
2. Select **Settings** > **Data management** > **Bulk deletion**.
3. Select **New** to start the **Bulk Deletion Wizard**, which creates a bulk deletion job with the soft delete users you want to delete.
4. Click **Next**.
5. In the **Look for** drop-down menu, select the **Users** table.
6. In the **Use Saved View** drop-down menu, select the **Users deleted in tenant but exist in the environment** view.
7. Select the **Preview Records** button to see the list of users that can be soft deleted.
8. Select **Next**.
9. In the **Name** field, enter a name for your bulk deletion job.
10. Select a date and time to start the job.
11. **Optional**: Select the **Run this job after every** check box and set a frequency (in days).

    > [!Note]
    > We recommend that you set this option to soft delete your users on a scheduled basis, as soft deleting users is where most of your storage costs can be saved.
    
12. Select **Next**.
13. Review the information and select **Submit**.

To check the status of your job, select the **My bulk deletion system jobs** view.

### To permanently delete users in Power Platform in bulk

1. In the [Power Platform admin center](https://aka.ms/ppac), select an environment.
2. Select **Settings** > **Data management** > **Bulk deletion**.
3. Select **New** to start the **Bulk Deletion Wizard**, which creates a bulk deletion job with the soft delete users you want to delete.
4. Click **Next**.
5. In the **Look for** drop-down meanu, select the **Users** table.
6. In the **Use Saved View** drop-down menu, select the **Soft deleted Users** view.
7. Select the **Preview Records** button to see the list of users that can be permanently deleted.
8. Select **Next**.
9. In the **Name** field, enter a name for your bulk deletion job.
11. Select a date and time to start the job.
    
    > [!Note]
    > We recommend that you set this schedule based on your record retention policy.
   
12. Select **Next**.
13. Review the information and select **Submit**.

To check on the status of your job, select the **My bulk deletion system jobs** view.

### See also

[Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide&preserve-view=true) <br />
[Troubleshooting: Common user access issues](troubleshooting-user-needs-read-write-access-organization.md) <br />

[!INCLUDE[footer-include](../includes/footer-banner.md)]
