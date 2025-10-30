---
title: Recommendation checklist for Reliability for Power Platform workloads
description: Learn about the recommendations that will help you to identify the best infrastructure and application design for your Power Platform workload.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: checklist
ms.date: 08/15/2025
---

# Recommendation checklist for Reliability

This checklist presents a set of recommendations for you to use to evaluate the reliability, resiliency, and failure recovery strategies in your architecture design. To ensure reliability, identify the best infrastructure and application design for your workload. Make these decisions based on your business requirements that are mapped to availability and recoverability target metrics.

To implement a reliable design, thoroughly consider decision points in your design and be aware of how those decisions affect your workload. This checklist and the guides that come with it offer resources to help you make those decisions. Make workload reliability a central consideration at every stage of the workload design, development, and operation lifecycle.

## Checklist

Approach your design with a focus on reliability to help ensure that you design a workload that's resilient, manageable, and repeatable. If you don't include reliability practices and consider the tradeoffs, your design is potentially at risk. Carefully consider all the points covered in the checklist to instill confidence in your system's success.

|&nbsp; |Code  |Recommendation  |
|-|-|-|
| &#9744; |[RE:01](simplify.md)     |  **Design your workload to align with business objectives and avoid unnecessary complexity or overhead**. Use a practical and balanced approach to make design decisions that deliver the desired results. Contain your design to the necessities to reduce inefficiencies and potential problems.       |
| &#9744; |[RE:02](identify-flows.md)    |  **Identify and rate user and system flows.** Use a criticality scale based on your business requirements to prioritize the flows. |
| &#9744; |[RE:03](failure-mode-analysis.md)     |  **Use failure mode analysis (FMA) to identify and prioritize potential failures in your solution components.** Perform FMA to help you assess the risk and effect of each failure mode. Determine how the workload responds and recovers.       |
| &#9744; |[RE:04](metrics.md)     |   **Define reliability and recovery targets** for the components, the flows, and the overall solution. Visualize the targets to **negotiate, gain consensus, set expectations, and drive actions** to achieve the ideal state. Use the defined targets to build the health model. The health model defines what healthy, degraded, and unhealthy states look like.      |
| &#9744; |[RE:05](background-jobs.md) <br> [RE:05](handle-transient-faults.md)  |  **Strengthen the resiliency of your workload by implementing error handling and transient fault handling**. Build capabilities into the solution to handle component failures and transient errors.      |
| &#9744; |[RE:06](testing-strategy.md)      |  **Test for resiliency and availability scenarios by applying the principles of chaos engineering in your test and production environments**. Use testing to ensure that your graceful degradation implementation strategies are effective by performing active malfunction and simulated load testing.       |
| &#9744; |[RE:07](disaster-recovery.md)     |  **Implement structured, tested, and documented business continuity and disaster recovery (BCDR) plans that align with the recovery targets**. Plans must cover all components and the system as a whole.       |
| &#9744; |[RE:08](monitoring-alerting-strategy.md)     |  **Measure and publish the solution's health indicators**. Continuously capture uptime and other reliability data from across the workload and also from individual components and key flows.       |

## Next steps

> [!div class="nextstepaction"]
> [Reliability tradeoffs](tradeoffs.md)
