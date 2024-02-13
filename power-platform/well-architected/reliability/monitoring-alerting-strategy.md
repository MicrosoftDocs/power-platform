---
title: Recommendations for designing a reliable monitoring and alerting strategy
description: Learn how to design a reliable monitoring and alerting strategy to ensure that your workload operates reliably and operations teams are aware of changes.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: robstand
ms.date: 03/01/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for designing a reliable monitoring and alerting strategy

**Applies to this Power Well-Architected Reliability checklist recommendation:**

|[RE:10](checklist.md)| Measure and publish the solution's health indicators. Continuously capture uptime and other reliability data from across the workload and also from individual components and key flows.  |
|---|---|

This guide describes the recommendations for designing a reliable monitoring and alerting strategy. Implement this strategy to keep your operations teams informed of your environment's health status and ensure that you meet the established reliability targets for your workload.

**Definitions**

| **Term** | **Definition** |
|---|---|
| **Metrics** | Numerical values that are collected at regular intervals. Metrics describe some aspects of a system at a particular time. |
| **Resource logs** | Data that a system generates. It provides information about the state of the system. |
| **Traces** | Data that provides information about the path that a request travels through services and components. |

## Key design strategies

Before you create a monitoring and alerting strategy, perform the following tasks for your workload as part of your reliability planning:

Identify critical and noncritical flows.

Perform [failure mode analysis (FMA)](/azure/well-architected/reliability/failure-mode-analysis) for your flows.

Identify [reliability targets](/azure/well-architected/reliability/metrics).

Design a robust [testing strategy](/azure/well-architected/reliability/testing-strategy).

Create a monitoring and alerting strategy to provide awareness to your operations teams so they're notified of changes in your workload's condition and can quickly address issues. The health model for your critical flows and workloads that include critical flows should define healthy, degraded, and unhealthy states. Design your monitoring posture to immediately catch changes in these states. When health states change from healthy to degraded or unhealthy, alerting mechanisms trigger should trigger automatic recovery measures, if available, and alerts to the responsible teams. 

Implement the following recommendations to design a monitoring and alerting strategy that meets the requirements of your business.

### General guidance

Understand the difference between [metrics](/azure/azure-monitor/essentials/data-platform-metrics), [logs](/azure/azure-monitor/logs/data-platform-logs), and [traces](/azure/azure-monitor/app/asp-net-trace-logs).

Enable [logging](/azure/azure-monitor/essentials/resource-logs) for all cloud resources. Use automation and governance in your deployments to enable diagnostic logging throughout your environment.

Forward all diagnostic logs to a centralized data sink and analytics platform, like a Log Analytics workspace. If you have regional data sovereignty requirements, you must use local data sinks in the regions that are subject to those requirements.

**Tradeoff**: There are cost implications for storing and querying logs. Notice how your log analysis and retention affects your budget, and determine the best balance of utilization to meet your requirements.

If your workloads are subject to one or more compliance frameworks, some of the component logs that handle sensitive information are also subject to those frameworks. Send the relevant component logs to a security information and event management (SIEM) system, like [Microsoft Sentinel](/azure/sentinel/overview).

Create a [log retention policy](/azure/azure-monitor/logs/data-retention-archive) that incorporates long-term retention requirements that the compliance frameworks impose on your workload.

Use [structured logging](https://stackify.com/what-is-structured-logging-and-why-developers-need-it) for all log messages to optimize querying the log data.

Configure alerts to trigger when values pass critical thresholds that correlate to a health model state change, like green to yellow or red.

Threshold configuration is a practice of continuous improvement. As your workload evolves, the thresholds you define might change. 

Consider using alerts when states improve, such as red to yellow or red to green, so that the operations teams can track these events for future reference.

Visualize the real-time health of your environment by using [custom dashboards](/azure/azure-monitor/visualize/tutorial-logs-dashboards).

Use data that's gathered during incidents to continuously improve your [health models](/azure/well-architected/reliability/metrics) and your monitoring and alerting strategy.

Incorporate cloud platform monitoring and alerting services, including platform-level health, like [How do I check my online service health? - Power Platform | Microsoft Learn](/power-platform/admin/check-online-service-health).

Incorporate purpose-built advanced monitoring and analytics that your cloud provider offers, like Azure Monitor [insight tools](/azure/azure-monitor/overview).

Implement backup and recovery monitoring to capture:

The data replication status to ensure that your workload achieves recovery within the target recovery point objective (RPO).

Successful and failed backups and recoveries.

The recovery duration to inform your [disaster recovery planning](/azure/well-architected/reliability/disaster-recovery).

### Monitor applications

Log data while the application runs in the production environment. You need sufficient information to diagnose the cause of issues in the production state.

Log events at service boundaries. Include a correlation ID that flows across service boundaries. If a transaction flows through multiple services and one of them fails, the correlation ID helps you track requests across your application and pinpoint why the transaction failed.

Separate application logging from auditing. Audit records are commonly maintained for compliance or regulatory requirements and must be complete. To avoid dropped transactions, maintain audit logs separate from diagnostic logs.

Use white box monitoring to instrument the application with semantic logs and metrics. Collect application-level metrics and logs, such as memory consumption or request latency, from the application to inform a health model and to detect and predict issues.

Use black box monitoring to measure platform services and the resulting customer experience. Black box monitoring tests externally visible application behavior without knowledge of the internals of the system. This approach is common for measuring customer-centric service-level indicators (SLIs), service-level objectives (SLOs), and service-level agreements (SLAs).

### Monitor data and storage

Monitor the availability metrics of your storage containers. When this metric drops below 100 percent, it indicates failing writes. Transient drops in availability might happen when your cloud provider manages the load. Track the availability trends to determine if there's an issue with your workload.

In some cases, a drop in the availability metrics for a storage container indicates a bottleneck in the compute layer that's associated with the storage container.

There are many metrics to monitor for databases. In the context of reliability, the important metrics to monitor include:

Query duration

Timeouts

Wait times

Memory pressure

Locks

## Power Platform facilitation

[Application Insights](/azure/azure-monitor/app/app-insights-overview) is part of the [Azure Monitor](/azure/azure-monitor/overview) ecosystem and Power Platform integrates with Application Insights: 

You can receive telemetry on diagnostics and performance captured by the [Dataverse platform in Application Insights](/power-platform/admin/overview-integration-application-insights). You can subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.  

You can connect your [canvas apps to Application Insights](/power-apps/maker/canvas-apps/application-insights). You can use these analytics to diagnose issues and understand what users actually do with your apps. You can collect information to help you drive better business decisions and improve the quality of your apps. 

You can configure [Power Automate telemetry](/power-platform/admin/app-insights-cloud-flow) to flow into Application Insights. You can use this to monitor cloud flow executions and create alerts for cloud flow run failures.  

Power Platform resources log activities in the [Microsoft Purview compliance portal](/purview/purview). Most events are available within 24hrs of the activity, so this can’t be used for real-time monitoring. 

[Power Apps](/power-platform/admin/logging-powerapps) 

[Power Automate](/power-platform/admin/logging-power-automate) 

[Power Pages](/power-platform/admin/logging-power-pages) 

[Power Platform connectors](/power-platform/admin/logging-power-pages) 

[Data Loss Prevention](/power-platform/admin/dlp-activity-logging)  

[Power Platform administrative logs](/power-platform/admin/admin-activity-logging) 

[Dataverse auditing](/power-platform/admin/manage-dataverse-auditing) 

Your Power Platform workload may include Azure resources, learn more about monitoring recommendations for Azure resources: [Recommendations for designing and creating a monitoring system - Microsoft Azure Well-Architected Framework | Microsoft Learn](/azure/well-architected/operational-excellence/observability) 

CoE Starter Kit 

## Related Links

[How do I check my online service health? - Power Platform | Microsoft Learn](/power-platform/admin/check-online-service-health)

