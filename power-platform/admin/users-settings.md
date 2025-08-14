---
title: Manage user settings as a Microsoft Power Platform administrator
description: Learn how to manage user settings and security roles when administering Microsoft Power Platform.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/06/2023
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- adrianorth 
---

# User settings

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Manage user settings in the Power Platform admin center.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.

2. Select **Settings** from the navigation pane to see the **Tenant settings** page.  

3. Find a user name from the **Name** list and select the check mark near the name.

4. Select a user setting:

   | Setting | Description | For more information |
   | ------- | ----------- | -------------------- |
   | Run diagnostics | Access diagnostics on a user in an environment. | [User diagnostics](troubleshooting-user-needs-read-write-access-organization.md#user-diagnostics) |
   | Manage security roles | Assign security roles to users to control access to data, using access levels and permissions.| [Assign a security role to a user](assign-security-roles.md) |
   | Refresh user | Resync the **User** page from Microsoft Entra ID. | |
   | Change position | Assign a position to a user. | [Hierarchy security to control access](hierarchy-security.md) |
   | Change manager  | Assign a manager to a user. | [Hierarchy security to control access](hierarchy-security.md) |
   | Reassign records | Assign all records owned by the current user or team to another user or team. | |
   | Change business unit | Assign a different business unit to the user. | [Change the business unit for a user](create-edit-business-units.md#change-the-business-unit-for-a-user) |
   | Manage teams | Add or remove a user from a team. | [Microsoft Dataverse teams management](manage-teams.md) |
   | Change channel | Change the release channel for a user, overriding the environment or app release channel. | [User channel override](user-channel-override.md) |

## See also

[Create users](create-users.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
