---
title: "Reset an environment to delete and reprovision"
description: "This page explains how to reset a Power Platform environment if you want to create a new project, free up storage space, or delete personal information."
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/05/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Reset environment 

Reset a sandbox environment to delete and reprovision it. Consider a reset when you want to:  
  
- Create a new project  
- Free up storage space  
- Remove an environment containing personal data  
  
> [!IMPORTANT]
> - You can only reset sandbox environments. 
> - A reset will permanently delete environment components such as canvas apps, flows, custom connectors, and connections.

 **An example scenario**  
  
 Thomas is looking at the storage consumed by the various Contoso environments. He is getting concerned that they'll run out of space in one of their production environments.  Thomas also wants to free up some space so that he can give the production environment some extra storage.  He's also been notified that the Legal department has a retention policy regarding the use of production data in test environments.  
  
 After contacting Elisa, Thomas resets the Sales department's complete sandbox environment. The environment has been reprovisioned to factory settings. It's now ready for future use as a sandbox environment for a future project.  
 
### To reset an environment  

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
  
2. From the left-side menu, select **Environments**, and then select an environment to reset.

3. Select **Reset** from the top menu bar.
  
   > [!div class="mx-imgBorder"] 
   > ![Reset menu](media/reset-menu.png "Reset menu")

4. On the **Reset environment** page, adjust the environment settings as needed and then select **Reset**.  
  
   > [!WARNING]
   >  The sandbox environment will be deleted and reset to factory settings. You will not be able to recover any deleted data.  
  
5. Select **Confirm** to reset the selected environment.

The reset process starts.

> [!div class="mx-imgBorder"] 
> ![Reset environment status](media/reset-environment-status.png "Reset environment status")
  

[!INCLUDE[footer-include](../includes/footer-banner.md)]
