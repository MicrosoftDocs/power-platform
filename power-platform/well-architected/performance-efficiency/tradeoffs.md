---
title: Performance Efficiency tradeoffs for Power Platform workloads
description: Learn about the Performance Efficiency tradeoffs you might encounter when optimizing for the other Power Platform Well-Architected pillars.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: concept-article
ms.date: 05/16/2024
---

# Performance Efficiency tradeoffs for Power Platform workloads

A workload that meets its performance targets without overprovisioning is efficient. Key strategies for performance efficiency include proper use of code optimizations, design patterns, and capacity planning. Clear performance targets and testing underpin this pillar.

During the design phase of a workload, it's important to consider how decisions based on the [Performance Efficiency design principles](./principles.md) and recommendations in the [Design review checklist for Performance Efficiency](./checklist.md) might influence the goals and optimization efforts of other pillars. Certain decisions may benefit some pillars, yet represent tradeoffs for others. This article lists example tradeoffs that a workload team might encounter when designing workload architecture and operations for performance efficiency.

## Performance Efficiency tradeoffs with Reliability

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Reduced replication and increased density.** A cornerstone of reliability is ensuring resilience by using replication and limiting the blast radius of malfunctions.

- Consolidating workload resources can use excess capacity and improve efficiency. However, it increases the blast radius of a malfunction in the co-located component or application platform.

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased complexity.** Reliability prioritizes simplicity.

- Data partitioning and sharding help avoid performance issues in large or frequently accessed datasets. However, the implementation of these patterns increases complexity because (eventual) consistency needs to be maintained across additional resources.

- Denormalizing data for optimized access patterns can improve performance, but it introduces complexity because multiple representations of data need to be kept synchronized.

- Performance-centric cloud design patterns sometimes necessitate the introduction of additional components. The use of these components increases the surface area of the workload. The components then must themselves be made reliable to keep the whole workload reliable.

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Testing and observation on active environments.** Avoiding the unnecessary use of production systems is a self-preservation approach for reliability.

- Performance testing in active environments carries the risk of causing malfunctions due to the test actions or configurations.

- Workloads should be instrumented with an application performance monitoring (APM) system that enables teams to learn from active environments. The APM tooling is installed and configured in application code or in the hosting environment. Improper use, exceeding limitations, or misconfiguration of the tool can compromise its functionality and maintenance, potentially undermining reliability.

## Performance Efficiency tradeoffs with Security

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Reduction of security controls.** Security controls are established across multiple layers, sometimes redundantly, to provide defense in depth.

One performance optimization strategy is to remove or bypass components or processes that contribute to delays in a flow, especially when their processing time isn't justified. However, this strategy can compromise security and should be accompanied by a thorough risk analysis. Consider the following examples:

- Removing encryption in transit or at rest to improve transfer speeds exposes the data to potential integrity or confidentiality breaches.

- Removing or reducing security scanning or inspecting tools to reduce processing times can compromise the confidentiality, integrity, or availability that those tools protect.

- Removing firewall rules from network flows to improve network latency can allow undesirable communication.

- Minimizing data validation for quicker data processing might compromise data integrity, especially if inputs are malicious.

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased workload surface area.** Security prioritizes a reduced and contained surface area to minimize attack vectors and reduce the management of security controls.

Performance-centric cloud design patterns sometimes necessitate the introduction of additional components. These components increase the surface area of the workload. The new components must be secured, possibly in ways that aren't already used in the system, and they often increase the compliance scope. Consider these commonly added components:

- Introducing multiple different methods of handling business logic, like cloud flows and low-code plugins, based on the performance requirements of each task.

- Offloading processing to background jobs or even client compute.

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Removing segmentation.** The Security pillar prioritizes strong segmentation to enable fine-grained security controls and reduce blast radius.

Sharing resources is an approach for improving efficiency. It increases density to optimize capacity usage. For example, re-using low-code plugins across multiple canvas apps and cloud flows. The increased density can lead to the following security concerns:

- A shared workload identity that violates the principle of least privilege and obscures individual audit trails in access logs.

- Perimeter security controls, for example network rules, that are reduced to cover all co-located components, giving individual components more access than necessary.

## Performance Efficiency tradeoffs with Operational Excellence

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Reduced observability.** Monitoring is necessary to provide a workload with meaningful alerting and help ensure successful incident response.

- Reducing log and metric volume to reduce the processing time spent on collecting telemetry instead of other tasks reduces the overall observability of the system. Some examples of the resulting reduced observability include:

    - It limits the data points that are used to build meaningful alerts.
    - It leads to gaps in coverage for incident response activities.
    - It limits observability in security-sensitive or compliance-sensitive interactions and boundaries.

- When performance design patterns are implemented, the complexity of the workload often increases. Components are added to critical flows. The workload monitoring strategy and performance monitoring must include those components. When a flow spans multiple components or application boundaries, the complexity of monitoring the performance of that flow increases. Flow performance needs to be correlated across all the interconnected components.

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Increased complexity in operations.** A complex environment has more complex interactions and a higher likelihood of a negative impact from routine, ad hoc, and emergency operations.

- Improving performance efficiency by increasing density elevates the risk in operational tasks. An error in a single process can have a large blast radius.

- As performance design patterns are implemented, they influence operational procedures like backups, key rotations, and recovery strategies. For example, data partitioning and sharding can complicate routine tasks when teams try to ensure that those tasks don't affect data consistency.

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Culture stress.** Operational Excellence is rooted in a culture of blamelessness, respect, and continuous improvement.

- Conducting root cause analysis of performance issues identifies deficiencies in processes or implementations that require correction. The team should consider the exercise a learning opportunity. If team members are blamed for issues, morale can be affected.

- Routine and ad hoc processes can affect workload performance. It's often considered preferable to perform these activities during off-peak hours. However, off-peak hours can be inconvenient or outside of regular hours for the team members who are responsible for or skilled in these tasks.

## Performance Efficiency tradeoffs with Experience Optimization

:::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff: Decreased user engagement.** The Experience Optimization pillar prioritizes more engaging user experiences.

- Optimizing for performance prioritizes using platform features over customizations, which deprioritize custom components that could lead to a more engaging user experience.

- Optimizing for performance can focus too much on minimizing complexity, which deprioritizes features for more engaging user experiences, such as custom components and integrations.

- User interface development is often done in faster iterations and ship cycles, which can make it harder to enhance performance continuously.

## Related information

- [Reliability tradeoffs](../reliability/tradeoffs.md)
- [Operational Excellence tradeoffs](../operational-excellence/tradeoffs.md)
- [Experience Optimization tradeoffs](../experience-optimization/tradeoffs.md)
- [Security tradeoffs](../security/tradeoffs.md)
