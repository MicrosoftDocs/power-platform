---
title: View information about plug-in steps
description: Learn how to view information about plug-ins.
ms.subservice: admin
author: sericks007
ms.author: sripod
ms.reviewer: sericks
ms.custom:
  - "admin-security"
  - bap-template
ms.topic: conceptual
ms.date: 07/13/2023
---

# View information about plug-in steps
_Plug-ins_ contain code that enable server-side customization of Microsoft Dataverse data operations. Each plug-in is registered to execute at a specific point within that operation, which is called a step. You may need to find which plug-in steps are registered for specific events and you may need to temporarily disable plug-ins steps to avoid issues caused by the plug-in.

This article describes how you can view information about plug-ins and disable and enable them using the Power Platform Admin Center or Power Apps. You can also perform these actions by installing and using the [Plug-in Registration tool](/power-apps/developer/data-platform/download-tools-nuget) (PRT).

## View all plug-in steps for an environment
To view all plug-in steps for an environemnt, complete the following steps in the Power Apps.

1. Sign in to [Power Apps](https://make.powerapps.com?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc).
1. Select **Solutions**.
1. Select **Default Solution**.
1. Select **Objects** > **Plug-in steps**.

## View plug-in details
If you have installed plug-ins in an environment, you can view plug-in details in Power Platform admin center. Follow these steps to view plug-in information such as the plug-in name, status, the user under whose identity the plug-in is executing, user license status, and more. You can use the information displayed in this experience to identify common issues related to plugin execution.

> [!Note]
> At this time, only plug-ins of the System User entity type are supported.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane.
1. Select an environment.
1. Select **Settings** > **Users + permissions** > **Plug-ins**.
1. View information about all plug-ins (System User Entity type only) installed in the environment.

## Disable a plug-in
If you need to disable a plug in, see [Disable or enable a plug-in step](/power-apps/developer/data-platform/register-plug-in#disable-or-enable-a-plug-in-step).

## Change user impersonation for a plug-in
If you need to change user impersonation for a plug-in, see [Set user impersonation for a step](/power-apps/developer/data-platform/register-plug-in#set-user-impersonation-for-a-step).

## Update license information for a user
To change the license assignment for a user in the Microsoft 365 admin center, see [To assign a license](create-users.md#to-assign-a-license).


