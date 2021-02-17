---
title: "Delete users | MicrosoftDocs"
description: Information about deleting users
author: jimholtz
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/16/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Delete users

Users are deleted in the Microsoft 365 admin center as follows:

1. In the [Microsoft 365 admin center](https://admin.microsoft.com/), go to the **Users** > [Active users](https://go.microsoft.com/fwlink/p/?linkid=834822) page.

2. Select the names of the users that you want to delete, select **More options** (...), and then select **Delete user**.

Although you deleted the user's account, you're still paying for the license. See the next procedure to stop paying for the license. Or, you can assign the license to another user. It won't be assigned to someone automatically. For more information, see [Delete a user from your organization](https://docs.microsoft.com/en-us/microsoft-365/admin/add-users/delete-a-user?view=o365-worldwide).

## About deleted users

When a user is deleted from the Microsoft 365 admin center, the user is not removed from environments in which they are active. Instead, the user's status is set to disabled in Dynamics 365.

The following lists the scenarios when a user is deleted:

- If the user is in the environment and has a status of **enabled**, the status will be updated to **disabled**.
- If the user is in the environment and has a status of **disabled**, the status remains as **disabled**.
- If the user is not present in the environment, there is no action taken.

It can take between 30 minutes to 6 hours for a user’s status to be updated in an environment when the user is deleted from the Microsoft 365 admin center.  If you need to update the user status immediately, you can following the steps below as outlined in [Troubleshooting: Common user access issues](troubleshooting-user-needs-read-write-access-organization.md).

Follow these steps to run user access diagnostics on a user in a Dataverse environment.

1. In the Power Platform admin center, select an environment.
2. Select **Settings** > **Users + permissions** > **Users**.
3. Select a **user**.
4. Select **Run diagnostics**.

<!-- Question for Paul, once user is deleted from M365 and shows up as disabled in D365, how to re-enable in D365? 
Diagnosis fails for disabled users -->

## About disabled users

When you view the **Users** page in the Power Platform admin center, you can see a list of enabled and disabled users. To view a list of disabled users, follow these steps:

1. In the Power Platform admin center, select an environment.

2. Select **Settings** > **Users + permissions** > **Users**.

3. In the top menu bar, select **Manage users in Dynamics 365**. 

4. From the drop-down menu, choose **Disabled users**. 

> [!NOTE]
> To delete or re-enable disabled users, contact [Support](support-overview.md).











