---
title: Failure mode analysis recommendation for Power Platform workloads
description: Learn how to identify potential failure points within your Power Platform workload and plan mitigation actions accordingly.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for performing failure mode analysis

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

| [RE:03](checklist.md) | **Use failure mode analysis (FMA) to identify and prioritize potential failures in your solution components. Perform FMA to help you assess the risk and effect of each failure mode. Determine how the workload responds and recovers.** |
| --- | --- |

This guide describes the best practices for performing failure mode analysis (FMA) for your workload. FMA is the practice of identifying potential points of failure within your workload and the associated flows and planning mitigation actions accordingly. At each step of the flow, you identify the blast radius of multiple failure types, which helps you design a new workload or refactor an existing workload to minimize the widespread effect of failures.

A key tenet of FMA is that failures happen no matter how many layers of resiliency you apply. More complex environments are exposed to more types of failures. Given this reality, FMA allows you to design your workload to withstand most types of failures and recover gracefully when a failure occurs.

If you skip FMA altogether or perform an incomplete analysis, your workload is at risk of unpredicted behavior and potential outages caused by suboptimal design.

**Definitions**

| Term | Definition |
| --- | --- |
| Failure mode | A type of problem that can cause one or more workload components to be degraded or severely affected to the point of being unavailable. |
| Mitigation | The activities that you have identified to address problems either proactively or reactively. |
| Detection | Your data and app monitoring and alerting processes and procedures. |

## Key design strategies

In the context of FMA, understanding the prerequisites is crucial. Begin by reviewing and implementing recommendations for identifying flows, prioritizing them based on criticality. Your data artifacts play a pivotal role in describing the data paths within these flows. As you delve into the FMA approach, focus on planning components for critical flows, identifying dependencies (both internal and external), and devising mitigation strategies.

### Prerequisites

Review and implement the [recommendations for identifying and rating flows](identify-flows.md). It's assumed that you have identified and prioritized user and system flows based on criticality.

The data that you have gathered and the artifacts that you have created in your work provide you with a concrete description of your data paths involved throughout the flows. To be successful in your FMA work, accuracy and thoroughness in your artifacts is critical.

### FMA approach

After you determine the critical flows, you can plan their required components. Next, follow each flow step by step to identify dependencies, including third-party services and potential points of failure, and plan your mitigation strategies.

#### Decompose the workload

As you move from ideation to design, you need to identify the component types that are required to support your workload. Your workload determines the necessary components that you must plan for.

After you create your initial architecture design, you can overlay your flows to identify the discrete components that are used in those flows and create lists or workflow diagrams that describe the flows and their components. To understand the criticality of the components, use the criticality definitions that you have assigned to the flows. Consider the effect of a component malfunction on your flows.

#### Identify dependencies

Identify your workload dependencies to perform your single-point-of-failure analysis. Decomposing your workload and overlaying flows provides insight into dependencies that are internal and external to the workload.

Internal dependencies are components in the workload scope that are required for the workload to function. Typical internal dependencies include APIs or secret/key management solutions like Azure Key Vault. For these dependencies, capture the reliability data, like availability service-level agreements (SLAs) and scaling limits. External dependencies are required components outside the scope of the workload, such as another application or third-party service. Typical external dependencies include authentication solutions, like Microsoft Entra ID, and Power Platform infrastructure.

Identify and document the dependencies in your workload and include them in your flow documentation artifacts.

### Failure points

In your workload's critical flows, consider each component and determine how that component, and its dependencies, might be affected by a failure mode. Remember that there are many failure modes to consider when planning for resiliency and recovery. Any one component can be affected by more than one failure mode at any given time. These failure modes include:

- Regional outage: An entire Power Platform or Azure region is unavailable
- Service outage: One or more Power Platform or Azure services are unavailable
- Distributed denial-of-service (DDoS) or other malicious attack
- App or component misconfiguration
- Operator error
- Planned maintenance outage
- Component overload

Consider the likelihood of each type of failure mode. Some are very unlikely, like multi-zone or multi-region outages, and adding mitigation planning beyond redundancy isn't a good use of resources and time.

#### Mitigation

Mitigation strategies fall into two broad categories: building more resiliency and designing for degraded performance.

Building more resiliency means ensuring that your application design follows best practices for durability; for example, breaking up monolithic applications into isolated apps and microservices and using platform-provided resiliency configurations, like retry policies. For more information, see [Recommendations for redundancy](/azure/well-architected/reliability/redundancy) and [Recommendations for self-preservation](/azure/well-architected/reliability/self-preservation).

To design for degraded performance, identify potential failure points that might disable one or more components of your flow but don't fully disable that flow. To maintain the functionality of the end-to-end flow, you might need to reroute one or more steps to other components or accept that a failed component runs a function, so the function is no longer available in the user experience. To return to the e-commerce application example, a failed component like a microservice might cause your recommendation engine to be unavailable, but the customers can still search for products and complete their transaction.

You also need to plan mitigation around dependencies. Strong dependencies play a critical role in application function and availability. If they're absent or experiencing a malfunction, there might be significant effect. The absence of weak dependencies might only affect specific features and not affect overall availability. This distinction reflects the cost to maintain the high availability relationship between the service and its dependencies. Classify dependencies as either strong or weak to help you identify which components are essential to the application.

If the application has strong dependencies that it can't operate without, the availability and recovery targets of these dependencies should align with the targets of the application itself. If the application lifecycle is closely coupled with the lifecycle of its dependencies, the operational agility of the application might be limited, particularly for new releases.

#### Detection

Failure detection is essential to ensure that you have correctly identified failure points in your analysis and properly planned your mitigation strategies. Detection in this context means the monitoring of your infrastructure, data, and application, and alerting when issues arise. Automate detection as much as possible, and build redundancy into your operations processes to ensure that alerts are always caught and are responded to quickly enough to meet your business requirements. For more information, see [Recommendations for monitoring](./monitoring-alerting-strategy.md).

#### Outcome

For the outcome of your analysis, create a set of documents that effectively communicate your findings, the decisions that you have made relative to the flow components and mitigation, and the effect of the failure on your workload.

In your analysis, prioritize the failure modes and mitigation strategies that you have identified based on severity and likelihood. Use this prioritization to focus your documentation on those failure modes that are common and severe enough to warrant spending the time, effort, and resources on designing mitigation strategies around. For example, there might be some failure modes that are very rare in occurrence or detection. Designing mitigation strategies around them isn't worth the cost.

Refer to the [example table](#example) for a documentation starting point.

During your initial FMA exercise, the documents you produce will be mostly theoretical planning. The FMA documents should be reviewed and updated regularly to ensure that they stay up to date with your workload. Chaos testing and real-world experiences will help you refine your analyses over time.

## Example

The following table shows an FMA example for an expense application that's hosted as a Power Apps canvas app with a Microsoft Dataverse backend and APIs hosted in APIM to interact with a third party system.

**User flow**: User sign in, submission of expense claim, and interaction with expense report

| Component | Risk | Likelihood | Effect/Mitigation/Note | Outage |
|---|---|---|---|---|
| Microsoft Entra ID | Service outage | Low | Full workload outage. Dependent on Microsoft to remediate. | Full |
| Microsoft Entra ID | Misconfiguration | Medium | Users unable to sign in. No downstream effect. Help desk reports configuration issue to identity team. | None |
| Power Apps | Service outage | Low | Full outage for external users. Dependent on Microsoft to remediate. | Full |
| Power Apps | Regional outage | Very low | Full outage for external users. Dependent on Microsoft to remediate. | Full |
| Power Apps | DDoS attack | Medium | Potential for disruption. Microsoft manages DDoS (L3 and L4) protection. | Potential for partial outage |
| Dataverse | Service outage | Low | Full workload outage. Dependent on Microsoft to remediate. | Full |
| Dataverse | Regional outage | Very low | Auto-failover group fails over to secondary region. Potential outage during failover. Recovery time objectives (RTOs) and recovery point objectives (RPOs) to be determined during reliability testing. | Potential full |
| Dataverse | Malicious attack (injection) | Medium | Minimal risk. | Potential low risk |
| API Management | Service outage | Low | Full outage for external users. Dependent on Microsoft to remediate. | Full |
| API Management | Regional outage | Very low | Full outage for external users. Dependent on Microsoft to remediate. | Full |
| API Management | DDoS attack | Medium | Potential for disruption. Microsoft manages DDoS (L3 and L4) protection. | Potential for partial outage |
| Your Power Platform solution | Misconfiguration | Medium | Misconfigurations should be caught during deployment. If these happen during a configuration update, administrators must roll back changes. Configuration update causes a brief external outage. | Potential for full outage |

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
- [Data Policies](/power-platform/admin/dlp-activity-logging)  
- [Power Platform administrative logs](/power-platform/admin/admin-activity-logging)
- [Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
