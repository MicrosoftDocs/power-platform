---
title: "View and reset Sandbox environments  | MicrosoftDocs"
description: Learn about Sandbox environments ann how to reset them. 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/14/2019
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# View and reset Sandbox environments

A Sandbox environment is any non-production environment of Common Data Service. Isolated from production, a Sandbox environment is the place to safely develop and test application changes with low risk.

## View your Sandbox environments  

Manage your Sandbox environments from the Power Platform Admin center.  
  
1. Go to [https://admin.powerplatform.microsoft.com/](https://admin.powerplatform.microsoft.com), and sign in using Environment Admin or System Administrator role credentials.
  
2. Open the **Environments** page. Select the **Type** tab to sort by environment type.
  
   > [!div class="mx-imgBorder"] 
   > ![](media/sandbox-environments.png "Environments page")

## Reset a Sandbox environment  

Reset a Sandbox environment to delete and re-provision it. Consider a reset when you want to:  
  
- Create a new project  
- Free up storage space  
- Remove an environment containing Personally Identifiable Information (PII) data  
  
> [!IMPORTANT]
> - You can only reset Sandbox environments. 
> - A reset will permanently delete environment components such as canvas apps, flows, custom connectors, and connections.

 **An example scenario**  
  
 Thomas is looking at the storage consumed by the various Contoso environments and is getting concerned that they’ll run out of space in one of their Production environments.  He’d like to free up some space so he can give the Production environment some additional storage.  He’s also been notified that the Legal department has set a retention policy on the use of production data in the test environment.  
  
 After contacting Isaac, Thomas resets the Sales department’s complete Sandbox environment. The environment is re-provisioned to factory settings and ready for future use as a Sandbox environment for a future project.  
 
### To reset an environment  

1. Go to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
  
2. From the left-side menu, select **Environments**, and then select an environment to reset.

3. Select **Reset** from the top menu bar.
  
   > [!div class="mx-imgBorder"] 
   > ![](media/reset-menu.png "Reset menu")

4. On the **Reset environment** page, adjust the environment settings as needed and then select **Reset**.  
  
   > [!WARNING]
   >  The Sandbox environment will be deleted and reset to factory settings. You will not be able to recover any deleted data.  
  
5. Select **Confirm** to reset the selected environment.

The reset process starts.

> [!div class="mx-imgBorder"] 
> ![](media/reset-environment-status.png "Reset environment status")
  
## Administration mode  
 When you place a Sandbox environment in administration mode only users with Dynamics 365 apps System Administrator or System Customizer security roles will be able to sign in to that environment. Administration mode is useful when you want to make operational changes and not have regular users affect your work, and not have your work affect regular users.  
  
> [!NOTE]
> - You can only place Sandbox environments in administration mode.  
> - Processes that use code, such as plug-ins or custom workflow assemblies, continue to be processed by the Common Data Service platform when administration mode is enabled and background operations are disabled.
  
 On the **Details** page, you can set the following.  
  
|Setting|Description|  
|-------------|-----------------|  
|Administration mode | Select to enable administration mode for the selected Sandbox environment. Only System Administrators or System Customizers will be able to sign in to the selected Sandbox environment.|  
|Background operations | Select to disable all asynchronous operations (see [Asynchronous service architecture](https://docs.microsoft.com/dynamics365/customer-engagement/developer/asynchronous-service-architecture)) such as workflows and synchronization with Exchange. Emails will not be sent and server-side synchronization for appointments, contacts, and tasks are disabled. **Note:**  Administration mode must be enabled to disable background operations.|  
|Custom message | Enter a message that will be displayed to all users when they attempt to sign in.|  
  
### Set administration mode  
  
1. Go to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.
  
2. From the left-side menu, select **Environments**, and then select an environment.
  
3. Select **See all**.
  
4. On the **Details** page, select **Edit**. 
  
5. Under **Administration mode**, toggle **Disabled** to **Enabled**.

6. Set **Background operations** and **Custom message**, and then select **Save**.