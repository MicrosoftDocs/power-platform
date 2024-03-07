---
title: Reliability design principles
description: Understand the design principles of the reliability pillar.
author: robstand
ms.author: rstand
ms.reviewer: robstand
ms.subservice: guidance
ms.topic: conceptual
ms.date: 11/30/2023
---

# Reliability design principles

Outages and malfunctions are serious concerns for all workloads. A reliable workload must survive those events and **continue to consistently provide its intended functionality**. It must be **resilient** so that it can detect, withstand, and recover from failures within an acceptable time period. It must also be **available** so that users can access the workload during the promised time period at the promised quality level.

It's not realistic to assume failures won't occur, especially when the workload is built to run on distributed systems. Some components might fail while others continue to operate. At some point, the user experience might be affected, which compromises business goals.

Workload architectures should have **reliability assurances in application code, infrastructure, and operations**. Design choices shouldn't change the intent that's specified by business requirements. Such changes should be considered significant tradeoffs.

The **design principles** are intended to provide guidance for aspects of reliability that you should consider throughout the development lifecycle. Start with the recommended approaches and **justify the benefits for a set of requirements**. After you set your strategy, drive actions by using the [**Reliability checklist**](./checklist.md).

If you don't apply these principles to your design, the workload most likely won't be prepared to **anticipate or handle problems in production**. The outcome might be service disruptions that lead to financial loss. In the case of critical workloads, failing to apply these principles could jeopardize safety.

## Design for business requirements  

| ![Goal icon](../_images/goal.svg) Gather business requirements with a focus on the intended utility of the workload. |
| -- |

Requirements must cover user experience, data, workflows, and characteristics that are unique to the workload. The outcome of _the requirements process must clearly state the expectations_. The goals must be achievable and negotiated with the team, given a specified investment. They must be documented to drive technological choices, implementations, and operations.

| Approach | Benefit |
| -- | -- |
| **Quantify success by setting targets on indicators** for individual components, system flows, and the system as a whole. **Do those targets make user flows more reliable?** | Metrics quantify expectations. They enable you to **understand complexities** and determine whether the downstream costs of those complexities are within the investment limit.<br><br>The target values indicate an ideal state. You can use the values as test thresholds that help you **detect deviations** from that state and how long it takes to return to the target state.<br><br>Compliance requirements must also have predictable outcomes for in-scope flows. Prioritizing these flows **brings attention to areas that are the most sensitive**. |
| Understand platform commitments. **Consider the limits, quotas, regions, and capacity constraints** for services. | Service-level agreements (SLAs) vary by service. Not all services and features are covered equally. Not all services or features are available in all regions. Most of the subscription resource limits are per region. Having a good **understanding of coverage and limits** can help you detect drift and build resiliency and recovery mechanisms. |
| **Determine dependencies** and their effect on resiliency. | Keeping track of dependent infrastructure, services, APIs, and functions developed by other teams or third parties helps you determine **whether the workload can operate in the absence of those dependencies**. It also helps you **understand cascading failures** and **improve downstream operations**.<br><br>Developers can **implement resilient design patterns** to handle potential failures when you use external services that might be susceptible to failures. |

## Design for resilience

| ![Goal icon](../_images/goal.svg) The workload must continue to operate with full or reduced functionality. |
| -- |

You should expect that component malfunctions, platform outages, performance degradations, limited resource availability, and other faults will occur. Build resiliency in the system so that it's _fault-tolerant and can degrade gracefully_.

| Approach | Benefit |
| - | - |
| **Distinguish components that are on the critical path** from those that can function in a degraded state. | Not all components of the workload need to be equally reliable. Determining criticality helps you design according to the **criticality of each component**. You **won't overengineer resiliency for components** that could slightly deteriorate the user experience, as opposed to components that can cause end-to-end problems if they fail.<br><br>The design can be efficient in allocating resources to critical components. You can also implement fault isolation strategies so that if a noncritical component fails or enters a degraded state, it can be isolated to prevent cascading failures. |
| **Identify potential failure points in the system**, especially for the critical components, and determine the effect on user flows. | You can **analyze the failure cases, blast radius, and intensity of fault**: full or partial outage. This analysis influences the design of error handling capabilities at the component level. |
| **Build self-preservation capabilities** by using design patterns correctly and modularizing the design to isolate faults. | The system will be able to **prevent a problem from affecting downstream components**. The system will be able to mitigate transient and permanent failures, performance bottlenecks, and other problems that might affect reliability.<br><br>You'll also be able to **minimize the blast radius**. |
| **Add the capability to scale out the critical components** (application and infrastructure) by considering the capacity constraints of services in the supported regions. | The workload will be able to **handle variable capacity spikes and fluctuations**. This capability is crucial when there's an unexpected load on the system, like a surge in valid usage. If the workload is designed to scale out over multiple regions it can even overcome potential temporary resource capacity constraints or other issues impacting in a single region. |
| **Build redundancy in layers and resiliency on various application tiers**.<br><br>Aim for redundancy in physical utilities and immediate data replication. Also aim for redundancy in the functional layer that covers services, operations, and personnel. | Redundancy helps **minimize single points of failure**. For example, if there's a component, zonal, or regional outage, redundant deployment (in active-active or active-passive) allows you to meet uptime targets.<br><br>Adding intermediaries prevents direct dependency between components and improves buffering. Both of these benefits harden the resiliency of the system. |
| **Overprovision to immediately mitigate individual failure** of redundant instances and to buffer against runaway resource consumption. | Higher investment in overprovisioning **increases resiliency**.<br><br>The system will continue to operate at full utility during an active failure even before scaling operations can start to **remediate the failure**. Likewise, you can reduce the risk of unexpected runaway resource consumption claiming your planned buffer, gaining critical triage time, before system faults or aggressive scaling occur. |

## Design for recovery

| ![Goal icon](../_images/goal.svg) The workload must be able to anticipate and recover from most failures, of all magnitudes, with minimal disruption to the user experience and business objectives. |
| -- |

Even highly resilient systems need _disaster preparedness approaches_, in both architecture design and workload operations. On the data layer, you should have strategies that can repair workload state in case of corruption.

| Approach | Benefit |
| -- | -- |
| **Have structured, tested, and documented recovery plans** that are aligned with the negotiated recovery targets. Plans must cover all components in addition to the system as a whole. | A well-defined process leads to a **quick recovery** that can prevent negative impact on the finances and reputation of your business. Conducting regular recovery drills tests the process of recovering system components, data, and failover and failback steps to **avoid confusion when time and data integrity are key** measures of success. |
| Ensure that you can **repair data** of all stateful components within your recovery targets. | Backups are essential to getting the **system back to a working state** by using a trusted recovery point, like the last-known good state.<br><br>Immutable and transactionally consistent backups ensure that data can't be altered, and that the restored data isn't corrupted. |
| Implement **automated self-healing capabilities** in the design. | This automation **reduces risks from external factors**, like human intervention, and shortens the break-fix cycle. |
| Replace stateless components with **immutable ephemeral units**. | Building ephemeral units that you can spin up and destroy on demand provides **repeatability and consistency**. Use side-by-side deployment models to make the transition to the new units incremental, minimizing disruptions. |

## Design for operations

| ![Goal icon](../_images/goal.svg) Shift left in operations to anticipate failure conditions. |
| -- |

_Test failures early and often_ in the development lifecycle, and determine the impact of performance on reliability. For the sake of root cause analysis and postmortems, you need to have shared visibility, across teams, of dependency status and ongoing failures. _Insights, diagnostics, and alerts from observable systems are fundamental_ to effective incident management and continuous improvement.

| Approach | Benefit |
| -- | -- |
| **Build observable systems** that can correlate telemetry. | Monitoring and diagnostics are crucial operations. If something fails, you need to know that it failed, **when it failed**, and **why it failed**. Observability at the component level is fundamental, but aggregated observability of components and correlated user flows provides a holistic view of health status. This data is required to enable site-reliability engineers to prioritize their efforts for remediation. |
| **Predict potential malfunctions and anomalous behavior**. Make active reliability failures visible by using prioritized and actionable alerts.<br><br>Invest in reliable processes and infrastructure that leads to quicker triage. | Site reliability engineers can be notified immediately so that they can **mitigate ongoing live site incidents** and proactively mitigate potential failures identified by predictive alerts before they become live incidents. |
| **Simulate failures** and run tests in production and preproduction environments. | It's beneficial to experience failures in production so you can set **realistic expectations for recovery**. This allows you to make design choices that gracefully respond to failures. Also, it enables you to test the thresholds you set for business metrics. |
| Build components with **automation in mind**, and automate as much as you can. | Automation **minimizes the potential for human error**, bringing **consistency** to testing, deployment, and operations. |
| Factor in **routine operations and their impact** on the stability of the system. | The workload might be subject to ongoing operations, like application revisions, security and compliance audits, component upgrades, and backup processes. Scrutinizing those changes ensures the **stability of the system**. |
| Continuously **learn from incidents in production**. | Based on the incidents, you can determine the impact and oversights in design and operations that might go unnoticed in preproduction. Ultimately, you'll be able to **drive improvements** based on real-life incidents. |

## Keep it simple

| ![Goal icon](../_images/goal.svg) Avoid overengineering the architecture design, application code, and operations. |
| -- |

It's often what you remove rather than what you add that leads to the most reliable solutions. _Simplicity reduces the surface area for control_, minimizing inefficiencies and potential misconfigurations or unexpected interactions. On the other hand, oversimplification can introduce single points of failure. Maintain a balanced approach.

| Approach | Benefit |
| -- | -- |
| Add components to your architecture only if they help you achieve target business values. **Keep the critical path lean**. | Designing for business requirements can lead to a straightforward solution that's **easy to implement and manage**. Avoid having too many critical components, because each one is a significant point of failure. |
| **Establish standards** in code implementation, deployment, and processes, and document them. Identify opportunities to enforce those standards by using automated validations. | Standards provide **consistency and minimize human errors**. Approaches like standard naming conventions and code style guides can help you maintain quality and make assets easy to identify during troubleshooting. |
| Evaluate whether theoretical approaches translate to **pragmatic design** that applies to your use cases. | Application code that's too granular can lead to unnecessary interdependence, extra operations, and **difficult maintenance**. |
| **Develop just enough code**. | You'll be able to prevent problems that are the result of **inefficient implementations**, like unexpected resource consumption, user or data flow failures, and code bugs.<br><br>Conversely, reliability problems should lead to code reviews to ensure that code is resilient enough to handle the problems. |
| **Take advantage of platform-provided features** and prebuilt assets that can help you effectively meet business targets. | This approach **minimizes development time**. It also enables you to **rely on tried and tested practices** that have been used with similar workloads. |

## Next steps

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
