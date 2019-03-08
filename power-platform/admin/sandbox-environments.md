---
title: "Sandbox environments | MicrosoftDocs"
description: Learn about the usage and management of Sandbox environments. 
ms.custom: ""
ms.date: 03/15/2019
ms.reviewer: ""
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Sandbox environments

A Sandbox environment is any non-production environment of Common Data Service for apps. Isolated from production, a Sandbox environment is the place to safely develop and test application changes with low risk.

## View your Sandbox environments  

Manage your Sandbox environments from the Power Platform Admin center.  
  
1. Go to [https://admin.powerplatform.microsoft.com/](https://admin.powerplatform.microsoft.com), and sign in as an admin.
  
2. Open the **Environments** page. Select the **Type** tab to sort by environment type.
  
   > [!div class="mx-imgBorder"] 
   > ![](media/sandbox-environments.png "Environments page")

## Reset a Sandbox environment  

Reset a Sandbox environment to delete and re-provision it. Consider a reset when you want to:  
  
- Change to a different version of Common Data Service for apps  
  
- Create a new project  
  
- Free up storage space  
  
- Remove an environment containing Personally Identifiable Information (PII) data  
  
> [!NOTE]
> You can only reset Sandbox environments.  
  
### To reset an environment  
  
1. Go to [https://admin.powerplatform.microsoft.com/](https://admin.powerplatform.microsoft.com), and sign in as an admin.
  
2. Open the **Environments** page, select the environment to reset, and then select **Reset**.

   > [!div class="mx-imgBorder"] 
   > ![](media/select-sandbox-environment.png "Select Sandbox environment and Reset")
  
3. On the **reset environment** page, adjust the environment settings as needed and then click **Reset**.  
  
   > [!WARNING]
   >  The Sandbox environment will be deleted and reset to factory settings. You will not be able to recover any deleted data.  
  
6. Select **Confirm** in the confirmation dialog box.  


