---
title: Use service admin roles to manage your tenant 
description: Use service admin roles to manage your tenant 
author: srpoduri 
ms.subservice: admin
ms.author: sericks 
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
contributors:
- JesseParsons 
- srpoduri
- kavehkazms 
ms.topic: conceptual
ms.date: 08/20/2024
search.audienceType: 
  - admin
---
# Use service admin roles to manage your tenant

To help you administer environments and settings for the Microsoft Power Platform, you can assign users to manage the service at the tenant level without having to assign a role that provides access to other services within the tenant.

There are two Power Platform related service admin roles you can assign to provide a high level of admin management.

> [!NOTE]
> These ([and other](database-security.md#predefined-security-roles)) admin roles only apply to [what you can do in the Power Platform admin center](admin-documentation.md#power-platform-admin-center-features). For example, Dynamics 365 Finance and Dynamics 365 Supply Chain Management are currently not managed in the Power Platform admin center.

## Dynamics 365 administrator

The Dynamics 365 admin can:

- Sign in to and manage multiple environments. If an environment uses a security group, a service admin would need to be added to the security group in order to manage that environment. Not assigning to an in place security group essentially locks these admins out of any admin management. 
- Perform admin functions in Microsoft Power Platform because they have the System Administrator role.  

## Power Platform administrator
  
 Users with the Power Platform admin role can:  
  
- Sign in to and manage multiple environments. Power Platform admins **are not affected** by security group membership and can manage environments even if not added to an environment's security group.
- Perform admin functions in Microsoft Power Platform because they have the System Administrator role.
  
Both service admin roles cannot do functions such as manage user accounts, manage subscriptions, access settings for Microsoft 365 apps like Microsoft Exchange or Microsoft SharePoint.  
  
## Assign a service admin role to a user

Follow these steps to assign a service admin role.

> [!NOTE]
> When the Dynamics 365 administrator, Power Platform administrator, or Global administrator role is assigned to a user in Microsoft Entra ID, the user is no longer automatically assigned to the system administrator role in environments. For more information on how to gain access to the system administrator role and remove such access, see [Manage admin roles with Microsoft Entra Privileged Identity Management](manage-high-privileged-admin-roles.md).
>
> To opt-out of automatic license-based user roles, see [Opt-out of automatic license-based user roles management](opt-out-automatic-license.md).

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) as a [Privileged Role Administrator role](/entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator)

2. Go to **Users** > **Active users** and select a user.
  
3. Under **Account** > **Roles** select **Manage roles**.

4. Select to expand **Show all by category**.

5. Under **Collaboration** select either **Dynamics 365 administrator** or **Power Platform administrator**. 
  
6. Select **Save changes**.

> [!NOTE]
> If you are using the [Microsoft Entra Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management/pim-configure#what-does-it-do) time-based role activation to manage your service admin roles, see [Manage admin roles with Microsoft Entra Privileged Identity Management](manage-high-privileged-admin-roles.md).  
> 
> Service Admin roles must be assigned directly to users, as inheriting from security groups is not fully supported.

## Service administrator permission matrix

The following matrix shows what management is possible with the various service admin roles compared to the Microsoft 365 global admin role.

> [!NOTE]
> Global admin, Power Platform admin, and the Dynamics 365 admin roles must be directly assigned for a user. Role association through security groups is not supported.

|  &nbsp;    |Microsoft 365<br>Global admin<br />  |Power Platform<br> admin <br />  |Dynamics 365<br> admin<br />  | Power BI<br> admin<br />  |
|---------|---------|---------|---------|---------|
|**POWER PLATFORM** |||||  
|**Environments** |||||  
|Full access<sup>1</sup> |Yes|Yes|Yes<sup>2</sup>|No|  
|Create|Yes|Yes|Yes<sup>2</sup>|No|  
|Delete|Yes|Yes|Yes<sup>2</sup>|No|  
|Backup and restore|Yes|Yes| Yes<sup>2</sup>|No|  
|Copy |Yes|Yes|Yes<sup>2</sup>|No|  
|Ability to exclude access from selected environments (using security groups) |No|No|Yes|Yes|  
|**Analytics**|||||
|Capacity|Yes|Yes|Yes<sup>2</sup>|No|  
|Capacity allocation (Power Apps per app plans, Power Automate, AI Builder, and Portal) |Yes|Yes|Yes<sup>2</sup>|No|
|Microsoft Dataverse|Yes|Yes|Yes<sup>2</sup>|No|  
|Power Automate|Yes|Yes|Yes<sup>2</sup>|No|  
|Power Apps|Yes|Yes|Yes<sup>2</sup>|No|  
|**Help + support**|||||
|Create and access support requests|Yes|Yes|Yes<sup>2</sup>|No|  
|**Data integration**|||||
|Create new project and connection set|Yes|Yes|Yes<sup>2</sup>|No|  
|**Data gateways**|||||
|View gateways|Yes|Yes|Yes<sup>2</sup>|No|  
|**Data policies**|||||
|View and manage tenant policies|Yes|Yes|Yes|No|  
|View and manage environment policies|Yes|Yes|Yes|No|  
|**Copilot**|||||
|View Copilot page in Power Platform admin center|Yes|Yes|Yes|No|  
||||||
|**POWER BI**|||||  
|Manage the Power BI tenant|Yes|Yes|No|Yes|  
|Acquire and assign Power BI licenses|Yes|No|No|No|  
||||||
|**MICROSOFT 365**|||||  
|Create users|Yes|No|No|No|  
|Add security roles|Yes|No|No|No|  
|Add licenses|Yes|No|No|No|  

<sup>1</sup>Equivalent permission level to a System Administrator after [self-elevation](manage-high-privileged-admin-roles.md#self-elevate-to-the-system-administrator-role). Has full permission to customize or administer the environment, including creating, modifying, and assigning security roles. Can view all data in the environment - if the user has a suitable license.

<sup>2</sup>If no security group is assigned to the environment, or if a security group is assigned and the user with this role is added to it.


### See also  
[Environments overview](environments-overview.md)<br />
[What is Power BI administration?](/power-bi/service-admin-administering-power-bi-in-your-organization)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
