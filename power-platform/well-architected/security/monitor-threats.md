---
title: Recommendations for monitoring and threat detection
description: Learn how to get information about events, capture information about the workload, and gain awareness of suspicious activities. 
author: RobStand
ms.author: mapichle
ms.reviewer: sericks
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for monitoring and threat detection

**Applies to this Power Well-Architected Security checklist recommendation:**

|[SE:10](checklist.md)|Implement a holistic monitoring strategy that relies on modern threat detection mechanisms that can be integrated with the platform. Mechanisms should reliably alert for triage and send signals into existing SecOps processes.|
|---|---|

This guide describes the recommendations for monitoring and threat detection. Monitoring is fundamentally a process of **getting information about events that have already occurred**. Security monitoring is a practice of capturing information at different altitudes of the workload (identity, flows, application, operations) to **gain awareness of suspicious activities**. The goal is to predict incidents and learn from past events. Monitoring data provides the basis of post-incident analysis of what occurred to help incident response and forensic investigations.

Monitoring is an Operational Excellence approach that's applied across all Power Well-Architected Framework pillars. This guide provides recommendations only from a security perspective. General concepts of monitoring will be covered in [link to operational excellence monitoring article].

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

**Monitor at various altitudes.** Observing from **various altitudes** is the process of getting information about user flows, data access, identity, networking, and even the operating system. Each of these areas offers unique insights that can help you identify deviations from expected behaviors that are established against the security baseline. Conversely, continuously monitoring a system and applications over time can **help establish that baseline posture**. For example, you might typically see around 1,000 sign-in attempts in your identity system every hour. If your monitoring detects a spike of 50,000 sign-in attempts during a short period, an attacker might be trying to gain access to your system.

**Monitor at various scopes of impact.** It's critical to **observe the application and the platform**. Assume an application user accidentally gets escalated privileges or a security breach occurs. If the user performs actions beyond their designated scope, the impact might be confined to actions that other users can perform.

However, if an internal entity compromises a database, the extent of the potential damage is uncertain.

The blast radius or impact scope could be significantly different, depending on which of these scenarios occurs.

**Use specialized monitoring tools.** It's critical to invest in **specialized tools** that can continuously scan for anomalous behavior that might indicate an attack. Most of these tools have **threat intelligence capabilities** that can perform predictive analysis based on a large volume of data and known threats. Most tools aren't stateless and incorporate a deep understanding of telemetry in a security context.

The tools need to be platform-integrated or at least platform-aware to get deep signals from the platform and make predictions with high fidelity. They must be able to generate alerts in a timely manner with enough information to conduct proper triage. Using too many diverse tools can lead to complexity.

**Use monitoring for incident response.** Aggregated data, transformed into actionable intelligence, **enables swift and effective reactions** to incidents. Monitoring **helps with post-incident activities**. The goal is to collect enough data to analyze and understand what happened. The process of monitoring captures information on past events to enhance reactive capabilities and potentially predict future incidents.

The following sections provide recommended practices that incorporate the preceding monitoring perspectives.

### Capture data to keep a trail of activities

The objective is to maintain a **comprehensive audit trail** of events that are significant from a security perspective. Logging is the most common way to capture access patterns. Logging must be performed for the application and the platform.

For an audit trail, you need to **establish** **the** ***what*****,** ***when*****, and** ***who***** that's associated with actions**. You need to identify the specific timeframes when actions are performed. Make this assessment in your threat modeling. To counteract a repudiation threat, you should establish strong logging and auditing systems that result in a record of activities and transactions.

The following sections describe use cases for some common altitudes of a workload.

##### Workload user flows

Your workload should be designed to provide runtime visibility when events occur. **Identify critical points within your** **workload and establish logging for these points.** It's important to acknowledge any escalation in user privileges, the actions performed by the user, and whether the user accessed sensitive information in a secure data store. Keep track of activities for the user and the user session.

To facilitate this tracking, code should be **instrumented via structured logging**. Doing so enables easy and uniform querying and filtering of the logs.

** Important**

You need to enforce responsible logging to maintain the confidentiality and integrity of your system. Secrets and sensitive data must not appear in logs. Be aware of leaking personal data and other compliance requirements when you capture this log data.

##### Identity and access monitoring

Maintain a thorough **record of access patterns for the application and modifications to platform resources**. Have robust activity logs and threat detection mechanisms, particularly for identity-related activities, because attackers often attempt to manipulate identities to gain unauthorized access.

Implement comprehensive logging by **using all available data points**. For example, include the client IP address to differentiate between regular user activity and potential threats from unexpected locations. All logging events should be timestamped by the server.

**Record all resource access activities**, capturing who's doing what and when they're doing it. Instances of privilege escalation are a significant data point that should be logged. Actions related to account creation or deletion by the application must also be recorded. This recommendation extends to application secrets. Monitor who accesses secrets and when they're rotated.

Although logging successful actions is important, **recording failures is necessary from a security perspective**. Document any violations, like a user attempting an action but encountering an authorization failure, access attempts for nonexistent resources, and other actions that seem suspicious.

##### Network monitoring

By monitoring network packets and their sources, destinations, and structures, you gain visibility into access patterns at the network level.

Your segmentation design should **enable observation points at the boundaries** to monitor what crosses them and log that data. For example, monitor subnets that have network security groups that generate flow logs. Also monitor firewall logs that show the flows that were allowed or denied.

There are access logs for inbound connection requests. These logs record the source IP addresses that initiate the requests, the type of request (GET, POST), and all other information that's part of the requests.

Capturing DNS flows is a significant requirement for many organizations. For instance, **DNS logs can help identify which user or device initiated a particular DNS query**. By correlating DNS activity with user/device authentication logs, you can track activities to individual clients. This responsibility often extends to the workload team, especially if they deploy anything that makes DNS requests part of their operation. DNS traffic analysis is a key aspect of platform security observability.

It's important to monitor unexpected DNS requests or DNS requests that are directed toward known command and control endpoints.

 > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: **Logging all network activities can result in a large amount of data.** Every request from layer 3 can be recorded in a flow log, including every transaction that crosses a subnet boundary. Unfortunately, it's not possible to capture only adverse events because they can only be identified after they occur. Make strategic decisions about the type of events to capture and how long to store them. If you're not careful, managing the data can be overwhelming. There's also a tradeoff on the cost of storing that data.

Because of the tradeoffs, you should consider whether the benefit of network monitoring of your workload is sufficient to justify the costs. If you have a web application solution with a high request volume and your system makes extensive use of managed Azure resources, the cost might outweigh the benefits. On the other hand, if you have a solution that's designed to use virtual machines with various ports and applications, it might be important to capture and analyze network logs.

### Capture system changes

To maintain the integrity of your system, you should have an accurate and up-to-date record of system state. If there are changes, you can use this record to promptly address any issues that arise.

**Build processes should also emit telemetry.** Understanding the security context of events is key. Knowing what triggered the build process, who triggered it, and when it was triggered can provide valuable insights.

Track **when resources are created and when they're decommissioned**. This information must be extracted from the platform. This information provides valuable insights for resource management and accountability.

Monitor **drift in resource configuration**. Document any change to an existing resource. Also keep track of changes that don't complete as part of a rollout to a fleet of resources. Logs must capture the specifics of the change and the exact time it occurred.

Have a comprehensive view, from a patching perspective, of whether the system is up-to-date and secure. **Monitor routine update processes** to verify that they complete as planned. A security patching process that doesn't complete should be considered a vulnerability. You should also maintain an inventory that records the patch levels and any other required details.

**Change detection also applies to the operating system.** This involves tracking whether services are added or turned off. It also includes monitoring for the addition of new users to the system. There are tools that are designed to target an operating system. They help with context-less monitoring in the sense that they don't target the functionality of the workload. For example, file integrity monitoring is a critical tool that enables you to track changes in system files.

You should set up alerts for these changes, particularly if you don't expect them to occur often.

** Important**

When you roll out to production, be sure that alerts are configured to catch anomalous activity that's detected on the application resources and build process.

In your test plans, **include the validation of logging and alerting** as prioritized test cases.

### Store, aggregate, and analyze data

Data collected from these monitoring activities must be stored in data sinks where it can be thoroughly **examined, normalized, and correlated**. Security data should be persisted outside the system's own data stores. Monitoring sinks, whether they're localized or central, must outlive the data sources. The **sinks can't be ephemeral** because sinks are the source for intrusion detection systems.

Networking logs can be verbose and take up storage. **Explore different tiers in storage systems**. Logs can naturally transition to colder storage over time. This approach is beneficial because older flow logs typically aren't used actively and are only needed on demand. This method ensures efficient storage management while also ensuring that you can access historical data when you need to.

The flows of your workload are typically a composite of multiple logging sources. Monitoring data must be **analyzed intelligently across all those sources**. For example, your firewall will only block traffic that reaches it. If you have a network security group that has already blocked certain traffic, that traffic isn't visible to the firewall. To reconstruct the sequence of events, you need to aggregate data from all components that are in flow and then aggregate data from all flows. This data is particularly useful in a post-incident response scenario when you're trying to understand what happened. Accurate timekeeping is essential. For security purposes, all systems need to use a network time source so that they're always in sync.

##### Centralized threat detection with correlated logs

You can use a system like security information and event management (SIEM) to **consolidate security data in a central location** where it can be correlated across various services. These systems have **built-in threat detection** mechanisms. They can **connect to external feeds** to obtain threat intelligence data. Microsoft, for example, publishes threat intelligence data that you can use. You can also buy threat intelligence feeds from other providers, like Anomali and FireEye. These feeds can provide valuable insights and enhance your security posture. For threat insights from Microsoft, see [Security Insider](https://www.microsoft.com/security/business/security-insider/).

A SIEM system can **generate alerts** based on correlated and normalized data. These alerts are a significant resource during an incident response process.

 > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: SIEM systems can be expensive, complex, and require specialized skills. However, if you don't have one, you might need to correlate data on your own. This can be a time-consuming and complex process.

SIEM systems are usually managed by an organization's central teams. If your organization doesn't have one, consider advocating for it. It could alleviate the burden of manual log analysis and correlation to allow more efficient and effective security management.

Some cost-effective options are provided by Microsoft. Many Microsoft Defender products provide the alerting functionality of a SIEM system, but without a data-aggregation feature.

By combining several smaller tools, you can emulate some functions of a SIEM system. However, you need to know that these makeshift solutions might not be able to perform correlation analysis. These alternatives can be useful, but they might not fully replace the functionality of a dedicated SIEM system.

### Detect abuse

**Be proactive about threat detection** and be vigilant for signs of abuse, like identity brute force attacks on an SSH component or an RDP endpoint. Although external threats might generate a lot of noise, especially if the application is exposed to the internet, **internal threats are often a greater concern**. An unexpected brute force attack from a trusted network source or an inadvertent misconfiguration, for instance, should be investigated immediately.

**Keep up with your hardening practices.** Monitoring isn't a substitute for proactively hardening your environment. A larger surface area is prone to more attacks. Tighten controls as much as practice. Detect and disable unused accounts, remove unused ports, and use a web application firewall, for example. For more information about hardening techniques, see [Recommendations on security hardening](https://learn.microsoft.com/azure/well-architected/security/harden-resources).

**Signature-based detection** can inspect a system in detail. It involves looking for signs or correlations between activities that might indicate a potential attack. A detection mechanism might identify certain characteristics that are indicative of a specific type of attack. It might not always be possible to directly detect the command-and-control mechanism of an attack. However, there are often hints or patterns associated with a particular command-and-control process. For example, an attack might be indicated by a certain flow rate from a request perspective, or it might frequently access domains that have specific endings.

Detect **anomalous user access patterns** so that you can identify and investigate deviations from expected patterns. This involves comparing current user behavior with past behavior to spot anomalies. Although it might not be feasible to perform this task manually, you can use threat intelligence tools to do it. Invest in **User and Entity Behavior Analytics (UEBA) tools** that collect user behavior from monitoring data and analyze it. These tools can often perform predictive analysis that maps suspicious behaviors to potential types of attack.

**Detect threats during pre-deployment and post-deployment stages.** During the predeployment phase, incorporate vulnerability scanning into pipelines and take necessary actions based on the results. Post-deployment, continue to conduct vulnerability scanning. You can use tools like Microsoft Defender for Containers, which scans container images. Include the results in the collected data. For information about secure development practices, see [Recommendations for using safe deployment practices](https://learn.microsoft.com/azure/well-architected/operational-excellence/safe-deployments).

**Take advantage of platform-provided detection mechanisms and measures.** For example, Azure Firewall can analyze traffic and block connections to untrusted destinations. Azure also provides ways to detect and protect against distributed denial-of-service (DDoS) attacks.

## Power Platform facilitation

### Activity Logging

Available via Microsoft Purview

- Power Apps activities 
- Power Automate activities
- Power Platform connector events
- Data Policy changes
- Environment lifecycle operations
- Environment property and setting change activities

Each activity event consists of a common schema defined at [Office 365 Management Activity API schema](https://learn.microsoft.com/office/office-365-management-api/office-365-management-activity-api-schema). The schema defines the payload of metadata that is unique for each activity.

### Dataverse auditing

The Dataverse auditing feature is designed to meet the external and internal auditing, compliance, security, and governance policies that are common to many enterprises. Dataverse auditing logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment.

Dataverse auditing is supported on all custom and most customizable tables and columns. Audit logs are stored in Dataverse and consume log storage capacity. Audit logs can be viewed in the Audit History tab for a single record and in the Audit Summary view for all audited operations in a single environment. Audit logs can also be retrieved using the Web API or the SDK for .NET.

[Manage Dataverse auditing - Power Platform | Microsoft Learn](https://learn.microsoft.com/power-platform/admin/manage-dataverse-auditing)

### Model Driven Apps auditing

Protecting data, preserving privacy, and complying with [privacy regulations](https://www.microsoft.com/trust-center/privacy) are some of the highest priorities for your business. It's critical that you audit the entirety of data processing actions taking place to be able to analyze for possible security breaches. This information from Activity Logging can be used when you perform a Data Protection Impact Assessment (DPIA) addressing the use of Office, Power Apps, Power Automate, and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).

This topic covers how you can set Power Apps, Power Automate, and customer engagement apps to audit a broad range of data processing activities and use the [Microsoft Purview compliance portal](https://support.office.com/article/go-to-the-office-365-security-compliance-center-7e696a40-b86b-4a20-afcc-559218b7b1b8?ui=en-US&rs=en-US&ad=US) to review the data in activity reports.

[Microsoft Dataverse and model-driven apps activity logging - Power Platform | Microsoft Learn](https://learn.microsoft.com/power-platform/admin/enable-use-comprehensive-auditing)

### Microsoft Sentinel

Microsoft Sentinel solution for Microsoft Power Platform, a premium offering, allowing customers to detect various suspicious activities such as [**Microsoft Power Apps**](https://powerapps.microsoft.com/) execution from unauthorized geographies, suspicious data destruction by Power Apps, mass deletion of Power Apps, phishing attacks made possible through Power Apps, Power Automate flows activity by departing employees, Microsoft Power Platform connectors added to the an environment, and the update or removal of Microsoft Power Platform data loss prevention policies.

This integration will enable Microsoft Power Platform admin center to surface proactive threats to your data and other assets and provide recommendations or automations for mitigation or resolution. This will be essential for organizations to protect their sensitive data, mitigate security risks, and stay one step ahead.

**Identify and prevent insider attacks**: Microsoft Power Platform administrators can be alerted about a wide range of insider threats, including mass deletion of sensitive data, bulk retrieval of sensitive data outside of normal activity hours, and more. 

**Improve incident response time**: Microsoft Power Platform administrators can quickly identify and use recommendations or mitigations provided by Microsoft Sentinel to respond to security incidents, reducing the time it takes to mitigate risks. 

**Comply with regulatory requirements**: Microsoft Power Platform administrators can resolve their regulation and compliance requirements that mandate the use of threat detection tools to protect sensitive data and other assets.  

**Enhance overall security standing**: Microsoft Power Platform administrators can use this integration to proactively monitor their sensitive data, identify vulnerabilities, and take steps to strengthen overall security standing. 

[Microsoft Sentinel](https://www.microsoft.com/security/business/siem-and-xdr/microsoft-sentinel) is a cloud-native security information event and management (SIEM) platform that provides intelligent security analytics for enterprises and provides security operations center (SOC) analysts with a single pane of glass for threat detection and incident management across the organization. Microsoft Sentinel solutions are a collection of SIEM content elements that cover log collection, threat detection, incident investigation, and response for a specific domain in an easy-to-consume-and-deploy package available in Microsoft Sentinel Content hub.

### Analyze telemetry with Application Insights

You can set up an Application Insights environment to receive telemetry on diagnostics and performance captured by the Dataverse platform.

You can subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.

You don't need to write any code to enable this telemetry. You can enable or disable the telemetry feed at any time.

[Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview) is part of the Azure Monitor ecosystem. It's widely used by enterprises for monitoring and diagnostics. Many customers have added code to their extensions to capture this data into their Application Insights environments. This additional code has a cost, however—not only the cost to write and maintain, but also a performance cost at runtime. These costs can be avoided by using Application Insights built-in integration.

[Overview of integration with Application Insights - Power Platform | Microsoft Learn](https://learn.microsoft.com/power-platform/admin/overview-integration-application-insights)

### Identity

Monitor identity-related risk events on potentially compromised identities and remediate those risks. Review the reported risk events in these ways:

Use Microsoft Entra ID reporting. For more information, see [What is Identity Protection?](https://learn.microsoft.com/azure/active-directory/reports-monitoring/concept-user-at-risk) and [Identity Protection](https://learn.microsoft.com/azure/active-directory/active-directory-identityprotection).

Use Identity Protection risk detection API members to get programmatic access to security detections via Microsoft Graph. For more information, see riskDetection and riskyUser.

Microsoft Entra ID uses adaptive machine learning algorithms, heuristics, and known compromised credentials (user name and password pairs) to detect suspicious actions that are related to your user accounts. These user name and password pairs are surfaced by monitoring the public and dark web and by working with security researchers, law enforcement, security teams at Microsoft, and others.

### Azure Pipelines

DevOps advocates change management of workloads via continuous integration and continuous delivery (CI/CD). Be sure to add security validation in the pipelines. Follow the guidance described in Securing Azure Pipelines.

## Related links

[What is Microsoft Sentinel?](https://learn.microsoft.com/azure/sentinel/overview)

[Threat intelligence integration in Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/threat-intelligence-integration)

[Identify advanced threats with User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/identify-threats-with-entity-behavior-analytics) 

<https://learn.microsoft.com/purview/audit-solutions-overview>

[https://learn.microsoft.com/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype](https://learn.microsoft.com/office/office-365-management-api/office-365-management-activity-api-schema)

