---
title: "Administration mode  | MicrosoftDocs"
description: Administration mode
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/13/2021
ms.subservice: admin
author: ChrisGarty
ms.author: cgarty
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Administration mode  

You can set a sandbox, production, or trial (subscription-based) environment in administration mode so that only users with System Administrator or System Customizer security roles will be able to sign in to that environment. Administration mode is useful when you want to make operational changes and not have regular users affect your work, and not have your work affect end users (non-admins).  
  
> [!NOTE]
> - You can place sandbox, production, or trial (subscription-based) environments in administration mode.  
> - Processes that use code, such as plug-ins or custom workflow assemblies, continue to be processed by the Microsoft Dataverse platform when administration mode is enabled and background operations are disabled.
  
 On the **Settings** panel, you can set the following:  
  
|Setting|Description|  
|-------------|-----------------|  
|Administration mode | Select to enable administration mode for the selected sandbox, production, or trial (subscription-based) environment. Only System Administrators or System Customizers will be able to sign in to the selected sandbox or production environment.|  
|Background operations (optional) | Select to disable all asynchronous operations (see [Asynchronous service](/powerapps/developer/common-data-service/asynchronous-service)) such as workflows and synchronization with Exchange. Emails will not be sent and server-side synchronization for appointments, contacts, and tasks are disabled. **Note:**  Administration mode must be enabled to disable background operations.|  
|Custom message (optional)| Enter a message that will be displayed to all users when they attempt to sign in.|  
  
## Set administration mode  
  
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
  
2. From the left-side menu, select **Environments**, and then select a sandbox, production, or trial (subscription-based) environment.
  
3. On the **Details** page, select **Edit**. 
  
4. Under **Administration mode**, toggle **Disabled** to **Enabled**.

5. Optionally, you can set **Background operations** and **Custom message**, and then select **Save**.

## Known issues

- After taking the environment out of admin mode, flows may not trigger as expected until caches have been cleared; this can take up to 24 hours.

[!INCLUDE[footer-include](../includes/footer-banner.md)]