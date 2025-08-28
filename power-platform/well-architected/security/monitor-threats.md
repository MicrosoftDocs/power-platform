---
title: Monitor and threat detection recommendation for Power Platform workloads
description: Learn how to implement a monitoring strategy that helps you gain awareness of suspicious activities. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/18/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for monitoring and threat detection

**Applies to this Power Platform Well-Architected Security checklist recommendation:**

|[SE:08](checklist.md)| **Implement a holistic monitoring strategy that relies on modern threat detection mechanisms that can be integrated with the platform. Mechanisms should reliably alert for triage and send signals into existing SecOps processes.** |
|---|---|

This guide describes the recommendations for monitoring and threat detection. Monitoring is fundamentally a process of **getting information about events that have already occurred**. Security monitoring is a practice of capturing information at different altitudes of the workload (identity, flows, application, operations) to **gain awareness of suspicious activities**. The goal is to predict incidents and learn from past events. Monitoring data provides the basis of post-incident analysis of what occurred to help incident response and forensic investigations.

Monitoring is an Operational Excellence approach that's applied across all Power Platform Well-Architected pillars. This guide provides recommendations only from a security perspective. General concepts of monitoring are covered in [Recommendations for designing and creating a monitoring system](../operational-excellence/observability.md).

**Definitions**

| Term | Definition |
|---|---|
| Audit logs | A record of activities in a system. |
| Security information and event management (SIEM) | An approach that uses built-in threat detection and intelligence capabilities based on data that's aggregated from multiple sources. |
| Threat detection | A strategy for detecting deviations from expected actions by using collected, analyzed, and correlated data. |
| Threat intelligence | A strategy for interpreting threat detection data to detect suspicious activity or threats by examining patterns. |
| Threat prevention | Security controls that are placed in a workload at various altitudes to protect its assets. |

## Key design strategies

The main purpose of security monitoring is **threat detection**. The primary objective is to prevent potential security breaches and maintain a secure environment. However, it's equally important to recognize that not all threats can be preemptively blocked. In such instances, monitoring also serves as a mechanism to identify the cause of a security incident that has occurred despite the prevention efforts.

Monitoring can be approached from various perspectives:

- **Monitor at various altitudes.** Observing from **various altitudes** is the process of getting information about user flows, data access, identity, networking, and even the operating system. Each of these areas offers unique insights that can help you identify deviations from expected behaviors that are established against the security baseline. Conversely, continuously monitoring a system and applications over time can **help establish that baseline posture**. For example, you might typically see around 1,000 sign-in attempts in your identity system every hour. If your monitoring detects a spike of 50,000 sign-in attempts during a short period, an attacker might be trying to gain access to your system.

- **Monitor at various scopes of impact.** It's critical to **observe the application and the platform**. Assume an application user accidentally gets escalated privileges or a security breach occurs. If the user performs actions beyond their designated scope, the impact might be confined to actions that other users can perform.

    However, if an internal entity compromises a database, the extent of the potential damage is uncertain.

    The blast radius or impact scope could be significantly different, depending on which of these scenarios occurs.

- **Use specialized monitoring tools.** It's critical to invest in **specialized tools** that can continuously scan for anomalous behavior that might indicate an attack. Most of these tools have **threat intelligence capabilities** that can perform predictive analysis based on a large volume of data and known threats. Most tools aren't stateless and incorporate a deep understanding of telemetry in a security context.

    The tools need to be platform-integrated or at least platform-aware to get deep signals from the platform and make predictions with high fidelity. They must be able to generate alerts in a timely manner with enough information to conduct proper triage. Using too many diverse tools can lead to complexity.

- **Use monitoring for incident response.** Aggregated data, transformed into actionable intelligence, **enables swift and effective reactions** to incidents. Monitoring **helps with post-incident activities**. The goal is to collect enough data to analyze and understand what happened. The process of monitoring captures information on past events to enhance reactive capabilities and potentially predict future incidents.

The following sections provide recommended practices that incorporate the preceding monitoring perspectives.

### Capture data to keep a trail of activities

The objective is to maintain a **comprehensive audit trail** of events that are significant from a security perspective. Logging is the most common way to capture access patterns. Logging must be performed for the application and the platform.

For an audit trail, you need to **establish the *what*, *when*, and *who*** that's associated with actions You need to identify the specific timeframes when actions are performed. Make this assessment in your threat modeling. To counteract a repudiation threat, you should establish strong logging and auditing systems that result in a record of activities and transactions.

The following sections describe use cases for some common altitudes of a workload.

#### Workload user flows

Your workload should be designed to provide runtime visibility when events occur. **Identify critical points within your workload and establish logging for these points.** It's important to acknowledge any escalation in user privileges, the actions performed by the user, and whether the user accessed sensitive information in a secure data store. Keep track of activities for the user and the user session.

To facilitate this tracking, code should be **instrumented via structured logging**. Doing so enables easy and uniform querying and filtering of the logs.

>[!IMPORTANT]
> You need to enforce responsible logging to maintain the confidentiality and integrity of your system. Secrets and sensitive data must not appear in logs. Be aware of leaking personal data and other compliance requirements when you capture this log data.

#### Identity and access monitoring

Maintain a thorough **record of access patterns for the application and modifications to platform resources**. Have robust activity logs and threat detection mechanisms, particularly for identity-related activities, because attackers often attempt to manipulate identities to gain unauthorized access.

Implement comprehensive logging by **using all available data points**. For example, include the client IP address to differentiate between regular user activity and potential threats from unexpected locations. All logging events should be timestamped by the server.

**Record all resource access activities**, capturing who's doing what and when they're doing it. Instances of privilege escalation are a significant data point that should be logged. Actions related to account creation or deletion by the application must also be recorded. This recommendation extends to application secrets. Monitor who accesses secrets and when they're rotated.

Although logging successful actions is important, **recording failures is necessary from a security perspective**. Document any violations, like a user attempting an action but encountering an authorization failure, access attempts for nonexistent resources, and other actions that seem suspicious.

#### Network monitoring

Your segmentation design should **enable observation points at the boundaries** to monitor what crosses them and log that data. For example, monitor subnets that have network security groups that generate flow logs. Also monitor firewall logs that show the flows that were allowed or denied.

There are access logs for inbound connection requests. These logs record the source IP addresses that initiate the requests, the type of request (GET, POST), and all other information that's part of the requests.

Capturing DNS flows is a significant requirement for many organizations. For instance, **DNS logs can help identify which user or device initiated a particular DNS query**. By correlating DNS activity with user/device authentication logs, you can track activities to individual clients. This responsibility often extends to the workload team, especially if they deploy anything that makes DNS requests part of their operation. DNS traffic analysis is a key aspect of platform security observability.

It's important to monitor unexpected DNS requests or DNS requests that are directed toward known command and control endpoints.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: **Logging all network activities can result in a large amount of data.** Unfortunately, it's not possible to capture only adverse events because they can only be identified after they occur. Make strategic decisions about the type of events to capture and how long to store them. If you're not careful, managing the data can be overwhelming. There's also a tradeoff on the cost of storing that data.

### Capture system changes

To maintain the integrity of your system, you should have an accurate and up-to-date record of system state. If there are changes, you can use this record to promptly address any issues that arise.

**Build processes should also emit telemetry.** Understanding the security context of events is key. Knowing what triggered the build process, who triggered it, and when it was triggered can provide valuable insights.

Track **when resources are created and when they're decommissioned**. This information must be extracted from the platform. This information provides valuable insights for resource management and accountability.

Monitor **drift in resource configuration**. Document any change to an existing resource. Also keep track of changes that don't complete as part of a rollout to a fleet of resources. Logs must capture the specifics of the change and the exact time it occurred.

Have a comprehensive view, from a patching perspective, of whether the system is up-to-date and secure. **Monitor routine update processes** to verify that they complete as planned. A security patching process that doesn't complete should be considered a vulnerability. You should also maintain an inventory that records the patch levels and any other required details.

**Change detection also applies to the operating system.** This involves tracking whether services are added or turned off. It also includes monitoring for the addition of new users to the system. There are tools that are designed to target an operating system. They help with context-less monitoring in the sense that they don't target the functionality of the workload. For example, file integrity monitoring is a critical tool that enables you to track changes in system files.

You should set up alerts for these changes, particularly if you don't expect them to occur often.

>[!IMPORTANT]
> When you roll out to production, be sure that alerts are configured to catch anomalous activity that's detected on the application resources and build process.

In your test plans, **include the validation of logging and alerting** as prioritized test cases.

### Store, aggregate, and analyze data

Data collected from these monitoring activities must be stored in data sinks where it can be thoroughly **examined, normalized, and correlated**. Security data should be persisted outside the system's own data stores. Monitoring sinks, whether they're localized or central, must outlive the data sources. The **sinks can't be ephemeral** because sinks are the source for intrusion detection systems.

Networking logs can be verbose and take up storage. **Explore different tiers in storage systems**. Logs can naturally transition to colder storage over time. This approach is beneficial because older flow logs typically aren't used actively and are only needed on demand. This method ensures efficient storage management while also ensuring that you can access historical data when you need to.

The flows of your workload are typically a composite of multiple logging sources. Monitoring data must be **analyzed intelligently across all those sources**. For example, your firewall will only block traffic that reaches it. If you have a network security group that has already blocked certain traffic, that traffic isn't visible to the firewall. To reconstruct the sequence of events, you need to aggregate data from all components that are in flow and then aggregate data from all flows. This data is particularly useful in a post-incident response scenario when you're trying to understand what happened. Accurate timekeeping is essential. For security purposes, all systems need to use a network time source so that they're always in sync.

#### Centralized threat detection with correlated logs

You can use a system like security information and event management (SIEM) to **consolidate security data in a central location** where it can be correlated across various services. These systems have **built-in threat detection** mechanisms. They can **connect to external feeds** to obtain threat intelligence data. Microsoft, for example, publishes threat intelligence data that you can use. You can also buy threat intelligence feeds from other providers, like Anomali and FireEye. These feeds can provide valuable insights and enhance your security posture. For threat insights from Microsoft, see [Security Insider](https://www.microsoft.com/security/business/security-insider/).

A SIEM system can **generate alerts** based on correlated and normalized data. These alerts are a significant resource during an incident response process.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: SIEM systems can be expensive, complex, and require specialized skills. However, if you don't have one, you might need to correlate data on your own. This can be a time-consuming and complex process.

SIEM systems are usually managed by an organization's central teams. If your organization doesn't have one, consider advocating for it. It could alleviate the burden of manual log analysis and correlation to allow more efficient and effective security management.

Some cost-effective options are provided by Microsoft. Many Microsoft Defender products provide the alerting functionality of a SIEM system, but without a data-aggregation feature.

By combining several smaller tools, you can emulate some functions of a SIEM system. However, you need to know that these makeshift solutions might not be able to perform correlation analysis. These alternatives can be useful, but they might not fully replace the functionality of a dedicated SIEM system.

### Detect abuse

**Be proactive about threat detection** and be vigilant for signs of abuse, like identity brute force attacks on an SSH component or an RDP endpoint. Although external threats might generate a lot of noise, especially if the application is exposed to the internet, **internal threats are often a greater concern**. An unexpected brute force attack from a trusted network source or an inadvertent misconfiguration, for instance, should be investigated immediately.

**Keep up with your hardening practices.** Monitoring isn't a substitute for proactively hardening your environment. A larger surface area is prone to more attacks. Tighten controls as much as practice. Detect and disable unused accounts, use an IP firewall, and block endpoints that aren't required with data policies, for example.

**Signature-based detection** can inspect a system in detail. It involves looking for signs or correlations between activities that might indicate a potential attack. A detection mechanism might identify certain characteristics that are indicative of a specific type of attack. It might not always be possible to directly detect the command-and-control mechanism of an attack. However, there are often hints or patterns associated with a particular command-and-control process. For example, an attack might be indicated by a certain flow rate from a request perspective, or it might frequently access domains that have specific endings.

Detect **anomalous user access patterns** so that you can identify and investigate deviations from expected patterns. This involves comparing current user behavior with past behavior to spot anomalies. Although it might not be feasible to perform this task manually, you can use threat intelligence tools to do it. Invest in **User and Entity Behavior Analytics (UEBA) tools** that collect user behavior from monitoring data and analyze it. These tools can often perform predictive analysis that maps suspicious behaviors to potential types of attack.

**Detect threats during pre-deployment and post-deployment stages.** During the pre-deployment phase, incorporate vulnerability scanning into pipelines and take necessary actions based on the results. Post-deployment, continue to conduct vulnerability scanning. You can use tools like Microsoft Defender for Containers, which scans container images. Include the results in the collected data. For information about secure development practices, see [Recommendations for safe deployment practices](../operational-excellence/safe-deployments.md).

## Example

[Distributed tracing across multiple services in Power Platform](/power-platform/architecture/key-concepts/distributed-tracing) provides an example scenario and visual representation of how to trace events across multiple services. This guidance provides practical applications and use cases for distributed tracing and explains how to implement it across multiple services in Power Platform.

## Power Platform facilitation

The following sections describe the mechanisms you can use to monitor and detect threats in Power Platform.

### Microsoft Sentinel

Microsoft Sentinel solution for Microsoft Power Platform allows customers to detect various suspicious activities, including:

- Power Apps execution from unauthorized geographies
- Suspicious data destruction by Power Apps
- Mass deletion of Power Apps
- Phishing attacks made through Power Apps
- Power Automate flows activity by departing employees
- Microsoft Power Platform connectors added to an environment
- Update or removal of Microsoft Power Platform data policies

For more information, see [Microsoft Sentinel solution for Microsoft Power Platform overview](/azure/sentinel/business-applications/power-platform-solution-overview).

### Microsoft Purview Activity Logging

Power Apps, Power Automate, Connectors, Data Loss Prevention, and Power Platform administrative activity logging are tracked and viewed from the Microsoft Purview compliance portal.

For more information, see:

- [Power Apps activity logging](/power-platform/admin/logging-powerapps)
- [Power Automate activity logging](/power-platform/admin/logging-power-automate)
- [Copilot Studio activity logging](/microsoft-copilot-studio/admin-logging-copilot-studio)
- [Power Pages activity logging](/power-platform/admin/logging-power-pages)
- [Power Platform connector activity logging](/power-platform/admin/connector-events-power-platform)
- [Data policy activity logging](/power-platform/admin/dlp-activity-logging)
- [Power Platform administrative actions activity logging](/power-platform/admin/admin-activity-logging)
- [Microsoft Dataverse and model-driven apps activity logging](/power-platform/admin/enable-use-comprehensive-auditing)

### Dataverse auditing

Database auditing logs changes made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment. This auditing is enabled at the environment level, and additional configuration is required for individual tables and columns. For more information, see [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing).

### Analyze telemetry with Application Insights

Application Insights, a feature of Azure Monitor, is widely used within the enterprise landscape for monitoring and diagnostics. Data that has already been collected from a specific tenant or environment is pushed to your own Application Insights environment. The data is stored in Azure Monitor logs by Application Insights, and visualized in Performance and Failures panels under Investigate on the left pane. The data is exported to your Application Insights environment in the standard schema defined by Application Insights. The support, developer, and admin personas can use this feature to triage and resolve issues.

You might also:

- Set up an Application Insights environment to receive telemetry on diagnostics and performance captured by the Dataverse platform.
- Subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.
- Set up Power Automate cloud flows to integrate with Application Insights.
- Write events and activity from Power Apps canvas apps to Application Insights.

For more information, see [Overview of integration with Application Insights](/power-platform/admin/overview-integration-application-insights).

### Identity

Monitor identity-related risk events on potentially compromised identities and remediate those risks. Review the reported risk events in these ways:

- Use Microsoft Entra ID reporting. For more information, see [What is Identity Protection?](/azure/active-directory/reports-monitoring/concept-user-at-risk) and [Identity Protection](/azure/active-directory/active-directory-identityprotection).

- Use Identity Protection risk detection API members to get programmatic access to security detections via Microsoft Graph. For more information, see [riskDetection](/graph/api/resources/riskdetection) and [riskyUser](/graph/api/resources/riskyuser).

Microsoft Entra ID uses adaptive machine learning algorithms, heuristics, and known compromised credentials (user name and password pairs) to detect suspicious actions that are related to your user accounts. These user name and password pairs are surfaced by monitoring the public and dark web and by working with security researchers, law enforcement, security teams at Microsoft, and others.

### Azure pipelines

DevOps advocates change management of workloads via continuous integration and continuous delivery (CI/CD). Be sure to add security validation in the pipelines. Follow the guidance described in [Securing Azure Pipelines](/azure/devops/pipelines/security/overview).

## Related information

- [Detect threats to your organization](/power-platform/guidance/adoption/threat-detection)
- [What is Microsoft Sentinel?](/azure/sentinel/overview)
- [Threat intelligence integration in Microsoft Sentinel](/azure/sentinel/threat-intelligence-integration)
- [Identify advanced threats with User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel](/azure/sentinel/identify-threats-with-entity-behavior-analytics)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
