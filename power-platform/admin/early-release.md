---
title: Early release cycle environments
description: Description goes here.
author: ImadYanni
ms.topic: overview
ms.date: 05/14/2024
ms.reviewer: sericks
ms.subservice: admin
ms.author: iyanni

---
# Early release cycle environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
Product engineering teams update online software continuously. Updates that include fixes and minor or major features and capabilities may be made daily and weekly. It may take the update days or weeks to rollout to all customer environments in all regions. 

_Early release cycle_ gives you the ability to create environments that are updated first. This allows you to experience and validate scenarios that are important to you before any updates reach your business-critical applications.

Early release cycle environments are also the environments that are used for [Power Apps preview program](/power-apps/maker/powerapps-preview-program).

## Create early release cycle environments

Early release cycle environments are created similarly to the way [other environments are created in the Power platform admin center](create-environment.md). 

In fact, the only difference is in which infrastructure the environment is created, and therefore, it gets software releases first.

When you create an environment and select a region, you see the option to create the environment as an early release cycle environment. This option is named **Get new features early**. A subset of the regions currently have this capability, so the environment needs to be created in those specific regions. 

:::image type="content" source="media/Get-new-features-early.png" alt-text="**Get new features early** option":::
 
## Manage early release cycle environments

Early release cycle environments can be managed similarly to other environments in the Power platform admin center.  You can identify early release cycle environments if they have the **Early** value in the **Release cycle** column.

:::image type="content" source="media/blur-release-cycle.png" alt-text="Early release cycle environments have **Early** in the **Release Cycle** column.":::

## Move existing environments to early release cycle

To move environments to early release cycle, please [create](https://learn.microsoft.com/en-us/power-platform/admin/early-release?source=docs#create-early-release-cycle-environments) a new sandbox environment in early release and then [copy](https://learn.microsoft.com/en-us/power-platform/admin/copy-environment) from the environment to the newly created environment in early release. This will effectively move the environment to first release after the copy is completed. The original environment which is not in early release can then be deleted if it is not needed anymore and then it's environment name and url can be used for the copied-over environment in early release if required by [editing](https://learn.microsoft.com/en-us/power-platform/admin/edit-properties-environment#edit-an-environment) environment properties.
