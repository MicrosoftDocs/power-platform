---
title: Recommendation checklist for Performance Efficiency for Power Platform workloads
description: Learn about the recommendations that will help you to achieve performance efficiency in your Power Platform workloads.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: checklist
ms.date: 05/16/2024
---
# Recommendation checklist for Performance Efficiency

This checklist presents a set of recommendations for you to design your workload so it can grow and meet your workload usage demand. The goal of performance is to maintain the efficiency of every interaction with a healthy system as demand increases. When you design and implement for performance, focus on the efficiency and effectiveness of cost, complexity, supporting new requirements, technical debt, reporting, and toil.

For every system, there's a limit to how much you can scale it without redesigning, introducing a workaround, or incorporating human involvement. If you don't include performance efficiency practices and consider the tradeoffs, your design is potentially at risk. Carefully consider all the points covered in the checklist to instill confidence in your system's success.

## Checklist

|&nbsp;|Code  |Recommendation  |
|-|-|-|
| &#9744; | [PE:01](performance-targets.md)  | **Define performance targets.** Performance targets should be numerical values that are tied to workload requirements. You should implement performance targets for all workload flows. |
| &#9744; | [PE:02](performance-planning.md) | **Conduct performance planning.** Performance planning should be done before there are predicted changes in usage patterns. Predicted changes include seasonal variations, product updates, marketing campaigns, special events, or regulatory changes.  |
| &#9744; | [PE:03](select-services.md) | **Select the right services.** The services and product features must support your ability to reach the workload's performance targets and accommodate expected capacity changes. The selections should also weigh the benefits of using platform features or building a custom implementation.  |
| &#9744; | [PE:04](collect-performance-data.md) | **Collect performance data.** Workload components and flows should provide automatic, continuous, and meaningful metrics and logs. Collect data at different levels of the workload, such as the application, platform, data, and operating system levels.  |
| &#9744; | [PE:05](performance-test.md) | **Test performance.** Perform regular testing in an environment that matches the production environment. Compare results against the performance targets and the performance benchmark. |
| &#9744; | [PE:06](optimize-code.md) | **Optimize logic**. Use code and logic that's performant, and ensure that it offloads responsibilities to the platform. Use logic only for its intended purpose and only when necessary. |
| &#9744; | [PE:07](prioritize-critical-flows.md) | **Prioritize the performance of critical flows.** The allocation of workload resources and performance optimization efforts should prioritize the flows that support the most important business processes, users, and operations. |
| &#9744; | [PE:08](optimize-data-performance.md) | **Optimize data usage.** Optimize data stores for their intended and actual use in the workload. |
| &#9744; | [PE:09](respond-live-performance-issues.md) | **Respond to live performance issues.** Plan how to address performance problems by incorporating clear lines of communication and responsibilities. When a problematic situation occurs, use what you learn to identify preventive measures and incorporate them in your workload. Implement methods to return to normal operations faster when similar situations occur. |
| &#9744; | [PE:10](continuous-performance-optimize.md) | **Continuously optimize performance.** Focus on components that show deteriorating performance over time, such as databases and networking features. |

## Next steps

> [!div class="nextstepaction"]
> [Performance Efficiency tradeoffs](tradeoffs.md)
