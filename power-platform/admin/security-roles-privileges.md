---
title: "Security roles and privileges | MicrosoftDocs"
description: Overview of security roles and privileges
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Security roles and privileges

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

To control data access, you must set up an organizational structure that both protects sensitive data and enables collaboration. You do this by setting up business units, security roles, and field security profiles.  

> [!TIP]
> Check out the following video: [How to set up security roles](https://go.microsoft.com/fwlink/p/?linkid=2020433).
  
## Security roles  
A security role defines how different users, such as salespeople, access different types of records. To control access to data, you can modify existing security roles, create new security roles, or change which security roles are assigned to each user. Each user can have multiple security roles.  
  
Security role privileges are cumulative: having more than one security role gives a user every privilege available in every role.  
  
Each security role consists of record-level privileges and task-based privileges.  
  
*Record-level privileges* define which tasks a user with access to the record can do, such as Read, Create, Delete, Write, Assign, Share, Append, and Append To. *Append* means to attach another record, such as an activity or note, to a record. *Append to* means to be attached to a record. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)]  [Record-level privileges](#record-level-privileges).
  
*Task-based privileges*, at the bottom of the form, give a user privileges to perform specific tasks, such as publish articles.  
  
The colored circles on the security role settings page define the access level for that privilege. Access levels determine how deep or high in the organizational business unit hierarchy the user can perform the specified privilege. The following table lists the levels of access in the app, starting with the level that gives users the most access.  
  
|Icon |Description |  
|-|-|  
|![Access level global](../admin/media/access-level-global.png "Access level global")|**Global**. This access level gives a user access to all records in the organization, regardless of the business unit hierarchical level that the environment or the user belongs to. Users who have Global access automatically have Deep, Local, and Basic access, also.<br /><br /> Because this access level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the organization.<br /><br /> The application refers to this access level as **Organization**.|  
|![Access level deep](../admin/media/access-deep.png "Access level deep")|**Deep**. This access level gives a user access to records in the user's business unit and all business units subordinate to the user's business unit.<br /><br /> Users who have Deep access automatically have Local and Basic access, also.<br /><br /> Because this access level gives access to information throughout the business unit and subordinate business units, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business units.<br /><br /> The application refers to this access level as **Parent: Child Business Units**.|  
|![Access level local](../admin/media/access-local.png "Access level local")|**Local**. This access level gives a user access to records in the user's business unit.<br /><br /> Users who have Local access automatically have Basic access, also.<br /><br /> Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is usually reserved for managers with authority over the business unit.<br /><br /> The application refers to this access level as **Business Unit**.|  
|![Access level basic](../admin/media/access-level-basic.png "Access level basic")|**Basic**. This access level gives a user access to records that the user owns, objects that are shared with the user, and objects that are shared with a team that the user is a member of.<br /><br /> This is the typical level of access for sales and service representatives.<br /><br /> The application refers to this access level as **User**.|  
|![Access level none](../admin/media/access-level-none.png "Access level none")|**None**. No access is allowed.|  
  
> [!IMPORTANT]
> To ensure that users can view and access all areas of the web application, such as entity forms, the nav bar, or the command bar, all security roles in the organization must include the Read privilege on the `Web Resource` entity. For example, without read permissions, a user won't be able to open a form that contains a web resource and will see an error message similar to this: "Missing `prvReadWebResource` privilege." [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create or edit a security role](create-edit-security-role.md)  

### Record-level privileges  
 [!INCLUDE [pn-powerapps](../includes/pn-powerapps.md)] and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), use eight different record-level privileges that determine the level of access a user has to a specific record or record type.  
  
|Privilege|Description|  
|---------------|-----------------|  
|**Create**|Required to make a new record. Which records can be created depends on the access level of the permission defined in your security role.|  
|**Read**|Required to open a record to view the contents. Which records can be read depends on the access level of the permission defined in your security role.|  
|**Write**|Required to make changes to a record. Which records can be changed depends on the access level of the permission defined in your security role.|  
|**Delete**|Required to permanently remove a record. Which records can be deleted depends on the access level of the permission defined in your security role.|  
|**Append**|Required to associate the current record with another record. For example, a note can be attached to an opportunity if the user has Append rights on the note. The records that can be appended depend on the access level of the permission defined in your security role.<br /> In case of many-to-many relationships, you must have Append privilege for both entities being associated or disassociated.|  
|**Append To**|Required to associate a record with the current record. For example, if a user has Append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role.|  
|**Assign**|Required to give ownership of a record to another user. Which records can be assigned depends on the access level of the permission defined in your security role.|  
|**Share**|Required to give access to a record to another user while keeping your own access. Which records can be shared depends on the access level of the permission defined in your security role.|  
  
## Overriding security roles  
 The owner of a record or a person who has the Share privilege on a record can share a record with other users or teams. Sharing can add Read, Write, Delete, Append, Assign, and Share privileges for specific records.  
  
 Teams are used primarily for sharing records that team members ordinarily couldn't access. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Manage security, users and teams](manage-teams.md).  
  
 It's not possible to remove access for a particular record. Any change to a security role privilege applies to all records of that record type.  

## Team member's privilege inheritance

### User and Team privileges

- **User privileges**: User is granted these privileges directly when a security role is assigned to the user.  User can create and has access to records created/owned by the user when Basic access level for Create and Read were given. This is the default setting for new security roles.
- **Team privileges**: User is granted these privileges as member of the team.  For team members who do not have user privileges of their own, they can only create records with the team as the owner and they have access to records owned by the Team when Basic access level for Create and Read were given.

A security role can be set to provide a team member with direct Basic-level access user privileges. A team member can create records that they own and records that have the team as owner when the Basic access level for Create is given. When the Basic access level for Read is given, team member can access records that are owned by both that team member and by the team.  

This member's privilege inheritance role is applicable to [Owner](manage-teams.md#about-owner-teams) and Azure Active Directory (Azure AD) [group team](manage-group-teams.md). 


> [!NOTE]
> Prior to Team member's privilege inheritance release in May 2019, security roles behaved as **Team privileges**. Security roles created before this release are set as **Team privileges** and security roles created after this release are by default set as **User privileges**.

### Create a security role with team member's privilege inheritance

#### Prerequisites
These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **User's + permissions** > **Security roles**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions.

Check your security role:
- Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
- Don't have the correct permissions? Contact your system administrator.<br />

1. Select an environment and go to **Settings** > **User's + permissions** > **Security roles**.
2. On the command bar, select **New**.
3. Enter a role name.
4. Select the **Member's privilege inheritance** drop-down list.
5. Select **Direct User/Basic access level and Team privileges**.
6. Go to each tab and set the appropriate privileges on each entity.

   To change the access level for a privilege, select the access-level symbol until you see the symbol you want. The access levels available depend on whether the record type is organization-owned or user-owned.

> [!NOTE]
> You can also set this privilege inheritance property for all out-of-the-box security roles except the System Administrator role.  When a privilege inheritance security role is assigned to a user, the user gets all the privileges directly, just like a security role without privilege inheritance.
>
> You can only select Basic level privileges in the member's privilege inheritance. If you need to provide access to a child business unit, you will need to elevate the privilege to Deep; for example, you need to assign a security role to the Group team and you want the members of this group to be able to Append to Account.  You setup the security role with a Basic level member's privilege inheritance and in the Append to Account privilege, you set it to Deep.  This is because Basic privileges are only applicable to the user's business unit.

## Assigning security roles
In order to assign security roles to a user, you need to have the appropriate privileges (minimum privileges are 'Read' and 'Assign' on the Security Role entity). To prevent elevation of security role privileges, the person who is assigning the security role cannot assign someone else with a security role that has more privileges than the assignee, for example a CSR Manager cannot assign a System Administrator role to another user. 

By default, the System Administrator security role has all the required privileges to assign security roles to any user including assigning the System Administrator security role. If you have a need to allow non-System Administrators to assign security roles, you should consider creating a custom security role. See [Create an administrative user and prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md). 

