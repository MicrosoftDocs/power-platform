---
title: "Sandbox environments  | MicrosoftDocs"
description: Manage sandbox environments.
author: sericks007
contributors: yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/21/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Manage sandbox environments

A sandbox environment is any non-production environment of Microsoft Dataverse. Isolated from production, a sandbox environment is the place to safely develop and test application changes with low risk.

## View your sandbox environments  

You can view and manage your sandbox environments from the Power Platform admin center. To get started, take steps to view, sort, and filter your environments.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the **Type** column to sort and filter by environment type.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select the **Type** column to sort and filter by environment type.

---

## Create a sandbox environment

You can create new sandbox environments in the Power Platform admin center. To get started, go to [Create and manage environments in the Power Platform admin center](create-environment.md).

## Change a production environment to sandbox

You can change a production environment to a sandbox environment. To get started, take steps to edit the production environments details.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Service admin or Delegated admin credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select a production environment link.
1. In the environment's **Details** section, select **Edit**.
1. In the **Edit details** panel, under **Type**, select **Sandbox**.
1. Select **Save** to apply the changes.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Service admin or Delegated admin credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select a production environment link.
1. In the environment's **Details** section, select **Edit**.
1. In the **Edit details** panel, under **Type**, select **Sandbox**.
1. Select **Save** to apply the changes.

---

## Reset a sandbox environment  

You can reset a sandbox environment to delete and reprovision it. You may consider a reset when you want to:  
  
- Create a new project  
- Free up storage space  
- Remove an environment containing personal data  
  
> [!IMPORTANT]
>
> - You can only reset sandbox environments.
> - A reset will permanently delete environment components such as canvas apps, flows, custom connectors, and connections.

**An example scenario**  
  
Thomas is looking at the storage consumed by the various Contoso environments. Thomas is getting concerned that they'll run out of space in one of their production environments. Thomas also wants to free up some space to give the production environment some extra storage. Thomas is also notified that the legal department has a retention policy regarding the use of production data in test environments.  
  
After contacting Elisa, Thomas resets the sales department's complete sandbox environment. The reset reprovisions the environment to factory settings. It's now ready for future use as a sandbox environment for a future project.  

### Steps to reset an environment

If you find yourself in a situation where you need to reset an environment, take these steps to get started.

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the environment you want to reset.
1. Select **Reset** from the top command bar.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) using Environment Admin or System Administrator credentials.
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select the environment you want to reset.
1. Select **Reset** from the top command bar.

---

In the **Reset environment** panel:

1. Adjust the environment settings as needed.
1. Review and understand the consequences of resetting the environment.  
1. Select **Reset**, then select **Confirm** to begin the process.
1. The environment reset will then start.

> [!WARNING]
>
> - Resetting the sandbox environment deletes it and resets it to factory settings. This also means you're not able to recover any data that was previously in the environment.
> - When you reset an environment, the security group specified on the **Reset environment** page is applied. If a security group isn't specified during the reset, no security group is assigned to the environment after the reset is complete.  Any existing security group configured before the reset is no longer applied to the environment. You can learn more about how to [Control user access to environments: security groups and licenses](control-user-access.md).
  
## Administration mode  

 When you place a sandbox environment in administration mode, only users with System Administrator or System Customizer security roles are able to sign in to that environment.

 Administration mode is useful when you want to make operational changes and not have regular users affect your work, and not have your work affect regular users.  

> [!NOTE]
> System Customizers need to sign in to the environment directly through the URL as the environment in administration mode does not appear to System Customizers in the Environments page of the Power Platform admin center.

Learn more about [Administration mode](admin-mode.md).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
