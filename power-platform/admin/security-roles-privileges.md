---
title: "Security roles and privileges | MicrosoftDocs"
description: To control data access, you must set up an organizational structure that both protects sensitive data and enables collaboration. To help secure your data, assign users to security roles. This article explains security roles and their associated privileges.
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.topic: conceptual
ms.date: 04/18/2023
---
# Security roles and privileges

To control data access, you must set up an organizational structure that both protects sensitive data and enables collaboration. To help secure your data, assign users to security roles. This article explains security roles and their associated privileges.

You can assign security roles using the new, modern UI, or using the the legacy UI:

- [Security roles and the new, modern UI (preview)](security-roles-privileges.md#security-roles-and-the-new-modern-ui-preview)
- [Security roles and the legacy UI](security-roles-privileges.md#security-roles-and-the-legacy-ui)

## Security roles and the new, modern UI (preview)
> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]
> 
> This capability is in process of rolling out, and may not be available in your region yet.

A security role defines how different users, such as salespeople, access different types of records. To control access to data, you can modify existing security roles, create new security roles, or change which security roles are assigned to each user. Each user can have multiple security roles.
  
Each security role consists of record-level privileges and task-based privileges. To view a list of security roles in your environment, do the following:

1.  Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2.  Select **Environments** in the navigation pane.
3.  Select the check mark next to the environment you want to use.
4.  Select **Settings**.
5.  Expand **Users + Permissions**.
6.  Select **Security roles (Preview)**. A list of the existing security roles in your environment is displayed.

### Define the privileges and properties of a security role
You can set the **Member's privilege inheritance** option to:

- **Team privileges only**: A user is granted these privileges as member of a team. For team members who do not have user privileges of their own, they can only create records with the team as the owner. They have access to records owned by the Team when **User** access level for Create and Read privileges were given.

- **Direct User (Basic) access level and Team privileges**: A user is granted these privileges directly when a security role is assigned to the user. A user can create and access records that were created and owned by the user when the **User** access level for Create and Read privileges were given. This is the default setting for new security roles.

  :::image type="content" source="media/members-privilege-inheritance.png" alt-text="Set the **Member's privilege inheritance** option.":::

Each security role consists of the following privilege types:

- **Tables**: Table privileges define which tasks a user with access to a table record can do, such as Read, Create, Delete, Write, Assign, Share, Append, and Append To. *Append* means to attach another record, such as an activity or note, to a record. *Append to* means to be attached to a record.

- **Miscellaneous privileges**: These task-based privileges give a user permission to perform specific, miscellaneous (non-record) tasks, such as publish articles or activate business rules. More information: [Miscellaneous privileges](miscellaneous-privileges.md)

- **Privacy-related privileges**: These privileges give a user permission to perform tasks where data is integrated or downloaded or exported outside of Dataverse, such as exporting data to Microsoft Excel or printing. More information: [Privacy-related privileges](privacy-related-privileges.md)

Each set of privilege types are separated by a tab. For each tab, you can filter the view by all privileges, assigned privileges or unassigned privileges for the selected security role.

#### Search by table name or table privilege name

You can locate a specific table or privilege by entering the name in the search box and selecting the magnifying glass icon or by pressing **Enter**. This will display a filtered list based on your search criteria. Select the **X** icon to clear your search.

#### Table groupings

Tables are, by default, grouped into the following categories:

-   Business Management
-   Business Process Flows
-   Core Records
-   Custom Tables
-   Customization
-   Missing Tables
-   Sales
-   Service
-   Service Management
  
#### Configure permissions

Tables are organized by groupings that align to their module or application.

> [!Note]
> You can only update the one selected table at a time. You can copy settings from one table to multiple tables in a single action.

The **Tables** tab shows the list of Dataverse tables in the environment. Each table has the following attributes visible in the security role editor:

| **Property**         | **Description**                                                                         |
|----------------------|-----------------------------------------------------------------------------------------|
| Table                | The name of the Dataverse table                                                         |
| Name                 | The logical name of the Dataverse table, this is a helpful reference for developers.    |
| Record ownership     | Indicates if records are **Organization** owned or can be owned by a **User or Team**.  |
| Permissions Settings | Determines if the table is using a predefined set of permissions or custom permissions. |

When configuring a security role, you will need to determine the setting for each table and privacy-related privileges that are related to the application.

:::image type="content" source="media/security-role-editor.png" alt-text="When configuring a security role, you will need to determine the setting for each table and privacy-related privileges that are related to the application.":::

The following table provides details about each specific table privilege:

| **Privilege** | **Description** |
|-------------------------|-------------------------|
| Create | Required to make a new record. Which records can be created depends on the access level of the permission defined in your security role. |
| Read | Required to open a record to view the contents. Which records can be read depends on the access level of the permission defined in your security role. |
| Write | Required to make changes to a record. Which records can be changed depends on the access level of the permission defined in your security role. |
| Delete | Required to permanently remove a record. Which records can be deleted depends on the access level of the permission defined in your security role. |
| Append | Required to associate the current record with another record. For example, a note can be attached to an opportunity if the user has Append rights on the note. The records that can be appended depend on the access level of the permission defined in your security role.<br /></br>In case of many-to-many relationships, you must have Append privilege for both tables being associated or disassociated. |
| Append to | Required to associate a record with the current record. For example, if a user has Append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role. |
| Assign | Required to give ownership of a record to another user. Which records can be assigned depends on the access level of the permission defined in your security role. |
| Share | Required to give access to a record to another user while keeping your own access. Which records can be shared depends on the access level of the permission defined in your security role. |

For each specific privilege, there is a drop-down menu that allows you to define the access level. Access levels determine how deep or high in the business unit hierarchy the user can perform the specified privilege in the organization. 

The following table lists the levels of access in the app, starting with the level that gives users the most access. Note that for organization-owned tables, miscellaneous privileges, and privacy-related privileges will only have **Organization** or **None** types.

| **Type** | **Description** |
|-------------------------|-------------------------|
| Organization | This access level gives a user access to all records in the organization, regardless of the business unit hierarchical level that the environment or the user belongs to. Users who have organization access automatically have the other types of access listed below as well.<br /></br><br /></br>Because this access level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the organization. |
| Parent: Child Business Unit | This access level gives a user access to records in the user's business unit and all business units subordinate to the user's business unit.<br /></br><br /></br>Users who have the access automatically have business unit and user access.<br /></br><br /></br>Because this access level gives access to information throughout the business unit and subordinate business units, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business units. |
| Business Unit | This access level gives a user access to records in the user's business unit.<br /></br><br /></br>Users who have business unit access automatically have user access.<br /></br><br /></br>Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business unit. |
| User | This access level gives a user access to records that the user owns, objects that are shared with the organization, objects that are shared with the user, and objects that are shared with a team that the user is a member of.<br /></br><br /></br>This is the typical level of access for sales and service representatives. |
| None | No access is allowed. |

For each table, select the appropriate type for each privilege. Select **Save** when you have completed your updates.

### Copy table permissions

Updating settings for each table can be very time-consuming and tedious. To expedite the process, you can select a table and choose **Copy table permissions**, then search and choose the tables to which you want to replicate the permissions. Note that this will overwrite existing configuration. Select **Save** to update the permissions.

The behavior of the copy table permission will be as follows:

- For permissions that exist in both source and target:

  - If the source permission settings depth exists in the target, then the copy table permissions will be successful.

  - If the source permission settings depth **does not** exist in target, an error message is displayed indicating that the copy process failed.

- For permissions that only exist in either the source or target:

  - If the permission exists in the source and not in the target, then it will be ignored in the target and the copy for the remaining permissions will be successful.

  - Similarly, if the permissions **does not** exist in the source and exists in the target, then the current depth of that permission will be retained in the target and the copy for the remaining permissions will be successful.

### Permission settings

Another option to expedite configuration of table permissions is to use predefined groups of permissions and assign them to tables.

The following permission setting groups are available:

| **Permission setting** | **Details**                                               |
|------------------------|-----------------------------------------------------------|
| No Access              | No access to the table.                                   |
| Full Access            | Allows end users to see and edit all records in the table.|
| Collaborate            | Allows end users to see all records, but they can only edit their own records.|
| Private                | Allows end users to only view and edit their own data. |
| Reference              | Provides a read-only view of data for end users. |
| Custom                 | Indicates that permission settings have been changed from the default value.  |

To set or update a table's permission setting, select the table and choose **Permission Settings** in the command bar or by selecting the ellipses (**…**) in the row.

Select the appropriate setting and select **Save**. Note that this will overwrite the existing permissions of the table.

## Security roles and the legacy UI  
A security role defines how different users, such as salespeople, access different types of records. To control access to data, you can modify existing security roles, create new security roles, or change which security roles are assigned to each user. Each user can have multiple security roles. See [Predefined security roles](database-security.md#predefined-security-roles).
  
Security role privileges are cumulative: having more than one security role gives a user privileges available in each role that is assigned.  
  
Each security role consists of record-level privileges and task-based privileges.  
  
*Record-level privileges* define which tasks a user with access to the record can do, such as Read, Create, Delete, Write, Assign, Share, Append, and Append To. *Append* means to attach another record, such as an activity or note, to a record. *Append to* means to be attached to a record. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)]  [Record-level privileges](#record-level-privileges).
  
*Miscellaneous privileges*, (aka task-based privileges) at the bottom of the form, give a user privileges to perform specific miscellaneous (non-record) tasks, such as publish articles or activate business rules. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)]  [Miscellaneous privileges](miscellaneous-privileges.md).
  
The colored circles on the security role settings page define the access level for that privilege. Access levels determine how deep or high in the organizational business unit hierarchy the user can perform the specified privilege. The following table lists the levels of access in the app, starting with the level that gives users the most access.  
  
|Icon |Description |  
|-|-|  
|![Access level global.](../admin/media/access-level-global.png "Access level global")|**Global**. This access level gives a user access to all records in the organization, regardless of the business unit hierarchical level that the environment or the user belongs to. Users who have Global access automatically have Deep, Local, and Basic access, also.<br /><br /> Because this access level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the organization.<br /><br /> The application refers to this access level as **Organization**.|  
|![Access level deep.](../admin/media/access-deep.png "Access level deep")|**Deep**. This access level gives a user access to records in the user's business unit and all business units subordinate to the user's business unit.<br /><br /> Users who have Deep access automatically have Local and Basic access, also.<br /><br /> Because this access level gives access to information throughout the business unit and subordinate business units, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business units.<br /><br /> The application refers to this access level as **Parent: Child Business Units**.|  
|![Access level local.](../admin/media/access-local.png "Access level local")|**Local**. This access level gives a user access to records in the user's business unit.<br /><br /> Users who have Local access automatically have Basic access, also.<br /><br /> Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business unit.<br /><br /> The application refers to this access level as **Business Unit**.|  
|![Access level basic.](../admin/media/access-level-basic.png "Access level basic")|**Basic**. This access level gives a user access to records that the user owns, objects that are shared with the organization, objects that are shared with the user, and objects that are shared with a team that the user is a member of.<br /><br /> This is the typical level of access for sales and service representatives.<br /><br /> The application refers to this access level as **User**.|  
|![Access level none.](../admin/media/access-level-none.png "Access level none")|**None**. No access is allowed.|  
  
> [!IMPORTANT]
> To ensure that users can view and access all areas of the web application, such as table forms, the nav bar, or the command bar, all security roles in the organization must include the Read privilege on the `Web Resource` table. For example, without read permissions, a user won't be able to open a form that contains a web resource and will see an error message similar to this: "Missing `prvReadWebResource` privilege." [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create or edit a security role](create-edit-security-role.md)  

#### Record-level privileges  
 [!INCLUDE [pn-powerapps](../includes/pn-powerapps.md)] and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), use eight different record-level privileges that determine the level of access a user has to a specific record or record type.  
  
|Privilege|Description|  
|---------------|-----------------|  
|**Create**|Required to make a new record. Which records can be created depends on the access level of the permission defined in your security role.|  
|**Read**|Required to open a record to view the contents. Which records can be read depends on the access level of the permission defined in your security role.|  
|**Write**|Required to make changes to a record. Which records can be changed depends on the access level of the permission defined in your security role.|  
|**Delete**|Required to permanently remove a record. Which records can be deleted depends on the access level of the permission defined in your security role.|  
|**Append**|Required to associate the current record with another record. For example, a note can be attached to an opportunity if the user has Append rights on the note. The records that can be appended depend on the access level of the permission defined in your security role.<br /> In case of many-to-many relationships, you must have Append privilege for both tables being associated or disassociated.|  
|**Append To**|Required to associate a record with the current record. For example, if a user has Append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role.|  
|**Assign**|Required to give ownership of a record to another user. Which records can be assigned depends on the access level of the permission defined in your security role.|  
|**Share**|Required to give access to a record to another user while keeping your own access. Which records can be shared depends on the access level of the permission defined in your security role.|  
  
### Overriding security roles  
 The owner of a record or a person who has the Share privilege on a record can share a record with other users or teams. Sharing can add Read, Write, Delete, Append, Assign, and Share privileges for specific records.  
  
 Teams are used primarily for sharing records that team members ordinarily couldn't access. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Manage security, users and teams](manage-teams.md).  
  
 It's not possible to remove access for a particular record. Any change to a security role privilege applies to all records of that record type.  

### Team member's privilege inheritance

#### User and Team privileges

- **User privileges**: User is granted these privileges directly when a security role is assigned to the user.  User can create and has access to records created/owned by the user when Basic access level for Create and Read were given. This is the default setting for new security roles.
- **Team privileges**: User is granted these privileges as member of the team.  For team members who do not have user privileges of their own, they can only create records with the team as the owner and they have access to records owned by the Team when Basic access level for Create and Read were given.

A security role can be set to provide a team member with direct Basic-level access user privileges. A team member can create records that they own and records that have the team as owner when the Basic access level for Create is given. When the Basic access level for Read is given, team member can access records that are owned by both that team member and by the team.  

This member's privilege inheritance role is applicable to [Owner](manage-teams.md#types-of-teams) and Azure Active Directory (Azure AD) [group team](manage-group-teams.md). 

> [!NOTE]
> Prior to Team member's privilege inheritance release in May 2019, security roles behaved as **Team privileges**. Security roles created before this release are set as **Team privileges** and security roles created after this release are by default set as **User privileges**.

#### Create a security role with team member's privilege inheritance

##### Prerequisites
These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Security roles**.

Make sure you have the System Administrator security role or equivalent permissions.

Check your security role:
- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don't have the correct permissions? Contact your system administrator.<br />

1. Select an environment and go to **Settings** > **Users + permissions** > **Security roles**.
2. On the command bar, select **New**.
3. Enter a role name.
4. Select the **Member's privilege inheritance** drop-down list.
5. Select **Direct User/Basic access level and Team privileges**.
6. Go to each tab and set the appropriate privileges on each table.

   To change the access level for a privilege, select the access-level symbol until you see the symbol you want. The access levels available depend on whether the record type is organization-owned or user-owned.

> [!NOTE]
> You can also set this privilege inheritance property for all out-of-the-box security roles except the System Administrator role.  When a privilege inheritance security role is assigned to a user, the user gets all the privileges directly, just like a security role without privilege inheritance.
>
> You can only select Basic level privileges in the member's privilege inheritance. If you need to provide access to a child business unit, you will need to elevate the privilege to Deep; for example, you need to assign a security role to the Group team and you want the members of this group to be able to Append to Account.  You setup the security role with a Basic level member's privilege inheritance and in the Append to Account privilege, you set it to Deep.  This is because Basic privileges are only applicable to the user's business unit.

#### See also
[Video: Administer application users, security roles, teams, and users in the Power Platform admin center](https://www.microsoft.com/en-us/videoplayer/embed/RWJBr8) <br />
[Video: Check Access feature](https://youtu.be/rigZ1FvrgSY)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
