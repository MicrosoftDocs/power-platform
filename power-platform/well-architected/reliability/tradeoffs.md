---
title: Reliability tradeoffs for Power Platform workloads
description: Learn about the Reliability tradeoffs you might encounter when optimizing for the other Power Platform Well-Architected pillars.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 05/16/2024
---

# Reliability tradeoffs for Power Platform workloads

A reliable workload consistently meets its defined reliability objectives. It should reach established resiliency targets, ideally by circumventing events that affect reliability. Realistically, however, a workload must tolerate and control the impact of such events and maintain operations at a predetermined level during active malfunction. Even during a disaster, a reliable workload must recover to a specific state within a given period of time, both of which are agreed upon among the stakeholders. An incident response plan that enables you to achieve rapid detection and recovery is vital.

During the design phase of a workload, you need to consider how decisions based on the [Reliability design principles](./principles.md) and the recommendations in the [Design review checklist for Reliability](./checklist.md) might influence the goals and optimizations of other pillars. Certain decisions might benefit some pillars but constitute a tradeoff for others. This article describes example tradeoffs that a workload team might encounter when designing workload architecture and operations for reliability.

## Reliability tradeoffs with Security

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased workload surface area**. The Security pillar prioritizes a reduced and contained surface area to minimize attack vectors and reduce the management of security controls.

- Reliability is often obtained through replication. Replication can occur at the component level, at the data level, or even at a geographic level. Replicas, by design, increase the surface area of a workload. From a security perspective, a reduced and contained surface area is preferred to minimize potential attack vectors and streamline the management of security controls.

- Similarly, disaster recovery solutions, like backups, increase a workload's surface area. However, they're often isolated from the workload's runtime. This requires the implementation of additional security controls, which might be specific to the disaster recovery solution.

- For the sake of reliability goals, additional components might be needed for the architecture, which increases the surface area. This increased complexity increases the surface area of the workload by adding new components that need to be secured, possibly in ways that aren't already used in the system. Typically, these components are accompanied by additional code to support their use or general reliability patterns, which also increases the application's surface area.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Security control bypass**. The Security pillar recommends that all controls remain active in both normal and stressed systems.

- When a workload is experiencing a reliability event that's being addressed under active incident response, urgency might create pressure for workload teams to bypass security controls that are optimized for routine access.

- Troubleshooting activities can cause the team to temporarily disable security protocols, leaving an already stressed system potentially exposed to additional security risks. There's also a risk that the security protocols won't be reestablished promptly.

- Granular implementations of security controls, like role-based access control assignments or firewall rules, introduce configuration complexity and sensitivity, increasing the chance for misconfiguration. Mitigating this potential reliability impact by using broad rules erodes all three Zero Trust architecture principles.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Old software versions**. The Security pillar encourages a "get current, stay current" approach to vendor security patches.

- Applying release wave updates or updates to vendor libraries, like third-party components or solutions, can potentially disrupt the target component, causing unavailability during the change. Delaying or avoiding patching might avoid the potential reliability risks, but it leaves the system unprotected against evolving threats.

- The preceding consideration also applies to the workload's code. For example, it applies to application code that uses old libraries and components. If updating and deploying application code is viewed as an unmitigated reliability risk, the application is exposed to additional security risks over time.

## Reliability tradeoffs with Operational Excellence

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased operational complexity**. Operational Excellence, like Reliability itself, prioritizes simplicity.

- Having a comprehensive monitoring strategy for a workload is a key part of operational excellence. Introducing additional components into an architecture to implement reliability design patterns results in more data sources to manage, increasing the complexity of implementing distributed tracing and observability.

- Using multiple regions to overcome single region resource capacity constraints and/or implement an active/active architecture increases the complexity of the workload's operational management. This complexity is introduced by the need to manage multiple regions and the need to manage the data replication between them.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased effort to generate team knowledge and awareness**. The Operational Excellence pillar recommends keeping and maintaining a documentation repository for procedures and topologies.

- As a workload becomes more robust through the addition of reliability components and patterns, it takes more time to maintain operational procedures and artifact documentation.

- Training becomes more complex as the number of components in the workload increases. This complexity affects the time required for onboarding and increases the knowledge that's needed to track product roadmaps and service-level guidance.

## Reliability tradeoffs with Experience Optimization

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Decreased agility**. The Experience Optimization pillar prioritizes user efficiency.

- Emphasizing rigorous testing can delay the release of experience features that are essential for adoption.

- Optimizing for reliability can overindex on minimizing complexity, which deprioritizes features for more engaging user experiences, such as custom components and integrations.

## Reliability tradeoffs with Performance Efficiency

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased latency**. Performance Efficiency requires a system to achieve performance targets for user and data flows.

- Reliability patterns often incorporate data replication to survive replica malfunction. Replication introduces additional latency for reliable data-write operations, which consumes a part of the performance budget for a specific user or data flow.

- Reliability sometimes employs various forms of resource balancing to distribute or redistribute load to healthy replicas. A dedicated component that's used for balancing usually affects the performance of the request or process that's being balanced.

- Distributing components across geographical boundaries or availability zones to survive a scoped impact introduces network latency in the communication between components that span those availability boundaries.

- Extensive processes are used to observe the health of a workload. Although monitoring is critical for reliability, instrumentation can affect system performance. As observability increases, performance might decrease.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased over-provisioning**. The Performance Efficiency pillar discourages over-provisioning, instead recommending the use of just enough resources to satisfy demand.

- Automatic scaling operations aren't instantaneous and therefore can't reliably handle a sudden and dramatic spike in demand that can't be shaped or smoothed. Therefore, over-provisioning via either larger instances or more instances is a critical reliability tactic to account for the lag between demand signal and supply creation. Unused capacity counters the goals of performance efficiency.

- Sometimes a component can't be scaled in reaction to demand, and that demand isn't fully predictable. Using large instances to cover the worst case leads to over-provisioning waste in situations that are outside that use case.

## Related information

- [Operational Excellence tradeoffs](../operational-excellence/tradeoffs.md)
- [Experience Optimization tradeoffs](../experience-optimization/tradeoffs.md)
- [Security tradeoffs](../security/tradeoffs.md)
- [Performance Efficiency tradeoffs](../performance-efficiency/tradeoffs.md)
