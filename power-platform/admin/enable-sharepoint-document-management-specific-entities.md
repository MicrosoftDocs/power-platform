---
title: "Enable SharePoint document management for specific entities   | MicrosoftDocs"
description: Enable SharePoint document management for specific entities
author: Mattp123

ms.component: pa-admin
ms.topic: how-to
ms.date: 09/04/2020
ms.subservice: admin
ms.custom: NewPPAC
ms.author: matp
search.audienceType: 
  - admin
---
# Enable SharePoint document management for specific entities

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Enable document management for specific entities to store related records in SharePoint. This setting allows you to quickly access, share, and manage these documents directly from customer engagement apps such as Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation.

> [!TIP]
> If you didn't set up server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration, you may want to do that before enabling document management for specific entities. For more information, see [Set up SharePoint integration](set-up-sharepoint-integration.md).

> [!IMPORTANT]
> If you have customer engagement apps and SharePoint Online, make sure the site is under the same Microsoft 365 tenant as your environments.
  
[!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)] To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

### [Modern admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Integration**, then select **Document management settings**.
1. On the **Document Management** page, select **Document management settings**.
1. Choose the entities to use for managing SharePoint documents.
   - If a SharePoint site URL isn't already specified, enter the URL for storing documents. 
1. Click **Next** to finalize and apply the changes. 
 
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Integration**, then select **Document management settings**.
1. On the **Document Management** page, select **Document management settings**.
1. Choose the entities to use for managing SharePoint documents.
   - If a SharePoint site URL isn't already specified, enter the URL for storing documents. 
1. Click **Next** to finalize and apply the changes. 
---
 
> [!IMPORTANT]
> - Except for the opportunity and contract entities, a hierarchical folder structure isn't automatically created in SharePoint for entities that have more than one many-to-one (N:1) relationship with the parent entity.
> - For document management to function correctly for an entity, the entity relationship must be one-to-many (1:N) between the entity and the SharePoint document entity. The documents that exist in the SharePoint document library don't appear in the app for entities with many-to-one (N:1) or many-to-many (N:N) relationships between the entity and a SharePoint document entity.

  
### See also  
 [Edit existing SharePoint site records](../admin/edit-existing-sharepoint-site-records.md)   
 [Set up SharePoint integration](set-up-sharepoint-integration.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
