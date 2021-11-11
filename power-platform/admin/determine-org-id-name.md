---
title: "Find your environment's organization ID and name"
description: "If you need to find your Power Platform environment's organization ID and name for any reason, this page explains how to find this information in your settings."
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/11/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Determine your environment's organization ID and name

To find your organization ID and name: 

1.	In the Power Platform admin center, select an environment. Select **Settings** > **Resources** > **All legacy settings**.

    For [Unified Interface](about-unified-interface.md), in the upper-right corner select Settings (![Gear button.](media/selection-rule-gear.png "Gear button")) > **Advanced Settings**.
   
2. Go to **Settings** > **Customizations** > **Developer Resources**.

3. Under **Instance Reference Information**, make note of **ID** and **Unique Name**. **Unique Name** is the organization name.

    :::image type="content" source="media/org-id-name.png" alt-text="Find the organization ID and name.":::

> [!NOTE]
> The organization name is derived from the domain name when the environment was provisioned. You cannot change the organization name using the [Business Unit](create-edit-business-units.md) form but it can be changed using the [Web API](/dynamics365/customer-engagement/web-api/businessunit?view=dynamics-ce-odata-9).



[!INCLUDE[footer-include](../includes/footer-banner.md)]
