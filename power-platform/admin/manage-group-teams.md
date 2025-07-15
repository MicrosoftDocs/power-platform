---
title: Manage group teams
description: Managing group teams 
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/15/2025
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.contributors:
  - lsuresh
contributors:
  - lavanyapg
search.audienceType: 
  - admin
---
# Manage group teams

## About group teams

A Microsoft Entra *group* team is similar to *owner* team. A Microsoft Entra group team can own records and can have security roles assigned to the team. There are two *group* team types, and they correspond directly to the Microsoft Entra group types – Security and Microsoft 365. The *group* security role can be just for the team or for team member with User privileges [member's privilege inheritance](security-roles-privileges.md). Team members are dynamically derived (added and removed) when they access the environment based on their Microsoft Entra group membership. 

### Using Microsoft Entra groups to manage a user's app and data access 

The administration of app and data access for Microsoft Dataverse is extended to allow administrators to use their organization's Microsoft Entra groups to manage access rights for licensed Dataverse users.

Both types of Microsoft Entra groups—Security and Microsoft 365—can be used to secure user-access rights. Using groups lets administrators assign a security role with its respective privileges to all the members of the group, instead of having to provide the access rights to an individual team member.

Both types of Microsoft Entra groups—Security and Microsoft 365—with a Membership type *Assigned* and *Dynamic User* can be used to secure user-access rights. Membership type *Dynamic Device* isn't supported. Using groups lets administrators assign a security role with its respective privileges to all the members of the group, instead of having to provide the access rights to an individual team member.

The administrator can create Microsoft Entra group teams that are associated to the Microsoft Entra groups in each of the environments and assign a security role to these group teams. For each Microsoft Entra group, the administrator can create group teams based on the Microsoft Entra group **Members**, and/or **Owners**, or **Guests**. For each Microsoft Entra group, an administrator can create separate group teams for owners, members, guests, and members and guests, and assign a respective security role to each of these teams.

When members of these group teams access these environments, their access rights are automatically granted based on the group team's security role.

> [!TIP]
> ![Video symbol](../admin/media/video-thumbnail-4.png "Video symbol") Check out the following video: [Dynamic Microsoft Entra Groups](https://learn-video.azurefd.net/vod/player?id=2624ecc4-a40a-451d-a5b4-8bc9d4d0069a).  


#### Provision and deprovision users 

Once the group team and its security role are established in an environment, user access to the environment is based on the user membership of the Microsoft Entra groups. When a new user is created in the tenant, all the administrator needs to do is assign the user to the appropriate Microsoft Entra group, and assign Dataverse licenses. The user can immediately access the environment without the need to wait for the administrator to add the user into the environment or assign a security role. The user is created in the environment under the root business unit.  

When users are deleted or disabled in Microsoft Entra ID or removed from the Microsoft Entra groups, they lose their group membership and can't access the environment when they try to sign in.  

> [!NOTE]
> The deleted or disabled group user remains in the Power Platform Dataverse environment if the user didn't access the environment.

To remove the user from a Dataverse group team, perform the following steps:

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. 
1. Select an environment, and then select **Settings** > **Users + permissions** > **Users**.
1. Search and select the user.
1. On the User form, select the **...** menu.
1. Select the **Manage user in Dynamics 365** option.
1. On the **User** page, select the Dataverse group team you want to remove the user from.
1. Select the **Delete** button.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 
1. Go to **Environments**.
1. Select an environment, and then select **Settings** > **Users + permissions** > **Users**.
1. Search and select the user.
1. On the User form, select on the **...** menu.
1. Select the **Manage user in Dynamics 365** option.
1. On the **User** page, select the Dataverse group team you want to remove the user from.
1. Select the **Delete** button.


---

If you accidentally deleted an active group user, the group user will be added back to the Dataverse group team the next time the user accesses the environment.
   
#### Remove user access at run time 

When a user is removed from the Microsoft Entra groups by an administrator, the user is removed from the group team, and they lose their access rights the next time they access the environment. The memberships for the user's Microsoft Entra groups and Dataverse group teams are synchronized, and the user's access rights are dynamically derived at run time.

#### Administer user security role 

Administrators no longer have to wait for the user to sync to the environment and then to assign a security role to the user individually by using Microsoft Entra group teams. Once a group team is established and created in an environment with a security role, any licensed Dataverse users who are added to the Microsoft Entra group can immediately access the environment. 

#### Lock down user access to environments 

Administrators can continue to use a Microsoft Entra security group to lock down the list of users synced to an environment. This can be further reinforced by using Microsoft Entra group teams. To lock down environment or app access to restricted environments, the administrator can create separate Microsoft Entra groups for each environment and assign the appropriate security role for these groups. Only these Microsoft Entra group team members have the access rights to the environment.

#### Share Power Apps to team members of a Microsoft Entra group 

When canvas and model-driven apps are shared to a Microsoft Entra group team, team members can immediately run the apps.

#### User-owned and team-owned records 

A new property is added to the security role definition to provide special team privileges when the role is assigned to group teams. This type of security role allows team members to be granted User/Basic-level privileges as if the security role is directly assigned to them. Team members can create and be an owner of records without the need to have an additional security role assigned.

A group team can own one or more records. To make a team an owner of the record, you must assign the record to the team.

While teams provide access to a group of users, you must still associate individual users with security roles that grant the privileges that they need to create, update, or delete user-owned records. These privileges can't be applied by assigning a nonmember's privilege inherited security role to a team and then adding the user to that team. If you need to provide your team members the team privileges directly, without their own security role, you can assign the team a security role that has [member's privilege inheritance](security-roles-privileges.md).

For more information, see [Assign a record to a user or team](/powerapps/user/assign-or-share-records).

## Create a group team

### Prerequisites to create a group team 

- Make sure that you have the System Administrator, Sales Manager, Vice President of Sales, Vice President of Marketing, or CEO-Business Manager security role or equivalent permissions.

   Check your security role:
   - Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
   - Don't have the correct permissions? Contact your system administrator.

- A Microsoft Entra Group is required for each group team.
- Obtain the Microsoft Entra Group's **ObjectID** from your https://portal.azure.com site.
- Create a custom security role that contains privileges per your team's collaboration requirement. See the discussion of [member's inherited privileges](security-roles-privileges.md) if you need to extend the team member's privileges directly to a user.

### Create a group team in Power Platform admin center

To create a group team in the Power Platform admin center, perform the following steps:

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. 
1. Select an environment, and then select **Settings** > **Users + permissions** > **Teams**.
1. Select **+ Create team**.

# [Classic admin center](#tab/classic)


1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 
1. Select an environment.
1. Select **Settings** > **Users + permissions** > **Teams**.
1. Select **+ Create team**.

---

You need to specify the following fields:   

   - **Team name:** Be sure this name is unique within a business unit.
   - **Description:** Enter a description of the team.
   - **Business unit:** Select the business unit from the dropdown list.
   - **Administrator:** Search for users in the organization. Start entering characters.
   - **Team type:** Select the team type from the dropdown list. A team can be either the Owner, Access, Microsoft Entra Security group, or the Microsoft Entra Office group type. 

   :::image type="content" source="media/dataverse-team-manage-new-team.png" alt-text="Screenshot of settings for a new Dataverse team.":::
   
If the team type is Microsoft Entra Security group or Microsoft Entra Office group, you must also enter these fields:

   - **Group name:** Start entering text to select an existing Microsoft Entra group name. These groups are precreated in Microsoft Entra ID.
   - **Membership type:** Select the membership type from the dropdown list. See [How Microsoft Entra security group members match to Dataverse group team members](#how-microsoft-entra-security-group-members-match-to-dataverse-group-team-members).
   
   :::image type="content" source="media/dataverse-team-manage-new-team-azuread.png" alt-text="Screenshot of settings for a new Microsoft Entra team.":::

After you create the team, you can add team members and select corresponding security roles. This step is optional, but recommended.

### How Microsoft Entra security group members match to Dataverse group team members

:::image type="content" source="media/match-azure-ad-to-dataverse.png" alt-text="How does Microsoft Entra members match to Dataverse group team members":::

Review the following table for how members in Microsoft Entra groups match to Dataverse group team members.

|Select Dataverse group team membership type (4)  | Resulting membership |
|---------|---------|
| Members and guests | Select this type to include both Member and Guest user types (3) from the Microsoft Entra group category Members (1). |
| Members    | Select this type to include only user type Member (3) from the Microsoft Entra group category Members (1).     |
| Owners     | Select this type to include only user type Member (3) from the Microsoft Entra group category Owners (2).     |
| Guests     | Select this type to include only user type Guest (3) from the Microsoft Entra group category Members (1).    |

## Edit a group team

### Prerequisites to edit a group team 

- Make sure that you have the System Administrator, Sales Manager, Vice President of Sales, Vice President of Marketing, or CEO-Business Manager security role or equivalent permissions.

   Check your security role:
   - Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
   - Don't have the correct permissions? Contact your system administrator.

### Edit a group team in Power Platform admin center

To edit a group team in the Power Platform admin center, perform the following steps:

# [New admin center](#tab/new)
 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. 
1. Select an environment, and then select **Settings** > **Users + permissions** > **Teams**.


# [Classic admin center](#tab/classic)
   
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 
1. Select an environment, and then select **Settings** > **Users + permissions** > **Teams**.


---

Select the checkbox for a team name. Select **Edit team**. Only the **Team name**, **Description**, and **Administrator** are available for editing. Update the fields as required, and then select **Update**.

   :::image type="content" source="media/dataverse-team-manage-edit.png" alt-text="Screenshot of editing a team.":::

> [!NOTE]
> - To edit the Business Unit, see [Change the business unit for a team](create-edit-business-units.md#change-the-business-unit-for-a-team).
> - You can create Dataverse group teams - **Members**, **Owners**, **Guests**, and **Members and Guests** per environment based on the Microsoft Entra group membership type for each Microsoft Entra group. The Microsoft Entra ID ObjectId of the group team can't be edited once the group team is created.
> - The Dataverse Membership Type can't be changed after the group team is created. If you need to update this field, you need to delete the group team and create a new one.
> - All existing group teams created prior to the new **Membership Type** field being added are automatically updated as **Members and guests**. There's no loss in functionality with these group teams as the default group team is mapped to the Microsoft Entra Group **Members and guests** membership type. 
> - If your environment has a security group, you need to add the group team's Microsoft Entra group as a member of that security group in order for the group team's users to be able to access the environment.
> - **The list of team members listed in each group team only displays the user members who have accessed the environment.** This list doesn't show all the group members of the Microsoft Entra group. When a Microsoft Entra group member accesses the environment, the group member is added to the group team. The team member's privileges are derived dynamically at run-time by inheriting the group team's security role. Since the security role is assigned to the group team and the group team member inherits the privileges, the security role isn't assigned directly to the group team member. Due to the team member's privileges being derived dynamically at run-time, the team member's Microsoft Entra group memberships are cached upon the team member's sign in.  This means that any Microsoft Entra group membership maintenance done on the team member in Microsoft Entra ID won't be reflected until the next time the team member logs in or when the system refreshes the cache (after 8 hours of continuous sign in).
> - **Microsoft Entra group members are also added to the group team with [impersonation calls](/powerapps/developer/common-data-service/impersonate-another-user)**. You can use create group members in the group team on behalf of another user using impersonation. 
> - Team members are added or removed from the group team at run-time when the group member signs into the environment. These addition and removal group member events can be used to trigger plugin operations.
> - You don't need to assign team members with an individual security role if your group team's security role has a [member's privilege inheritance](security-roles-privileges.md) and the security role contains at least one privilege that has User level permission.
> - The group team name isn't automatically updated when the Microsoft Entra group name is changed. There's no impact in system operation with group name changes, but we recommend that you update it in the Power Platform admin center Teams settings.
> - The AD group members are automatically created in the environment when they first access the environment. The users are added under the root business unit. You don't need to move the user to a different business unit if you enabled the [Modernized Business Units](wp-security-cds.md#matrix-data-access-structure-modernized-business-units) to manage your user's data access. 

## Manage the security roles of a team

1. Select the checkbox for a team name.  

   :::image type="content" source="media/select-team.png" alt-text="Screenshot selecting a team.":::

1. Select **Manage security roles**. 

1. Select the role or roles you want, and then select **Save**.

   :::image type="content" source="media/dataverse-team-manage-security-roles.png" alt-text="Screenshot of managing security roles.":::

## Change the business unit for a team  

See [Change the business unit for a team](create-edit-business-units.md#change-the-business-unit-for-a-team).

## Add group team types to the default lookup view

When you manually assign a record or sharing a record using the built-in form, the default options list doesn't pick up some group team types such as Microsoft Entra ID. You can edit the filter on the default lookup view of the teams table so that it includes these groups.

1.	Sign in to [Power Apps](https://make.powerapps.com).

2.	Select **Dataverse** > **Tables** > **Team** > **Views** > **Teams Lookup View** > **Edit Filters**

3.	Set **Team Type**, **Equals** to:  **AAD Office Group**, **AAD Security Group**, **Owner**

   :::image type="content" source="media/team-type-edit-filters.png" alt-text="Add Microsoft Entra Office Group and Microsoft Entra Security Group to the Team type.":::
    
4.	Select **OK** > **Save** > **Publish**.

## Delete team members and group team

You can [delete the group team](manage-teams.md#delete-a-team) by first removing all the team members from the Dataverse group team. 

## Delete Microsoft Entra group

When the Microsoft Entra group is deleted from the Azure.portal, all members are removed automatically from the Dataverse group team in the environment within 24 hours. The [Dataverse group team can then be deleted](manage-teams.md#delete-a-team) after all the members are removed.

## Other team operations  

- [Manage team members](manage-teams.md#manage-team-members)
- [Delete a team](manage-teams.md#delete-a-team)
- [Change the business unit for a team](manage-teams.md#change-the-business-unit-for-a-team)


### Related content

[Manage teams](manage-teams.md) <br />
[Video: Microsoft Entra group membership](https://youtu.be/GW2Rz53BX6o) <br />
[Create a basic group and add members using Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) <br />
[Quickstart: View your organization's groups and members in Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-groups-view-azure-portal)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
