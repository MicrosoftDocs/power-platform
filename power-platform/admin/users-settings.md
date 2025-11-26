---
title: Manage user settings as a Microsoft Power Platform administrator
description: Learn how to manage user settings and security roles when administering Microsoft Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/26/2023
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
  - MichaelPDuda-Microsoft
  - adrianorth 
---

# User settings

Manage user settings in the Power Platform admin center.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. The **Environments** page is dispalyed.
1. Select an environment.
1. Select **Settings** from the command bar to view the **Settings** page.  
1. Expand the **Users + permissions** category and select **Users** to view the **Users** page.
1. Find a user name from the **Name** list and select the check mark near the name.
1. Select an option from the command bar:

   | Option | Description | For more information |
   | ------- | ----------- | -------------------- |
   | Run diagnostics | Access diagnostics on a user in an environment. | [User diagnostics](troubleshooting-user-needs-read-write-access-organization.md#user-diagnostics) |
   | Manage security roles | Assign security roles to users to control access to data, using access levels and permissions.| [Assign a security role to a user](assign-security-roles.md) |
   | Refresh user | Resync the **User** page from Microsoft Entra ID. | |
   | Change position | Assign a position to a user. | [Hierarchy security to control access](hierarchy-security.md) |
   | Change manager  | Assign a manager to a user. | [Hierarchy security to control access](hierarchy-security.md) |
   | Reassign records | Assign all records owned by the current user or team to another user or team. |[Reassign all records belonging to a user](update-record-owner.md#reassign-all-records-belonging-to-a-user) |
   | Change business unit | Assign a different business unit to the user. | [Change the business unit for a user](create-edit-business-units.md#change-the-business-unit-for-a-user) |
   | Manage teams | Add or remove a user from a team. | [Microsoft Dataverse teams management](manage-teams.md) |
   | Change channel | Change the release channel for a user, overriding the environment or app release channel. | [User channel override](user-channel-override.md) |

## Related content

[Create users](create-users.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
