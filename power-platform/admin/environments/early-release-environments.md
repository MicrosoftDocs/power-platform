---
title: Early release cycle environments
description: Description goes here.
author: ImadYanni
ms.topic: overview
ms.date: 05/09/2024
ms.reviewer: sericks
ms.subservice: admin
ms.author: iyanni

---
# Early release cycle environments
Product engineering teams update online software continuously; updates that include fixes, minor or major features and capabilities maybe made daily and weekly. It may take the update days or weeks to rollout to all customer environments in all regions. 

Early release cycle gives you the ability to create environments that are updated first so you can experience and validate scenarios that are important to you before any updates reach your business-critical applications.

Early release cycle are also the environments that are used for Power Apps preview program Power Apps preview program - Power Apps | Microsoft Learn

# How to create

Early release environments are created similarly to the way other environments are created in Power platform admin center 
Create and manage environments in the Power Platform admin center - Power Platform | Microsoft Learn

In fact, the only difference is in which infrastructure the environment is created and therefore it gets software releases first.

When you create an environment and select a region, you will see the option to create the environment as an early cycle environment. note that a subset of the regions currently have this capability, the environment needs to be created in those regions. 
 

# How to manage

Early release cycle environments can be managed similarly to other environments in Power platform admin center.  You can identify early release cycle environments if they have “Early” value in the “Release cycle” column

:::image type="content" source="media/blur-release-cycle.png" alt-text="release cycle":::

