---
title: "Delete users from Dynamics 365 environments | MicrosoftDocs"
description: Information about deleting users
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/04/2022
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Delete users

## Delete users from Microsoft 365 admin center

Users are deleted in the Microsoft 365 admin center as follows:

1. In the [Microsoft 365 admin center](https://admin.microsoft.com/), go to the **Users** > [**Active users**](https://go.microsoft.com/fwlink/p/?linkid=834822) page.

2. Select the names of the users you want to delete, and then select **Delete user**.

Although you deleted the user's account, you're still paying for the license. To stop paying for the license, follow the procedures in [Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide). Or, you can assign the license to another user. It won't be assigned to anyone automatically.

## About deleted users

When a user is deleted from the Microsoft 365 admin center, the user isn't removed from environments in which they're active. Instead, the user's status is set to **Disabled** in Dynamics 365.

The following lists the scenarios when a user is deleted:

- If the user is in the environment and has a status of **Enabled**, the status will be updated to **Disabled**.
- If the user is in the environment and has a status of **Disabled**, the status remains as **Disabled**.
- If the user isn't present in the environment, no action is taken.

It can take from 30 minutes to 6 hours for a user's status to be updated in an environment when the user is deleted from the Microsoft 365 admin center. If you need to update the user status immediately, you can follow the steps in [User diagnostics](troubleshooting-user-needs-read-write-access-organization.md#user-diagnostics) to see what needs to be done to restore the user.

> [!div class="mx-imgBorder"] 
> ![Run diagnostics results.](media/run-diagnostics.png "Run diagnostics results")

> [!NOTE]
> A user deleted from the Microsoft 365 admin center is put on the **Deleted user** list for 30 days and can be restored as directed in [Restore a user](/microsoft-365/admin/add-users/restore-user?view=o365-worldwide). 
> 
> After the 30-day window, the user account is permanently deleted by an automatic deletion process. If you want to delete the user permanently without waiting for 30 days, you can [permanently delete the user](/azure/active-directory/fundamentals/active-directory-users-restore) using Azure Active Directory (Azure AD) in the Azure portal. 

## View the list of disabled users

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. In the top menu bar, select **Manage users in Dynamics 365**. 

4. From the drop-down menu, select **Disabled users**. 

> [!NOTE]
> If a disabled user accesses Power Automate while the user is in the disabled state, the user will automatically be re-enabled in the environment.

## Restore deleted users

1. In the [Microsoft 365 admin center](https://admin.microsoft.com/), go to the **Users** > [**Deleted users**](https://go.microsoft.com/fwlink/p/?linkid=834822) page.

2. Select the name of the user you want to re-enable, select **Restore user**, and then proceed through various pages.

3. Reassign licenses as needed to the user in the Microsoft 365 admin center.

> [!NOTE]
> You can restore deleted users up to 30 days after deletion. When a deleted user is restored and a license is reassigned, the user's status is set to **Enabled** in the respective environments in which the user was disabled.

## Delete users from Dataverse

Users deleted from the [Microsoft 365 admin center](https://admin.microsoft.com/) can remain in the Dynamics 365 environment(s) with a **Disabled** status. These users can now be deleted permanently from the Dynamics 365 environment(s). Deleting users in the Dynamics 365 environment goes through the similar deletion stages as in Azure AD. When you first delete the user in the Dynamics 365 environment, the disabled user is first 'soft deleted' and then you can 'permanently delete' the user.

> [!NOTE]
> Not all users with a **Disabled** status can be deleted. A user can be in a **Disabled** status in Dynamics 365 environment and still be active in Azure AD. The user can be in this disabled state when the license was removed or the user was removed from the security group of the environment. The user can also be disabled by updating the Status field. Customizing the User form by allowing the Status field to be updated is required.

### Users flagged for soft delete in Dataverse

When a user is deleted from the [Microsoft 365 admin center](https://admin.microsoft.com/), Dataverse flags the user as ready for 'soft delete' state in the Dynamics 365 environment. The following fields are set:

- Status = **Disabled**.
- AzureState (internal) = **SoftDeleted**.
- DeletedState (internal) = **NotDeleted**.
- User Name = **user Azure AD objectID** + User Name.
- Internal email address = **user Azure AD objectID** + Internal email address.
- Windows LiveID = **user Azure AD objectID** + WindowsLiveId.
- Licensed = **false**.

> [!NOTE]
> The user cannot be deleted at this stage from Dataverse because the user can be restored from the [Microsoft 365 admin center](https://admin.microsoft.com/). When the user is restored, the user is automatically restored in the Dynamics 365 environment(s) with an **Enabled** status and the above fields are reset back to its original state.

## Soft delete users in Dataverse

To soft delete a user in a Dynamics 365 environment, the user must first be deleted permanently in Azure AD. This applies to regular users and not the [application users](manage-application-users.md#create-an-application-user) or [stub users](create-users.md#how-stub-users-are-created).  Users deleted from the [Microsoft 365 admin center](https://admin.microsoft.com/) are deleted permanently after 30-days or they can be [permanently deleted](/azure/active-directory/fundamentals/active-directory-users-restore#permanently-delete-a-user) manually. 

### Prerequisites to soft delete users in Dataverse

- All records owned by the user must be re-assigned to another user.
- The following user owned tables with only basic depth privilege must be re-assigned to another user:
  - UserForm
  - UserQueryVisualization
  - UserEntityUISettings
  - UserEntityInstanceData
  - ExchangeSyncIdMapping
  - UserQuery
  - UserApplicationMetadata
  - ActionCardUserSettings

## How to Soft delete users in Dataverse

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. In the top menu bar, select **Manage users in Dynamics 365**. 

4. From the drop-down menu, select **Disabled users**. 

5. Select a user from the list.

6. On the User Form, choose the **Delete** button.

### The following happens when a user is soft deleted:

- The User record still exists in the environment and continues to have a **Disabled** status.
- AzureState (internal) = **NotExistsOrHardDeleted.**
- DeletedState (internal) = **SoftDeleted.**
- The user cannot be restored.
- The user's security role is un-assigned.
- The user is removed from all Teams.

## Audit log after user is soft deleted

The name of the deleted user continues to show in the audit log records where the user was the creator or modifier of the record.

## How to permanently delete users in Dataverse

### View the list of soft deleted users

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. In the top menu bar, select **Manage users in Dynamics 365**. 

4. From the drop-down menu, select **Soft Deleted users**. 

5. Select a soft deleted user to delete the user permanently in the Dynamics 365 environment. Only users who were soft deleted can be deleted permanently.

6. On the User Form, choose the **Delete** button.

## Audit log after user is permanently deleted

The name of the deleted user no longer shows in the audit log records where the user was the creator or modifier the record. The name is replaced with  **(No Name)** in these audit records.


### See also
[Delete a user from your organization](/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide) <br />
[Troubleshooting: Common user access issues](troubleshooting-user-needs-read-write-access-organization.md)




[!INCLUDE[footer-include](../includes/footer-banner.md)]
