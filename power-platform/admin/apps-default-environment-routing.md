---
title: Environment routing for apps
description: Environment routing is on by default for apps. Learn what this means for your tenant and makers, and how it works with existing routing rules.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/08/2026
author: sidhartg
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: mkaur
ms.custom: Apps in Copilot Cowork
search.audienceType: 
  - admin
---

# Environment routing for apps

Apps you create in Copilot Cowork automatically enable environment routing, a premium governance feature, in all tenants. You can't change this setting. In tenants without an existing routing configuration, apps are selected by default.

As an admin, you must manually enable environment routing for other products. To learn how to do this, see the [Default environment routing article](default-environment-routing.md). If environment routing is already turned on for any of the Power Platform or Copilot Studio products, you see apps selected in addition to your prior selections.

This article explains what environment routing for apps means for your tenant and makers, and how it works with existing environment routing rules you set up.

## Environment routing rules

> [!IMPORTANT]
> The following changes relate to apps and the environment routing feature.
>
> - Apps you create in Copilot Cowork automatically enable environment routing in all tenants. You can't change this setting.
>   - Tenants without any routing configuration see apps selected by default. Admins must manually enable environment routing for other products.
>   - Tenants that enabled routing for any of the Power Platform or Copilot Studio products see apps selected in addition to their prior selections.
>   - Makers in tenants with routing enabled for apps alone aren't routed to their personal developer environments when they visit Power Apps or Power Automate maker surfaces. They can continue to build in the default environment or other environments where they have maker permissions.
> - A new routing rule automatically routes all makers in the tenant to their own personal developer environments.
>   - Tenants without any routing rules see a single routing rule that routes _Everyone_ in the tenant to their personal developer environments. A new _Default Environment Group_ is also created automatically, and app-specific rules are applied to this group to route all these personal developer environments.
>   - A new routing rule isn't added to tenants with existing routing rules. Some makers in these tenants might not be able to use apps. An admin should create a new routing rule for _Everyone_ to ensure makers don't use apps in the default environment or other environments.
>   - Admins can't delete the routing rule that routes _Everyone_ to an environment group. Only one routing rule is allowed to target _Everyone_. Tenants with multiple routing rules targeting _Everyone_ must clean up the configuration before making any changes to the routing rules.
>   - The routing rule targeting _Everyone_ must be last in the priority order. Tenants with a routing rule that places _Everyone_ above a security group must adjust the priority before making any further changes.
>   - New routing rules can't be created without selecting an environment group.
> - Makers using apps are automatically routed to their personal developer environments.
>   - The personal developer environments created for apps are managed environments by default.
>   - Makers who don't create Power Apps or Power Automate resources in these personal developer environments don't require premium licenses to those products. Auto claim isn't applicable in this scenario.
>   - Makers who create Power Apps or Power Automate resources in a personal developer environment created for apps require the appropriate premium licenses to comply with managed environment requirements. This requirement applies whether they explicitly select the environment or are routed to it by an admin's routing configuration. Auto claim is applicable in this scenario.
>   - Personal developer environments created for apps don't have Dataverse. Makers or admins can manually add Dataverse to these environments from the Power Platform admin center.
>   - Dataverse is automatically added to the personal developer environments created for apps when a maker visits a Power Apps or Power Automate maker surface and explicitly selects the environment or is routed to it by an admin's routing configuration.

## Related information

[Apps overview for admins (preview)](https://go.microsoft.com/fwlink/?LinkId=2371660)

