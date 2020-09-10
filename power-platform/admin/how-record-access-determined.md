---
title: How access to a record is determined | Microsoft Docs
description: How access to a record is determined 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.date: 09/10/2020
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

There are different ways to obtain access to a particular record in CDS.
In broad terms, in order to be able to do a certain action with an entity (Read, Write, Create, Delete, Append, Append to, Share, Assign) there are two major checks that are done, privilege and access checks. The access check only takes place once the privilege check was passed
 
 
## Privilege Check
 
The privilege check is the first barrier that needs to be passed in order to do a certain action with a record of an entity. The privilege checks validate that the user has the required privilege for that entity.
For each entity, be it out of the box or custom there exist different privileges to provide interaction capabilities with the records of that type. 

For example, for Account, the privileges are:
- prvReadAccount
- prvCreateAccount
- prvWriteAccount
- prvDeleteAccount
- prvAppendAccount
- prvAppendToAccount
- prvShareAccount
- prvAssignAccount

In order to perform an action on a record, the caller needs to have either the required privilege assigned through a role directly, or the caller needs to be member of a team that has a security role with the privilege assigned.
If this is not the case, then the user will get an access denied error claiming that they do not hold the necessary privilege to perform the action.
 
For example, in a scenario where a user wants to create an Account record, it is necessary that the user has the privilege prvCreateAccount either through a security role assigned to them or to a team they belong to.
 
Note: When creating or editing a security role, a privilege is granted to that role with a given depth. The depth is not taken into account in the privilege check, this is done in the access check in case that the privilege check is passed.

## Access Check
 
If the privilege check is passed, then the access check takes place. The Access check verifies that the user has the required rights to perform the action they are trying to perform.

There are for different ways in which a user can have access rights to a perform an action in a particular record. These are:
- Ownership
- Role Access
- Shared Access
- Hierarchy Access

It is important to notice that all of these are checked during the access check so it is possible that the user has access to perform the required action on the record on more than one way.

### Ownership
 
A user can have access to a particular record because either they own the record in question or they belong to a team that owns the record.
In both cases any depth will suffice to have access regardless of the Business Unit the record belongs to. 
As the privilege check was already passed this means the user has appropriate access to perform the action.
 
Note: In case the user belongs to a team that owns the record, the user has access to the record as well. 

### Role Access
 
Users can have access to perform an action on a record because of the security roles they hold. In this case, the depth of the privilege a role has is taken into account. In this particular case, there are three major scenarios that correspond to the different depths that are not Basic (User) which is covered in the ownership case.
 
#### The record belongs to the user or a team the user belongs to.
In this case, the user must either have or belong to a team that has a role assigned which has the required privilege with at least Basic (User) depth.
 
Note: For Roles assigned to Teams with Basic Privilege, the role's inheritance configuration also comes into place. If the team has the isinherited field set to false, then the user will only be able to effectively make user of that privilege for records owned by the Team.
 
#### The record belongs to the same Business Unit as the user.
In this case, the user must either have or belong to a team that has a role assigned which has the required privilege with at least Local (Business Unit) depth.
 
#### The record belongs to a Business Unit that is a descendant of the user's Business Unit
In this case, the user must either have or belong to a team that has a role assigned which has the required privilege with at least Deep (??) depth.
 
#### The record belongs to a Business Unit that is not a descendant of the user's Business Unit
In this case, the user must either have or belong to a team that has a role assigned which has the required privilege with Global (Organization) depth.
 
### Shared Access
 
Another way to get access to a record without having an explicit role assigned that allows this is through shared access. Shared access is obtained when a record is shared with a user, team or organization by a user that has appropriate share rights. There are four ways in which a user can have shared access to a record:
 
#### The record was shared with the user directly
If a record is shared with the user to perform a certain action then the user would have access to do that action provided it passed the privilege check.
 
#### A related record was shared with the user directly
The following scenario takes place when a record A is related to a record B. If the user has shared access to perform a certain action on the record A, it would then have inherited access to perform the same action on the record B  provided they passed the privilege check.
 
#### The record was shared with a team that the user belongs to
If a record is shared with a team to perform a set of actions, then the users that belong to that team would have access to do those actions provided they passed the privilege check.
 
#### A related record was shared with a team that the user belongs to
The following scenario takes place when a record A is related to a record B. If record A is shared with a team to perform a set of actions, and record A is related to record B, then the users that belong to that team would have access to do those actions in both records A and B, provided they passed the privilege check.
 
#### The record was shared with the entire organization
If a record is shared with an organization to perform a set of actions, then all the users that belong to that organization will be able to perform those actions provided they passed the privilege check.

### Hierarchy
 
The hierarchy access only takes place if Hierarchy Security Management is enabled in that organization and that entity and if the user is a manager.
 
In this case, the user would have access to the record if:
- The manager has a security role assigned directly or through a team that have Local or Deep depth
And
- The record is owned by a direct report OR
- A direct report is member of the owner team OR
- The record was shared to perform the required action with a direct report OR
- The record was shared to perform the required action with a team a direct report belongs to


