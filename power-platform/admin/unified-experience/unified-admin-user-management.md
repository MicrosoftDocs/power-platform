---
title: Admin user management unification for finance and operations in Power Platform admin center (preview)
description: Learn about admin user management unification for finance and operations in Power Platform admin center and how to manage environment admin roles.
author: aayuagrawal
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/20/2026
ms.subservice: admin
ms.author: aayuagrawal
ms.reviewer: ellenwehrle
search.audienceType: admin
---

# Manage Finance and Operations environment admin users in Power Platform admin center (preview)

Admin user management unification for Finance and Operations in Power Platform admin center centralizes the creation, update, and removal of admin users through the Power Platform management layer, with user and role data mastered in Dataverse, and synchronizes the changes with Finance and Operations.

A common use case is changing the environment admin when the current admin leaves the organization or no longer has the required permissions. In the broader vision of unified user management, this capability represents a foundational step toward managing all administrative access through a single, unified control plane.

This feature is only available for environments running:
    
- Platform Update 71 (PU71) and above.
- Finance and Operations application version 10.0.47 (for example, 10.0.47 PQU2) or later.

This article covers the following supported scenarios:

- Environment admin (provisioning admin) management
- Unified system admin user creation
- Unified system admin user updates
- Unified system admin user removal
- Admin user management via teams (Owner type)


## Prerequisites

Before administering admin user management unification as a system admin, follow these steps to turn on **(Preview) Unified admin user management** in the Finance and Operations app:

1. Go to  **System administration** > **Workspace** > **Feature management**.
1. Select **All**.
1. Enable **(Preview) Unified admin user management**.

To confirm the unified admin user management feature is turned on, check that **Dataverse environment admins** are visible in the Finance and Operations app. This check confirms that admin users are now unified and synchronized from Dataverse into Finance and Operations.

> [!IMPORTANT] 
> After you turn on unified admin user management, the Power Platform admin center becomes the source of truth for admin roles. Users aren't removed from Finance and Operations during synchronization. However, admin roles that exist only in Finance and Operations (and not in Dataverse) are removed to prevent role drift.

:::image type="content" source="media/unified-admin-user-management/feature-management-page.png" alt-text="Shows the Feature Management page with the Unified admin user management feature.":::

> [!TIP]
> Change the environment admin only during downtime to avoid failures in active batch jobs or processes.

## Finance and Operations environment admin

Each Finance and Operations environment has a single environment admin. When you create the environment, designate a user as the environment admin (provisioning admin).

- The user with the user ID, *Admin*, is always the environment admin.
- If no other system administrator exists, you can't remove the environment admin role.
- If another system administrator exists and you remove the current environment admin from the Power Platform admin center, the system automatically promotes another system administrator.

You can update the environment admin user in two ways:

- [Make environment admin](#make-environment-admin-in-finance-and-operations-app)    
- [Remove system administrator role in Power Platform admin center](#remove-system-admin-role-in-power-platform-admin-center)

### Make environment admin in Finance and Operations app

To make a user the environment admin, take these steps in the Finance and Operations app:

1.  Select a *user* who has the **system administrator role**.
1.  Select **Make environment admin**.

### Remove system admin role in Power Platform admin center

To remove the system admin role , follow these steps in Power Platform admin center:

1. Select **Manage** and then select **Environments**.
1. Select the environment where you want to remove the system administrator role.
1. Select **Settings** and then expand **Users + permissions**.
1. Select **Users**.
1. Select the user and then select **Manage roles**.
1. Scroll to the **System administrator** role and clear the selection.
1. Select **Save**.

During synchronization, the system removes the role and promotes another system administrator automatically.

> [!NOTE]
>
> The provisioning (environment) admin can be removed only if there are **at least three System Administrators** in the environment. If fewer than three admins exist, the delete action isn't supported.

## Admin user teams management

Admin user management also supports *teams-based* assignments.

### Create an admin team

To create unified system admin users for teams, follow these steps in the Power Platform admin center:

1. Select **Manage** and then select **Environments**.
1. Select an environment.
1. Select **Settings**. 
1. Expand **Users and permissions** and select **Teams**.
1. Select **Create team**. Fill out the *New team* form. Expand **Team type** and select **Owner** (use this type for Finance and Operations).
1. Add users to the team.
1. Assign the **System administrator** role to the team.
1. Select **Save**.

This process sets up all team members as system administrators in Finance and Operations. The changes synchronize asynchronously.

### Remove the system admin role from the team

When you remove the system admin role from a team, all team members lose admin access in Finance and Operations unless they have the role assigned directly. The changes synchronize asynchronously.

To add or remove the system admin role from the team, follow these steps on the **Teams** settings page in the Power Platform admin center:

1. Select the three dots next to the team that has the system admin role.
1. Select **Manage security roles**.
1. Scroll to **System administrator** and then check or clear the system administrator selection.
1. Select **Save**.

### Add or remove team members

When you add a user to a team with the system administrator role, you grant admin access. When you remove a user from the team, the user loses admin access but keeps the system user role. The changes synchronize asynchronously.

To add or remove team members, follow these steps on the **Teams** settings page in the Power Platform admin center:

1. Select the three dots next to the team that has the system admin role.
1. Select **Manage Team members**.
1. Add or remove team members as needed.
1. Select **Save**.

:::image type="content" source="media/unified-admin-user-management/manage-unified-admin-team.png" alt-text="Shows the Teams settings page in the Power Platform admin center where you can manage unified admin teams.":::

### Not supported scenario

**Non-owner teams are not supported** in public preview. Only teams with **Team type = Owner** are supported for admin user management. Teams that other *types* can't be used to provision or manage system admin access.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]