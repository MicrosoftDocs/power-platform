---
title: "Working with environments in Microsoft Power Apps"
description: "Learn how to change environments on powerapps.com, and how to create and view an app in the right environment. Power Apps opens in the default environment."
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.topic: conceptual
ms.custom: canvas
ms.date: 06/30/2020
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - maker
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Working with environments and Microsoft Power Apps
With Power Apps, you can work in different environments and easily switch among them. For an overview of environments, see [Environments overview](environments-overview.md), which explains in detail why you use environments and how you can create and manage them. The scope of this article will cover the following topics on environment:

- How to switch the environment on powerapps.com
- How to create an app in the right environment
- How to view an app in the right environment

## Switch the environment
When you sign up and first sign in to Power Apps, it opens in a default environment, which you can identify in the upper-right corner of the page.

> [!div class="mx-imgBorder"]
> ![Default environment.](media/env-dropdown.png)

Everyone in your organization can access the default environment. You can create apps in this environment and share your apps with other users. You may also have access to other environments, whether [you create them](create-environment.md) or others do. You can switch environments by opening the environment list in the upper-right corner and then selecting a different environment. This example shows switching from **Microsoft** to **MyOwnEnv**.

> [!div class="mx-imgBorder"]
> ![Switch environment.](media/switch-environment2.png)

After you switch environments, the new environment shows all the apps to which you have access in that environment.

## Create apps in the right environment
You can create apps in an environment that you create or for which you've been given access. Creating your own environment, however, requires a [specific plan](pricing-billing-skus.md). Before you create an app, always **make sure you select the environment you want to app to be in**. Otherwise, you will have to deal with moving apps between environments.

To create an app in the right environment:

1. [Sign in to Power Apps](https://make.powerapps.com?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc).

1. As the previous section describes, select the environment in which you would like to create your app.

1. Select **Apps** near the left edge, and then select **Create an app**.

## View apps in the right environment
Whether you are working in [powerapps.com](https://make.powerapps.com?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc) or Power Apps Studio, the list of apps, connections, etc. that you see is always filtered based on the environment that's selected in the dropdown. If you don't see the apps you're looking for, always confirm whether the right environment is selected.

For more information about environments, see [this overview](environments-overview.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
