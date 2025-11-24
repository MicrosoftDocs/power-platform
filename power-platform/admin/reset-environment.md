---
title: "Reset an environment to delete and reprovision"
description: "This page explains how to reset a Power Platform environment if you want to create a new project, free up storage space, or delete personal information."
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/24/2025
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
- iscohen-microsoft 
---
# Reset environment 

Reset a sandbox environment to delete and reprovision it. Consider a reset when you want to:  
  
- Create a new project  
- Free up storage space  
- Remove an environment containing personal data  
  
> [!IMPORTANT]
> - You can only reset sandbox and developer environments. 
> - A reset will permanently delete environment components such as canvas apps, flows, custom connectors, connections and back ups

 **An example scenario**  
  
 Thomas is looking at the storage consumed by the various Contoso environments. Thomas is getting concerned that they'll run out of space in one of their production environments. Thomas also wants to free up some space to give the production environment some extra storage. Thomas has also been notified that the Legal department has a retention policy regarding the use of production data in test environments.  
  
 After contacting Elisa, Thomas resets the Sales department's complete sandbox environment. The environment has been reprovisioned to factory settings. It's now ready for future use as a sandbox environment for a future project.  
 
### To reset an environment  

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) using Environment Admin or System Administrator role credentials.
  
1. In the navigation pane, select **Manage**.
   
1. In the **Manage** pane, select **Environments**.
   
1. Select an environment to reset.

1. Select **Reset** from the top menu bar.
  
   > [!div class="mx-imgBorder"] 
   > ![Reset menu.](media/reset-menu.png "Reset menu")

1. On the **Reset environment** page, adjust the environment settings as needed and then select **Reset**.  
  
   > [!WARNING]
   >  The sandbox environment will be deleted and reset to factory settings. You will not be able to recover any deleted data.  
  
1. Select **Confirm** to reset the selected environment.

The reset process starts.

> [!div class="mx-imgBorder"] 
> ![Reset environment status.](media/reset-environment-status.png "Reset environment status")
  

[!INCLUDE[footer-include](../includes/footer-banner.md)]
