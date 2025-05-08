---
title: "Manage PrincipalObjectAccess storage  | MicrosoftDocs"
description: Information about managing PrincipalObjectAccess storage.
author: paulliew 
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/20/2023
ms.subservice: admin
ms.author: paulliew 
ms.reviewer: sericks 
contributors:
- igorantunesms 
search.audienceType: 
  - admin
---
# Manage PrincipalObjectAccess storage

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Users in an environment with the Microsoft Dataverse database can collaborate with other users by granting access to a user-owned record. The user can share a record with another user or team, or reassign a record to another user or team.

To manage this record-level collaboration and to provide user access to shared records, all sharing of records and their permissions are stored in the PrincipalObjectAccess (POA) table. Whenever users try to access a record that they don’t own or don't have the appropriate privilege in their security role, the system checks the POA table to authorize the user’s access. 

## Sources of POA
The following topics outline the settings or usage that create POA records, as they enable record sharing. The settings should be reviewed and updated accordingly to avoid over-sharing and the increase in POA storage. 

### Share reassigned records with original owner

By-default, the **Set whether reassigned records are shared with original owner** setting is **No**. This is where the original owner of the record no longer has access to the record when the record ownership is reassigned to another user. When this setting is set to **Yes**, then a record is created in the POA table whenever a user assigns a record to another user or team. The original owner is automatically added as **Share** to.

:::image type="content" source="media/manage-principalobjectaccess-storage.png" alt-text="Manage PrincipalObjectAccess storage.":::

### Access teams
When an access team is used for record collaboration, records are created in the POA table whenever a user is added to the access team. There are two types of access teams:

- **System-managed**: These are created via templates and are embedded on a form to allow the user to easily manage the member list. The system automatically creates an access team for a record that is shared. For example, Account #1 has an access team that is different from Account #2. 

- **Manually added**: These are individual access teams where an admin/owner of the team manages the team members list. 

### Direct sharing

- When a user explicitly shares a record to another user, a record is created in the POA table.

### Indirect sharing

- When a user shares a record to a team, all members of the team are indirectly shared to.

- Indirect sharing also occurs with a record that has a cascade-sharing relationship or on a table with a parent/child relationship. When a parent record is shared to a user or team, the shared-to user or team has access to all the cascaded, or child records. All these permissions to access the child records are created in the POA table. 

  **Example of table relationship**
  
  A table can be set to have relationships with other tables (for example, Account to Case). By default, the relationship of the **Reparent** option is set to **Cascade All**. All related subrecords are shared to the owner of the parent record.  

  For example: User #1 owns Account #1. User #1 shares Account #1 with User #2. User #2 creates a Case #1 underneath Account #1. With the out-of-the-box reparent options, User #1 has access to Case #1. All these user permissions are captured in the POA table.

### Sharing source
The RetrieveAccessOrigin API can be used to determine where a user or team’s access to a specific table comes from. The API requires an objectId, logicalName, and principalId in the request, and the response is a string describing where the access to the table was obtained.

## Management of POA table growth  

- Evaluate your business needs and turn on **Set whether reassigned records are shared with the original owner** where needed. Note that this is a system-wide setting. Once it’s turned on, the setting is applied to all records.
- Share with users for collaboration where the list of users isn't the same in the different records you shared.
- Use the team as the record owner if you frequently share records with the same list of users or share the record with the team.
- If you have a complex business unit structure and frequent use of sharing:
  - Share only where needed.
  - Minimize the number of business units.
  - Make sure that users are placed in the appropriate business unit.
  - Share to the team to allow users from different business units to access records.
- When a record can be accessed by multiple access teams—for example, a sales representative team that can only read the record, and another sales manager team that has full read and write access—consider using different role-based forms for sales representative and sales manager. 
- Manage the lifecycle of your access team members. Remove users who are no longer needed for the collaboration.
- Remove all access team members when collaboration is over. 

## Deleting POA records
The POA table is managed by the system to ensure proper access of users or teams to respective records. Direct deletion on this table is not supported since it can break the security model defined for the organization. The correct way to clean up the POA table is by adjusting the security model, and revoking access that was previously given.

## Troubleshooting guides
When the cascade configuration of a table relationship is [changed from **Reparent** or **Share** to **No Cascade**](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior#inherited-access-repair), use this article to clean up the inherited access. This removes unnecessary POA records. More information: [How to clean up inherited access](/troubleshoot/power-platform/power-apps/dataverse/cleanup-inherited-access?tabs=sdk).

Inherited access rights cleanup is a system job that cleans up the legacy, inherited access rights that remain after the cascading behavior is changed to **Cascade None**. More information: [Inherited access rights cleanup](/power-apps/maker/data-platform/create-edit-entity-relationships#inherited-access-rights-cleanup)

To learn whether user access was granted because of POA, see [Determine why a user has access](/power-apps/developer/data-platform/security-sharing-assigning?tabs=sdk#determine-why-a-user-has-access). 


### See also
[Dataverse storage capacity](capacity-storage.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]



