---
title: "Use service admin roles to manage your tenant   | MicrosoftDocs"
description: Use service admin roles to manage your tenant 
author: jayasreekumar
ms.author: jkumar
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/20/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Use service admin roles to manage your tenant

To help you administer environments and settings for Power Platform, you can assign users to manage at the tenant level without having to assign the more powerful Microsoft 365 global admin privilege.  

There are two Power Platform related service admin roles you can assign to provide a high level of admin management.

## Dynamics 365 administrator

The Dynamics 365 admin can:

- Sign in to and manage multiple environments. If an environment uses a security group, a service admin would need to be added to the security group in order to manage that environment. Not assigning to an in place security group essentially locks these admins out of any admin management. 
- Perform admin functions in Power Platform because they have the system admin role.  

## Power Platform administrator 
  
 Users with the Power Platform admin role can:  
  
- Sign in to and manage multiple environments. Power Platform admins **are not affected** by security group membership and can manage environments even if not added to an environment's security group.
- Perform admin functions in Power Platform because they have the system admin role.
  
Both service admin roles cannot do functions restricted to the Microsoft 365 global admin such as manage user accounts, manage subscriptions, access settings for Microsoft 365 apps like Microsoft Exchange or Microsoft SharePoint.  
  
## Assign a service admin role to a user

Follow these steps to assign a service admin role.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) as a global admin.

2. Go to **Users** > **Active users** and select a user.
  
3. Under **Account** > **Roles** select **Manage roles**.

4. Select to expand **Show all by category**.

5. Under **Collaboration** select either **Dynamics 365 administrator** or **Power Platform administrator**. 
  
6. Select **Save changes**.

## Service administrator permission matrix

The following matrix shows what management is possible with the various service admin roles compared to the Microsoft 365 global admin role.

|    |Microsoft 365<br>Global admin<br />  |Power Platform<br> admin <br />  |Dynamics 365<br> admin<br />  | Power BI<br> admin<br />  |
|---------|---------|---------|---------|---------|
|**POWER PLATFORM** |||||  
|**Environments** |||||  
|Full access<sup>1</sup> |Yes|Yes|Yes<sup>2</sup>|No|  
|Create|Yes|Yes|Yes<sup>2</sup>|No|  
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
|View and manage tenant policies|Yes|Yes|Yes<sup>2</sup>|No|  
|View and manage environment policies|Yes|Yes|Yes<sup>2</sup>|No|  
||||||
|**POWER BI**|||||  
|Manage the Power BI tenant|Yes|Yes|No|Yes|  
|Acquire and assign Power BI licenses|Yes|No|No|No|  
||||||
|**MICROSOFT 365**|||||  
|Create users|Yes|No|No|No|  
|Add security roles|Yes|No|No|No|  
|Add licenses|Yes|No|No|No|  

<sup>1</sup>Equivalent permission level to a System Administrator. Has full permission to customize or administer the environment, including creating, modifying, and assigning security roles. Can view all data in the environment - if the user has a suitable license.

<sup>2</sup>If a security group is assigned to the environment and the user with this role added to the security group


### See also  
[Environments overview](environments-overview.md)<br />
[What is Power BI administration?](https://docs.microsoft.com/power-bi/service-admin-administering-power-bi-in-your-organization)
