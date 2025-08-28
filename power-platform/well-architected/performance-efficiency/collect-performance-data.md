---
title: Collect workload performance data recommendation for Power Platform workloads
description: Learn how to collect performance data to help you assess the performance of a Power Platform workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for collecting performance data

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:04](checklist.md)|**Collect performance data. Workload components and flows should provide automatic, continuous, and meaningful metrics and logs. Collect data at different levels of the workload, such as the application, platform, data, and operating system levels.** |
|---|---|

Collecting performance data is the process of gathering metrics and logs that provide information about the performance of a workload. This data includes numerical values, which are known as _metrics_. Metrics describe the state of the system at a particular point in time. Performance data also includes logs that contain different types of data organized into records.

By collecting performance data, you can monitor and analyze the performance of a workload. You can use this information to identify performance bottlenecks, troubleshoot issues, and to make data-driven decisions to improve the overall performance efficiency of the workload.

Without data-driven insights, you might be unaware of underlying performance issues or opportunities for optimization. Potential results include slower response times, decreased throughput, and ultimately, a suboptimal user experience. Additionally, the lack of performance data makes it difficult to diagnose and troubleshoot issues in a timely manner, leading to prolonged downtime and reduced productivity.

**Definitions**

| Term | Definition |
|---|---|
| Activity logs | Logs that track management operations on resources, such as deleting a resource. |
| Application logs | Logs that track information about application events, errors, and other activities, such as sign-ins and database connection failures. |
| Application performance monitoring (APM) tool | A tool that monitors and reports the performance of an application. |
| Code instrumentation | The direct or indirect capture of performance metrics from the perspective of the application code. Captured metrics include flow metrics, resource use, and metrics specific to the language or runtime. |
| Distributed tracing | Gathering and correlating metrics across distributed workload components. |
| Metrics sink | A storage destination for your metrics that correlates time series data for analysis. |
| Platform logs | Diagnostic and auditing data that includes resource logs, activity logs, and audit logs. |
| Platform metrics | Numerical values that record workload performance at a particular time. |
| Resource logs | Data that a system generates. It provides information about the state of the system. |
| Structured logging | Defining a meaningful format to log messages, typically as key-value pairs. |

## Key design strategies

Performance optimization requires data to measure the current performance of a workload or a flow against its performance targets. You need to collect the right amount and diversity of data to measure the performance of the code and the infrastructure against [performance targets](performance-targets.md). Ensure that every component and flow within the workload automatically generates continuous and meaningful metrics and logs. You need to source this data from diverse levels like the application, platform, storage, and operating system. Comprehensive performance data collection allows for a holistic understanding of performance, enabling precise identification of inefficiencies and avenues for improvement.

### Centralize performance data

Centralizing performance metrics and logs is the process of collecting performance metrics and logs from various sources and storing them in a central location. Create a central metrics sink and a central log sink. This centralization allows for easy access, analysis, and monitoring of performance metrics and logs across different systems and components. By centralizing metrics and logs, you gain visibility into the performance of your workload. Choose a suitable platform or tool that can aggregate and store workload performance metrics and logs.

Tradeoff: Understand the cost of collecting metrics and logs. In general, the more metrics and logs you collect, the higher the cost.

### Segment performance data

Segmenting performance data involves organizing and categorizing metrics and logs based on their origin, purpose, or environment. For example, you should separate production data from nonproduction data or distinguish between performance targets and business metrics. Segmenting data helps with optimizing specific environments, facilitates troubleshooting, and limits inaccuracies in performance monitoring. By maintaining a clear distinction between different data types, you can capture, analyze, and respond to relevant metrics more efficiently and better align workload health with workload objectives. To segment performance data, consider the following recommendations:

- _Keep production data and nonproduction data separate_. By separating data by environment, you can ensure focused monitoring and optimization of each environment. In production environments, you can better identify and address performance issues that directly affect users and business operations. In nonproduction environments, data separation facilitates effective troubleshooting and fine-tuning during the testing phase before you deploy to production.

- _Use one set of data within each environment_. Don't use one set of data for performance targets and another set of data for alerts related to the performance targets. Using different sets of data leads to inaccurate alerts that undermine the effectiveness of performance monitoring.

- _Separate performance targets and business metrics_. The operations and development teams use performance targets to monitor workload health and meet business targets. Business metrics relate to business goals or customer reporting. Capture business metrics in a separate data stream, even if the data directly overlaps. This separation gives you flexibility to capture the right data and independently analyze the data.

### Define retention policies

Retention policies dictate how long performance data should be kept. Establishing these policies helps manage storage efficiently and ensures only necessary data is accessible for analysis. Such policies support better performance and meet compliance standards. You should configure retention policies for the log and metrics data to enable effective troubleshooting and monitoring in all environments. For example, the logs and metrics might need to be kept for longer time in a production environment than in the testing environment. The retention period should match your organization's requirements and compliance regulations. Decide how long to retain the data for analysis and audit purposes. Archive the data that you don't need for immediate analysis.

### Collect performance data

Collecting data involves monitoring and analyzing a workload’s performance metrics, such as throughput, latency, and completion times, primarily gathered through instrumenting code. Workload performance data provides valuable insights into the health and performance of an application. By monitoring and analyzing performance data, you can identify and troubleshoot issues, optimize performance, and make informed decisions for your workload.

#### Instrument code

Instrumentation refers to the process of embedding code snippets or actions into your workloads code; for example, creating [custom trace events](/power-apps/maker/canvas-apps/application-insights#create-custom-trace-events) in your canvas app. The purpose of instrumentation is to capture performance data while the workload runs. It's essential to gather metrics that highlight the workload’s critical operations. Focus on metrics like throughput, latency, and completion time. It's important to differentiate business-related operations from other operations. For data related to business operations, make sure its metadata is structured in a way that allows distinct tracking and storage. Code instrumentation provides the following benefits:

- _Identifying performance bottlenecks:_ By tracking metrics such as elapsed time, you can identify bottlenecks and optimize the code accordingly.

- _Evaluating system behavior under a load:_ You can see how the workload performs under different stress scenarios. This data can help you identify issues related to scalability, concurrency, and resource use.

- _Tracking_ _workload_ _health and availability:_ Because key performance indicators are monitored in real time, you can get alerts about potential issues that affect the application's performance and availability.

- _Improve user experience:_ You can gain insights into how users interact with the workload. Use this information to optimize the user experience and identify areas for improvement.

- _Plan capacity and allocate resources:_ The performance data that instrumentation gathers can provide valuable insights into the resource requirements of a workload. This information can inform your decisions about planning capacity and allocating resources.

When you instrument code for performance monitoring, consider the following strategies:

- _Use APM tools_: Application performance monitoring (APM) tools collect and analyze performance data, including metrics, traces, and logs. APM tools offer features like code-level instrumentation, transaction tracing, and performance profiling.

- _Custom instrumentation_: Developers can add custom code to collect performance metrics that are unique to their application and workload. The custom instrumentation can measure runtimes, track resource usage, or capture specific events.

- _Capture transaction times._ Capturing transaction times relates to measuring the end-to-end times for key technical functions as a part of performance monitoring. Application-level metrics should include end-to-end transaction times. These transaction times should cover key technical functions such as database queries, response times for external API calls, and failure rates of processing steps.

- _Use telemetry standards._ Consider using APM tool instrumentation libraries and tools that are built around a telemetry standard, such as OpenTelemetry.

### Collect resource performance data

By collecting resource performance data, you can gain insights into the health and behavior of your workload. Resource performance data provides information about resource use, which is key for capacity planning. This data also provides insights into the health of a workload and can help you detect issues and troubleshoot. Consider the following recommendations:

- _Collect metrics and logs for every resource._ Each service has a set of metrics that's unique to the functionality of the resource. These metrics help you understand the resource's health and performance.

- _Use platform tooling._ Gather inspiration from built-in and integrated monitoring solutions, such as Azure Monitor Insights. This tooling streamlines performance operations. Consider platform tooling as you select a platform and invest in custom tooling or reporting.

- _Monitor network traffic._ Monitoring network traffic means to track and analyze the flow and patterns of data as it moves across network pathways. Collect traffic analytics and monitor the traffic that traverses subnet boundaries. Your goal is to analyze and optimize network performance.

### Collect database and storage data

Many database and storage systems provide their own monitoring tools. These tools collect performance data specific to those systems. Database and storage systems often generate logs that contain performance-related events and indicators. Collect database data and storage performance data so you can identify bottlenecks, diagnose issues, and make informed decisions to improve the overall performance and reliability of your workload. Consider collecting the following types of performance data:

- _Throughput_: Throughput measures the amount of data read from or written to the storage system over a period of time. Throughput data indicates the data transfer capabilities.

- _Latency_: Latency measures how long storage operations last. Latency data indicates the responsiveness of the storage system.

- _IOPS (I/O operations per second)_: Data about the number of read operations or write operations that the storage system can perform in a second. IOPS data indicates the storage system's throughput and responsiveness.

- _Capacity use_: Capacity use is the amount of storage capacity used and the amount that's available. Capacity-use data helps organizations plan for future storage needs.

### Collect connector performance data

Time spent waiting for integrated services operations to complete can contribute to the overall poor performance of a workload. If your workload uses connectors to integrate services, consider measuring the time spent in each connector operation to evaluate its impact and decide whether to optimize your workload design. Depending on the service, you can use run history or custom logic to capture the time spent in connector operations.

### Validate and analyze data

Your performance data should align with the performance targets. The data needs to represent workload or flow performance completely and accurately as it relates to performance targets. For example, the response time for a web service has a performance target of 500 milliseconds. Make it a routine to analyze the data, as frequent evaluations allow for early detection and mitigation of performance issues.

- _Create alerts._ It's beneficial to have alerts that are actionable, enabling prompt identification and rectification of performance problems. These alerts should clearly indicate the breached performance threshold, the potential business effect, and the components involved. Start by setting common and recommended alert. Over time, you can modify these criteria based on your specific needs. The primary objective of these alerts should be to forecast potential performance drops before they escalate into significant issues. If you can't set an alert for an external dependency, consider devising a method to gather indirect measurements, like the duration of a dependency call.

- _Set data collection limits._ Determine and set logical limits on the volume of data you collect and its retention duration. Telemetry can sometimes produce overwhelming amounts of data. It's essential to focus on capturing only the most vital performance indicators or have an efficient system in place to extract meaningful insights from your performance data.

## **Power Platform facilitation**

**View performance data in the Power Platform admin center**: Use the [Monitor](/power-platform/admin/monitoring/monitoring-overview) area of the Power Platform admin center to measure and improve operational health metrics of apps and flows. The Monitor experience is available to both makers and admins. Makers use the data to improve their resources. Admins use it to understand aggregate operational health in the tenant or in specific environments. The purpose of the Monitor area of the Power Platform admin center is to bring attention to resources that have degraded operational health and highlight resources that have opportunities for improvement.

**Collecting application performance data**: [Application Insights](/power-platform/admin/overview-integration-application-insights?source=recommendations) is a feature of Azure Monitor that helps you monitor the performance and availability of your application. The data is stored in Azure Monitor logs by Application Insights, and visualized in [Performance and Failures](/azure/azure-monitor/app/failures-and-performance-views?tabs=failures-view) panels. The data is exported to your Application Insights environment in the standard schema defined by Application Insights. You can export [Dataverse and Power Automate data](/power-platform/admin/set-up-export-application-insights) to Application Insights, [connect your canvas apps](/power-apps/maker/canvas-apps/application-insights) to Application Insights, and capture telemetry data from your [Microsoft Copilot Studio agent](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry) for use in Azure Application Insights. 

Application Insights allows you to choose [**Server** and **Browser** data views](/power-platform/admin/overview-integration-application-insights#performance-panel-in-application-insights). By identifying those operations with the longest duration, you can diagnose potential problems.

**Use native platform features to analyze performance:** [Analytics in Copilot Studio](/microsoft-copilot-studio/analytics-summary) provides a comprehensive overview of your agent's performance. It uses artificial intelligence (AI) technology to identify which topics are having the greatest impact on escalation rate, abandon rate, and resolution rate. [Performance insights for Power Apps](/power-apps/maker/common/performance-insights-overview) analyze runtime user data and provide a prioritized list of recommendations to help improve the performance of model-driven apps.

**Centralizing, segmenting, and retaining performance data:** Microsoft already gathers extensive telemetry on Dataverse, Power Automate cloud flows, and model-driven apps. With [**Application Insights integration**](/power-platform/admin/analyze-telemetry), an environment or tenant admin provides the Application Insights instrumentation key while setting up the data export process in the Power Platform admin center. As soon as setup is complete, telemetry that Microsoft gathers about your environment are sent to your Application Insights environment. When you use Application Insights integration, you'll receive a standardized set of telemetry that follows the Application Insights [telemetry data model](/azure/azure-monitor/app/data-model). In addition to this integration, you can also [connect canvas apps to Application Insights](/power-apps/maker/canvas-apps/application-insights) and capture telemetry data from your [Microsoft Copilot Studio agent](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry) for use in Azure Application Insights.

**Collecting Azure resource performance data:** Most Azure services generate platform logs and metrics that provide diagnostic and auditing information. By enabling diagnostic settings, you can specify the platform logs and metrics to collect and store.For correlation purposes, enable diagnostics for all supported services and send the logs to the same destination as your application logs.

**Collecting database performance data:** [Microsoft Dataverse integrates with Application Insights](/power-platform/admin/telemetry-events-dataverse). The data stream currently provides performance data related to Dataverse API incoming calls, Dataverse plug-in execution calls, and Dataverse SDK calls. To be notified of issues, set up alerts based on performance thresholds.

**Validating and analyzing performance data:** Within Azure Monitor, you can use Azure Monitor Logs to collect, analyze, and visualize log data from your applications and systems. By aggregating logs, you can cross-query events and gain insights into the performance of your application. For more information, see [Azure Monitor Logs cost calculations and options](/azure/azure-monitor/logs/cost-logs)** and [Pricing for Azure Monitor](https://azure.microsoft.com/pricing/details/monitor/).

In Azure Monitor, you can define alert rules to monitor specific performance metrics and trigger alerts based on predefined conditions. For example, you can create an alert rule to notify you when response time goes above a specified limit. Configure the alert rule to send notifications to the desired recipients.

When you create an alert rule, you can define the criteria that determine when an alert should be triggered. You can set thresholds, aggregation methods, time windows, and the frequency of evaluation. Define the criteria based on your performance monitoring requirements. In addition to sending notifications, you can specify actions to be taken when an alert is triggered. Actions can include sending emails, calling webhooks, or running Azure functions. Choose the appropriate actions to respond to the specific alert scenario.

## Examples

- [Enterprise monitoring with Azure Monitor](/azure/architecture/example-scenario/monitoring/enterprise-monitoring)
- [Create custom trace events in canvas apps](/power-apps/maker/canvas-apps/application-insights#create-custom-trace-events)
- [Create custom alerts for cloud flows](/power-platform/admin/app-insights-cloud-flow#create-a-custom-alert)
- [Analyze agent performance and usage in Copilot Studio](/microsoft-copilot-studio/analytics-summary)

## Related information

- [Manage solution performance](/power-platform/architecture/key-concepts/performance/)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
