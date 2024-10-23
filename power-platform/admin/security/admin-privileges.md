---
title: Administrative privileges (preview)
description: Learn how to review users who have these privileged roles, review the user list, and remove users who should no longer have privileged access.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/23/2024
author: srpoduri
ms.author: sripod
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Administrative privileges (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
                                             
You can improve the security score of your tenant by limiting the number of users who have high-privileged, administrative roles in Microsoft Entra ID and Power Platform. This feature allows you to review users who have these privileged roles, review the user list, and remove users who should no longer have privileged access. 

> [!Note]
> This feature is only available for Managed Environments.

## Many users with administrative privileges
The **Security** page provides a proactive recommendation if your tenant has many users with administrative privileges. You can open the recommendation which shows you a list of environments with many users&mdash;currently more than 20 users&mdash;with the system administrator security role. Select the link below the **System administrators** column for any listed environment to display the **Security roles** page. From there, you can select the **System administrator** security role and select **Membership** to view a list of users with the role assignment. From the **Membership** page, you can select users to remove from the role, one user at a time. 

> [!Note]
> Only users assigned to the Global administrator role can remove other users from the Global administrator role.

## Known issues
Be aware of the following known issues with this feature:

- The security role **Membership** page displays only the security roles in the default business unit. Turn off the **Display only parent security roles** option to list all security roles across all business units.
- After you remove a user from the system administrator role, it takes around 24 hours for the updated admin count to show up on the page.
