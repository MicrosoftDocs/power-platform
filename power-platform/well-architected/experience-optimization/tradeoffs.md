---
title: Experience Optimization tradeoffs
description: Learn about the Experience Optimization tradeoffs with other pillars.
author: robstand
ms.author: rstand
ms.reviewer: robstand
ms.subservice: guidance
ms.topic: conceptual
ms.date: 03/28/2024
---

# Experience Optimization tradeoffs

During the design phase of a workload, it's important to consider how decisions based on the [Experience Optimization design principles](./principles.md) and recommendations in the [Design review checklist for Experience Optimization](./checklist.md) might influence the goals and optimization efforts of other pillars. Certain decisions may benefit some pillars, while being tradeoffs for others. This article lists example tradeoffs that a workload team might encounter when designing workload architecture and operations for experience optimization.

## Experience Optimization tradeoffs with Reliability

> :::image type="icon" source="../_images/trade-off.svg"::: **Increased complexity**. A workload that uses straightforward approaches and limits customization is generally easier to manage in terms of reliability.

- Continuous improvement through adding new features in the user experience can introduce new issues that affect reliability and will require thorough testing.
- Customizing the user interface with code and components adds new reliability targets.

## Experience Optimization tradeoffs with Security

> :::image type="icon" source="../_images/trade-off.svg"::: **Increased workload surface area**. The Security pillar prioritizes a reduced and contained surface area to minimize attack vectors and the management of security controls.

- Improving the experience with features and integrations can introduce potential vectors for attack.
- Using code components can inadvertently increase the workload's attack surface.

## Experience Optimization tradeoffs with Operational Excellence

> :::image type="icon" source="../_images/trade-off.svg"::: **Compromised resource capacities**. A workload's operational process provides rigor, consistency, specificity, and prioritization to change management in a workload.

- Customizations in the workload's experience can complicate maintenance efforts and require increased resource utilization for testing.
- Allocating resources to perform user research and develop prototypes can impact the focus on operational activities.

<!-- ## Experience Optimization tradeoffs with Performance Efficiency

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff summary.** Tradeoff description. -->

## Related resources

Explore the tradeoffs for the other pillars.

- [Reliability tradeoffs](../reliability/tradeoffs.md)
- [Operational Excellence tradeoffs](../operational-excellence/tradeoffs.md)
- [Security tradeoffs](../security/tradeoffs.md)