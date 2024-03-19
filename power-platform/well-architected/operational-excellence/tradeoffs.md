---
title: Operational Excellence tradeoffs
description: Learn about tradeoffs that you might encounter when you design workload architectures and operations for operational excellence.
author: robstand
ms.author: rstand
ms.reviewer: robstand
ms.subservice: guidance
ms.topic: conceptual
ms.date: 11/30/2023
---

# Operational Excellence tradeoffs

Operational Excellence provides workload quality through the implementation of clear team standards, understood responsibility and accountability, attention to customer outcomes, and team cohesion. The implementation of these goals is rooted in DevOps, which recommends minimizing process variance, reducing human error, and ultimately increasing the return of value for the workload. That value isn't just measured against the functional requirements served by the components of the workload. It's also measured by the value that the team delivers in striving for improvement.

During the design phase of a workload and over its lifecycle, as continuous improvement steps are taken, it's important to consider how decisions based on the [Operational Excellence design principles](./principles.md) and the recommendations in the [Design review checklist for Operational Excellence](./checklist.md) might influence the goals and optimizations of other pillars. Certain decisions might benefit some pillars but constitute tradeoffs for others. This article describes example tradeoffs that a workload team might encounter when designing workload architecture and operations.

## Operational Excellence tradeoffs with Reliability

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased complexity**. Reliability prioritizes simplicity, because simple design minimizes misconfiguration and reduces unexpected interactions.

- Safe deployment strategies often require some amount of forward and backward compatibility between application logic and data in the workload. This added complexity increases the testing burden and can lead to complexities or integrity issues with the workload's data.

- Highly layered, modularized, or parameterized structures can increase the chance of accidental misconfiguration due to the complexity of the interaction between the components of the workload.

- Cloud design patterns that benefit operations sometimes necessitate the introduction of additional components, for example, the use of secret store or taking a dependency on Application Insights. The additional components increase the points of interaction in the system, increasing the surface area for malfunction or misconfiguration.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased potentially destabilizing activities**. The Reliability pillar encourages the avoidance of activities or design choices that can destabilize a system and lead to disruptions, outages, or malfunctions.

- Deploying small, incremental changes is a technique for mitigating risk, but those small changes are also expected to be delivered to production more frequently. Deployments can destabilize a system, so as the rate of deployment increases, so does this risk.

- A culture that measures itself with velocity metrics like deployments per week and uses automation that can facilitate introducing changes at a faster pace is also likely to perform more deployments in a shorter period.

- Increasing density to simplify operations by reducing the number of control and observability surfaces can also lead to an increased availability risk because malfunction or misconfiguration increases the impact radius of a destabilizing event.

## Operational Excellence tradeoffs with Security

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased surface area**. The Security pillar recommends a reduced workload surface area in terms of components and exposure to operations. This reduction minimizes attack vectors and produces a smaller scope for security control and testing.

- Components that surround the workload and support its operations, like automation or a custom control plane, must also be in scope for regular security hardening and testing.

- Routine, ad hoc, and emergency operations increase the points of contact with the workload. A zero trust approach requires that these processes are considered attack vectors and must be included in the security controls and validation for the workload.

- The observability platform of the system collects logs and metrics about the workload, which can be a valuable source of information disclosure. Therefore, the workload's security needs to extend to protect data sinks from internal and external threats.

- Build agents, externalized configuration, and feature toggle stores all increase the application surface area that requires security.

- A higher deployment frequency caused by small, incremental changes or by "get current, stay current" efforts results in more security testing in the software development lifecycle.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased desire for transparency**. A secure workload is based on designs that protect the confidentiality of data that flows through the components of the system.

Observability platforms ingest data of all types to gain insights into a workload's health and behavior. As teams try to attain higher fidelity in observability data, there's an increased risk that data classification controls, like data masking, of the source systems don't extend to the logs and log sinks of the observability platform.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Reduced segmentation**. A key security approach for isolating access and function is to design a strong segmentation strategy. This design is implemented through resource isolation and identity controls.

- Co-locating disparate application components in shared environments and data resources to make management easier reverses segmentation or makes role-based segmentation harder to achieve. Co-located components might also need to share a workload identity, which can lead to over-assignment of permissions or a lack of traceability.

- Collecting all logs from across the system in a unified log sink can make querying and building alerts easier. However, doing so can also make it harder or impossible to provide row-based security in order to treat sensitive data with the required audit controls.

- Simplifying the management of attribute-based or role-based security by reducing the granularity of roles and their assignments can lead to inappropriately broad permissions.

<!--
## Operational Excellence tradeoffs with Performance Efficiency

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased resource utilization**. The Performance Efficiency pillar recommends the allocation of as much of the available compute and network as possible to the requirements of the workload.

- A workload's observability framework requires that the components in the architecture allocate time and resources to create, collect, and stream logs and metrics. These data points help ensure that effective alerting and monitoring is possible for reliability, security, and performance. As the level of instrumentation increases, the strain on system resources might also increase.

- Some deployment models, like blue/green deployment, which a workload might use for safe deployment, might introduce side-by-side deployments on the production application platform. These deployments require preemptive scaling to provide enough supply to meet future demand, or leave a mostly dormant deployment in place for a period of time to support rollback.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased latency**. To create performant workloads, teams look for ways to reduce the time and resources that workloads consume to perform their tasks.

- Many deployment models require the use of gateway routing access patterns, which can introduce latency. This latency draws against the performance target budget for the related flows.

- Some cloud design patterns that support "independent change over time" approaches to support the ideals of incremental improvement can introduce latency due to the traversal of additional components. This latency can be introduced by gateways, messaging brokers, or anti-corruption layers.
-->
## See also

- [Reliability tradeoffs](../reliability/tradeoffs.md)
- [Experience Optimization tradeoffs](../experience-optimization/tradeoffs.md)
- [Security tradeoffs](../security/tradeoffs.md)