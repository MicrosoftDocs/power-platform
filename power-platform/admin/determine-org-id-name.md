---
title: "Find your environment and organization ID and name"
description: "If you need to find your Power Platform environment's organization ID and name for any reason, this page explains how to find this information in your settings."
author: sericks007
contributors: yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/16/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Find your Environment and organization ID and name
Use the following steps to find your environment ID, organization ID, and organization name.

## Find your environment and organization ID

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the **Details** section, locate the **Organization ID** and **Environment ID**.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the **Details** section, locate the **Organization ID** and **Environment ID**.
---

## Find your organization name

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the **Resources** section, select **Power Apps**.
1. On the **Power Apps** page, open any app.
1. In the command bar of the opened app, select **Settings**, then select **Advanced Settings**.
1. In the navigation pane, select **Administration**, then select **Resources in use**.
1. Locate the **Dynamics 365 Organization Name**.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the **Resources** section, select **Power Apps**.
1. On the **Power Apps** page, open any app.
1. In the command bar of the opened app, select **Settings**, then select **Advanced Settings**.
1. In the navigation pane, select **Administration**, then select **Resources in use**.
1. Locate the **Dynamics 365 Organization Name**.
---

> [!NOTE]
> The organization name is derived from the domain name when the environment was provisioned. You cannot change the organization name using the [Business Unit](create-edit-business-units.md) form but it can be changed using the [Web API](/dynamics365/customer-engagement/web-api/businessunit?view=dynamics-ce-odata-9).




[!INCLUDE[footer-include](../includes/footer-banner.md)]
