---
title: "Use access and owner team templates for collaboration"
description: "Learn how to use team templates in Microsoft Power Platform to allow users across business units to share information and collaborate."
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/11/2021
author: jimholtz
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# About collaborating with team templates

Using teams is optional, however, teams give you an easy way to share information and collaborate with users across business units. A team is a group of users. As a group, you will be able to track information about the rows and perform assigned tasks in a much more efficient and coordinated way. While a team belongs to only one business unit, it can include users from other business units. A user can be associated with more than one team.
  
 There are two types of teams that you can work with: *owner* and *access*.  
  
-   An owner team owns rows and has security roles assigned to the team. The team’s privileges are defined by these security roles. In addition to privileges provided by the team’s security roles, users have the privileges defined by their individual security roles and by the roles from other teams in which they are members. A team has full access rights on the rows that the team owns.  
  
-   An access team doesn’t own rows and doesn’t have security roles assigned to the team. The users have privileges defined by their individual security roles and by the roles from other teams in which they are members. The rows are shared with an access team and the team members are granted access rights on the rows, such as Read, Write, or Append.  
  
An access team can be created manually (user-created) or automatically (system-managed). You can share multiple rows with a user-created access team. A system-managed team is created for a specific row and other rows can’t be shared with this team. For system-managed teams, you have to provide a team template that the system uses to create a team. In this template, you define the table type and the access rights on the row that are granted to the team members when the team is created. A team template is displayed on all row forms for the specified table as a list. When you add the first user to the list, the actual access team for this row is created. You can add and remove members in the team using this list. The team template applies to the rows of the specified table type and the related tables, according to the cascading rules. To give team members different access on the row, you can provide several team templates, each template specifying different access rights. For example, you can create a team template for the account table with the Read access right, which allows the team members to view the specified account. For another team that requires more access to the same account, you can create a team template with Read, Write, Share and other access rights.  
  
Only tables that are enabled for system-managed access teams can be specified in the template.  
  
If you change access rights in the team template, the changes are only applied to new system-managed access teams. The existing teams aren’t affected.  
  
For information about how to create a team template, enable an table for system-managed access teams and how to customize the table form to add the team template, see [Create a team template and add to an table form](create-team-template-add-entity-form.md).
  
### See also  
 [Create a team template and add to an table form](create-team-template-add-entity-form.md)   
 [Manage teams](manage-teams.md)    



[!INCLUDE[footer-include](../includes/footer-banner.md)]
