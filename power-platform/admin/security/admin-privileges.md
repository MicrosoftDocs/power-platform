---
title: Administrative privileges (preview)
description: Learn how to manage security in the Power Platform admin center with security features available.
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

# Security overview (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
                                             
You can improve the security score of your tenant by limiting the number of users who have high privileged administrative roles in Microsoft Entra ID and Power Platform. This feature enables you to review users who have these privileged roles, review the user list, and remove users who should no longer have privileged access. 

The **Security** page provides a proactive recommendation if your tenant has many users with administrative privileges. You can open the recommendation which shows you a list of environments with many users (currently >20) with the System administrator security role. Click on the link below the “System administrators” column for any listed environment to display the security roles page. From there, you can select the “System administrator” security role, click Membership to view a list of users with the role assignment. From the membership page, you can select users to remove from the role, one user at a time. 

