---
title: "Dataverse teams management in PPAC | MicrosoftDocs"
description: Understand the different types of teams and their associated privledges for members based on their roles.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/17/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Dataverse teams management in PPAC

This articles discusses the different types of teams and their associated Power Platform privledges for members based on their roles.

## Types of teams

**Owner team:** An owner team owns records and has security roles assigned to the team. The team's privileges are defined by their security roles. In addition to privileges provided by the team, team members privileges are defined by their individual security roles, the team(s) for which they're members of, and roles from other teams for which they [inherit member privleges](security-roles-privileges#team-members-privilege-inheritance.md). A team has full access rights on the records that the team owns.  Team members are added manually to the owner team.

**Access team:** An access team doesn't own records and doesn't have security roles assigned to the team. The team members have privileges defined by their individual security roles and by roles from the teams for which they are members. They share records with an access team, and the team is granted access rights to the records. Access rights include Read, Write, and Append.

**AAD group team:** Similar to owner teams, an Azure Active Directory (Azure AD) group team can own records and can have security roles assigned to the team. *Security* and *Office* are two group team types, and they correspond directly to Azure AD group types. Group security roles can be only for a specific team or for a team member with user privileges that include [members' privilege inheritance](security-roles-privileges#team-members-privilege-inheritance.md). Team members are dynamically derived (added and removed) when they access an environment based on their Azure AD group membership. To learn more, see [Manage group teams](manage-group-teams.md).

## Modify the team page settings

To access your team's page:
1. Go to Environment > Settings > Teams.

![Environments Settings](media/dataverseteam1.png "Environments Settings")

2. On the Environments tab, the page displays all of the teams in an environment.

![Teams Settings](media/dataverseteam2.png "Teams Settings")

To create a new team:
1. Specify the following fields:   
  - **Team name:** Team name should be unique for a business unit.
  - **Description:** Team description
  - **Business unit:** Select the business unit in the drop down.
  - **Administrator:** Search for users in the organization (Start typing characters)
  - **Team type:** Select Team type from the drop down.
  > [!NOTE]
  > A team can be one of the following types: Owner, Access, AAD Security Group, or AAD Office Group. 

![New team](media/dataverseteam3.png "New team")

2. If the team type is AAD Security Group or AAD Office Group, you must also enter these fields:
  - **Group name:** AAD Group Name (Start typing for existing AAD group names). These groups are pre-created in AAD.
  - **Membership type:** Select membership type from the dropdown.

![New team AAD](media/dataverseteam4.png "New team AAD")

Once you create the team, you can add team members and select corresponding security roles. (This step is optional, but recommended.)

To edit a team:
1. Select the team and then choose **Edit team**. (Only the Team Name, Description and Administrator are available for editing.) 

2. Update the fields as required, and then select **Update**.

![Edit team](media/dataverseteam5.png "Edit team")

To delete a team:
1.  Select the team and then **Delete team**. 

2. Select **Delete** to confirm. (Note that this action cannot be undone.)

![Delete access](media/dataverseteam6.png "Delete access")

To manage the security role(s) of a team:
1. Select the team and then **Manage security roles**. 

2. Select the role(s) required and then **Save**.

![Manage security roles](media/dataverseteam7.png "Manage security roles")

### Managing team members

You can add and delete members from a team.

> [!NOTE]
> Managing team members is allowed only for the *Owner* and *Access* team types. For AAD group teams, managing team members must be performed by an Azure AD admin.

To manage team members:
1. Select the team and then **Manage team members**. 

2. Do one of the following:
  - To add a new team member, select **Add team members** and specify the user.

![Add team members](media/dataverseteam8.png "Add team members")

  - To delete a team member, select the user and then **Remove**.

![Delete team members](media/dataverseteam9.png "Delete team members")

## See also

[Manage group teams](manage-group-teams.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]