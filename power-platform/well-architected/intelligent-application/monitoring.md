---
title: Performance optimization for intelligent application workloads
description: Optimize intelligent application workloads by monitoring key performance metrics, diagnosing issues promptly, and continuously enhancing efficiency to meet user demands.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Performance optimization for intelligent application workloads

Performance efficiency is the ability of your workload to efficiently scale to meet the demands placed on it by users. Monitoring the performance of your intelligent application workload is crucial to ensuring it operates effectively and efficiently.

The workload team need to establish key performance metrics, regularly review system performance, and diagnose any issues promptly. Effective monitoring and diagnostic procedures help maintain system reliability and user satisfaction.

## Define performance targets

Identifying key performance metrics involves determining the essential measurements that track the progress towards achieving workload performance goals. This identification provides a quantifiable way to measure and improve performance efficiency.

When you identify key metrics to focus on, consider metrics related to availability, capacity, and response time:

- _Capacity_: Throughput and concurrency are sample capacity metrics. Throughput refers to the ability to handle a specific number of transactions within a given time period. For instance, a copilot might handle 200,000 chat sessions per month. Understanding target volumes helps validate the target architecture and scale. Also consider seasonal affect and expected maximum peak of concurrent conversations. Concurrency is a measure of simultaneous users or actions. For instance, a copilot might handle a maximum of 5,000 concurrent chats during peak season.

- _Response time:_ Latency and load time are common response time metrics. Latency is the time it takes to respond to a request (200 milliseconds). Load time is the time it takes for a copilot to be active with the response of the first message. Understand the expected maximum latency for the copilot to answer queries, and define an approach for handling long-running actions (for example, waiting for an external system to return data).

- _Deflection rate:_ In the context of conversational AI, deflection is an indicator representing the percentage of requests that are completed in a self-service fashion that would otherwise be handled by live agents. In other words, it refers to the number of items a team avoids having to deal with as a result of automation. Optimizing the copilot deflection rate is one of the top focus areas for organizations to achieve their business goals around return on investment (ROI) and customer satisfaction (CSAT), and to improve the copilot's overall performance. There are major indicators in Copilot Studio that help improve copilot performance, such as resolution rate, escalation rate, and CSAT.

- _Engagement and outcomes_: Tracking conversation engagement and outcomes is important to measure the copilot performance metrics and identify areas for improvements in the analytics dashboard. Learn more: [Measure copilot engagement](/microsoft-copilot-studio/guidance/measuring-engagement) and [Measure copilot outcomes](/microsoft-copilot-studio/guidance/measuring-outcomes)

## Performance planning

Resources in your workload have performance limitations. Performance limitations apply to features within each service. You need to understand the limitations of the resources in your workload and factor those limitations into your design decisions. For example, you should know whether resource limitations require you to change the design approach or to change resources altogether.

- Understanding target volumes helps validate the target architecture and scale. Target volumes also help validate the licensing aspects of the copilot and the potential affect on Dataverse storage for the conversation transcripts.
- Understand [platform limits](/microsoft-copilot-studio/requirements-quotas). When integrating your intelligent application workload with external systems, for example through Power Automate or HTTP requests, it’s important to validate that every part can handle the load.
- Identify bottlenecks by measuring throughput and response times to identify the specific components of your system that might become bottlenecks as the workload grows. Identify bottlenecks in the end-to-end process by using process mining analysis capabilities like rework and root cause analysis.

Learn more: [Recommendations for performance planning](../performance-efficiency/performance-planning.md)

## Performance monitoring

Performance optimization requires data to measure the current performance of a workload or a flow against its performance targets. You need to collect the right amount and diversity of data to measure the performance of the code and the infrastructure against performance targets. Ensure that every component and flow within the workload automatically generates continuous and meaningful metrics and logs.

Monitoring the performance of your intelligent application workload is important to ensure it operates effectively and efficiently. 

Copilot Studio provides comprehensive [out-of-the-box analytics](/microsoft-copilot-studio/analytics-overview) that allow you to understand a copilot's usage and key performance indicators.

Customers can view reports related to:

- Performance and usage.
- Customer satisfaction.
- Session information.
- Topic usage.
- Billed sessions.

In addition to the native analytics features within Copilot Studio, you can send telemetry data to Application Insights. Learn more: [Capture Copilot Studio telemetry with Azure Application Insights](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry?tabs=webApp). Continuously monitoring performance and detecting anomalies by using tools such as Azure Monitor, Log Analytics, Application Insights, and alerts.

Define the key performance indicators (KPIs) that you'll monitor to measure your intelligent application workloads success - for example, the engagement rate, resolution rate, and deflection rate. Start by assessing the native dashboards, and then evaluate if developing a custom report would better meet your requirements.

Learn more:

- [Custom analytics strategy](/microsoft-copilot-studio/guidance/custom-analytics-strategy) 
- [Recommendations for collecting performance data](../performance-efficiency/collect-performance-data.md)

## Continuous performance optimization

Proactively optimizing performance means taking measures to improve and enhance the performance of the workload before any performance issues arise. Using proactive measures involves identifying potential bottlenecks, monitoring performance metrics, and implementing optimizations to ensure that the workload operates efficiently and meets the desired performance goals.

Optimizing the copilot deflection rate is often one of the top focus areas to improve the copilot's overall performance. There are major indicators in Copilot Studio that help improve copilot performance, such as resolution rate, escalation rate, and customer satisfaction (CSAT).

To regularly improve your intelligent application workload, plan regular review of the copilot performance:

| Performance Indicator | Definition |
| --- | --- |
| Resolution rate | The deflection rate refers to the percentage of user requests that are successfully resolved by the Copilot without needing to escalate to a human agent. |
| Engagement rate | The engagement rate refers to the percentage of total sessions that become engaged. A session is considered engaged when a user interacts with the Copilot in a meaningful way, such as triggering a nonsystem topic, escalating the session, or invoking a fallback topic. | 
| Abandon rate | The abandon rate refers to the percentage of engaged sessions that end without reaching a resolution or escalation. Essentially, it measures how often users leave or stop interacting with the Copilot before their issue is resolved or escalated to a human agent. | 
| Escalation rate | The escalation rate refers to the percentage of engaged sessions that are escalated to a human agent. This metric is crucial for understanding how often the Copilot is unable to resolve user queries on its own and requires human intervention. |
| Unrecognized utterances | An unrecognized utterance refers to a user input that the Copilot’s natural language understanding (NLU) model can't match to any predefined intent or topic. When this occurs, the system is unable to determine the user’s intent based on the provided input. | 
| CSAT | Customer satisfaction |
| Topics with low resolution | Topics with low resolution refer to conversation topics that frequently fail to resolve user queries effectively. These topics often lead to user dissatisfaction, abandonment, or escalation to human agents. |

This review helps prioritize the backlog of copilot updates. For example, if unrecognized utterances are escalated to a human agent–that is, not deflected–there's an opportunity to improve the deflection by addressing the usage patterns of the user that triggers fallback consistently and use unrecognized utterances are to either train existing topic or create new topic where there's demand.

Learn more:

- [Deflection optimization](/microsoft-copilot-studio/guidance/deflection-overview) 
- [Analyze copilot performance and usage in Copilot Studio](/microsoft-copilot-studio/analytics-summary)
- [Recommendations for continuous performance optimization](../performance-efficiency/continuous-performance-optimize.md)
