---
title: Design review checklist for Reliability
description: Use this checklist to identify the best approach for reliability of your low-code workload.
author: robstand
ms.author: rstand
ms.reviewer: robstand
ms.subservice: guidance
ms.topic: conceptual
ms.date: 11/30/2023
---

# Design review checklist for Reliability

This checklist presents a set of recommendations for you to use to evaluate the reliability, resiliency, and failure recovery strategies in your architecture design. To ensure reliability, identify the best infrastructure and application design for your workload. Make these decisions based on your business requirements that are mapped to availability and recoverability target metrics.

When designing for reliability, pay attention to the choices you make in your design and how they impact your workload. This checklist and the guides that come with it offer resources to help you with those choices. Keep workload reliability in mind at every stage of the workload design, development, and operation lifecycle.

## Checklist

Approach your design with a focus on reliability to help ensure that you design a workload that's resilient, manageable, and repeatable. If you don't include reliability practices and consider the tradeoffs, your design is potentially at risk. Carefully consider all the points covered in the checklist to instill confidence in your system's success.

|&nbsp; |Code  |Recommendation  |
|-|-|-|
| &#9744; |[RE:01](simplify.md)     |  **Design your workload to align with business objectives and avoid unnecessary complexity or overhead**. Use a practical and balanced approach to make design decisions that deliver the desired results. Contain your design to the necessities to reduce inefficiencies and potential problems.       |
| &#9744; |[RE:02](identify-flows.md)    |  **Identify and rate user and system flows.** Use a criticality scale based on your business requirements to prioritize the flows. |
| &#9744; |[RE:03](failure-mode-analysis.md)     |  **Use failure mode analysis (FMA) to identify and prioritize potential failures in your solution components.** Perform FMA to help you assess the risk and effect of each failure mode. Determine how the workload responds and recovers.       |
| &#9744; |[RE:07](background-jobs.md) <br> [RE:07](self-preservation.md) <br> [RE:07](handle-transient-faults.md)  |  **Strengthen the resiliency and recoverability of your workload by implementing self-preservation and self-healing measures**. Build capabilities into the solution by using infrastructure-based reliability patterns and software-based design patterns to handle component failures and transient errors. Build capabilities into the system to detect solution component failures and automatically initiate corrective action while the workload continues to operate at full or reduced functionality.       |
| &#9744; |[RE:08](testing-strategy.md)      |  **Test for resiliency and availability scenarios by applying the principles of chaos engineering in your test and production environments**. Use testing to ensure that your graceful degradation implementation and scaling strategies are effective by performing active malfunction and simulated load testing.       |
| &#9744; |[RE:09](disaster-recovery.md)     |  **Implement structured, tested, and documented business continuity and disaster recovery (BCDR) plans that align with the recovery targets**. Plans must cover all components and the system as a whole.       |
| &#9744; |[RE:10](monitoring-alerting-strategy.md)     |  **Measure and publish the solution's health indicators**. Continuously capture uptime and other reliability data from across the workload and also from individual components and key flows.       |
| &#9744; |[RE:11](default-environment-hygiene.md)     |  **Default environment hygiene** recommendation.       |

## Next steps

We recommend that you review the Reliability tradeoffs to explore other concepts.

> [!div class="nextstepaction"]
> [Reliability tradeoffs](tradeoffs.md)