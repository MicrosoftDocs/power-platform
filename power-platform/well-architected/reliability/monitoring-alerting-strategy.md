---
title: Design a reliable monitoring and alerting strategy recommendation for Power Platform workloads
description: Learn how to design a monitoring and alerting strategy that supports the reliability requirements of your Power Platform workload. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing a reliable monitoring and alerting strategy

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

|[RE:08](checklist.md)| **Measure and publish the solution's health indicators. Continuously capture uptime and other reliability data from across the workload and also from individual components and key flows.**  |
|---|---|

This guide describes the recommendations for designing a reliable monitoring and alerting strategy. Implement this strategy to keep your operations teams informed of your environment's health status and ensure that you meet the established reliability targets for your workload.

**Definitions**

| Term | Definition |
| --- | --- |
| Metrics | Numerical values that are collected at regular intervals. Metrics describe some aspects of a system at a particular time. |
| Resource logs | Data that a system generates about the state of the system. |
| Traces | Data that provides information about the path that a request travels through services and components. |

## Key design strategies

Before you create a monitoring and alerting strategy, perform the following tasks for your workload as part of your reliability planning:

- Identify [critical and noncritical flows](./identify-flows.md).

- Perform [failure mode analysis (FMA)](failure-mode-analysis.md) for your flows.

- Identify [reliability targets](metrics.md).

- Design a robust [testing strategy](testing-strategy.md).

Create a monitoring and alerting strategy to provide awareness to your operations teams so that they're notified of changes in your workload's condition and can quickly address issues. The health model for your critical flows and for workloads that include critical flows should define healthy, degraded, and unhealthy states. Design your monitoring posture to immediately catch changes in these states. When health states change from healthy to degraded or unhealthy, alerting mechanisms should trigger automatic recovery measures and alerts to the responsible teams.

Implement the following recommendations to design a monitoring and alerting strategy that meets the requirements of your business.

### General guidance

Understand the difference between [metrics](/azure/azure-monitor/essentials/data-platform-metrics), [logs](/azure/azure-monitor/logs/data-platform-logs), and [traces](/azure/azure-monitor/app/asp-net-trace-logs).

Enable [logging](/azure/azure-monitor/essentials/resource-logs) for all cloud resources. Use automation and governance in your deployments to enable diagnostic logging throughout your environment.

Forward all diagnostic logs to a centralized data sink and analytics platform, like a [Log Analytics workspace](/azure/azure-monitor/logs/log-analytics-workspace-overview). If you have regional data sovereignty requirements, you must use local data sinks in the regions that are subject to those requirements.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: There are cost implications for storing and querying logs. Notice how your log analysis and retention affects your budget, and determine the best balance of utilization to meet your requirements.

If your workloads are subject to one or more compliance frameworks, some of the component logs that handle sensitive information are also subject to those frameworks. Send the relevant component logs to a security information and event management (SIEM) system, like [Microsoft Sentinel](/azure/sentinel/overview).

Create a [log retention policy](/azure/azure-monitor/logs/data-retention-archive) that incorporates long-term retention requirements that the compliance frameworks impose on your workload.

Use [structured logging](https://stackify.com/what-is-structured-logging-and-why-developers-need-it) for all log messages to optimize querying the log data.

Configure alerts to trigger when values pass critical thresholds that correlate to a health model state change, like green to yellow or red. Threshold configuration is a practice of continuous improvement. As your workload evolves, the thresholds you define might change.

Consider using alerts when states improve, such as red to yellow or red to green, so that the operations teams can track these events for future reference.

Visualize the real-time health of your environment by using [custom dashboards](/azure/azure-monitor/visualize/tutorial-logs-dashboards).

Use data that's gathered during incidents to continuously improve your [health models](metrics.md).

Incorporate [cloud platform monitoring and alerting services](/power-platform/admin/check-online-service-health), including platform-level health.

Incorporate purpose-built advanced monitoring and analytics that your cloud provider offers, like Azure Monitor [insight tools](/azure/azure-monitor/overview).

Implement backup and recovery monitoring to capture:

- The data replication status to ensure that your workload achieves recovery within the target recovery point objective (RPO).  
- Successful and failed backups and recoveries.  
- The recovery duration to inform your [disaster recovery planning](disaster-recovery.md).

### Monitor applications and agents

Log data while the application or agent runs in the production environment. You need sufficient information to diagnose the cause of issues in the production state.

Log events at service boundaries. Include a correlation ID that flows across service boundaries. If a transaction flows through multiple services and one of them fails, the correlation ID helps you track requests across your application and pinpoint why the transaction failed.

Separate application and agent logging from auditing. Audit records are commonly maintained for compliance or regulatory requirements and must be complete. To avoid dropped transactions, maintain audit logs separate from diagnostic logs.

Use white box monitoring to instrument the application or agent with semantic logs and metrics. Collect application- and agent-level metrics and logs, such as memory consumption or request latency, from the application or agent to inform a health model and to detect and predict issues.

Use black box monitoring to measure platform services and the resulting customer experience. Black box monitoring tests externally visible application or agent behavior without knowledge of the internals of the system. This approach is common for measuring customer-centric service-level indicators (SLIs), service-level objectives (SLOs), and service-level agreements (SLAs).

### Monitor data and storage

Monitor the availability metrics of your storage containers. When this metric drops below 100%, it indicates failing writes. Transient drops in availability might happen when your cloud provider manages the load. Track the availability trends to determine if there's an issue with your workload. In some cases, a drop in the availability metrics for a storage container indicates a bottleneck in the compute layer that's associated with the storage container.

There are many metrics to monitor for databases. In the context of reliability, the important metrics to monitor include:

- Query duration
- Timeouts
- Wait times
- Memory pressure
- Locks

## Power Platform facilitation

Power Platform integrates with [Application Insights](/azure/azure-monitor/app/app-insights-overview), which is part of the [Azure Monitor](/azure/azure-monitor/overview) ecosystem. You can use this integration to:

- Subscribe to receive telemetry captured by the [Dataverse platform in Application Insights](/power-platform/admin/overview-integration-application-insights) on diagnostics, performance, and operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.

- Connect your [canvas apps to Application Insights](/power-apps/maker/canvas-apps/application-insights) to use these analytics to diagnose issues, understand what users actually do with your apps, drive better business decisions, and improve the quality of your apps.

- Configure [Power Automate telemetry](/power-platform/admin/app-insights-cloud-flow) to flow into Application Insights. You can use this telemetry to monitor cloud flow executions and create alerts for cloud flow run failures.

- Capture telemetry data from your [Microsoft Copilot Studio agent](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry) for use in Azure Application Insights. You can use this telemetry to monitor logged messages and events sent to and from your agent, topics to be triggered during user conversations, and custom telemetry events that can be sent from your topics.

Power Platform resources log activities in the [Microsoft Purview compliance portal](/purview/purview). Most events are available within 24 hours of the activity. Don't use this information for real-time monitoring. For more information about logging activities in Power Platform, see:

- [Power Apps](/power-platform/admin/logging-powerapps)
- [Power Automate](/power-platform/admin/logging-power-automate)
- [Copilot Studio](/microsoft-copilot-studio/admin-logging-copilot-studio)
- [Power Pages](/power-platform/admin/logging-power-pages)
- [Power Platform connectors](/power-platform/admin/connector-events-power-platform)
- [Data loss prevention](/power-platform/admin/dlp-activity-logging)
- [Power Platform administrative logs](/power-platform/admin/admin-activity-logging)
- [Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)

Your Power Platform workload may include Azure resources. To learn more about monitoring recommendations for Azure resources, see [Recommendations for designing and creating a monitoring system](/azure/well-architected/operational-excellence/observability).

The [Power Platform CoE Starter Kit](/power-platform/guidance/coe/starter-kit) is a reference implementation containing a collection of components and tools designed to help you get started with developing a strategy for adopting and supporting Power Platform. The kit provides automation and tooling to help teams build monitoring and automation necessary to support a CoE.

## Related information

[How do I check my online service health?](/power-platform/admin/check-online-service-health)

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
