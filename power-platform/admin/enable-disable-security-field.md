---
title: "Enable or disable security for a field  | MicrosoftDocs"
description: Enable or disable security for a field 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/25/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable or disable security for a field to control access

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

<!-- legacy procedure -->

Field-level security lets you set which fields users can see or edit. For example, if want to prevent users from accidentally changing an account name, you can restrict them from editing that field. In [!INCLUDE[pn_crmv6](../includes/pn-crmv6.md)], you could only set field-level security for custom fields, but in [!INCLUDE[pn_crm_2015](../includes/pn-crm-2015.md)] or later, you can also set field-level security for some default fields. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Field-level security](field-level-security.md)  
  
 To set which users and teams have read or write access to fields, see [Set up security permissions for a field](../admin/set-up-security-permissions-field.md).  
  
> [!NOTE]
>  You can't change the permissions on a field that you don't have permission to access.  
  
1. In the web app, go to **Settings** > **Customizations**.
  
2. Click **Customize the System**.  
  
3. Under **Components**, expand **Entities**, expand the entity that has the field you want to secure, and then click **Fields**.  
  
4. In the list of fields, double-click the field you want to secure.  
  
5. In the **Field** window, on the **General** tab, to the right of **Field Security**, specify whether to **Enable** or **Disable** security for the field.  
  
6. Click **Save** or **Save and Close**.  
  
7. When your customizations are complete, publish them:  
  
   -   To publish customizations for only the entity that you are currently editing, in the navigation pane, select the entity, and then click **Publish**.  
  
   -   To publish customizations for all unpublished entities at one time, in the navigation pane, click **Entities**, and then on the command toolbar, click **Publish All Customizations**.  
  
### See also  
 [Field-level security](field-level-security.md)   
 [Set up security permissions for a field](../admin/set-up-security-permissions-field.md)
