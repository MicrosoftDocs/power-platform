---
title: Control user access to environments with security groups and licenses
description: Learn how to control user access to environments using security groups and licenses
services: powerapps
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.contributors:
  - pmantha
  - paulliew
  - sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: how-to
ms.date: 6/3/2025
search.audienceType: 
  - admin
---

# Control user access to environments with security groups and licenses

If your company has multiple environments, you can use security groups to control which licensed users can be members of a particular environment.  

> [!NOTE]
> For information on how user access works for Microsoft Dataverse for Teams, see [User access to Dataverse for Teams environments](about-teams-environment.md#user-access-to-dataverse-for-teams-environments).
  
Consider the following example scenario:  
  
|Environment|Security group|Purpose|  
|--------------|--------------------|-------------|  
|Coho Winery Sales|Sales_SG| Provide access to the environment that creates sales opportunities, handles quotes, and closes deals.|  
|Coho Winery Marketing|Marketing_SG|Provide access to the environment that drives marketing efforts through marketing campaigns and advertising.|  
|Coho Winery Service|Service_SG|Provide access to the environment that processes customer cases.|  
|Coho Winery Dev|Developer_SG|Provide access to the sandbox environment used for development and testing.|  
  
In this example, four security groups provide controlled access to a specific environment.  
  
Note the following information about security groups: 
  
- About nested security groups

  Members of a nested security group in an environment security group aren't **pre-provisioned or automatically added to the environment**. However, they can be added into the environment when you create a [Dataverse group team](manage-group-teams.md#create-a-group-team) for the nested security group. 

  An example of this scenario: you assigned a security group for the environment when the environment was created. During the lifecycle of the environment, you want to add members to the environment that are managed by security groups. You create a security group in Microsoft Entra ID—managers, for example—and assign all your managers to the group. You then add this security group as a child of the environment security group, create a [Dataverse group team](manage-group-teams.md#create-a-group-team), and assign a security role to the group team. Your managers can now access Dataverse immediately.   
  
  A member of a nested security group is also added into the environment at run time when the member accesses the environment the first time. But the member won't be able to run any application and access any data until a security role is assigned.   
  
- When users are added to the security group, they're added to the environment.  
- When users are removed from the group, they're disabled in the environment.  
- When a security group is associated with an existing environment with users, all users in the environment that aren't members of the group will be disabled. 
- If an environment doesn't have an associated security group, all users with a Dataverse license (customer engagement apps—Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation—Power Automate, Power Apps, and others) will be created as users and enabled in the environment.  
- If a security group is associated with an environment, only users with Dataverse licenses or per app plan that are members of the environment security group will be created as users in the environment.  
- If you don't specify a security group, all users who have a Dataverse license (customer engagement apps such as Dynamics 365 Sales and Customer Service) or per app plan will be added to the new environment.
- **New**: Security groups can't be assigned to default and developer environment types. If you've already assigned a security group to your default or developer environment, we recommend removing it since the default environment is intended to be shared with all users in the tenant and the developer environment is intended for use by only the owner of the environment.
- Environments support associating the following group types: Security and Microsoft 365. Associating [other group types](/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide&WT.mc_id=365AdminCSH&preserve-view=true) isn't supported.
- When you select a security group, be sure to select a Microsoft Entra security group and not one created in on-premises Windows Active Directory. On-premises Windows AD security groups aren't supported.
- If a user isn't part of the assigned security group to the environment but has the Power Platform Administrator role, the user will still show as an active user and will be able to sign in.
- If a user is assigned the Dynamics 365 Service Admin role, then the user must be part of the security group before they're enabled in the environment. They can't access the environment until they're added to the security group and enabled.
- All your [application users](manage-application-users.md) can run in any environments that are secured with a security group, without being a member of the security group.

> [!NOTE]
> All licensed users, whether or not they're members of the security groups, must be assigned security roles to access data in the environments. You [assign security roles](assign-security-roles.md) in the web application.  If users don’t have a security role, they'll get a data access denied error when trying to run an app. Users can't access environments until they're assigned at least one security role for that environment. For more information, see [Configure environment security](database-security.md).
> Automatic user assignment to an environment isn't supported for trial environments. For trial environments, users must be assigned manually. 
  
## Create a security group and add members to the security group  

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).  
  
2. Select **Teams & groups** > **Active teams & groups**.  
  
3. Select **+ Add a group**.  
  
4. Change the type to **Security group**, add the group **Name** and **Description**, and then select **Add** > **Close**.  
  
5. Select the group you created, and then next to **Members**, select **Edit**.  
  
6. Select **+ Add members**. Select the users to add to the security group, and then select **Save** > **Close** several times to return to the **Groups** list.  
  
To remove a user from the security group, select the security group and then, next to **Members**, select **Edit**. Select **- Remove members**, and then select **X** for each member you want to remove.  
  
> [!NOTE]
> If the users you want to add to the security group aren't created, create the users and assign the Dataverse licenses to them.  
> 
> To add multiple users, see: [bulk add users to Office365 groups](/microsoft-365/enterprise/add-several-users-at-the-same-time).  
  
### Create a user and assign license  
  
1. In the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], select **Users** > **Active users** > **+ Add a user**.

2. Enter the user information, select licenses, and then select **Add**.  
  
   [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users)  

Or, purchase and assign per-app passes: [About Power Apps per app plans](about-powerapps-perapp.md)

> [!NOTE]
> If an environment has a Power Apps per-app plan allocated, all users will be considered licensed when they attempt to access the environment, including users that don't have individual licenses assigned. Per-app plan allocation on an environment satisfies the requirement for users to be licensed in order to access the environment.
  
## Associate a security group with an environment
  
#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).

1. In the navigation pane, select **Manage**.

1. In the **Manage** pane, select **Environments**, and then choose the environment to which you want to associate the security group.

1. Select **Edit**.

1. In the **Edit details** pane, select the **Edit** icon in the **Security group** area.

    :::image type="content" source="media/edit-security-groups-new-tab.png" alt-text="Select the Edit icon to select a security group.":::

    Only the first 200 security groups will be returned. Use **Search** to look for a specific security group.

1. Select a security group, select **Done**, and then select **Save**.

    The security group is associated with the environment.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).

1. In the navigation pane, select **Environments**.

1. Select the name of the environment and select **Edit**.

    :::image type="content" source="media/environment-properties.svg" alt-text="Select Edit.":::

1. In the **Edit details** pane, select the **Edit** icon in the **Security group** area.
  
    :::image type="content" source="media/edit-security-groups.png" alt-text="Select the Edit icon to select a security group.":::

   Only the first 200 security groups will be returned. Use **Search** to look for a specific security group.

1. Select a security group, select **Done**, and then select **Save**.

    The security group is associated with the environment.

---

> [!NOTE]
> Users running canvas apps when a security group is associated with the environment of the app must be members of the security group to be able to run the canvas app, regardless of whether the app has been shared with them. Otherwise, users will see this error message: "You can't open apps in this environment. You aren't a member of the environment's security group." If your Power Platform admin has [set governance details](powerapps-powershell.md) for your organization, you will see a governance contact that you may reach out to for security group membership.

### See also

[Create users](create-users.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
