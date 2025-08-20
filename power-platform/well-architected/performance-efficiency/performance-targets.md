---
title: Define performance targets recommendation for Power Platform workloads
description: Learn how to drive continuous improvement by setting performance targets for your Power Platform workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for defining performance targets 

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:01](checklist.md)|**Define performance targets. Performance targets should be numerical values that are tied to workload requirements. You should implement performance targets for all workload flows.**|
|---|---|

This guide describes the recommendations for establishing and exposing performance targets. Performance targets are metrics that define performance objectives. These metrics are expressed as a single numerical value or a numerical range. They're clear and specific metrics that drive continuous improvement. Performance targets are a numerical foundation for improvements, and they help teams align their efforts toward specific goals. Without clear performance targets, teams might lack focus and accountability for performance issues. By setting performance targets, teams can work toward specific objectives and drive continuous improvement.

**Definitions**

| Term | Definition |
|---|---|
| Data flow | The movement of data within a system or between systems. |
| Dependency | A component that a workload relies on. |
| Flow | In a workload, a sequence of operations that performs a specific function. It involves the movement of data and the running of processes between components of the workload. Although "flow" might suggest a Power Automate flow, in this context it refers to a generic sequence that isn't tied to a specific implementation. |
| Metrics | Numerical values that are collected at regular intervals. Metrics describe some aspects of a system at a particular time. |
| Performance targets | Metrics that define performance objectives. These metrics are expressed as a single numerical value or a numerical range. |
| User flow | The paths or sequences of actions that users take within an application or system. |
| Workflow | The sequence of steps that a workload runs to accomplish a task. |

## Key design strategies

Establishing performance targets is an essential step in achieving workload performance efficiency. Performance targets define the desired level of performance for your workload and help you gauge its effectiveness in meeting those objectives. Performance targets provide a benchmark to measure and compare a workload's efficiency. This benchmark can help you highlight improvement areas. The targets also align tasks with your organization's objectives and enhance business outcomes. Additionally, performance targets offer guidance in resource allocation, helping you ensure that workloads can adapt to varying demands while maintaining optimal performance.

### Set performance targets early

Set performance targets before you deploy your workload. Performance targets require research. Conduct market research, competitive analysis, and surveys to generate your performance target ranges. For an existing production workload that has no performance targets, use production data and user feedback to establish performance targets.

### Determine performance requirements

Determining performance requirements is about identifying essential performance metrics like response time, throughput, and latency that are critical for your workload. Aligning these performance targets with your organization's business goals ensures the workload meets the desired standards, whether for a best-in-class or average product. For example, you might aim to reduce response times, increase throughput rates, or optimize resource use.

When setting performance goals, it's important to align the organization's objectives with the distinct needs of the user base. Users ultimately determine the success of performance, emphasizing the need to align performance targets with their expectations. This balance ensures that performance targets capture the intended user experience and the overall efficiency of the workload. 

To comprehensively gauge and optimize workload performance, you should consider setting performance targets for the following:

- _Individual components_: Individual components are the separate units or segments of the workload, each potentially having distinct performance attributes and demands.
- _User_ _flows_: These pathways chart how users maneuver through the workload, and ensuring their fluidity directly enhances user experience.
- _Workflows_: Workflow-defined internal processes are crafted to achieve particular results and often dictate operational efficiency.
- _Data flows_: Data flows refer to the movement and interaction of data within the workload, helping identify potential inefficiencies or bottlenecks.
- _External dependencies_: External dependencies are elements outside the primary workload (integrated third-party services or tools) that can significantly affect performance.
- _Technology levels_: Technology levels are direct performance indicators such as the speed of API access, database operation latencies, and potential network delays.
- _Business transactions_: The seamless execution of end-to-end user business transactions, such as completing a purchase or booking a service, is directly tied to user satisfaction.
- _Workload all up_: This holistic metric gives an overview of the collective performance encompassing all components and aspects of the workload.

### Identify key metrics

Identifying key performance metrics involves determining the essential measurements that track the progress towards achieving workload performance goals. This identification provides a quantifiable way to measure and improve performance efficiency. 

When you identify key metrics to focus on, consider metrics related to availability, capacity, and response time:

- _Availability_: Error rate is an availability performance metric. Error rate represents the percentage of failed requests over a certain time period. A common target for error rate is 0.1 percent of requests.

- _Capacity_: Throughput and concurrency are sample capacity metrics. Throughput refers to the ability to handle a specific number of transactions within a given time period. For instance, an application integration with an external system might need to sustain 10 million update transactions per month. Concurrency is a measure of simultaneous users or actions.

- _Response time:_ Latency and load time are common response time metrics. Latency is the time it takes to respond to a request (200 milliseconds). Load time is the time it takes for an application or web page to be interactive. A common target is 99% of customer lookup requests completing in less than 2 seconds.

- _Deflection rate:_ In the context of conversational AI, deflection measures the percentage of requests completed through self-service that would otherwise be handled by live agents. In other words, it indicates the number of tasks that can be automated, reducing the workload for the team. Optimizing the agent deflection rate is one of the top focus areas for organizations aiming to achieve their business goals around return on investment (ROI) and customer satisfaction (CSAT), as well as to improve the agent's overall performance. Key indicators in Copilot Studio that help improve agent performance include resolution rate, escalation rate, and CSAT.

### Set specific targets

After you identify the key metrics, you need to specify performance targets or thresholds for each metric. Performance targets should be measurable, realistic, and aligned with your workload objectives. For example, you might set a target response time of less than 500 milliseconds (ms) or a target error rate of less than 1 percent. 

Avoid qualitative assessments of performance. For example, your users have different opinions on what fast or slow means. Stakeholders need to agree on what "fast" means and on how to measure it.

By using numerical targets, you can objectively assess performance over time. As you set specific performance targets, consider these recommendations:

- _Consider the_ _user_: When you set performance targets, adopt a user-centric perspective. Recognizing the user as the ultimate judge of performance helps ensure that performance targets align with user expectations. This alignment involves considering both organizational objectives and the distinct requirements of the user base. When you integrate these two aspects, you can tailor performance targets to reflect the desired user experience and overall workload effectiveness. By defining performance objectives that consider user expectations, you can strive to provide a high-quality user experience and meet the needs of your users. However, be careful asking users for their performance requirements. They might simply state that they want the system to be "as fast as possible," which is not informative. Try to establish what they think is too slow, or what unacceptable performance looks like, and work backwards from there. This way, you'll get more realistic requirements.

- _Consider the_ _tasks_: Consider the different tasks that users do with the system. Some tasks are more important than others from a  performance perspective. For example, a salesperson who needs to look up a customer's information quickly has a higher performance need than the same user looking at a monthly sales report. Focus on the tasks that are critical for performance and make sure they meet the requirements. For each critical task, talk to users about how long they think it should take. Be specific and focus on one task at a time. You'll end up with different requirements for different tasks within the same workload, which makes sense.

- _Use percentiles_: Percentiles like P99, P95, and P50 are commonly used to represent the results of performance assessments. They tell you what portion of the data a number includes. For instance, P99 includes 99% of the data. Use percentiles, rather than simple averages, to provide a more comprehensive understanding of workload performance. To measure percentiles, collect performance data over a period of time, typically using monitoring tools or logging mechanisms. Then, analyze this data to determine the response time values at different percentiles.

- _Set achievable goals_: Consider the baseline performance of the services you're using and set achievable goals. When using services that abstract the underlying platform, don't set goals that are tied to factors you don't control. For instance, setting a target of 200 ms for a screen load would be unrealistic if the baseline performance is already 250 ms, before you even have a chance to incorporate your custom logic.

### Document and expose performance target

Documenting and exposing performance targets is about recording all performance targets in a centralized location. Meeting performance targets is a shared responsibility between development and operations teams. To ensure that the workload consistently meets or exceeds these targets, provide teams with the information and access to take action. 

To document and expose performance targets, consider these recommendations:

- _Document performance targets_: Document all performance targets. Ensure that all performance targets are documented in a centralized location, easily accessible by both development and operations teams. It promotes alignment and aids in real-time decision-making.

- _Expose performance targets_: All responsible teams should be able to review and create actionable tasks from the performance targets. Use information radiators, such as dashboards and reports, to make the performance targets accessible.

- _Make it actionable_: The documentation and information radiators should suggest clear next steps. For example, a rise in errors might prompt an immediate check, or meeting a target consistently might suggest a reevaluation of that benchmark.

### Evaluate user feedback

Evaluating user feedback involves actively seeking out and analyzing the responses and suggestions of your users. Actively collecting and analyzing user feedback offers valuable insights into their needs and expectations. Regular communication helps in adjusting performance targets in line with changing preferences and tech trends. A focus on user needs means that the workload not only aligns with technical benchmarks but also undergoes continuous refinement. This approach, emphasizing user satisfaction, ensures that the workload remains relevant and successful in the long run.

## Power Platform facilitation

Power Platform integrates with [Application Insights](/azure/azure-monitor/app/app-insights-overview), which is part of the [Azure Monitor](/azure/azure-monitor/overview) ecosystem. Azure Monitor is a full-stack monitoring service that provides a complete set of features to monitor your resources and measure performance targets. Azure Monitor collects platform metrics and provides ready-to-use dashboards. It lets you configure alerts based on metrics and also stores and correlates metrics to ensure a single source of truth. For information on how standard telemetry and custom trace events can be logged and analyzed, see [Analyze system-generated logs using Application Insights](/power-apps/maker/canvas-apps/application-insights).

Power Platform ensures consistent availability and performance by applying service protection limits. These limits are usually high enough that your workload won't encounter them during normal usage. However, you might hit them if your workload handles large data volumes, bulk operations, or data migrations. If you're a workload developer, you should know how service protection limits are enforced and how to design your workload to reduce the chance of exceeding them. You should also plan for how to handle limits if they occur. For more information, see:

- [Power Platform request limits and allocations](/power-platform/admin/api-request-limits-allocations)
- [Service protection API limits](/power-apps/developer/data-platform/api-limits?tabs=sdk)
- [Limits of automated, scheduled, and instant Power Automate flows](/power-automate/limits-and-config)

[Copilot Studio](/microsoft-copilot-studio/analytics-overview) has a comprehensive set of analytics that identify the key performance indicators for your agent. Multiple charts show you trends and usage for your agent's topics. These charts use AI to highlight the topics that have the greatest impact on your agent's performance. You can also design a [custom analytics strategy](/microsoft-copilot-studio/guidance/custom-analytics-strategy) to create a report not covered by out-of-the-box analytics.

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
