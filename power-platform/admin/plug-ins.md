---
title: View information about plug-ins
description: Learn how to view information about plug-ins.
ms.subservice: admin
author: sericks007
ms.author: sripod
ms.reviewer: sericks
ms.custom:
  - "admin-security"
  - bap-template
ms.topic: conceptual
ms.date: 06/27/2023
---

# View information about plug-ins

If you have installed plug-ins in an environment, you can view plug-in details in Power Platform admin center. Follow these steps to view plug-in information such as the plug-in name, status, the user under whose identity the plug-in is executing, user license status, and more. You can use the information displayed in this experience to identify common issues related to plugin execution.

> [!Note]
> At this time, only plug-ins of the System User entity type are supported.

View plug-in details
1. In the Power Platform admin center, select an environment.
1. Select **Settings** > **Users + permissions** > **Plug-ins**.
1. View information about all plug-ins (System User Entity type only) installed in the environment.

## Disable a plug-in
If you need to disable a plug in, see [Disable or enable a plug-in step](/power-apps/developer/data-platform/register-plug-in#disable-or-enable-a-plug-in-step).

## Change user imperonation for a plug-in
If you need to change user impersonation for a plug-in, see [Set user impersonation for a step](/power-apps/developer/data-platform/register-plug-in#set-user-impersonation-for-a-step).

## Update license inforamtion for a user
To change license assignment for a user in the Microsoft 365 admin center, follow these steps:  

Sign in to the Microsoft 365 admin center.  

In the left navigation pane, select "Users" and then select the user whose license you want to change.  

In the user details pane, select "Licenses and Apps".  

To add a license, select "Add a license" and then select the license you want to assign to the user.  

To remove a license, select the license you want to remove and then select "Remove".  

Click "Save" to apply the changes.  

That's it! The user's license assignment has now been updated. 
