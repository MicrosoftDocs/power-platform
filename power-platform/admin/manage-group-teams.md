---
title: "Manage group teams  | MicrosoftDocs"
description: About managing group teams 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage group teams

<!-- legacy procedure -->

## About group teams

Applies to Microsoft Dataverse

An Azure Active Directory (Azure AD) *group* team. Similar to *owner* team, an Azure AD group team can own records and can have security roles assigned to the team. There are two *group* team types, and they correspond directly to the Azure AD group types – Security and Office. The *group* security role can be just for the team or for team member with User privileges [member's privilege inheritance](security-roles-privileges.md#team-members-privilege-inheritance). Team members are dynamically derived (added and removed) when they access the environment based on their Azure AD group membership. 

### Using Azure Active Directory groups to manage a user's app and data access 

The administration of app and data access for Microsoft Dataverse has been extended to allow administrators to use their organization's Azure Active Directory (Azure AD) groups to manage access rights for licensed Dataverse users.

Both types of Azure AD groups—Office and Security—can be used to secure user-access rights. Using groups lets administrators assign a security role with its respective privileges to all the members of the group, instead of having to provide the access rights to an individual team member.

Both types of Azure AD groups — Office and Security — with a Membership type *Assigned* can be used to secure user-access rights. Membership type *Dynamic User* and *Dynamic Device* is not supported. Using groups lets administrators assign a security role with its respective privileges to all the members of the group, instead of having to provide the access rights to an individual team member.

The administrator can create Azure AD group teams that are associated to the Azure AD groups in each of the Dataverse environments and assign a security role to these group teams. For each Azure AD group, the administrator can create group teams based on the Azure AD group membership types. The administrator can create separate group teams for owners, members, guests and members, and guests, and assign a respective security role to each of these teams.

When members of these group teams access these environments, their access rights are automatically granted based on the group team's security role.

#### Provision and deprovision users 

Once the group team and its security role is established in an environment, user access to the environment is based on the user membership of the Azure AD groups. When a new user is created in the tenant, all the administrator needs to do is assign the user to the appropriate Azure AD group, and assign Dataverse licenses. The user can immediately access the environment without the need to wait for the administrator to assign a security role.

When users are deleted/disabled in Azure AD or removed from the Azure AD groups, they lose their group membership and won't be able to access the environment when they try to sign in.  

#### Remove user access at run time 

When a user is removed from the Azure AD groups by an administrator, the user is removed from the group team, and they lose their access rights the next time they access the environment. The memberships for the user's Azure AD groups and Dataverse group teams are synchronized, and the user's access rights are dynamically derived at run time.

#### Administer user security role 

Administrators no longer have to wait for the user to sync to the environment and then to assign a security role to the user individually by using Azure AD group teams. Once a group team is established and created in an environment with a security role, any licensed Dataverse users who are added to the Azure AD group can immediately access the environment. 

#### Lock down user access to environments 

Administrators can continue to use an Azure AD security group to lock down the list of users synced to an environment. This can be further reinforced by using Azure AD group teams. To lock down environment or app access to restricted environments, the administrator can create separate Azure AD groups for each environment and assign the appropriate security role for these groups. Only these Azure AD group team members have the access rights to the environment.

#### Share Power Apps to team members of an Azure AD group 

When canvas and model-driven apps are shared to an Azure AD group team, team members can immediately run the apps.

#### User-owned and team-owned records 

A new property has been added to the security role definition to provide special team privileges when the role is assigned to group teams. This type of security role allows team members to be granted User/Basic-level privileges as if the security role is directly assigned to them. Team members can create and be an owner of records without the need to have an additional security role assigned.

A group team can own one or more records. To make a team an owner of the record, you must assign the record to the team.

While teams provide access to a group of users, you must still associate individual users with security roles that grant the privileges that they need to create, update, or delete user-owned records. These privileges can't be applied by assigning a nonmember's privilege inherited security role to a team and then adding the user to that team. If you need to provide your team members the team privileges directly, without their own security role, you can assign the team a security role that has [member's privilege inheritance](security-roles-privileges.md#team-members-privilege-inheritance).

For more information, see [Assign a record to a user or team](https://docs.microsoft.com/powerapps/user/assign-or-share-records).

## Create a group team

1. Make sure that you have the System Administrator, Sales Manager, Vice President of Sales, Vice President of Marketing, or CEO-Business Manager security role or equivalent permissions.

   Check your security role:
   - Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
   - Don't have the correct permissions? Contact your system administrator.

   Prerequisites:
   1. An Azure Active Directory (Azure AD) Group is required for each group team.
   2. Obtain the Azure AD Group's **ObjectID** from your https://portal.azure.com site.
   3. Create a custom security role that contains privileges per your team's collaboration requirement. Please see the discussion of [member's inherited privileges](security-roles-privileges.md#team-members-privilege-inheritance) if you need to extend the team member's privileges directly to a user.

2. In the web app, go to **Settings** > **Security**. In Microsoft Dynamics 365 for Outlook, go to **Settings** > **System** > **Security**.

3. Select **Teams**.

4. On the Actions toolbar, select **New** button.

5. Enter a team name.

6. Select a business unit.

7. Enter an administrator.

8. Select **Team Type** (a drop-down list is displayed).

9. Select **AAD Security** or **Office group** (this must match the Azure AD Group type).

10. Enter the respective Azure AD **ObjectID** of the Azure AD Security or Office group.

11. Select **Membership Type**, and then one of the following:
  
    - **Members and guests**
    - **Members**
    - **Owners**
    - **Guests**

    The Azure AD group members from the selected membership type will be mapped to the group team when the member accesses the system.   

12. Select **Save**. 
    
    If you don't select the business unit to which the team will belong, by default, the root business unit is selected. The root business unit is the first business unit created for an organization.

## Edit a group team

1. Make sure that you have the System Administrator, Sales Manager, Vice President of Sales, Vice President of Marketing, or CEO-Business Manager security role or equivalent permissions.
   
   Check your security role:
   - Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
   - Don't have the correct permissions? Contact your system administrator.

2. In the web app, go to **Settings** > **Security**. In Dynamics 365 for Outlook, go to **Settings** > **System** > **Security**.

3. Select **Teams**.

4. In the **Teams** drop-down list, select **All AAD Office or Security Teams**.

5. In the grid, select the team you want to edit.

6. On the Actions toolbar, select **Edit**, change the desired fields (Membership Type cannot be updated), and then select **Save**.

> [!NOTE]
> - You can only create one group team for each Azure AD group membership type per environment, and the Azure AD ObjectId of the group team cannot be edited once the group team is created.
> - Membership Type cannot be changed after the group team is created.  If you need to update this field, you will need to delete the group team and create a new one.
> - All existing group teams created prior to the new **Membership Type** field being added are automatically updated as **Members and guests**. There is no loss in functionality with these group teams as the default group team is mapped to the Azure AD Group **Members and guests** membership type. 
> - If your environment has a security group, you will need to add the group team's Azure AD group as a member of that security group in order for the group team's users to be able to access the environment.
> - **The list of team members listed in each group team only displays the user members who have accessed the environment.** This list doesn't show all the group members of the Azure AD group. The team member's privileges are derived dynamically at run-time when the team member accesses the application. The security role of the team is not assigned directly to the team member. Since team member's privileges are derived dynamically at run-time, the team member's Azure AD group memberships are cached upon the team member's log-in.  This means that any Azure AD group membership maintenance done on the team member in Azure AD will not be reflected until the next time the team member logs in or when the system refreshes the cache (after 8 hours of continuous log-in).
> - **Azure AD group members are also added to the group team with [impersonation calls](https://docs.microsoft.com/powerapps/developer/common-data-service/impersonate-another-user)**. You can use create group members in the group team on behalf of another user using impersonation. 
> - Team members are maintained in each group team at run-time and the operation is done at the database level; therefore, the update to group team event is not available for plugin.
> - You do not need to assign team members with an individual security role if your group team's security role has a [member's privilege inheritance](security-roles-privileges.md#team-members-privilege-inheritance) and the security role contains at least one privilege that has User level permission.

### See also
[Manage teams](manage-teams.md)
