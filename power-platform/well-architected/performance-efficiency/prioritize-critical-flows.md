---
title: Prioritize the performance of critical flows recommendation for Power Platform workloads
description: Learn how to identify critical flows and prioritize the performance of critical flows in a Power Platform workflow.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for prioritizing the performance of critical flows

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:07](checklist.md)|**Prioritize the performance of critical flows. The allocation of workload resources and performance optimization efforts should prioritize the flows that support the most important business processes, users, and operations.**|
|---|---|

This guide describes the recommendations for prioritizing the performance of critical flows in a workload. Critical flows represent crucial business processes that generate revenue or drive high-priority operations. When you prioritize the performance of critical flows, you ensure the flows that have the most impact get the resources they need before lower priority flows. Failure to do this prioritization can have disproportionate negative effects on workload priorities and the user experience.

**Definitions**

| Term | Definition |
|---|---|
| Flow | In a workload, the sequence of actions that performs a specific function. A flow involves the movement of data and the running of processes between components of the workload. |
| Priority queue processing | The act of processing high-priority tasks before low-priority tasks. |
| Rate limiting | The act of limiting how many requests can access a resource. |
| System flow | The flow of information and processes within a system. The system automatically follows this flow to enable user flows or workload functionality. |
| User flow | The sequence that a user follows to accomplish a task. |

## Key design strategies

Critical flows refer to the key user flows for customers or the system and data flows for operations that are crucial to the workload functionality. These flows can include actions such as user registrations, processing of financial transactions, or any other key path or process within your workload.

Critical flows significantly affect the user experience or business operations. Critical flows have higher performance targets and service-level agreements than noncritical flows. Where resources are limited, noncritical flows should yield resource usage to critical flows. You need to identify, monitor, and prioritize all flows before isolating and optimizing critical flows.

### Identify all flows

The first step in prioritizing the performance of critical flows is identifying all the flows within your workload. Flow identification involves systematically mapping and understanding user paths and component communication. The focus is on understanding the performance metrics and potential impact of flows on workload performance.

By dissecting the workload into discrete flows, you can find performance bottlenecks, inefficient resource utilization, and opportunities for performance optimization. This knowledge exposes areas of improvement and is the first step to identifying critical flows. For more information, see [Identify and rate user and system flows](../reliability/identify-flows.md).

### Monitor flow performance metrics

After you identify all flows within your workload, you need to collect performance metrics on each flow and monitor those metrics. Flow metrics provide insights into response times, error rates, and throughput. The goal is to consistently observe and record performance-related metrics to further refine your understanding of each flow's impact on workload performance. 

To monitor flow metrics, use the following tools to collect data:

- _Analytic and tracking tools_: These tools provide insights into user behavior and interactions within your application. By analyzing user data, you can identify the most common flows, bottlenecks, or potential issues.

- _Application performance monitoring (APM) tools_: Use APM tools to monitor the performance of your application and track how flows run. These tools provide visibility into response times, errors, and other performance metrics, allowing you to identify critical flows and optimize their performance.

- _Logging and debugging tools_: Use these tools to capture and analyze logs and debug information while your application runs. Review logs and debugging information to trace how flows are running and identify issues or errors.

### Identify critical flows

With the performance data available, you can begin ranking all the flows and identifying the critical flows. The identification of critical flows involves evaluating the performance impact and criticality of each flow. Effective flow prioritization ensures that the most important flows receive the resources needed before less critical flows. 

To prioritize flows in your application, consider these steps:

- _Identify business impact_: Start by assessing the importance of each flow within your operations. Focus on how each flow aligns with your business objectives, its impact on users, and the potential negative effects of poor performance. For instance, slow performance of your customer service system might mean users use workarounds, like Microsoft Teams or eMail, instead of recording customer decisions in the system, leading to poor data quality and incorrect reporting. 

    Additionally, consider the performance impacts of a flow across one or more business processes. Multiple flows might support a single business process, but often, one flow has a significant effect on the performance of that process. You want to identify the flows that have the greatest performance impact. Conversely, a single flow might underpin several processes. In such cases, the performance of this flow directly influences the efficacy of all related processes, and it's likely a critical flow.

- _Analyze performance data_: Analyze the performance metrics associated with each flow. Look for patterns, anomalies, or standout metrics that can provide insights into the flow's efficiency and importance. For example, system flows with significant usage are likely important flows.

- _Assign criticality rating_: Based on the business impact and performance indicators, you should prioritize the flows. Use criticality ratings of _Critical (high criticality)_, _Important (medium criticality)_, and _Productivity (low criticality)_. Flows with a significant business impact or high-performance demand should receive a _Critical_ (_high criticality)_ criticality rating. Focus on flows with high user traffic or have a direct effect on revenue generation. The following table provides characteristics of critical (_High_) and noncritical flows (_Medium_ to _Low_).

    | Critical flows | Noncritical flows |
    |---|---|
    | High usage | Low usage |
    | Business critical | Not business critical |
    | Expensive operations | Small operations |
    | Time-sensitive | Not time-sensitive |
    | Production | Preproduction |
    | Real-time processing | Batch processing |
    | Latency sensitive | Not latency sensitive |
    | Paying user | Nonpaying user |
    | Important tasks | Nonessential tasks |

### Isolate critical flows

The process of isolating critical flows involves allocating dedicated resources or capacity to support critical flows. You want to allocate resources and attention to those flows that are essential for optimal user experience or significant business outcomes. The goal is to ensure critical flows receive enough resources to operate efficiently and effectively. By isolating critical flows, you can more easily manage the resources that support critical flows. 

Here are recommendations for isolating critical flows:

- _Resource segmentation_: Create separate environments for critical workloads, allowing them to operate independently without interference from other processes. For example, make sure that Power Automate cloud flows that are critical to your workload run under a dedicated service account so they aren't impacted by the capacity limitations of a user account that might run other processes as well.

- _Capacity allocation_: For critical flows, explicitly allocate a fixed set of capacity such as assigning a Power Automate Process license to a cloud flow, or creating a dedicated environment for your workload where you allocate AI Builder or other credits. This allocation ensures that critical flows always have enough resources to operate efficiently. By explicitly allocating resources to critical flows, you prevent resource contention and prioritize how they run.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Resource segmentation affects costs. When you dedicate resources to a flow, you often increase the cost and leave some resources underutilized. To justify the performance enhancements to critical flows, the increase in business impact must outweigh the increase in cost.

## Power Platform facilitation

**Generate process diagrams**: [Plan designer](/power-apps/maker/plan-designer/process-diagram) helps teams create and refine diagrams as part of the plan to clarify user interactions and build effective solutions. Process diagrams make workflows clearer, improve communication, and help teams work more efficiently, especially on complex projects.

**Identifying and monitoring flows**: Consider using [process mining and task mining in Power Automate](/power-automate/process-advisor-overview), including a [process map](/power-automate/process-advisor-visualize), a powerful tool that can help you visualize and analyze your business processes. 

**Optimizing capacity allocations**: You can isolate critical flows through techniques such as creating separate environments, solutions, resources, and explicitly allocating resources to critical flows.

During your design phase, take into account [request limits and allocations](/power-platform/admin/api-request-limits-allocations) and [performance profiles](/power-automate/limits-and-config) that apply to your resources.

## Related information

- [Recommendations for identifying and rating flows](/power-platform/well-architected/reliability/identify-flows)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
