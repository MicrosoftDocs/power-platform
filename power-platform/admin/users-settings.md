---
title: "Manage user settings as a Microsoft Power Platform administrator"
description: "Learn how to manage user settings and security roles when administering Microsoft Power Platform."
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/06/2023
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- adrianorth 
---
# User settings

Managing user settings can be done in the Power Platform admin center. Use the following steps to change user settings.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

2. Select **Settings** > **Users + permissions** > **Users**.  

3. Select the check mark to the left of a user name. 

4. Select a user setting from the top menu bar.

    |Setting  |Description  |
    |---------|---------|
    |Run diagnostics     | Access diagnostics on a user in an environment. See [User diagnostics](troubleshooting-user-needs-read-write-access-organization.md#user-diagnostics).    |
    |Manage security roles     | Assign security roles to control a user's access to data through a set of access levels and permissions. See [Assign a security role to a user](assign-security-roles.md).        |
    |Refresh user     | Re-sync the **User** page from Microsoft Entra ID.        |
    |Change position     | Specify the position that you want to assign a user. See [Hierarchy security to control access](hierarchy-security.md).   |
    |Change manager     | Specify the manager you want to assign to a user. See [Hierarchy security to control access](hierarchy-security.md).    |
    |Reassign records     | Assign all the records owned by the current user or team to a user or team.       |
    |Change business unit     | Change the business unit a user is assigned to. See [Change the business unit for a user](create-edit-business-units.md#change-the-business-unit-for-a-user).        |
    |Manage teams     | Add or remove a user from a team. See [Microsoft Dataverse teams management](manage-teams.md).        |
    |Change channel    | Change the release channel for a user which overrides the environment or app release channel. More information: [User channel override](user-channel-override.md).        |

### See also
[Create users](create-users.md)







[!INCLUDE[footer-include](../includes/footer-banner.md)]