---
title: Manage unified admin roles for finance and operations in Power Platform admin center
description: Learn how to manage unified admin roles for finance and operations in Power Platform admin center.
author: aayuagrawal
ms.component: pa-admin
ms.topic: how-to
ms.date: 02/18/2026
ms.subservice: admin
ms.author: aayuagrawal
ms.reviewer: ellenwehrle
search.audienceType: admin
---

# Manage unified admin roles in Power Platform admin center

This article provides an overview of the elements of unified admin role management in Finance and Operations in the Power Platform Admin Center. One of the major use cases for unified admin role management addresses scenarios where the environment admin role needs to be changed due to various reasons, such as the user leaving the company or losing their rights.

This feature is only available for environments with Finance and Operations Platform versions:

- PU70; Build version: 7.0.7778.44.
- PU71; Build version: 7.0.7858.12.

## Prerequisites for unified admin role management

Check if the flight is enabled for unified admin user updates in Finance and Operations. To check, go to the **users** page. Select **Admin**. You should see the button **Make Environment Admin** (either enabled or disabled). This button appears only if the flight is enabled. **Make Environment Admin** is disabled when the current user is environment admin and one can't make themselves the environment admin again. To see the **Make Environment Admin** button, enable the feature from the **Feature Management** page. If the flights are disabled, you can't enable the feature from the **Feature Management** page.

-\> Go to **System Administration** -\> **Workspace** -\> **Feature Management** page, select the **all** tab and enable **(Preview) Unified admin user management**.

:::image type="content" source="media/unified-admin-user-management/feature-management-page.png" alt-text="Shows the Feature Management page with the Unified admin user management feature state in preview":::

When you enable this feature, it syncs admins from Power Platform Admin Center (with direct role assignment) to Finance and Operations. It removes the admin role from users who are admin in Finance and Operations but not Power Platform admin center. So, it's recommended to enable this feature when you're ready to manage all your admins from Power Platform Admin Center and avoid making changes to admin users directly from Finance and Operations.

> [!TIP]
> Make changes to the environment admin only during downtime to avoid any active batch jobs or processes running with the context of the older admin, which could fail if the admin is changed in the middle.

## Manage the Finance and Operations environment admin user

Currently, one configuration file contains the email of the environment admin. When you create the environment for the first time, you mark that user as the admin. Any user with the user ID Admin is the environment admin. If there are no other system administrators in finance and operations in a particular environment, you can't remove the system administrator role from the environment admin. If another system administrator user exists in finance and operations and you delete the current environment admin user from Power Platform admin center, the system deletes the current environment admin user from finance and operations and assigns the environment admin role to another random system administrator user present at that time.

## Update the environment admin user

Use one of the following methods to update an environment admin:

- **Make Environment Admin**: Select the **Make environment admin** action. Assign the system admin role to a user and set that user as the environment admin. Take the following steps:

1.  Select any user in Finance and Operations with the system administrator role assigned. This user must be part of Entra ID in Power Platform admin center.
1.  Select **Make environment admin**.

- **Remove system administrator role in Power Platform admin center**: Go to Power Platform admin center and remove the system administrator role from the user who is the environment admin in Finance and Operations. When Power Platform admin center syncs this information to Finance and Operations, the system removes the system administrator role from the current environment admin and promotes any other system administrator to environment admin.

> [!NOTE]
>
> - An admin who signs in can't promote themselves as an environment admin. If they try to do so, an error is thrown: *Admins cannot promote themselves to environment administrator*. Any other system admin can make the signed-in user an environment admin, but the same user can't do that.
> - A disabled user can't become an environment admin.

## Create unified system admin user

Users in Power Platform admin center must be part of the Entra ID of the Finance and Operations tenant. According to security guidelines, you can't import any user who isn't part of Entra ID. If a user isn't part of Entra ID in Power Platform admin center and you assign the admin role to this user, they don't appear in Finance and Operations as part of admin unification.

To create a unified system admin user for finance and operations in Power Platform admin center, take the following steps:

1.  Create a user in Power Platform admin center.
1.  Assign the system administrator role to that user from manage roles.

The user is added to Finance and Operations with the system administrator and system user roles assigned. This operation is synchronous. The user can sign in to the environment as an admin after you complete this operation.

> [!NOTE]
> You can't create admin users from Finance and Operations.

## Remove unified system admin user

By design, removing the system administrator role from users in Power Platform admin center and Finance and Operations is an asynchronous operation.

To remove a unified system admin user for finance and operations in Power Platform admin center, take the following steps:

1.  Remove the user with the system administrator role from Power Platform admin center, which is present in both Power Platform admin center and Finance and Operations.

The system administrator role is removed from that user in Finance and Operations after some time. The rest of the roles assigned to that user stay the same.

> [!NOTE]
> You can't update admin users from Finance and Operations. If you try to delete the admin user from Finance and Operations, the user isn't deleted and an error message is displayed.

## Update unified system admin user details

Any role changes to admin users from Power Platform admin center are reflected in Finance and Operations for that admin user, as long as the user is present in Entra for the Finance and Operations tenant and isn't disabled. You can't update admin user details directly from Finance and Operations.

## Create unified system admin user for teams

To create unified system admin users for Teams in Power Platform admin center, take the following steps:

1. Go to Power Platform admin center.
1. Select **Manage** and then select **Environments**.
1. Select an Environment.
1. Select **Settings**. 
1. Expand **Users and permissions** and select **Teams**.
1. Select **Create team**. Fill out the *New team* form. Expand **Team type** and select **Owner** (use this type for finance and operations).
1. Add users as team members (as present in Entra).
1. Add the system administrator role to the team.

This process automatically creates all users in the team in Finance and Operations with the system administrator role and the system user role by default.

## Remove the system admin role from the team

When you remove the system admin role from the team, all users in that team lose the system admin role in Finance and Operations and keep only the system user role. This operation is asynchronous, and it might take some time for the user role to disappear in Finance and Operations after you remove the system admin role from the team in Power Platform admin center.

To remove the system admin role from the team, take the following steps:

1. Go to Power Platform admin center.
1. Select **Manage** and then select **Environments**.
1. Select an Environment.
1. Select **Settings**. 
1. Expand **Users and permissions** and select **Teams**.
1. Select the three dots next to the team that has the system admin role in Power Platform admin center and whose team users are already synced in Finance and Operations.
1. Remove the system admin role from the team.

All the team users in Finance and Operations lose the system admin role and keep only the system user role. Because this change is asynchronous, it might take some time for the user role to disappear.

> [!NOTE]
> If a user has a direct system admin role assigned and you remove the system admin role from the owner type in the Teams setting in Power Platform admin center that the user is part of, the system admin role isn't removed in Finance and Operations for that user. The user still has the system admin role if they're part of any other owner Team with the system admin role assigned.

## Add or remove team members

When you add a user to a team with the system admin role in Power Platform admin center, that user gets the system admin role in Finance and Operations. When you remove a user from a team with the system admin role in Power Platform admin center, that user loses the system admin role in Finance and Operations but keeps the system user role. This operation is asynchronous, and it might take some time for the user role to be updated in Finance and Operations after you add or remove the user from the team in Power Platform admin center.

Use these two methods to add or remove team members:

1.  Select a team in Power Platform admin center. The selection opens a new page. Add a new user to this team and assign the system admin role to the user as the team has the system admin role. Remove users as needed. The changes sync to Finance and Operations. Select the user and select **Remove**.

1.  Select **Manage Team members** in Power Platform admin center. Add or remove team members. The changes sync to Finance and Operations.

### Remove the user with admin role from a team

To remove the user from the team with the admin role, take the following steps:

1. Go to Power Platform admin center.
1. Select **Manage** and then select **Environments**.
1. Select an Environment.
1. Select **Settings**. 
1. Expand **Users and permissions** and select **Teams**.
1. Select the team.
1. Select the user within that team.
1. Select **Remove**.

The user loses the system admin role but keeps the system user role in Finance and Operations.

> [!NOTE]
> If you assign a direct system admin role to a user and remove the system admin role from the owner type Teams that the user is part of in Power Platform admin center, the system admin role isn't removed from that user in Finance and Operations. The user still has the system admin role if they're part of any other owner team with the system admin role assigned to the Team. 

## Delete the team

To delete the team from the Power Platform admin center, follow these steps:

1. Go to Power Platform admin center.
1. Select **Manage** and then select **Environments**.
1. Select an Environment.
1. Select **Settings**. 
1. Expand **Users and permissions** and select **Teams**.
1. Select the team.
1. Select **Delete**.

This action removes all the users from that team in Power Platform admin center. Also, in Finance and Operations, the system admin role assigned to the users as part of the team is removed, leaving only the system user role. However, if any user has a direct system admin role assigned, that user isn't impacted in Power Platform admin center and Finance and Operations.

## Known issues

### Team-based admin assignments aren't supported during initial sync

- **Issue**: Admin users assigned through **Teams** aren't included during the initial synchronization to Finance and Operations. Only admins assigned **directly to individual users** are synced during first-time ingestion.
- **Impact**: Users who are granted admin access through Teams don't appear as administrators in FinOps immediately after setup.
- **Guidance**: For initial configuration, assign admin roles directly to individual users in Power Platform admin center. After the initial sync completes, you can use team-based assignments.

### Removing users from Teams might not revoke admin access in Finance and Operations

- **Issue**: When you remove a user from a Team that has the **System Administrator** role, the admin role isn't always removed from the user in Finance and Operations.
- **Impact**: The user might continue to have administrator access in Finance and Operations even though you removed them from the Team in Power Platform admin center.
- **Guidance**: If you need to remove admin access immediately, remove the **System Administrator** role directly from the user in Power Platform admin center instead of relying only on Team membership changes.

### Environment admin changes through Teams setting might be inconsistent

- **Issue**: Updating the environment admin works reliably when you make changes at the **individual user level**. When **Team membership** drives environment admin changes, the behavior might be inconsistent - especially during automatic reassignment scenarios.
- **Impact**: The expected environment admin might not be updated correctly in Finance and Operations.
- **Guidance**: Manage environment admin changes directly on individual users in Finance and Operations rather than through Teams sync from Power Platform admin center to Finance and Operations.

###  Environment copy might create system admins who can't sign in to Finance and Operations

- **Issue**: When a system administrator in Power Platform admin center performs an **environment copy**, the process copies all system administrators from the source environment to the target environment.
- **Impact**: Although these users appear as system administrators in the target environment, some of them might be unable to sign in to the Finance and Operations instance and might receive sign-in errors.
