---
title: Reliability design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Reliability pillar.
author: manuelap-msft
ms.author: prwilk
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: conceptual
ms.date: 05/10/2024
---

# Reliability design principles

A reliable workload must survive outages and malfunctions and consistently deliver functionality. It must be resilient, capable of identifying, withstanding, and recovering from failures within a reasonable timeframe. Additionally, it must be available so that users can consistently and reliably access the workload during the agreed timeframe and at the agreed quality level.
 
Use the following design principles, modeled on the Microsoft Azure Well-Architected Framework, to help ensure reliability throughout the entire development lifecycle. Start with the recommended best practices and justify the benefits of each reliability principle. Once you set your strategy, use the [Reliability checklist](./checklist.md) as your next step.

- [Design for business requirements](/azure/well-architected/reliability/principles). Gather business requirements with a focus on the intended utility of the workload. Requirements must cover user experience, data, workflows, and characteristics that are unique to the workload. The outcome of _the requirements process must clearly state the expectations_. The goals must be achievable and negotiated with the team, given a specified investment. They must be documented to drive technological choices, implementations, and operations.
- [Design for resilience](/azure/well-architected/reliability/principles). The workload must continue to operate with full or reduced functionality. You should expect that component malfunctions, platform outages, performance degradations, limited resource availability, and other faults will occur. Build resiliency in the system so that it's _fault-tolerant and can degrade gracefully_.
- [Design for recovery](/azure/well-architected/reliability/principles). The workload must be able to anticipate and recover from most failures, of all magnitudes, with minimal disruption to the user experience and business objectives. Even highly resilient systems need _disaster preparedness approaches_, in both architecture design and workload operations. On the data layer, you should have strategies that can repair workload state in case of corruption.
- [Design for operations](/azure/well-architected/reliability/principles). Shift left in operations to anticipate failure conditions. _Test failures early and often_ in the development lifecycle, and determine the impact of performance on reliability. For the sake of root cause analysis and postmortems, you need to have shared visibility, across teams, of dependency status and ongoing failures. _Insights, diagnostics, and alerts from observable systems are fundamental_ to effective incident management and continuous improvement.
- [Keep it simple](/azure/well-architected/reliability/principles). Avoid overengineering the architecture design, application code, and operations. It's often what you remove rather than what you add that leads to the most reliable solutions. _Simplicity reduces the surface area for control_, minimizing inefficiencies and potential misconfigurations or unexpected interactions. On the other hand, oversimplification can introduce single points of failure. Maintain a balanced approach.

## Next steps

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
