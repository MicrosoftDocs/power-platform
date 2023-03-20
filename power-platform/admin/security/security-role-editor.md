---
title: Security role editor (preview)
description: The security role management experience in the Power Platform admin center has been updated so that you no longer need to use the legacy user interface. 
ms.date: 03/20/2023
ms.service: power-platform
ms.topic: overview
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
search.app:
  - Powerplatform
ms.contributors:
- pmantha
---

# Security role editor (preview)

[This article is pre-release documentation and is subject to change.]

The security role management experience in the Power Platform admin center has been updated so that you no longer need to use the legacy user interface. 

[!include [preview](../../includes/cc-preview-features-definition.md)]

## Enabling the new security role editor

The new security role editor preview will need to be enabled on your environment. You will first need to provide to the team a **tenant Id** where you would like the feature to be enabled.

Once our team has enabled the feature at the tenant level, you will need to use a specific feature flag to activate the new experience. Instructions will be provided once tenant is signed up for the new Security Role editor experience.

## Accessing the security role editor

Once the security role editor private preview has been enabled on your environment, follow these steps to access the editor:

1.  Go to the Power Platform Admin center (<https://aka.ms/ppac>)

2.  Choose **Environments**

3.  Select the environment.

4.  Go to **Settings**.

5.  Expand **Users + Permissions**

6.  Select **Security roles**.

You should see a list of the existing security roles in your environment.

![List of security roles for a specific environment in the Power Platform admin center ](media/image1.png)

## Security roles

Microsoft Dataverse comes with a set of predefined security roles and additional roles are available if the Dynamics 365 apps have been enabled.

The following actions are available from the main menu when no security role is selected

| **Action**   | **Description**                                               |
|--------------|---------------------------------------------------------------|
| New role     | Allows you to create a new security role.                     |
| Go to legacy | Will open the legacy web client interface for security roles. |

The following actions are available when a security role is selected or by choosing the ellipses (…) from the selected security role.

| **Action** | **Description**                                                        |
|------------|------------------------------------------------------------------------|
| Copy       | Will allow you to copy the selected security role.                     |
| Edit       | Allows you to edit the properties of the selected security role.       |
| Delete     | Allows you to delete the selected custom security role.                |
| Members    | Allows you to view and edit the members of the selected security role. |

## Creating a new security role

To create a new security role, select **New role** from the main menu.

You will need to give the role a name and select the corresponding business unit the role will belong to.

Select **Save** to save the role, and it will open the security role editor.

## Editing an existing security role

To edit an existing security role, either select the role name, or select the row and choose **Edit.**

## Copy a security role

Select the security role and choose copy. You will need to give the role a new name. Note that only the privileges will be copied, the assigned members and teams will not be assigned to the copied role.

## Security role editor

The security role editor allows you to define the privileges and properties of a specific security role.

You have the option to enable or disable the **Team members inherit role** option. If enabled and the role is assigned to a team, all team members will inherit all the privileges associated with this role.

Each security role consists of the following privilege types:

-   Tables

-   Miscellaneous Privileges

-   Privacy-related Privileges

*Table* privileges define which tasks a user with access to a table record can do, such as Read, Create, Delete, Write, Assign, Share, Append, and Append To.  *Append* means to attach another record, such as an activity or note, to a record.  *Append to* means to be attached to a record.

*Miscellaneous privileges*, (aka task-based privileges), give a user privileges to perform specific miscellaneous (non-record) tasks, such as publish articles or activate business rules.

*Privacy-related privileges* give a user the privilege to perform tasks where data is integrated, downloaded or output outside of Dataverse, such as exporting data to Microsoft Excel or printing.

Each set of privilege types are separated by a tab, and for each tab you can filter the view by all privileges, assigned privileges or unassigned privileges for the selected security role.

![The security role editor page displaying the drop down to display specific table views  show all tables  show only assigned tables and show only unassigned tables ](media/image2.png)

## Search by table name or table privilege name

You can locate a specific table or privilege by entering the name in the search box and selecting the magnifying glass icon or by pressing **Enter**. This will display a filtered list based on your search criteria. Select the **X** icon to clear your search.

## Table groupings

Tables are by default grouped into the following categories:

-   Business Process Flows

-   BusinessManagement

-   CoreRecords

-   Custom Entities

-   Customization

-   Missing Entities

-   Sales

-   ServiceManagement

-   ServiceTab

## Configuring permissions

In the security role editor, the tables are organized by groupings that align to their module or application.

**NOTE:** You can only update the one selected entity at a time. You can copy settings from one table to multiple tables in a single action.

The **Tables** tab shows the list of Dataverse tables in the environment. Each table has the following attributes visible in the security role editor:

| **Property**         | **Description**                                                                         |
|----------------------|-----------------------------------------------------------------------------------------|
| Table                | The name of the Dataverse table                                                         |
| Name                 | The logical name of the Dataverse table, this is a helpful reference for developers.    |
| Record ownership     | Indicates if records are **Organization** owned or can be owned by a **User or Team**.  |
| Permissions Settings | Determines if the table is using a predefined set of permissions or custom permissions. |

When configuring a security role, you will need to determine the setting for each table, miscellaneous and privacy-related privileges that are related to the application.

The following table provides details about each specific table privilege:

| **Privilege** | **Description** |
|-------------------------|-------------------------|
| Create | Required to make a new record. Which records can be created depends on the access level of the permission defined in your security role. |
| Read | Required to open a record to view the contents. Which records can be read depends on the access level of the permission defined in your security role. |
| Write | Required to make changes to a record. Which records can be changed depends on the access level of the permission defined in your security role. |
| Delete | Required to permanently remove a record. Which records can be deleted depends on the access level of the permission defined in your security role. |
| Append | Required to associate the current record with another record. For example, a note can be attached to an opportunity if the user has Append rights on the note. The records that can be appended depend on the access level of the permission defined in your security role.<br /></br>In case of many-to-many relationships, you must have Append privilege for both tables being associated or disassociated. |
| Append To | Required to associate a record with the current record. For example, if a user has Append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role. |
| Assign | Required to give ownership of a record to another user. Which records can be assigned depends on the access level of the permission defined in your security role. |
| Share | Required to give access to a record to another user while keeping your own access. Which records can be shared depends on the access level of the permission defined in your security role. |


For each specific privilege there is a drop-down that allows you to define the access level. Access levels determine how deep or high in the organizational business unit hierarchy the user can perform the specified privilege. The following lists the levels of access in the app, starting with the level that gives users the most access.

Note that for organization-owned tables, miscellaneous privileges, and privacy-related privileges will only have **Organization** or **None** types.

| **Type** | **Description** |
|-------------------------|-------------------------|
| Organization | This access level gives a user access to all records in the organization, regardless of the business unit hierarchical level that the environment or the user belongs to. Users who have organization access automatically have the other types of access listed below as well.<br /></br><br /></br>Because this access level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the organization. |
| Parent: Child Business Units | This access level gives a user access to records in the user's business unit and all business units subordinate to the user's business unit.<br /></br><br /></br>Users who have the access automatically have business unit and user access.<br /></br><br /></br>Because this access level gives access to information throughout the business unit and subordinate business units, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business units. |
| Business Unit | This access level gives a user access to records in the user's business unit.<br /></br><br /></br>Users who have business unit access automatically have user access.<br /></br><br /></br>Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business unit. |
| User | This access level gives a user access to records that the user owns, objects that are shared with the organization, objects that are shared with the user, and objects that are shared with a team that the user is a member of.<br /></br><br /></br>This is the typical level of access for sales and service representatives. |
| None | No access is allowed. |


For each table, select the appropriate type for each privilege. Select **Save** when you have completed your updates.

![Selecting the permission level for each privilege type of a table ](media/image3.png)

## Copy table permissions

Updating settings for each table can be very time-consuming and tedious. To expedite the process, you can select a table and choose **Copy table permissions**, then search and choose the tables to which you want to replicate the permissions. Note that this will overwrite existing configuration. Select **Save** to update the permissions.

![Selecting a table and copying the permissions to other tables ](media/image4.png)

Note : The behavior of the copy table permission will be as follows:

1.  For permissions that exist in both source and target :

    1.  If the source permission settings depth exists in the target, then the copy table permissions will be successful

    2.  If the source permission settings depth DOES NOT exist in target, then there will an error message thrown letting the user know that the copy process failed.

2.  For permissions that only exist in EITHER source OR target:

    1.  If the permission exists in the source and not in the target, then it will be ignored in the target and the copy for the remaining permissions will be successful.

    2.  Similarly, if the permissions DOES NOT exist in the source and EXISTS in the target, then the current depth of that permission will be retained in the target and the copy for the remaining permissions will be successful.

## Permission Settings

Another option to expedite configuration of table permissions is to use predefined groups of permissions and assign them to tables.

The following permission setting groups are available:

| **Permission Setting** | **Details**                                               |
|------------------------|-----------------------------------------------------------|
| No Access              | No access to the table.                                   |
| Full Access            | Full access to the table.                                 |
| Collaborate            | Ability to create and read tables.                        |
| Private                | Full access to tables owned by the specific user or team. |
| Reference              | Read only access to the table.                            |

To set or update a table's permission setting, select the table, and choose **Permission Settings** from the main menu or by menu made visible by selecting the ellipses (…).

Select the appropriate setting and select **Save**. Note that this will overwrite the existing permissions of the table.

For tables where you have specified the individual permission settings will show as having a **Custom** permission setting.

![Selecting the permission setting for a specific table ](media/image5.png)
