---
title: Find your environment and organization IDs and organization name
description: If you need to find your Power Platform environment and organization IDs and organization name for any reason, this article explains how to find this information.
author: sericks007
contributors: yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 12/12/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Find environment and organization IDs and organization name

This article shows you how to find your environment and organization IDs, and your organization name.

## Find your environment and organization IDs

To find your environment ID and your organization ID, follow these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the **Details** section, find the **Organization ID** and **Environment ID**.

## Find your organization name

To find your organization name, take these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the **Resources** section, select **Power Apps**.
1. On the **Power Apps** page, open any app.
1. In the command bar of the opened app, select **Settings**, and then select **Advanced Settings**.
1. In the navigation pane, select **Administration**, and then select **Resources in use**.
1. Locate the **Dynamics 365 Organization Name**.

> [!NOTE]
> The organization name comes from the domain name when you provision the environment. You can't change the organization name by using the [Business Unit](create-edit-business-units.md) form but you can change it by using the [Web API](/dynamics365/customer-engagement/web-api/businessunit).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
