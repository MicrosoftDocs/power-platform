---
title: "Assign security roles | MicrosoftDocs"
description: About assigning security roles to a user.
author: jimholtz
ms.reviewer: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Assign a security role to a user  

**About security roles**

 - Security roles control a user's access to data through a set of access levels and permissions. The combination of access levels and permissions that are included in a specific security role sets limits on the user's view of data and on the user's interactions with that data.  
 - Customer engagement apps provide a default set of security roles. If necessary for your organization, you can create new security roles by editing one of the default security roles and then saving it under a new name. See [Predefined security roles](database-security.md#predefined-security-roles).
 - You can assign more than one security role to a user. The effect of multiple security roles is cumulative, which means that the user has the permissions associated with all security roles assigned to the user.  
- Security roles are associated with business units. If you've created business units, only those security roles associated with the business unit are available for the users in the business unit. You can use this feature to limit data access to data owned by the business unit.  
- You need to have the appropriate privileges in order to assign security roles to another user. See [Assigning security roles](security-roles-privileges.md#assigning-security-roles).
  
 For more information about the difference between [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] administrator roles and security roles, see [Grant users access](grant-users-access.md).  
  
Follow these steps to assign a security role.

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) as a System Administrator. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Settings**.

4. Select **Users + permissions**, and then select **Users**.

5. On the **Users** page select a user, and then select **Manage security roles**.

   :::image type="content" source="media/manage-security-roles.png" alt-text="Manage security roles.":::

6. Select or deselect security roles. If the user has roles already assigned. When finished, select **Save**.  After saving, all selected roles become the current assigned roles for the user.  Unselected roles will not be assigned. 

   :::image type="content" source="media/manage-security-roles-page.png" alt-text="Manage security roles page.":::

> [!IMPORTANT] 
> You must assign at least one security role to every user either directly or indirectly as a member of a [group team](manage-group-teams.md). The service doesn't allow access to users who don't have at least one security role.

To assign security roles to users in an environment that has zero or one Microsoft Dataverse database, see [Configure user security to resources in an environment](database-security.md). 

### See also
[Get started with security roles in Dataverse](/learn/modules/get-started-security-roles/)
[Create security roles](create-users.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]