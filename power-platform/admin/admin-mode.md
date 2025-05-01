---
title: Administration mode  
description: Administration mode
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/04/2025
ms.subservice: admin
ms.custom: NewPPAC
author: ChrisGarty
ms.author: cgarty
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Administration mode  

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can set a sandbox, production, or trial (subscription-based) environment in administration mode so that only users with System Administrator or System Customizer security roles are able to sign in to that environment. Administration mode is useful when you want to make operational changes and not have regular users affect your work, and not have your work affect end users (non-admins).  
  
> [!NOTE]
> - You can place sandbox, production, or trial (subscription-based) environments in administration mode.  
> - Processes that use code, such as plug-ins or custom workflow assemblies, continue to be processed by the Microsoft Dataverse platform when administration mode is enabled and background operations are disabled.
> - System Customizers need to sign in to the environment directly through the URL, as the environment in administration mode doesn't appear to System Customizers in the Environments page of the Power Platform admin center.
  
 On the **Settings** panel, you can set the following:  
  
|Setting|Description|  
|-------------|-----------------|  
|Administration mode | Select to enable administration mode for the selected sandbox, production, or trial (subscription-based) environment. Only System Administrators or System Customizers will be able to sign in to the selected sandbox or production environment.|  
|Background operations (optional) | Select to disable all asynchronous operations (see [Asynchronous service](/powerapps/developer/common-data-service/asynchronous-service)) such as workflows and synchronization with Exchange. Emails aren't sent and server-side synchronization for appointments, contacts, and tasks are disabled. **Note:**  Administration mode must be enabled to disable background operations.|  
  
## Set administration mode  

# [New admin center](#tab/new)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. In the **Environments** page, select a sandbox, production, or trial (subscription-based) environment.
1. In the **Details** web part, select **Edit**.
1. The **Edit details** pane appears.
1. Turn the **Administration mode** property to **Enabled**.
1. Optionally, you can set **Background operations**.
1. Select **Save**.

# [Classic admin center](#tab/classic)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
1. In the navigation page, select **Environments**.
1. In the **Environments** page, select a sandbox, production, or trial (subscription-based) environment.
1. In the **Details** web part, select **Edit**.
1. The **Edit details** pane appears.
1. Turn the **Administration mode** property to **Enabled**.
1. Optionally, you can set **Background operations**.
1. Select **Save**.

---

[!INCLUDE[footer-include](../includes/footer-banner.md)]
