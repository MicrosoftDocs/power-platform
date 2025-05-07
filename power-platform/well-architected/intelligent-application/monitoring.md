---
title: Performance optimization for intelligent application workloads
description: Optimize intelligent application workloads by monitoring key performance metrics, diagnosing issues promptly, and continuously enhancing efficiency to meet user demands.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Performance optimization for intelligent application workloads

Performance efficiency is the ability of your workload to scale efficiently to meet the demands placed on it by users. Monitoring the performance of your intelligent application workload is crucial to ensuring that it operates effectively and efficiently.

The workload team needs to establish key performance metrics, regularly review system performance, and diagnose any issues promptly. Effective monitoring and diagnostic procedures help maintain system reliability and user satisfaction.

## Define performance targets

Identifying key performance metrics involves determining the essential measurements that track the progress toward achieving workload performance goals. These metrics provide a quantifiable way to measure and improve performance efficiency.

When you identify key metrics to focus on, consider metrics related to capacity, response time, deflection rate, and engagement and outcomes:

- _Capacity_: Throughput and concurrency are sample capacity metrics. *Throughput* refers to the ability to handle a specific number of transactions within a given time period. For instance, an agent might handle 200,000 chat sessions per month. Also consider seasonal variations and the anticipated maximum peak of concurrent conversations. *Concurrency* is a measure of simultaneous users or actions. For instance, an agent might handle a maximum of 5,000 concurrent chats during peak season. Understanding target volumes helps validate the target architecture and scale. 

- _Response time_: Latency and load time are common response time metrics. *Latency* is the time it takes to respond to a request (200 milliseconds). *Load time* is the time it takes for an agent to become active and respond to the first message. Understand the expected maximum latency for the agent to answer queries, and define an approach for handling long-running actions (for example, waiting for an external system to return data).

- _Deflection rate_: In the context of conversational AI, *deflection* is an indicator representing the percentage of requests that are completed in a self-service fashion that would otherwise be handled by customer service representatives. In other words, it refers to the number of tasks a team no longer has to handle due to automation. Optimizing the agent deflection rate is one of the top focus areas for organizations to achieve their business goals, from return on investment (ROI) and customer satisfaction (CSAT), to improvement of the agent's overall performance. Microsoft Copilot Studio provides an overview of your agent's performance, including key indicators such as resolution rate, escalation rate, and CSAT.

- _Engagement and outcomes_: Tracking conversation engagement and outcomes is key to measuring agent performance metrics and identifying areas for improvement. Learn more in [Measuring agent engagement](/microsoft-copilot-studio/guidance/measuring-engagement) and [Measuring agent outcomes](/microsoft-copilot-studio/guidance/measuring-outcomes).

## Performance planning

Resources in your workload have performance limitations. Performance limitations apply to features within each service. You need to understand the limitations of the resources in your workload and factor those limitations into your design decisions. For example, you should know whether resource limitations require you to change the design approach or to change resources altogether.

- Understand target volumes. Target volumes help validate the target architecture and scale, licensing aspects of the agent, and the potential effect on Dataverse storage for conversation transcripts.
- Understand [platform limits](/microsoft-copilot-studio/requirements-quotas). When integrating your intelligent application workload with external systems, for example through Power Automate or HTTP requests, it's important to validate that every component can handle the load.
- Identify bottlenecks. Measure throughput and response times to identify the components of your system that might become problematic as the workload grows. Identify bottlenecks in the end-to-end process by using process-mining analysis capabilities like rework and root cause analysis.

Learn more: [Recommendations for performance planning](../performance-efficiency/performance-planning.md)

## Performance monitoring

Performance optimization requires data to measure the current performance of a workload or a flow against its performance targets. Collect a sufficient amount and variety of data to accurately measure the performance of the code and infrastructure against set performance targets. Ensure that every component and flow within the workload automatically generates continuous and meaningful metrics and logs.

Vigilantly monitor the performance of your intelligent application workload to ensure it operates at peak effectiveness and efficiency.

Copilot Studio provides comprehensive [out-of-the-box analytics](/microsoft-copilot-studio/analytics-overview) that allow you to understand an agent's usage and key performance indicators.

You can view reports related to:

- Performance and usage
- Customer satisfaction
- Session information
- Topic usage
- Billed sessions

In addition to the native analytics features within Copilot Studio, you can send telemetry data to Application Insights. Learn more in [Capture telemetry with Application Insights](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry?tabs=webApp). Continuously monitor performance and detect anomalies by using tools such as Azure Monitor, Log Analytics, Application Insights, and alerts.

Define the key performance indicators (KPIs) that you intend to monitor to measure your intelligent application workload's success, such as engagement rate, resolution rate, and deflection rate. First, review the native dashboards to understand the available data. Then, decide if creating a custom report would better meet your specific needs.

Learn more:

- [Custom analytics strategy](/microsoft-copilot-studio/guidance/custom-analytics-strategy) 
- [Recommendations for collecting performance data](../performance-efficiency/collect-performance-data.md)

## Continuous performance optimization

Proactively optimizing performance involves implementing measures to improve and enhance the performance of the workload before any issues arise. Proactive measures include identifying potential bottlenecks, monitoring performance metrics, and implementing optimizations to ensure the workload runs efficiently and meets performance goals.

To continuously enhance your intelligent application workload, schedule regular reviews of the agent's performance:

| Performance indicator | Definition |
| --- | --- |
| Resolution rate | Percentage of user requests that are successfully resolved by the agent without requiring escalation to a customer service representative. |
| Engagement rate | Percentage of total engaged sessions. A session is considered engaged when a user interacts with the agent in a meaningful way, such as triggering a nonsystem topic, escalating the session, or invoking a fallback topic. | 
| Abandon rate | Percentage of engaged sessions that end without reaching a resolution or escalation. Essentially, it measures how often users leave or stop interacting with the agent before their issue is resolved or escalated to a representative. | 
| Escalation rate | Percentage of engaged sessions that are escalated to a representative. This metric is key to understanding how often the agent is unable to resolve user queries on its own and requires human intervention. |
| Unrecognized utterances | Occurs when the agent's natural language understanding (NLU) model can't match a user input to any predefined intent or topic. The system is unable to determine the user's intent based on the input provided. | 
| CSAT | Customer satisfaction. |
| Topics with low resolution | Refers to conversation topics that frequently fail to resolve user queries effectively. These topics often lead to user dissatisfaction, abandonment, or escalation to a representative. |

This review helps prioritize the backlog of agent updates. For example, if unrecognized utterances are frequently escalated to a customer service representative, take the opportunity to improve deflection. Analyze user patterns that trigger fallback and unrecognized utterances, and either train existing topics or create new ones to equip the agent to better address user needs.

Learn more:

- [Deflection optimization](/microsoft-copilot-studio/guidance/deflection-overview) 
- [Analyze agent performance and usage in Copilot Studio](/microsoft-copilot-studio/analytics-summary)
- [Recommendations for continuous performance optimization](../performance-efficiency/continuous-performance-optimize.md)
