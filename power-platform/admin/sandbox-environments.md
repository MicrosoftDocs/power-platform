---
title: "Sandbox environments  | MicrosoftDocs"
description: Manage sandbox environments.
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/24/2020
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks 
search.audienceType: 
  - admin
---
# Manage sandbox environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

A sandbox environment is any non-production environment of Microsoft Dataverse. Isolated from production, a sandbox environment is the place to safely develop and test application changes with low risk.

## View your sandbox environments  

Manage your sandbox environments from the Power Platform admin center.  

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, click the **Type** column to sort by environment type.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, click the **Type** column to sort by environment type.
---

## Create a sandbox environment

See [Create and manage environments in the Power Platform admin center](create-environment.md).

## Change a production environment to sandbox

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Service admin or Delegated admin credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select a production environment.
1. In the **Details** pane, click **Edit**.
1. In the **Edit details** panel, under **Type**, select Sandbox.
1. Click **Save** to apply the changes.

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Service admin or Delegated admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select a production environment.
1. In the **Details** pane, click **Edit**.
1. In the **Edit details** panel, under **Type**, select Sandbox.
1. Click **Save** to apply the changes.
---

## Reset a sandbox environment  

Reset a sandbox environment to delete and reprovision it. Consider a reset when you want to:  
  
- Create a new project  
- Free up storage space  
- Remove an environment containing personal data  
  
> [!IMPORTANT]
> - You can only reset sandbox environments. 
> - A reset will permanently delete environment components such as canvas apps, flows, custom connectors, and connections.

 **An example scenario**  
  
  Thomas is looking at the storage consumed by the various Contoso environments. Thomas is getting concerned that they'll run out of space in one of their production environments. Thomas also wants to free up some space to give the production environment some extra storage.  Thomas has also been notified that the Legal department has a retention policy regarding the use of production data in test environments.  
  
 After contacting Elisa, Thomas resets the Sales department's complete sandbox environment. The environment has been reprovisioned to factory settings. It's now ready for future use as a sandbox environment for a future project.  
 
### To reset an environment  

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the environment you want to reset.
1. Click **Reset** from the top command bar. 

### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select the environment you want to reset.
1. Click **Reset** from the top command bar.
---

In the **Reset environment** panel:
1. Adjust the environment settings as needed.
1. Review and understand the consequences of resetting the environment.  
  
   > [!WARNING]
   > - The sandbox environment will be deleted and reset to factory settings. You will not be able to recover any data that was previously in the environment. 
   > - When you reset an environment, the security group specified on the **Reset environment** page will be applied. If a security group isn’t specified during the reset, no security group will be assigned to the environment after the reset is completed.  Any existing security group configured before the reset is performed will no longer be applied to the environment. More information: [Control user access to environments: security groups and licenses](control-user-access.md)   
  
1. Click **Reset**, then select **Confirm** to begin the process.
1. The environment reset will then start.

## Administration mode  

 When you place a sandbox environment in administration mode, only users with System Administrator or System Customizer security roles are able to sign in to that environment.
 
 Administration mode is useful when you want to make operational changes and not have regular users affect your work, and not have your work affect regular users.  

> [!NOTE]
> System Customizers will need to sign in to the environment directly through the URL as the environment in administration mode will not appear to System Customizers in the Environments page of the Power Platform admin center.

See [Administration mode](admin-mode.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
