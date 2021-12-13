---
title: "Enable or disable field-level security"
description: "Power Platform's field-level security lets you set which fields users can see or edit. Follow these steps to enable or disable security for a field."
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable or disable security for a field to control access

<!-- legacy procedure -->

Field-level security lets you set which fields users can see or edit. For example, if want to prevent users from accidentally changing an account name, you can restrict them from editing that field. In [!INCLUDE[pn_crmv6](../includes/pn-crmv6.md)], you could only set field-level security for custom fields, but in [!INCLUDE[pn_crm_2015](../includes/pn-crm-2015.md)] or later, you can also set field-level security for some default fields. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Field-level security](field-level-security.md)  
  
 To set which users and teams have read or write access to fields, see [Set up security permissions for a field](../admin/set-up-security-permissions-field.md).  
  
> [!NOTE]
>  You can't change the permissions on a field that you don't have permission to access.  

1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

2. Select **Settings** > **Customizations**.

3. Select **Customize the System**.  
  
4. Under **Components**, expand **Entities**, expand the entity that has the field you want to secure, and then click **Fields**.  
  
5. In the list of fields, double-click the field you want to secure.  
  
6. In the **Field** window, on the **General** tab, to the right of **Field Security**, specify whether to **Enable** or **Disable** security for the field.  
  
7. Click **Save** or **Save and Close**.  
  
8. When your customizations are complete, publish them:  
  
   - To publish customizations for only the entity that you are currently editing, in the navigation pane, select the entity, and then click **Publish**.  
  
   - To publish customizations for all unpublished entities at one time, in the navigation pane, click **Entities**, and then on the command toolbar, click **Publish All Customizations**.  
  
### See also  
 [Field-level security](field-level-security.md)   
 [Set up security permissions for a field](../admin/set-up-security-permissions-field.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
