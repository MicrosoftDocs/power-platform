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
Product engineering teams update online software continuously. Updates that include fixes and minor or major features and capabilities may be made daily and weekly. It may take the update days or weeks to rollout to all customer environments in all regions. 

_Early release cycle_ gives you the ability to create environments that are updated first so you can experience and validate scenarios that are important to you before any updates reach your business-critical applications.

Early release cycle environments are also the environments that're used for [Power Apps preview program](/power-apps/maker/powerapps-preview-program).

## Create early release cycle enviornments

Early release cycle environments are created similarly to the way [other environments are created in the Power platform admin center](../create-environment.md). 

In fact, the only difference is in which infrastructure the environment is created, and therefore it gets software releases first.

When you create an environment and select a region, you see the option to create the environment as an early release cycle environment. A subset of the regions currently have this capability, so the environment needs to be created in those specific regions. 
 
## Manage early release cycle environments

Early release cycle environments can be managed similarly to other environments in the Power platform admin center.  You can identify early release cycle environments if they have the **Early** value in the **Release cycle** column.

:::image type="content" source="media/blur-release-cycle.png" alt-text="The "Release Cycle" column is shown.:::


