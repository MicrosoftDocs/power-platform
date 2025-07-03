---
title: Early release cycle environments
description: Learn about how you can create and manage early release cycle environments.
author: ImadYanni
contributor: sericks
ms.topic: overview
ms.date: 07/03/2025
ms.reviewer: ellenwehrle
ms.subservice: admin
ms.author: iyanni

---
# Early release cycle environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Product engineering teams update online software continuously. Updates that include fixes and minor or major features and capabilities may be made daily and weekly. It may take the update days or weeks to rollout to all customer environments in all regions.

_Early release cycle_ lets you create environments that get updates first. Early release cycle environments allow you to validate scenarios that matter to you before updates reach your business-critical apps.

Early release cycle environments are also the type of environment used for the [Power Apps preview program](/power-apps/maker/powerapps-preview-program).

## Create early release cycle environments

Create early release cycle environments the same way you create [other environments in the Power Platform admin center](create-environment.md).

The only difference is the infrastructure where you create the environment, so it gets software releases first.

When you create an environment and select a region, you see the option to create the environment as an early release cycle environment. This option is named **Get new features early**. Only some regions support this option, so make sure to select a supported region.

:::image type="content" source="media/Get-new-features-early.png" alt-text="**Get new features early** option":::

## Manage early release cycle environments

You can manage early release cycle environments the same way as other environments in the Power Platform admin center. Identify early release cycle environments by the **Early** value in the **Release cycle** column.

:::image type="content" source="media/blur-release-cycle.png" alt-text="Early release cycle environments have **Early** in the **Release Cycle** column.":::

## Move existing environments to early release cycle

To move an environment to early release cycle:

1. [Create](early-release.md) a new sandbox environment in early release in the same region as the environment to be moved.
1. [Copy](copy-environment.md) your existing environment to the new early release environment. This effectively moves your environment to first release after the copy completes.
1. Delete the original environment if you don't need it. The original environment's URL can then be reused for the early release environment by [editing](edit-properties-environment.md) the environment properties.
