---
title: Configure user security in an environment
description: Learn how to configure users' access to resources in a Microsoft environment.
ms.subservice: admin
ms.author: paulliew
author: paulliew
ms.reviewer: sericks
contributors:
  - hamenon-ms
  - shahzorkhan123
ms.custom:
  - "admin-security"
  - bap-template
ms.component: pa-admin
ms.topic: how-to
ms.date: 1/15/2025
search.audienceType: 
  - admin
---

# Configure user security in an environment

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can create security roles and then assign those roles (new or existing) to users whether or not they use Dataverse.

## Prerequisites

When you create a custom security role, the role must have a set of minimum privileges for a user to run an app. [Learn more about required minimum privileges](create-edit-security-role.md#minimum-privileges-for-common-tasks).

## Create, edit, or copy a security role

You can easily create, edit, or copy a security role and customize it to meet your needs.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment.

1. Select **Settings**.

1. Expand **Users + Permissions**.

1. Select **Security roles**.

1. Complete the appropriate task:

    - [Create a security role](#create-a-security-role)
    - [Edit a security role](#edit-a-security-role)
    - [Copy a security role](#copy-a-security-role)

### Create a security role

1. Select **New role** from the command bar.

1. In the **Role Name** field, enter a name for the new role.

1. In the **Business unit** field, select the business unit the role belongs to.

1. Select whether team members should inherit the role.

   If this setting is enabled and the role is assigned to a team, all team members inherit all privileges associated with the role.

1. Select **Save**.

1. [Define the privileges and properties of the security role](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).

### Edit a security role

Either select the role name or select the row and then select **Edit.** Then [define the privileges and properties of the security role](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role).

Some predefined [security roles can't be edited](database-security.md#environments-with-a-dataverse-database). If you try to edit these roles, the **Save** and **Save + Close** buttons aren't available.

### Copy a security role

Select the security role and then select **Copy**. Give the role a new name. [Edit the security role](#edit-a-security-role) as needed.

Only the privileges are copied, not any assigned members and teams.

### Audit security roles

[Audit security roles](audit-security-roles.md) to better understand changes made to security in your Power Platform environment.

## Create or configure a custom security role

If your app uses a custom entity, its privileges must be explicitly granted in a security role before your app can be used. You can either add these privileges in an existing security role or create a custom security role.

Every security role must include a [minimum set of privileges](create-edit-security-role.md#minimum-privileges-for-common-tasks). [Learn more about security roles and privileges](security-roles-privileges.md).

> [!TIP]
> The environment might maintain records used by multiple apps. You might need multiple security roles that grant different privileges. For example:
>
> - Some users (call them Editors) might only need to read, update, and attach other records, so their security role has read, write, and append privileges.
> - Other users might need all the privileges that Editors have plus the ability to create, append to, delete, and share. The security role for these users has create, read, write, append, delete, assign, append to, and share privileges.

### Create a custom security role with minimum privileges to run an app

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.
1. Select the **App Opener** role, and then select **Copy**.
1. Enter the name of the custom role, and then select **Copy**.
1. In the list of security roles, select the new role, and then select **More actions** (**&hellip;**) > **Edit**.
1. In the role editor, select the **Custom Entities** tab.
1. Find your custom table in the list, and select the **Read**, **Write**, and **Append** privileges.
1. Select **Save and Close**.

### Create a custom security role from scratch

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.
1. Select **New role**.
1. Enter the name of the new role on the **Details** tab.
1. On the other tabs, find your entity and then select actions and the scope for performing them.
1. Select a tab, and search for your entity. For example, select the **Custom Entities** tab to set permissions on a custom entity.
1. Select the privileges **Read**, **Write**, **Append**.
1. Select **Save and Close**.

## Assign security roles to users in an environment that has no Dataverse database

For environments with no Dataverse database, a user who has the Environment Admin role in the environment can assign security roles to individual users or groups from Microsoft Entra ID.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments**, then choose an environment.
1. In the **Access** tile, select **See all** for **Environment admin** or **Environment maker** to add or remove people for either role.

    :::image type="content" source="media/assign-security-role-nodb.png" alt-text="Screenshot of selecting a security role in the Power Platform admin center.":::
1. Select **Add people**, and then specify the name or email address of one or more users or groups from Microsoft Entra ID.
1. Select **Add**.

## Assign security roles to users in an environment that has a Dataverse database

Security roles can be assigned to individual users, [owner teams](manage-teams.md#types-of-teams), and [Microsoft Entra group teams](manage-group-teams.md). Before you assign a role to a user, [verify the user's account is added to and enabled in the environment](troubleshooting-user-needs-read-write-access-organization.md).

In general, a security role can only be assigned to users whose accounts are enabled in the environment. To assign a security role to a user account disabled in the environment, turn on **allowRoleAssignmentOnDisabledUsers** in OrgDBOrgSettings.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments**, then choose an environment.
1. In the **Access** tile, select **See all** under **Security roles**.

    :::image type="content" source="media/see-all-security-roles.png" alt-text="Screenshot of the option to view all security roles in the Power Platform admin center.":::
1. Make sure the correct business unit is selected in the list, and then select a role from the list of roles in the environment.
1. Select **Add people**, and then specify the name or email address of one or more users or groups from Microsoft Entra ID.
1. Select **Add**.
