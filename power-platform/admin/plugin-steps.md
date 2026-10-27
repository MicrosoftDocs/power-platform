---
title: View information about plugin steps
description: Learn how to view information about plugins.
ms.subservice: admin
author: EllenWehrle
ms.author: ellenwehrle
ms.reviewer: ellenwehrle
ms.custom:
  - "admin-security"
  - bap-template
ms.topic: how-to
ms.date: 10/26/2026
---

# View information about plugin steps

A _plugin_ contains code that enables server-side customizations of Microsoft Dataverse data operations. Each plugin is registered to execute at a specific point within that operation, which is called a step. You might need to find which plugin steps are registered for specific events. You might also need to temporarily disable plugin steps to avoid issues caused by the plugin.

This article describes how you can view information about plugins and disable and enable them by using the Power Platform admin center or Power Apps. You can also perform these actions by installing and using the [Plugin Registration tool](/power-apps/developer/data-platform/download-tools-nuget) (PRT).

## View all plugin steps for an environment

To view all plugin steps for an environment, complete the following steps in Power Apps.

1. Sign in to [Power Apps](https://make.powerapps.com?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc).
1. Select **Solutions**.
1. Select **Default Solution**.
1. Under **Objects**, select **Plugin steps**.

## View System User plugin steps

Plugins on the System User table can interfere with user sync operations. To make these plugins more visible for system administrators, the Power Platform admin center provides information about these steps.

Follow these steps to view plugin information such as the plugin name, status, the user under whose identity the plugin is executing, user license status, and more. Use the information displayed in this experience to identify common issues related to plugin execution.

> [!NOTE]
> At this time, only plugins of the System User entity type are supported.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select an environment.
1. Select **Settings** > **Users + permissions** > **Plugins**.
1. View information about all plugins (System User entity type only) installed in the environment.

## Disable a plugin

If you need to disable a plugin, see [Disable or enable a plugin step](/power-apps/developer/data-platform/register-plug-in#disable-or-enable-a-plug-in-step).

## Change user impersonation for a plugin

If you need to change user impersonation for a plugin, see [Set user impersonation for a step](/power-apps/developer/data-platform/register-plug-in#set-user-impersonation-for-a-step).

## Update license information for a user

To change the license assignment for a user in the Microsoft 365 admin center, see [To assign a license](create-users.md#to-assign-a-license).

## Post-operation and pre-operation plugins

When the system user table updates with a SetBusiness unit, the post-operation plugin runs twice because these updates are two separate update operations in the event pipeline. However, the pre-operation plugin runs only once.

To prevent the post-operation plugin from running twice, check for the business unit field update and run your business process accordingly.  

For more information, see [Event execution pipeline](/power-apps/developer/data-platform/event-framework#event-execution-pipeline).
