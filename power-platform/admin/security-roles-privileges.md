---
title: Security roles and privileges
description: Learn how to control access to data and resources with security roles and associated privileges.
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.custom: bap-template, NEWPPAC
ms.topic: concept-article
ms.date: 06/03/2025
ms.contributors:
  - lsuresh
contributors:
  - srpoduri 
  - shahzorkhan123
  - lavanyapg

---

# Security roles and privileges

To control who can access restricted or sensitive data and resources and what they can do with them, assign users to security roles. This article provides an overview of security roles and their associated privileges.

You can assign security roles using the [new, modern UI](#security-roles-and-the-new-modern-ui), or the [legacy UI](#security-roles-and-the-legacy-ui).

## Security roles and the new, modern UI

Security roles define how different users access different types of records. To control access to data and resources, you can create or modify security roles and change the security roles that are assigned to users.

A user can have multiple security roles. Security role privileges are cumulative. Users are granted the privileges that are available in each role assigned to them.

### View a list of security roles in an environment

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** in the command bar. The **Settings** page for that environment is displayed.
1. Select **Users + Permissions** > **Security roles**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.

---

### Define the privileges and properties of a security role

After you [created a security role](create-edit-security-role.md#create-a-security-role) or while you're [editing one](create-edit-security-role.md#edit-a-security-role), set the **Member's privilege inheritance** option:

- **Team privileges only**: A user is granted these privileges as a member of a team. Team members who don't have user privileges of their own can create records with the team as the owner. They can access records that the team owns if they're given the **User** access level for Create and Read privileges.

- **Direct User (Basic) access level and Team privileges**: A user is granted these privileges directly when the security role is assigned. Users can create records with themselves as the owner. They can access records that they created or owned when the **User** access level for Create and Read privileges was given to them. This setting is the default for new security roles.

Then, configure the privileges associated with the security role.

A security role consists of record-level privileges and task-based privileges of the following three types:

- **Tables:** Table privileges define which tasks a user with access to a table record can do, such as Read, Create, Delete, Write, Assign, Share, Append, and Append To. *Append* means to attach another record, such as an activity or note, to a record. *Append to* means to be attached to a record. [Set table privileges](#table-privileges).

- **Miscellaneous privileges:** These task-based privileges give a user permission to perform specific, miscellaneous (non-record) tasks, such as publish articles or activate business rules. [Learn more about miscellaneous privileges](miscellaneous-privileges.md).

- **Privacy-related privileges**: These privileges give a user permission to perform tasks that involve data that's integrated, downloaded, or exported outside of Dataverse, such as exporting data to Microsoft Excel or printing. [Learn more about privacy-related privileges](privacy-related-privileges.md).

Each set of privilege types has its own tab. For each tab, you can filter the view by all privileges, assigned privileges, or unassigned privileges for the selected security role.

#### Table privileges

The **Tables** tab lists the Dataverse tables in the environment. The following table describes the attributes that are shown in the security role editor when the **Compact Grid View** option is off.

| **Property** | **Description** |
|--------------|-----------------|
| Table | The name of the Dataverse table |
| Name | The logical name of the Dataverse table; helpful for developers |
| Record ownership | Whether records are owned by the organization or business unit or can be owned by a user or team |
| Permission Settings | Which predefined set of permissions the table is using, or custom permissions |

Tables are grouped into the following categories:

- Business Management
- Business Process Flows
- Core Records
- Custom Tables
- Customization
- Missing Tables
- Sales
- Service
- Service Management

To quickly find a specific table or privilege, enter its name in the search box at the upper-right corner of the page, and then select the magnifying glass icon or press **Enter**. To clear your search, select the **X** icon.

You can only edit one table at a time, but you can copy settings from one table to multiple tables in a single action.

When you configure a security role, you need to determine the privileges it should grant for each table related to the application.

The following table describes the table privileges you can grant in a security role. In all cases, which records a privilege applies to depends on the access level of the permission defined in the security role.

| **Privilege** | **Description** |
|---------------|-----------------|
| Create | Required to make a new record |
| Read | Required to open a record to view the contents |
| Write | Required to make changes to a record |
| Delete | Required to permanently remove a record |
| Append | Required to associate the current record with another record; for example, if users have Append rights on a note, they can attach the note to an opportunity<br/> For many-to-many relationships, a user must have Append privilege for both tables being associated or disassociated. |
| Append to | Required to associate a record with the current record; for example, if users have Append To rights on an opportunity, they can add a note to the opportunity |
| Assign | Required to give ownership of a record to another user |
| Share | Required to give access to a record to another user while keeping your own access |

#### Access levels

Each privilege has a menu that allows you to define its *access level*. Access levels determine how deep in the business unit hierarchy the user can perform the privilege.

The following table describes the levels of access. For organization-owned tables, miscellaneous privileges and privacy-related privileges only have access levels of **Organization** or **None**.

| **Type** | **Description** |
|----------|-----------------|
| Organization | Users can access all records in the organization, regardless of the business unit hierarchical level they or the environment belong to. Users with organization access automatically have all other types of access as well.<br/>Because this level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the organization. |
| Parent: Child Business Unit | Users can access records in their business unit and all business units subordinate to it.<br/>Users with this access automatically have business unit and user access.<br/>Because this level gives access to information throughout the business unit and subordinate business units, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the business units. |
| Business Unit | Users can access records in their business unit.<br/>Users with business unit access automatically have user access.<br/>Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the business unit. |
| User | Users can access records they own, objects that are shared with the organization, objects that are shared with them, and objects that are shared with a team that they're a member of.<br/>This level of access is typical for sales and service representatives. |
| None | No access is allowed. |

For each table, select the appropriate type for each privilege. Select **Save** when you're finished.

### Copy table permissions

Setting the privileges for each table in your app can be time-consuming and tedious. To make it easier, you can copy the permissions from one table to one or more others.

> [!TIP] 
> Create your new security roles by copying the [predefined template security roles](database-security.md) in an environment.
> - Use **App Opener** role which has the minimum privileges to run an app.
> - Use **Basic User** role for the minimum privileges and including privileges to the core business tables.

1. Select a table, and then select **Copy table permissions**.

1. Search for and select the table or tables you want to copy the permissions to.

    Remember, the new configuration overwrites any previous settings.

1. Select **Save**.

Let's take a closer look at how copy table permissions work with privileges and access levels.

- For permissions that exist in both the source table and the target tables:

  - If the source permission settings depth exists in the target, then the copy is successful.

  - If the source permission settings depth **doesn't** exist in the target, then the copy fails and an error message is displayed.

- For permissions that only exist in either the source table or the target tables:

  - If the permission exists in the source but not in the target, then the permission is ignored in the target. The copy for the remaining permissions is successful.

  - If the permission **doesn't** exist in the source but does exist in the target, then the depth of the permission is retained in the target. The copy for the remaining permissions is successful.

### Permission settings

Another way to speed up the configuration of table permissions is to use predefined groups of permissions and assign them to tables.

The following table describes the permission setting groups that you can assign.

| **Permission setting** | **Details** |
|------------------------|-------------|
| No Access | No users can access the table. |
| Full Access | Users can view and edit all records in the table. |
| Collaborate | Users can view all records, but they can only edit their own. |
| Private | Users can only view and edit their own records. |
| Reference | Users can only view records, not edit them. |
| Custom | Indicates that permission settings have been changed from the default value. |

1. Select a table, and then select **Permission Settings** in the command bar or select **More Actions** (**&hellip;**) > **Permission Settings**.

1. Select the appropriate setting.

      Remember, the new configuration overwrites any previous settings.

1. Select **Save**.

### Add users to a security role

Follow these steps to add users to a security role.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** in the command bar. The **Settings** page for that environment is displayed.
1. Select **Users + permissions** > **Security roles**.
1. Select a security role and then select the **More actions** (**...**) icon.
1. Select **Members** in the menu that appears.
1. In the **Members** page, select the **+ Add people**.
1. In the **Add people** pane, enter a name, email address, or team name to search for the users you want to add to the security role.
1. Select **Add** to add those users to the security role.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** in the command bar. The **Settings** page for that environment is displayed.
1. Select **Users + permissions** > **Security roles**.
1. Select a security role and then select the **More actions** (**...**) icon.
1. Select **Members** in the menu that appears.
1. In the **Members** page, select **+ Add people**.
1. In the **Add people** pane, enter a name, email address, or team name to search for the users you want to add to the security role.
1. Select **Add** to add those users to the security role.

---

### Remove users from a security role

You can remove users from a security role through the modern UI. Follow these steps to remove users from a security role.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** in the command bar. The **Settings** page for that environment is displayed.
1. Select **Users + permissions** > **Security roles**.
1. Select a security role and then select the **More actions** (**...**) icon.
1. Select **Members** in the menu that appears.
1. In the **Members** page, select the users you want to remove from the security role.
1. Select **Remove** at the top of the page.
1. The **Remove from role?** window appears, asking you to confirm that you want privileges associated with that role removed for the selected user. Select **Remove**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** in the command bar. The **Settings** page for that environment is displayed.
1. Select **Users + permissions** > **Security roles**.
1. Select a security role and then select the **More actions** (**...**) icon.
1. Select **Members** in the menu that appears.
1. In the **Members** page, select the users you want to remove from the security role.
1. Select **Remove** at the top of the page.
1. The **Remove from role?** window appears, asking you to confirm that you want privileges associated with that role removed for the selected user. Select **Remove**.

---

## Security roles and the legacy UI

Security roles define how different users access different types of records. To control access to data and resources, you can create or modify security roles and change the security roles that are assigned to your users.

A user can have multiple security roles. Security role privileges are cumulative. Users are granted the privileges that are available in each role assigned to them.

### View a list of security roles in an environment (legacy UI)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.

### Define the privileges and properties of a security role (legacy UI)

After you [created a security role](create-edit-security-role.md#create-a-security-role) or while you're [editing one](create-edit-security-role.md#edit-a-security-role), set the privileges associated with it.

A security role consists of record-level privileges and task-based privileges.

- **Record-level privileges** define which tasks a user with access to the record can do, such as Read, Create, Delete, Write, Assign, Share, Append, and Append To. *Append* means to attach another record, such as an activity or note, to a record. *Append to* means to be attached to a record. [Learn more about record-level privileges](#record-level-privileges).

- **Miscellaneous privileges**, or task-based privileges, give a user permission to perform specific, miscellaneous (non-record) tasks, such as publish articles or activate business rules. [Learn more about miscellaneous privileges](miscellaneous-privileges.md).

The colored circles on the security role settings page identify the *access level* assigned to each privilege. Access levels determine how deep in the business unit hierarchy the user can perform the privilege.

The following table describes the levels of access.

| Icon | Description |
| --- |--- |
| ![Access level global.](../admin/media/access-level-global.png "Access level global") | **Global**. Users can access all records in the organization, regardless of the business unit hierarchical level they or the environment belong to. Users who have Global access automatically have Deep, Local, and Basic access.<br/>Because this level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the organization.<br/>The application refers to this access level as **Organization**. |
| ![Access level deep.](../admin/media/access-deep.png "Access level deep") | **Deep**. Users can access records in their business unit and all business units subordinate to it.<br/>Users who have Deep access automatically have Local and Basic access.<br/>Because this level gives access to information throughout the business unit and subordinate business units, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the business units.<br/>The application refers to this access level as **Parent: Child Business Units**. |
| ![Access level local.](../admin/media/access-local.png "Access level local") | **Local**. Users can access records in the user's business unit.<br/>Users who have Local access automatically have Basic access.<br/>Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the business unit.<br/>The application refers to this access level as **Business Unit**. |
| ![Access level basic.](../admin/media/access-level-basic.png "Access level basic") | **Basic**. Users can access records they own, objects that are shared with the organization, objects that are shared with them, and objects that are shared with a team that they're a member of.<br/>This is the typical level of access for sales and service representatives.<br/>The application refers to this access level as **User**. |
| ![Access level none.](../admin/media/access-level-none.png "Access level none") | **None**. No access is allowed. |

> [!IMPORTANT]
> To make sure that users can view and access all areas of the web application, such as table forms, the navigation bar, and the command bar, all security roles in the organization must include the Read privilege on the `Web Resource` table. For example, without read permission, a user can't open a form that contains a web resource and sees an error message like this: "Missing `prvReadWebResource` privilege." [Learn more about creating or editing a security role](create-edit-security-role.md).

#### Record-level privileges

Power Apps and Dynamics 365 customer engagement apps use record-level privileges to determine the level of access a user has to a specific record or record type.

The following table describes the record-level privileges you can grant in a security role. In all cases, the records a privilege applies to depends on the access level of the permission defined in the security role.

| Privilege | Description |
|-----------|-------------|
| Create | Required to make a new record |
| Read | Required to open a record to view the contents |
| Write | Required to make changes to a record |
| Delete | Required to permanently remove a record |
| Append | Required to associate the current record with another record; for example, if users have Append rights on a note, they can attach the note to an opportunity<br/>In the case of many-to-many relationships, a user must have Append privilege for both tables being associated or disassociated. |
| Append to | Required to associate a record with the current record; for example, if users have Append To rights on an opportunity, they can add a note to the opportunity |
| Assign | Required to give ownership of a record to another user |
| Share\* | Required to give access to a record to another user while keeping your own access |

\*The owner of a record or a person who has the Share privilege on a record can share it with other users or teams. Sharing can add Read, Write, Delete, Append, Assign, and Share privileges for specific records. Microsoft Teams is used primarily for sharing records that team members ordinarily can't access. [Learn more about security, users, and teams](manage-teams.md).

It's not possible to remove access for a particular record. Any change to a security role privilege applies to all records of that type.  

#### Team member's privilege inheritance

You can determine how privileges are inherited when a user is granted them as a member of a team or directly, as an individual.

- **User privileges**: A user is granted these privileges directly when the security role is assigned. Users can create records with themselves as the owner. They can access records that they created or owned when Basic access level for Create and Read was given to them. This setting is the default for new security roles.

- **Team privileges**: A user is granted these privileges as a member of a team. Team members who don't have user privileges of their own can create records with the team as the owner. They can access records that the team owns if Basic access level for Create and Read is given to them.

> [!NOTE]
> Before the release of the team member's privilege inheritance feature in May 2019, security roles behaved as **Team privileges**. Security roles created before that release are set as **Team privileges**, and security roles created after it are by default set as **User privileges**.

A security role can be set to provide team members with direct Basic-level access privileges. When a privilege inheritance security role is assigned to a user, the user gets all the privileges directly, just like a security role without privilege inheritance. The team members can create records with themselves as the owner and records with the team as the owner when Basic access level for Create is given to them. When the Basic access level for Read is given to them, they can access records that are owned by both themselves and by the team. This privilege inheritance role applies to [Owner](manage-teams.md#types-of-teams) and Microsoft Entra ID [group teams](manage-group-teams.md).

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.
1. Select **+New role**.
1. In the Create New Role page, enter the name of the new security role and its Business Unit.
1. Select the **Member's privilege inheritance** list, and then select **Direct User(Basic) access level and Team privileges**.
1. Go to each tab and set the appropriate privileges on each table.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Environments** in the navigation pane, and then select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.
1. Select **+New role**.
1. In the Create New Role page, enter the name of the new security role and its Business Unit.
1. Select the **Member's privilege inheritance** list, and then select **Direct User(Basic) access level and Team privileges**.
1. Go to each tab and set the appropriate privileges on each table.

---

To change the access level for a privilege, keep selecting the access level symbol until you see the one you want. The access levels available depend on whether the record type is organization-owned or user-owned.

You can only select Basic-level privileges in the member's privilege inheritance. If you need to provide, access to a child business unit, elevate the privilege to Deep. For example, you need to assign a security role to the Group team and you want the members of the group to be able to Append to Account. Set up the security role with a Basic-level member's privilege inheritance. Set the Append to Account privilege to Deep since Basic privileges apply only to the user's business unit.

> [!NOTE]
> Since July 2024, the **Team member's privilege inheritance** attribute of a role is no longer a [managed property](../alm/use-managed-properties.md). When you import a solution that has security roles, this attribute isn't included. 

### Related information

- [Video: Administer application users, security roles, teams, and users in the Power Platform admin center](https://learn-video.azurefd.net/vod/player?id=5799c67e-f283-4cbd-aafa-bc38a3f53276)  
- [Video: Check Access feature](https://youtu.be/rigZ1FvrgSY)  
- [Predefined security roles](database-security.md#predefined-security-roles)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
