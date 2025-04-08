---
title: Assign security roles 
description: Learn about assigning security roles to a user.
author: paulliew
ms.reviewer: sericks
ms.subservice: admin
ms.author: paulliew
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/02/2025
search.audienceType: 
  - admin
contributors:
  - jordanchodakWork

---
# Assign a security role to a user  

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Consider the following information about security roles:

 - Security roles control a user's access to data through a set of access levels and permissions. The combination of access levels and permissions that are included in a specific security role sets limits on the user's view of data and on the user's interactions with that data.  
 - Dataverse provide a default set of security roles. If necessary for your organization, you can create new security roles by editing one of the default security roles and then saving it under a new name. See [Predefined security roles](database-security.md#predefined-security-roles).
 - You can assign more than one security role to a user. The effect of multiple security roles is cumulative, which means that the user has the permissions associated with all security roles assigned to the user.  
- Security roles are associated with business units. If you've created business units, only those security roles associated with the business unit are available for the users in the business unit. You can use this feature to limit data access to data owned by the business unit.  
- When the [allow record ownership across business units](wp-security-cds.md#enable-the-matrix-data-access-structure) is enabled, you can assign security roles from different business units to your users irrespective of which business unit the users belong to.
- To assign security roles to a user, you need to have the appropriate privileges (minimum privileges are **Read** and **Assign** on the **Security Role** table). To prevent elevation of security role privileges, the person who is assigning the security role can't assign someone else to a security role that has more privileges than the assigner. For example, a CSR Manager can't assign another user to the System Administrator role. This privilege validation includes checking each privilege that the assigner has at the privilege depth-level and business unit. For example, you can't assign a security role from a different business unit to another user if you don't have a security role with the appropriate privilege-level assigned from that business unit.

> [!NOTE]
> By default, the System Administrator security role has all the required privileges to assign security roles to any user, including assigning the System Administrator security role. If you have a need to allow **non-System Administrators** to assign security roles, you should consider creating a custom security role with all the privileges listed in [Create an administrative user and prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md). Assign the custom security role and all the security roles that the non-System Administrator can assign to other users, to the non-System Administrator. This security role requirement is also required if you allow non-System Administrators to [manage team members in owner teams](manage-teams.md#manage-team-members).
>
> The System Administrator role should be assigned directly to users, or to a security group the users are part of.
> 
> It's important to note that custom security roles are **not** supported for canvas apps.
 
For more information about the difference between [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] administrator roles and security roles, see [Grant users access](grant-users-access.md).

> [!TIP]
> Check out the following video: [Assigning security roles in the Power Platform admin center](https://learn-video.azurefd.net/vod/player?id=fa663203-981a-4a08-8e25-2ec1e8d793f6).
  
Follow these steps to assign a security role.

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) as a System Administrator. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Settings**.

4. Select **Users + permissions**, and then select **Users**.

5. On the **Users** page select a user, and then select **Manage security roles**.

6. Select or deselect security roles. When finished, select **Save**.  After saving, all selected roles become the current assigned roles for the user.  Unselected roles aren't assigned. 

When the [allow record ownership across business units](wp-security-cds.md#enable-the-matrix-data-access-structure) is enabled, you can select security roles from different business unit. 

> [!IMPORTANT] 
> You must assign at least one security role to every user either directly or indirectly as a member of a [group team](manage-group-teams.md). The service doesn't allow access to users who don't have at least one security role.

> [!NOTE]
> The panel shown above shows and manages only direct role assignments for the user. [Manage group teams](manage-group-teams.md) explains how to see and manage roles assigned as a member of a [group team](manage-group-teams.md).

## User settings privileges for record ownership across business units
  
If you have enabled [allow record ownership across business units](wp-security-cds.md#enable-the-matrix-data-access-structure), your users can access data in other business units by having a security role from these other business units directly assigned to them. The user also needs a security role assigned from the user's business unit with  privileges from the following tables in order to update the user UI settings:  
  
- Action Card User Settings
- Saved View
- User Chart
- User Dashboard
- User Entity Instance Data
- User Entity UI Settings
- User Application Metadata
  
To assign security roles to users in an environment that has zero or one Microsoft Dataverse database, see [Configure user security to resources in an environment](database-security.md). 

## (Optional) Assign an administrator role  

You can share [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administration tasks among several people by assigning [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administrator roles to users you select to fill each role. For detailed information about [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] administrator roles, see [Assigning Admin Roles](/microsoft-365/admin/add-users/assign-admin-roles).  
  
> [!NOTE]
> [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administrator roles are valid only for managing aspects of the online service subscription. These roles don't affect permissions within the service.

## Automatic role assignment

When users are added to Dataverse, roles are assigned automatically based on the following criteria: 

1. Users, with a valid license, get corresponding mapped roles assigned to them automatically. Removal of the respective license results in automatic role removal. License-based default role management isn't applicable for users in these types of environments: Dataverse for Teams, Trial, and Developer. 

1. For the Default environment type, **Basic User** and **Environment Maker** roles are assigned automatically to all users added in Dataverse.

1. In the finance and operations linked environment with a Dataverse database, the finance and operations **Basic User** security role is automatically assigned to all active users in Dataverse.

> [!NOTE]
> Previously, Microsoft Entra ID admins, including Power Platform admins and Dynamics 365 service admins, were automatically assigned the System Administrator role in Dataverse. This is no longer the case. However, if an admin was previously assigned a role in Dataverse, removing them from the Power Platform admin and Dynamics 365 service admin roles will not automatically remove their System Administrator role in Dataverse. There is currently no way to determine whether the role was assigned automatically by the system or manually by an administrator. Therefore, we recommend that administrators manually remove the System Administrator role once the Microsoft Entra role has been removed.

## License to role mapping

If defined in your environment, certain roles are automatically assigned to users when users are added to Dataverse based on the license the users are assigned. You can view the license to role mapping in an environment by navigating to the License to Role Mapping page in the Power Platform admin center.

Go to **Environments** > [select an environment] > **Settings** > **Users + Permissions** > **License To Role mapping**.

### Related information
[Get started with security roles in Dataverse](/training/modules/get-started-security-roles/)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
