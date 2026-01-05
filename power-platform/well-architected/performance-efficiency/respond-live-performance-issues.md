---
title: Respond to live performance issues recommendation for Power Platform workloads
description: Learn how to respond to live performance issues and use root cause analysis, triage plans, and other steps to resolve problems in Power Platform workflows.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for responding to live performance issues

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:09](checklist.md)|**Respond to live performance issues. Plan how to address performance problems by incorporating clear lines of communication and responsibilities. When a problematic situation occurs, use what you learn to identify preventive measures and incorporate them in your workload. Implement methods to return to normal operations faster when similar situations occur.**|
|---|---|

This guide describes the best practices for responding to live performance issues. Live performance issues refer to real-time challenges and bottlenecks that can hinder the optimal functioning of a workload. Addressing these issues promptly not only facilitates the immediate detection and rectification of performance hiccups but also ensures that the workload consistently meets its performance benchmarks. Failing to address them can lead to complications, including slowdowns, crashes, and system unresponsiveness, and degrade the user experience. They can also prevent users from completing their tasks efficiently, and, in turn, tarnish the reputation of the organization.

**Definitions**

| Term | Definition |
|---|---|
| Data correlation | Aligning logs, metrics, and events from various parts of your workload to pinpoint underlying causes. |
| Root cause analysis | A process for identifying the underlying factors that are responsible for a problem. |
| Self-healing | The ability to automatically repair issues without human intervention. |
| Self-prevention | Implementations within a workload to prevent potential issues and failures. |

## Key design strategies

When you experience a live performance issue, you need to be prepared with the right data and a plan to respond to the issue. This plan should include clear lines of communication and responsibilities. The primary objective is to identify if the performance issues are temporary or isolated, to identify the root cause of the performance issue, and to implement solutions that facilitate a quick return to regular operations and provide insights from the incident. Integrating preventive measures into your workflow is a pivotal strategy. The goal is to either prevent the same issue from happening again or lessen its effects on performance if it isn't preventable.

### Prepare for issues

The ideal response to live-site performance issues is precise and fast. Precision and speed in performance remediation require preparation. To effectively respond to live performance issues, it's crucial to monitor key performance metrics, identify the root cause of the issues, and implement appropriate solutions or optimizations. To take these steps, you might need to analyze workload logs, conduct performance testing, and optimize code or configurations. 

The following examples outline a few critical areas of preparation:

- _Have accurate architecture diagrams._ Your architecture diagrams should include all components and show how they interact. Visual representation can help identify bottlenecks and single points of failure that can lead to performance degradation or unavailability. Ideally, you catch and remove these issues before they cause problems, but having an up-to-date diagram can help you pinpoint issues in high-stress moments.

- _Check data access._ Data and logs from monitoring processes are critical for responding to performance issues in real time and conducting root cause analyses. But it's important to maintain the integrity and confidentiality of the data. Responding to live-site performance issues often requires access to underlying data that might not be normally accessible. You need to ensure that personnel have access to the data that they need when issues arise. But you should only grant time-restricted, least-privilege access, and you should limit that access to authorized personnel.

- _Set automatic alerts._ Alerts can help you identify and address issues as soon as they occur. Alerts should generate notifications when workload performance deviates from performance baselines. Over time, you should tweak alert configurations to avoid generating too many or too few notifications. The monitoring solutions that you use need to collect enough data to generate alerts. These alerts should align with performance targets and established baselines. You should avoid generating alerts on issues that aren't relevant to your goals. Examples of alerts include degradations in response times, performance of Dataverse API calls or plug-ins, and page loads.

### Create a triage plan

Creating a triage plan involves devising a structured approach to identify, escalate, analyze, prioritize, and communicate live-site performance issues. A triage plan is a strategy for responding to live performance issues. It ensures that performance disruptions are addressed promptly and effectively, with clear roles and procedures. Most performance issues don't merit disaster recovery protocols, but they can affect workload functionality enough to require triage planning. A well-documented triage plan ensures all team members are aligned and can act swiftly, minimizing the impact on users and workloads. A triage plan should include the following components:

- _Identification and monitoring_: Implement a system to identify and monitor performance issues in real time. You should have a list of the contact information of people who are capable of making decisions or escalating issues to higher levels. The plan should also identify roles and responsibilities. It needs to document which accounts gain access to protected information and for how long.

- _Escalation process_: Define a clear escalation process to ensure that performance issues are escalated to the appropriate teams or individuals in a timely manner. The process definition should include contact information and guidelines for escalating issues.

- _Root cause analysis_: Develop a process for conducting a root cause analysis to identify the underlying cause of each performance issue. The process should involve analyzing logs and performance metrics and conducting diagnostic tests to pinpoint the source of each problem.

- _Prioritization_: Establish a prioritization framework to determine the severity of performance issues and prioritize them based on their effect on the workload and users.

- _Communication_: Create a communication plan to keep stakeholders informed about the status of performance issues and the progress of their resolution. Consider regular updates, status reports, and clear communication channels.

- _Documentation_: Document the triage plan, including all its steps, processes, and best practices. This documentation should be easily accessible to the team members who are involved in responding to performance issues.

### Develop methods to identify and resolve issues

Resolving live performance issues involves identifying and addressing any factors that can cause performance degradation or inefficiencies in a live workload. Data that you collect during monitoring is invaluable for investigating and resolving performance-related incidents. This data provides a historical record of performance metrics. When you have monitoring data available, you can analyze root causes and identify contributing factors. You should use all relevant monitoring data to understand and fix each performance issue. Monitor how many transient spikes you're detecting, and adjust thresholds accordingly.

### Use root cause analysis

Root cause analysis requires hypothesis testing. After you review monitoring data, you should list potential causes of the performance issue and test them. 

To conduct a root cause analysis on a live performance issue, follow these steps:

- _Gather information._ Collect as much information as possible about the performance issue. Examples include error messages, logs, performance metrics, and any other relevant data. Also include information about the users who reported the issue, such as their device, network, and location. 

- _Define the problem._ Clearly define the problem by identifying the symptoms and the effect that the problem has on the workload or users.

- _Investigate potential causes._ Narrow down the scope of the analysis by identifying the specific component or area of the workload where the performance issue is occurring. Identify potential causes of the performance issue based on the gathered information. This process can involve analyzing code, configuration settings, infrastructure, or external dependencies.

- _Correlate data._ Dive deeper into the collected data to identify patterns, anomalies, or correlations that might contribute to the performance issue. Data correlation is key to identifying performance issues and causes. It can involve reviewing logs, analyzing performance metrics, and conducting tests.

- _Test hypotheses._ Formulate hypotheses based on the potential causes that you identify. Conduct tests to validate or refute your hypotheses. You should use a test environment to see whether you can replicate the error.

- _Implement solutions._ Once you identify a root cause, develop and implement solutions to address the performance issue.

- _Monitor and validate._ After you implement the solutions, continuously monitor the workload to ensure that the performance issue is resolved. Validate the effectiveness of the solutions by monitoring performance metrics and user feedback.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: The steps of a root cause analysis, such as identifying possible causes, testing hypotheses, and documenting the analysis, can be time consuming. To correlate performance issues, you also need to collect and store data. The required time and infrastructure can add significant work to the operations teams and cost to the workload.

> :::image type="icon" source="../_images/risk.svg"::: **Risk**: If you perform a root cause analysis without proper security guardrails, there's a risk that you expose sensitive information when you provide access to logs and data.

### Engage Microsoft Support

Reach out to [Microsoft Support](https://support.microsoft.com/) to help address ongoing performance issues. Microsoft Support representatives not only have the expertise, tools, resources, and experience to resolve issues, but they may also be aware of any current global performance issues or outages that could affect your workload. Your support agreement determines the level of support provided.

It's often best to work in parallel with Microsoft Support. For example, consider a strategy in which some team members collaborate with Microsoft Support, while others continue to triage and fix performance issues.

It's important to make support contact information available to the team. Keep in mind that Microsoft Support might also need access to data to effectively engage in problem solving.

For more information, see [Get Support in Power Platform](/power-platform/admin/get-help-support).

### Learn from findings

After you fix a live-site performance issue, you need to review what happened. The goal is to learn from performance issues, not just identify problems. The best way to learn is through documentation. Document each issue and explain how to fix it. If a vendor helped, work with the vendor to enhance your documentation, train your team, and modify your workload accordingly.

The documentation should indicate how to prevent each problem from happening again. Along with the documentation, you can create refined alerts that help you respond early to performance issue indicators.

## Power Platform facilitation

Power Platform and Azure provide several tools to help you respond to live performance issues:

- [Azure Monitor](/azure/azure-monitor/overview) is a comprehensive monitoring solution that provides insights into the performance and health of your applications and infrastructure. Azure Monitor offers features such as metrics, logs, alerts, and dashboards to help you monitor and diagnose performance issues. Power Platform apps and automation can integrate with Azure Monitor using the Application Insights capability. Standard telemetry along with custom trace events can be [logged and analyzed](/power-apps/maker/canvas-apps/application-insights).

- [Application Insights](/azure/azure-monitor/app/app-insights-overview) is an application performance management (APM) service that helps developers and DevOps professionals monitor live applications. It automatically detects performance anomalies, collects application-level logs and events, and provides analytics tools to diagnose issues. Power Platform integrates with [Application Insights](/power-platform/admin/overview-integration-application-insights?source=recommendations). 

- [Log Analytics](/azure/azure-monitor/logs/log-analytics-overview) is a service that collects and analyzes log data from various sources, including applications, virtual machines, and Azure resources. When you use Log Analytics, you can query and analyze log data to gain insights into the performance and behavior of your applications. Consider using Log Analytics if your workload uses Azure resources.

- [Solution Checker](/power-apps/maker/data-platform/use-powerapps-checker) performs rich static analysis on your solutions against a set of best-practice rules and identifies problematic patterns. Address any performance related issues before deploying the solution to production to avoid live-site performance issues. 

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
