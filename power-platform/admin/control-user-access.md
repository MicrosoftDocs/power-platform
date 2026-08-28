---
title: Control user access to environments with security groups and licenses
description: Learn how to control user access to environments using security groups and licenses
services: powerapps
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: ellenwehrle
ms.contributors:
  - pmantha
  - paulliewI'
  - syalandur
contributors:
  - thomasjeffries11 
  - iscohen-microsoft 
  - praveenmantha
  - paulliew
  - syalandur24
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/26/2026
search.audienceType: 
  - admin
ms.custom:
  - "admin-security"
  - sfi-image-nochange
---

# Control user access to environments with security groups and licenses

If your company has multiple environments, use security groups to control which licensed users can be members of a particular environment.  

> [!NOTE]
> For information about how user access works for Microsoft Dataverse for Teams, see [User access to Dataverse for Teams environments](about-teams-environment.md#user-access-to-dataverse-for-teams-environments).
  
Consider the following example scenario:  
  
|Environment|Security group|Purpose|  
|--------------|--------------------|-------------|  
|Coho Winery Sales|Sales_SG| Provide access to the environment that creates sales opportunities, handles quotes, and closes deals.|  
|Coho Winery Marketing|Marketing_SG|Provide access to the environment that drives marketing efforts through marketing campaigns and advertising.|  
|Coho Winery Service|Service_SG|Provide access to the environment that processes customer cases.|  
|Coho Winery Dev|Developer_SG|Provide access to the sandbox environment used for development and testing.|  
  
In this example, four security groups provide controlled access to a specific environment.  
  
Note the following information about **nested security groups**:

Members of a security group nested within an environment security group **aren't pre-provisioned or automatically added to the environment**. There are a couple of ways to add members to an environment:

- Create a [Dataverse group team](manage-group-teams.md#create-a-group-team) for the nested security group and assign a security role to the team.
- Have a member of the nested security group access the environment for the first time. This action adds the member to the environment at run time, but the member still can't run model-driven apps or access Dataverse data until you assign a security role to them.

**Nested security group scenario**: Suppose you assign a security group when you create an environment. Later, you want to add users who are managed through another security group. You create a Microsoft Entra security group named *Managers* and add your managers to it. You then add the Managers security group as a child of the environment security group, create a [Dataverse group team](manage-group-teams.md#create-a-group-team) for Managers, and assign a security role to the group team so the managers can access Dataverse.

Note the following information about **security groups**:
  
- When you add users to the security group, you add them to the environment.  
- When you remove users from the group, you disable them in the environment.  
- When you associate a security group with an existing environment that has users, you disable all users in the environment who aren't members of the group. 
- If you associate a security group with an environment, only users with an [eligible Power Platform or Dynamics 365 license](pricing-billing-skus.md) or per-app plan who are members of the environment security group are created as users in the environment.
- You can't assign security groups to default and developer environment types. If you already assigned a security group to your default or developer environment, remove it. The default environment is intended to be shared with all users in the tenant and the developer environment is intended for use by only the owner of the environment.
- Environments support associating the following group types: Security and Microsoft 365. Associating [other group types](/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide&WT.mc_id=365AdminCSH&preserve-view=true) isn't supported.
- When you select a security group, select a Microsoft Entra security group and not one created in on-premises Windows Active Directory. On-premises Windows AD security groups aren't supported.
- If a user isn't part of the assigned security group to the environment, but has the Power Platform Administrator role, the user shows as an active user and can sign in.
- If a user is assigned to the Dynamics 365 administrator role, then the user must be part of the security group before they're enabled in the environment. They can't access the environment until they're added to the security group and enabled.
- All your [application users](manage-application-users.md) can run in any environments that are secured with a security group, without being a member of the security group.

> [!NOTE]
> All licensed users, whether or not they're members of the security groups, must be assigned security roles to access data in the environments. You [assign security roles](assign-security-roles.md) in the web application.  If users don't have a security role, they get a data access denied error when trying to run an app. Users can't access environments until they're assigned at least one security role for that environment. For more information, see [Configure environment security](database-security.md).
> Automatic user assignment to an environment isn't supported for trial environments. For trial environments, users must be assigned manually.

## Review admin roles you need to complete different tasks

Managing security groups often involves multiple roles. This table shows the least-privileged role necessary to complete each task.

| Task | Least-privileged role |
|---|---|
| Create or manage the Microsoft Entra security group and membership | Groups Administrator; User Administrator also works |
| Create users | User Administrator |
| Assign or remove licenses | License Administrator; User Administrator also works |
| Associate the security group with an environment | Power Platform Administrator or Dynamics 365 Administrator |
| Assign Dataverse security roles | System Administrator security role, or a custom Dataverse role with at least Read and Assign privileges on the Security Role table |

Important qualifications:

- A Dynamics 365 Administrator must belong to the environment's security group. This restriction doesn't apply to Global Administrators or Power Platform Administrators.
- Power Platform, Dynamics 365, and Global Administrators are no longer automatically assigned the Dataverse System Administrator role. They must self-elevate before assigning Dataverse roles.
- Power Platform and Dynamics 365 administrators can't create users, manage Entra groups, or assign licenses solely through their service-admin role.
  
## Create a security group and add members to the security group  

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).  
1. Select **Teams & groups** > **Active teams & groups**.  
1. Select **+ Add a group**.  
1. Change the type to **Security group**, add the group **Name** and **Description**, and then select **Add** > **Close**.  
1. Select the group you created, and then next to **Members**, select **Edit**.  
1. Select **+ Add members**. Select the users to add to the security group, and then select **Save** > **Close** several times to return to the **Groups** list.  
  
To remove a user from the security group, select the security group and then, next to **Members**, select **Edit**. Select **- Remove members**, and then select **X** for each member you want to remove.  
  
> [!NOTE]
> If the users you want to add to the security group aren't created, create the users and assign an [eligible Power Platform or Dynamics 365 license](pricing-billing-skus.md) to them.
> 
> To add multiple users, see: [bulk add users to Office365 groups](/microsoft-365/enterprise/add-several-users-at-the-same-time).  
  
### Create a user and assign license  
  
1. In the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], select **Users** > **Active users** > **+ Add a user**.
1. Enter the user information, select licenses, and then select **Add**.  
  
   [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users)  

Or, purchase and assign per-app passes: [About Power Apps per app plans](about-powerapps-perapp.md)

> [!NOTE]
> If an environment has a Power Apps per-app plan allocated, all users are considered licensed when they attempt to access the environment, including users that don't have individual licenses assigned. Per-app plan allocation on an environment satisfies the requirement for users to be licensed in order to access the environment. It's also important to note that the Power Apps per app plan only allows individual users to run one application or one portal for a specific business scenario in an environment allocated with the Power Apps per-app plan.
  
## Associate a security group with an environment
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 administrator or Power Platform administrator).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**, and then choose the environment with which you want to associate the security group.
1. Select **Edit**.
1. In the **Edit details** pane, select the **Edit** icon in the **Security group** area.

    :::image type="content" source="media/edit-security-groups-new-tab.png" alt-text="Select the Edit icon to select a security group.":::

    The first 200 security groups are returned. Use **Search** to look for a specific security group.

1. Select a security group, select **Done**, and then select **Save**.

    The security group is associated with the environment.

> [!NOTE]
> Canvas apps can be shared with users outside of the security group associated with the environment, but the users need to be members of the security group to run the apps. If you're a user who isn't in the security group and you try to run the shared apps, you see this error message: "You can't open apps in this environment. You aren't a member of the environment's security group." If your Power Platform admin [sets governance details](powerapps-powershell.md) for your organization, you see a governance contact that you can reach out to for security group membership.

### Related content

[Create users](create-users.md)
[Manage Microsoft Entra groups and group membership](/entra/fundamentals/how-to-manage-groups)
 
