---
title: "Dataverse teams management  | MicrosoftDocs"
description: Understand the different types of teams and how to view and manage settings.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/02/2021
author: jimholtz
ms.subservice: admin
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
# Dataverse teams management

Using teams is optional. However, teams provide an easy way to share business objects and let you collaborate with other people across business units. While a team belongs to one business unit, it can include users from other business units. You can associate a user with more than one team. This topic discusses the different types of teams and their various operations.

## Types of teams

**Owner team:** An owner team owns records and has security roles assigned to the team.  A user's privileges can come from their individual security roles, those of the team(s) they are part of, and/or the ones they inherit. A team has full access rights on the records that the team owns.  Team members are added manually to the owner team. 

**Access team:** An access team doesn't own records and doesn't have security roles assigned to the team. The team members have privileges defined by their individual security roles and by roles from the teams for which they are members. They share records with an access team, and the team is granted access rights to the records. Access rights include Read, Write, and Append.

**Azure AD group team:** Similar to owner teams, an Azure Active Directory (Azure AD) group team can own records and can have security roles assigned to the team. *Security* and *Office* are two group team types, and they correspond directly to Azure AD group types. Group security roles can be only for a specific team or for a team member with user privileges that include [members' privilege inheritance](security-roles-privileges.md#team-members-privilege-inheritance). Team members are dynamically derived (added and removed) when they access an environment based on their Azure AD group membership. See [Manage group teams](manage-group-teams.md).

> [!NOTE]
> You can assign security roles to **Owner and Azure AD group teams** and users directly. The environment picker only recognizes users who are members of Azure AD group teams and users who have security roles assigned to them directly. 

## Team operations

### Access your team's page

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select an environment and then select **Settings** > **Users + permissions** > **Teams**.

A list of all of the teams in the environment is displayed.

![List of teams in environment.](media/dataverse-team-manage-list.png "List of teams in environment")

### Create a new team

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select an environment and then select **Settings** > **Users + permissions** > **Teams**.

3. Select **+ Create team**.

4. Specify the following fields:   

   - **Team name:** Team name should be unique for a business unit.
   - **Description:** Team description.
   - **Business unit:** Select the business unit in the drop down.
   - **Administrator:** Search for users in the organization. Start typing characters.
   - **Team type:** Select Team type from the drop down.

   :::image type="content" source="media/dataverse-team-manage-new-team.png" alt-text="New Dataverse team settings.":::
   
   > [!NOTE]
   > A team can be one of the following types: Owner, Access, Azure AD Security group, or Azure AD Office group. 

5. If the team type is Azure AD Security group or Azure AD Office group, you must also enter these fields:

   - **Group name:** The Azure AD group name. Start typing for existing Azure AD group names). These groups are pre-created in Azure AD.
   - **Membership type:** Select the membership type from the dropdown.

   :::image type="content" source="media/dataverse-team-manage-new-team-azuread.png" alt-text="New Azure AD team.":::

Once you create the team, you can add team members and select corresponding security roles. This step is optional, but recommended.

### Edit a team

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select an environment and then select **Settings** > **Users + permissions** > **Teams**.

3. Select a team and then select **Edit team**. Only the Team name, Description, and Administrator are available for editing.

4. Update the fields as required, and then select **Update**.

   :::image type="content" source="media/dataverse-team-manage-edit.png" alt-text="Edit a team.":::

### Delete a team

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select an environment and then select **Settings** > **Users + permissions** > **Teams**.

3. Select a team and then select **Delete team**. 

4. Select **Delete** to confirm. Note that this action cannot be undone.

### Manage team members

You can add and delete members from a team.

> [!NOTE]
> Managing team members is allowed only for the *Owner* and *Access* team types. For Azure AD group teams, managing team members must be performed by an Azure AD admin.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select an environment and then select **Settings** > **Users + permissions** > **Teams**.

3. Select a team and then select **Manage team members**. 

4. Do one of the following:

   - To add a new team member, select **+ Add team members** and then specify users.

   :::image type="content" source="media/dataverse-team-manage-add-members.png" alt-text="Add team members.":::

   - To delete a team member, select the user and then select **Remove**.

### Manage the security role(s) of a team

1. Select a team and then select **Manage security roles**. 

2. Select the role(s) required and then select **Save**.

   :::image type="content" source="media/dataverse-team-manage-security-roles.png" alt-text="Manage security roles.":::


### See also  
 [Create a team template and add to an entity form](create-team-template-add-entity-form.md)   
 [Manage group teams](manage-group-teams.md)
 [About team templates](../admin/about-team-templates.md)   
 [Add teams or users to a field security profile](add-teams-users-field-security-profile.md)   
 [About team templates](about-team-templates.md)   
 [Entity relationship behavior](/powerapps/maker/common-data-service/create-edit-entity-relationships#entity-relationship-behavior)


[!INCLUDE[footer-include](../includes/footer-banner.md)]