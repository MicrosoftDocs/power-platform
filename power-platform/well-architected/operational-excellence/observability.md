---
title: Recommendations for designing and creating a monitoring system
description: Learn how to design and create a monitoring framework that provides a foundation for alerts, validates design choices, and informs design decisions.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing and creating a monitoring system

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:06](checklist.md)| **Design and implement a monitoring system to validate design choices and inform future design and business decisions. This system captures and exposes operational telemetry, metrics, and logs that are emitted from the workload.** |
|---|---|

This guide describes the recommendations for designing and creating a monitoring system. To effectively monitor your workload for security, performance, and reliability, you need a comprehensive system with its own stack that provides the foundation for all monitoring, detection, and alerting functions.

## Definitions

| Term | Definition |
|---|---|
| Logs | Recorded system events. Logs can contain different types of data in a structured or free-form text format. They contain a timestamp. |
| Metrics | Numerical values that are collected at regular intervals. Metrics describe some aspects of a system at a particular time. |

## Key design strategies

To implement a comprehensive monitoring system design for your workload, follow these core tenets:

- Whenever practical, take advantage of platform-provided monitoring tools, which typically require little configuration and can provide deep insights into your workload that might otherwise be difficult to obtain.

- Collect logs and metrics from the entire workload stack. All low-code and code-first components and resources should be configured to produce standardized, meaningful data, and that data needs to be collected.

- Store the collected data in a standardized, reliable, and secure storage solution.

- Process stored data so that it can be handled by analysis and visualization solutions.

- Analyze processed data to accurately determine the state of the workload.

- Visualize the state of the workload in meaningful dashboards or reports for workload teams and other stakeholders.

- Configure actionable alerts and other automatic responses to intelligently defined thresholds to notify workload teams when issues arise.

- Include monitoring and alerting systems in your overall workload testing practices.

- Ensure that monitoring and alerting systems are in scope for continuous improvement. Application and configuration behavior in production provides continuous learning opportunities. Incorporate those lessons into monitoring and alerting designs.

- Tie the monitoring data that you gather and analyze back to your [system and user flows](../reliability/identify-flows.md) to correlate the health of the flows with the data as well as the overall health of the workload. Analyzing that data in terms of the flows helps align your observability strategy with your [health model](../reliability/metrics.md).

- Minimize the storage of any identifiable information to ensure that you comply with laws and regulations. If you need to store identifiable information, be sure that when you design your solution, you take into account requirements that allow individuals to request that their information be deleted.

- Never record user passwords or other information that might be used to commit identity fraud. Scrub these details from the data before it's stored. Regulatory requirements might dictate that information collected for auditing and security needs to be archived and saved. This data is also sensitive and might need to be encrypted or otherwise protected to prevent tampering.

You should automate all functions of the monitoring system as much as possible, and they should all run continuously, all day, every day.

This workflow pipeline illustrates the monitoring system:

:::image type="content" source="media/observability/image1.png" alt-text="Diagram that shows the stages of a comprehensive monitoring system as a pipeline." lightbox="media/observability/image1.png" border="false":::

### Collection

You should configure all workload components, whether they're low-code or code-first components or platform settings such as environments and policies, to capture telemetry and events like logs and metrics.

Logs are primarily useful for detecting and investigating anomalies. Typically, logs are produced by the workload component and then sent to the monitoring platform or pulled by the monitoring platform with automation.

Metrics are primarily useful for [building a health model](../reliability/metrics.md) and identifying trends in workload performance and reliability. Metrics are also useful for identifying trends in the usage behavior of your users. These trends can help guide decisions about improvements from the customer perspective. Typically, metrics are defined in the monitoring platform, and the monitoring platform and other tools poll the workload to capture metrics.

#### Workload data

Use the out-of-the-box [integration with Application Insights](/power-platform/admin/overview-integration-application-insights?source=recommendations) to collect data. After Application Insights is enabled, you can get clear visibility into important events, both in real time and historically.

Application logs support the end-to-end application life cycle. Logging is essential to understanding how the application operates in various environments, which events occur, and the conditions under which they occur.

We recommend that you collect application logs and events across all major environments. Separate the data between environments as much as possible by using different data stores for each environment, if doing so is practical. Use filters to ensure that noncritical environments don't complicate the interpretation of production logs. Finally, corresponding log entries across the application should capture a correlation ID for their respective transactions.

#### Infrastructure and configuration data

For infrastructure resources in your workload, ensure that you collect both logs and metrics. Because Power Platform is a platform as a service (PaaS) offering, you might be limited in your ability to capture logs related to underlying infrastructure. You can, however, capture logs and analytics on configuration and policy changes related to workload health and incidents.

As much as possible, collect logs from your cloud platform. You might be able to collect activity logs for your subscription and diagnostic logs for the management plane.

#### Performance considerations

A complex and highly scalable application might generate huge volumes of data. The amount of data can cause performance issues depending on how verbose the tracing is at the application level. The telemetry solution must not act as a bottleneck and must be scalable as the system expands.

### Analysis

After you collect data from various sources, analyze it to assess the overall well-being of the system. For this analysis, have a clear understanding of:

- How to structure data based on key performance indicators (KPIs) and other performance metrics that you defined.
- How to correlate the data captured in different metrics and log files. This correlation is important when you're tracking a sequence of events and can help you diagnose problems.

In most cases, your workload will have different components and logs or events will be captured in different formats or tables. You'll need to accurately combine the data to build an understanding of the overall health of the workload.

For example, your Power Platform solution might consist of the following components:

- A canvas app that allows users to interact with the data
- A model-driven app that allows administrators to configure settings for the application
- A cloud flow that performs data operations
- A Dataverse instance that stores data associated with the operation
- An Azure function that retrieves data from Azure table storage and is called from the application

The usage data for a single business operation might span all components of the workload. This information needs to be correlated to provide an overall view of the resource and processing usage for the operation.

#### Recommendations for analysis of data

**Correlate application-level and resource-level logs.** Evaluate data at both levels to optimize detecting and troubleshooting issues.

**Define clear retention times on storage for cold analysis.** We recommend this practice to enable historic analysis over a specific period. It can also help you control storage costs. Implement processes that ensure data is archived to cheaper storage and aggregate data for long-term trend analysis.

**Analyze long-term trends to predict operational issues.** Evaluate long-term data to form operational strategies and also to predict what operational issues are likely to occur, and when. For example, you might note that average response times are slowly increasing over time and approaching the maximum target.

### Visualization

Visualization in health monitoring is critical for understanding the state of the workload. Visualization can help you quickly identify issues and trends, and can also help you understand the effect of changes you make to the workload.

#### Dashboards

The most common way to visualize data is to use dashboards that can display information in the form of charts or graphs. These items can be parameterized, and an analyst can select the important parameters, like the time period, for any specific situation.

Align your dashboards with your health model so that they indicate when the workload or components of the workload are healthy, degraded, or unhealthy.

For a dashboard system to work effectively, it must be meaningful to the workload team. Visualize information that relates to workload health and that's also actionable. When the workload or a component is degraded or unhealthy, members of the workload team should be able to easily identify where in the workload the issue originates and begin their corrective actions or investigations. Conversely, including information that isn't actionable or that's not related to workload health can make the dashboard needlessly complex and frustrating to team members who are trying to discern background noise from actionable data.

You might have dashboards for stakeholders or developers that are customized to only show data about the workload that they find relevant. Ensure that the workload team understands the types of data points that other teams are interested in seeing, and previews the dashboards before sharing them to check for clarity. Providing dashboards about your workload for stakeholders is a good way to keep them apprised of the workload health, but carries a risk of being counterproductive if the stakeholders don't clearly understand the data.

Restrict dashboard access to authorized personnel. Information on dashboards might be sensitive. You should also protect the underlying data to prevent users from changing it.

#### Reporting

Reporting is used to generate an overall view of the system. It might incorporate historical data and current information. Reporting requirements fall into two broad categories: operational reporting and security reporting.

Operational reporting typically includes:

- Aggregating statistics that you can use to understand resource utilization of the overall system or specified subsystems during a specified time window.
- Identifying trends in resource usage for the overall system or specified subsystems during a specified period.
- Monitoring exceptions that have occurred throughout the system or in specified subsystems during a specified period.
- Determining the efficiency of the application for the deployed resources, and understanding whether the volume of resources and their associated costs can be reduced without affecting performance unnecessarily.

Security reporting tracks customer use of the system. It can include:

- Auditing user operations. This task requires recording the individual requests that each user completes, together with dates and times. The data should be structured to enable an administrator to quickly reconstruct the sequence of operations that a user completes during a specified period.
- Tracking resource use by user. This task requires recording how each request from a user accesses the various resources in the system, and for how long. An administrator can use this data to generate a utilization report, by user, for a specified period, possibly for billing.

### Alerts

To help ensure that the system remains healthy, responsive, and secure, set alerts so that operators can respond to them in a timely manner. An alert can contain enough contextual information to help them quickly get started on diagnostic activities.

#### Recommendations for alerting

- Define a process for alert response that identifies the accountable owners and actions.
- Configure alerts for a well-defined scope and adjust the verbosity to minimize noise.
- Use an automated alerting solution, like Splunk or Azure Monitor, instead of requiring people to actively look for issues.
- Use alerts to operationalize remediation processes. For example, automatically create tickets to track issues and resolutions.

#### Thresholds

Alerts are generated when thresholds are crossed, as detected by your monitoring system. Ensure that the thresholds you set generally give you enough time to implement the necessary changes to your workload to avoid degradation or outages. You should also implement necessary error handling and catch known errors in your workload to reduce the number of alerts. For example, configure retry policies for your actions in cloud flows so that a retry is attempted as part of the flow run, and only if repeated retries fail and flow failure is recorded and an alert is sent. Learn more in [Recommendations for designing a reliable monitoring and alerting strategy](../reliability/monitoring-alerting-strategy.md).

## Example

[Distributed tracing across multiple services in Power Platform](/power-platform/architecture/key-concepts/distributed-tracing) provides an example scenario and visual representation of how to trace events across multiple services. This guidance provides practical applications and use cases for distributed tracing and explains how to implement it across multiple services in Power Platform.

## Power Platform facilitation

Power Platform integrates with [Application Insights](/azure/azure-monitor/app/app-insights-overview), which is part of the [Azure Monitor](/azure/azure-monitor/overview) ecosystem. Use this integration to:

- Receive telemetry on diagnostics and performance captured by the [Dataverse platform in Application Insights](/power-platform/admin/overview-integration-application-insights). You can subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.

- [Connect your canvas apps to Application Insights](/power-apps/maker/canvas-apps/application-insights). You can use these analytics to diagnose issues and understand what users do with your apps. You can collect information to help you drive better business decisions and improve the quality of your apps.

- [Configure Power Automate telemetry](/power-platform/admin/app-insights-cloud-flow) to flow into Application Insights. For example, you can monitor cloud flow executions and create alerts for cloud-flow run failures.

- Capture telemetry data from your [Microsoft Copilot Studio agent](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry) for use in Azure Application Insights. You can use this telemetry to monitor logged messages and events sent to and from your agent, topics to be triggered during user conversations, and custom telemetry events that can be sent from your topics.

Power Platform resources log activities in the [Microsoft Purview compliance portal](/purview/purview). Most events are available within 24 hours of the activity. Don't use this information for real-time monitoring. For more information about logging activities in Power Platform, see:

- [Power Apps](/power-platform/admin/logging-powerapps)
- [Power Automate](/power-platform/admin/logging-power-automate)
- [Copilot Studio](/microsoft-copilot-studio/admin-logging-copilot-studio)
- [Power Pages](/power-platform/admin/logging-power-pages)
- [Power Platform connectors](/power-platform/admin/connector-events-power-platform)
- [Data Policy activity logging](/power-platform/admin/dlp-activity-logging)
- [Power Platform administrative logs](/power-platform/admin/admin-activity-logging)
- [Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)

Your Power Platform workload might include Azure resources. Learn more in [Recommendations for designing and creating a monitoring system](/azure/well-architected/operational-excellence/observability).

The [Power Platform CoE Starter Kit](/power-platform/guidance/coe/starter-kit) is a reference implementation containing a collection of components and tools designed to help you get started with developing a strategy for adopting and supporting Power Platform. Included with the CoE Starter Kit is a rich set of dashboards. Learn more in [Gain deep insights into your Microsoft Power Platform adoption with the CoE Power BI dashboard](/power-platform/guidance/coe/power-bi).

The [Power Platform Automation Kit](/power-automate/guidance/automation-kit/overview/introduction) is set of tools that accelerates the use and support of Power Automate for desktop for automation projects. The kit provides tools that help you manage automation projects and monitor them to estimate money saved and return on investment (ROI). Part of the Automation Kit is the [control center](/power-automate/guidance/automation-kit/control-center-overview), which complements the Monitor desktop flow runs feature. The key focus of the control center is an orchestrator view for support analysts and organizations to monitor, take action, and alert when necessary.

The [Agent Inventory feature](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/blob/main/AGENT_INVENTORY.md) of the [Copilot Studio Kit](https://github.com/microsoft/Power-CAT-Copilot-Studio-Kit/blob/main/README.md) provides administrators with a tenant-wide view to all Copilot Studio custom agents in their organization, including detailed information on the features they are using, authentication mode, knowledge sources, orchestration type and more.

## Related information

- [Recommendations for designing a reliable monitoring and alerting strategy](../reliability/monitoring-alerting-strategy.md)
- [Recommendations for monitoring and threat detection](../security/monitor-threats.md)
- [Dataverse auditing](/power-platform/architecture/key-concepts/dataverse-auditing)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
