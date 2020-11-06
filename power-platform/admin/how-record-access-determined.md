---
title: How access to a record is determined | Microsoft Docs
description: How access to a record is determined 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# How access to a record is determined

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

There are different ways to obtain access to a particular record in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). To be able to do a certain action with an entity (Create, Read, Write, Delete, Append, Append to, Assign, Share), two major checks are done: privilege and access checks. The access check only takes place once the privilege check passes.
 
## Privilege check
 
The privilege check is the first barrier that needs to be passed in order to do a certain action with a record of an entity. The privilege checks validate that the user has the required privilege for that entity. For each entity, whether out of the box or custom, there exist different privileges to provide interaction capabilities with the records of that type. 

For example, for Account, the privileges are:

|Privilege|Description|  
|---------------|-----------------|  
|**Create**|Required to make a new record. Which records can be created depends on the access level of the permission defined in your security role.|  
|**Read**|Required to open a record to view the contents. Which records can be read depends on the access level of the permission defined in your security role.|  
|**Write**|Required to make changes to a record. Which records can be changed depends on the access level of the permission defined in your security role.|  
|**Delete**|Required to permanently remove a record. Which records can be deleted depends on the access level of the permission defined in your security role.|  
|**Append**|Required to associate the current record with another record. For example, a note can be attached to an opportunity if the user has Append rights on the note. The records that can be appended depend on the access level of the permission defined in your security role.<br /> In the case of many-to-many relationships, you must have Append privileges for both entities being associated or disassociated.|  
|**Append To**|Required to associate a record with the current record. For example, if a user has Append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role.|  
|**Assign**|Required to give ownership of a record to another user. Which records can be assigned depends on the access level of the permission defined in your security role.|  
|**Share**|Required to give access to a record to another user while keeping your own access. Which records can be shared depends on the access level of the permission defined in your security role.|  

In order to perform an action on a record, the user needs to have either the required privilege assigned through a role directly, or needs to be member of a team that has a security role with the privilege assigned. If this is not the case, then the user will get an access denied error stating that they do not hold the necessary privilege to perform the action.
 
For example, in a scenario where a user wants to create an Account record, it is necessary that the user has the Create privilege either through a security role assigned to them or to a team they belong to.
 
> [!NOTE]
> When creating or editing a security role, a privilege is granted to that role with a given access level. The access level is not taken into account in the privilege check, this is done in the access check when the privilege check is passed.

## Access check
 
If the privilege check is passed, then the access check takes place. The access check verifies that the user has the required rights to perform the action they are trying to do.

There are four different ways in which a user can have access rights to perform an action in a particular record. These are:
- Ownership
- Role access
- Shared access
- Hierarchy access

> [!IMPORTANT]
> All of these are checked during the access check so it is possible that the user has access to perform the required action on the record in more than one way.

### Ownership
 
A user can have access to a particular record because either they own the record in question or they belong to a team that owns the record. In both cases, any access level will suffice to have access regardless of the business unit the record belongs to. As the privilege check was already passed, this means the user has appropriate access to perform the action.

> [!NOTE]
> In case the user belongs to a team that owns the record, the user has access to the record as well. 

### Role access
 
Users can have access to perform an action on a record because of the security roles they hold. In this case, the access level of the privilege a role has is taken into account. There are four major scenarios that correspond to the different access levels that are not User, which is covered in the ownership case.

#### The record belongs to the user or a team the user belongs to
In this case, the user must either have or belong to a team that has a role assigned that has the required privilege with at least User-level access.

> [!NOTE]
> For roles assigned to teams with Basic-level access user privilege, the role's inheritance configuration also comes into play. If the team has the **Member's privilege inheritance** set to **Team privileges only**, then the user will only be able make use of that privilege for records owned by the team. For more information, go to [Team member's privilege inheritance](security-roles-privileges.md#team-members-privilege-inheritance).
> 
> :::image type="content" source="media/member-privilege-inheritance.png" alt-text="Member's privilege inheritance":::
 
#### The record belongs to the same business unit as the user
In this case, the user must either have or belong to a team that has a role assigned that has the required privilege with at least Business Unit-level access.
 
#### The record belongs to a business unit that is a descendant of the user's business unit
In this case, the user must either have or belong to a team that has a role assigned that has the required privilege with at least the access level Parent:Child Business Units.
 
#### The record belongs to a business unit that is not a descendant of the user's business unit
In this case, the user must either have or belong to a team that has a role assigned that has the required privilege with Organization-level access.
 
### Shared access
 
Another way to get access to a record without having an explicit role assigned that allows this is through shared access. Shared access is obtained when a record is shared with a user, team, or organization by a user that has appropriate share rights. There are five ways in which a user can have shared access to a record.

#### The record was shared with the user directly
If a record is shared with the user to perform a certain action, then the user would have access to do that action provided the user passed the privilege check.
 
#### A related record was shared with the user directly
The following scenario takes place when a record A is related to a record B. If the user has shared access to perform a certain action on the record A, it would then have inherited access to perform the same action on the record B, provided the user passed the privilege check.
 
#### The record was shared with a team that the user belongs to
If a record is shared with a team to perform a set of actions, then the users that belong to that team would have access to do those actions provided they passed the privilege check.
 
#### A related record was shared with a team that the user belongs to
The following scenario takes place when a record A is related to a record B. If record A is shared with a team to perform a set of actions, and record A is related to record B, then the users that belong to that team would have access to do those actions in both records A and B, provided they passed the privilege check.
 
#### The record was shared with the entire organization
If a record is shared with an organization to perform a set of actions, then all the users that belong to that organization will be able to perform those actions provided they passed the privilege check.

### Hierarchy access
 
The hierarchy access only takes place if [Hierarchy Security](hierarchy-security.md) management is enabled in that organization and for that entity, and if the user is a manager.

In this case, the user would have access to the record if both of the following are met:
- The manager has a security role assigned directly or through a team that has the access level Business Unit or Parent:Child Business Units. 
- Plus, any one of the following:
  - The record is owned by a direct report. 
  - A direct report is a member of the owner team. 
  - The record was shared to perform the required action with a direct report. 
  - The record was shared to perform the required action with a team a direct report belongs to.

### See also
[Security roles and privileges](security-roles-privileges.md) <br />
[Create users and assign security roles](create-users-assign-online-security-roles.md) <br />
[Create or edit a security role to manage access](create-edit-security-role.md)
