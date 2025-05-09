---
title: Define reliability targets recommendation for Power Platform workloads
description: Learn how to define a health model that includes availability and recovery target metrics for critical Power Platform workloads.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for defining reliability targets

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

|[RE:04](checklist.md)| **Define reliability and recovery targets for the components, the flows, and the overall solution. Visualize the targets to negotiate, gain consensus, set expectations, and drive actions to achieve the ideal state. Use the defined targets to build the health model. The health model defines what healthy, degraded, and unhealthy states look like.**  |
|---|---|

This guide describes the recommendations for defining availability and recovery target metrics for critical workloads. Reliability targets are derived through workshop exercises with business stakeholders.

The targets are improved through monitoring and testing. Work with your internal stakeholders to establish realistic expectations for reliability. This exercise will also help stakeholders support your architectural design choices and understand that you're designing to best meet the targets you agreed on.

Microsoft Power Platform handles most [infrastructure-level](/power-platform/admin/business-continuity-disaster-recovery) availability and reliability concerns for you. However, the availability of the workloads you build is a shared responsibility. It's important to understand that even with Microsoft's [commitment to high availability](https://servicetrust.microsoft.com/), the risk of system downtime is never zero.

Consider using the following metrics to quantify the business requirements.

| Term                      | Definition                                      |
|----------------------------------|------------------------------------------|
| Service-level objective (SLO)    | A percentage target that represents the health of the component and the reliability tier. The higher the tier, the more reliable the component. *Composite SLO* represents the aggregate target of the entire workload and accounts for the component SLOs. |
| Service-level indicator (SLI)    | A metric emitted by a service. SLI metrics are aggregated to quantify an SLO value. |
| Service-level agreement (SLA)    | A contractual agreement between the service provider and the service customer. The agreement defines the SLOs. Failure to meet the agreement might have financial consequences for the service provider.  |
| Mean time to recover (MTTR)      | The time taken to restore a component after a failure is detected.  |
| Mean time between failure (MTBF) | The duration for which the workload can perform the expected function without interruption, until it fails.  |
| Recovery time objective (RTO)    | The maximum acceptable time that an application can be unavailable after an incident.   |
| Recovery point objective (RPO)   | The maximum acceptable duration of data loss during an incident.   |

Define the workload's target values for these metrics in the context of user and system flows. [Identify and score those flows](identify-flows.md) by how critical they are to your requirements. Use the values to drive the design of your workload in terms of architecture, review, testing, and incident management operations. Failure to meet the targets will affect the business beyond the tolerance level.

## Key design strategies

Technical discussions shouldn't drive how you define reliability targets for your critical flows. Instead, business stakeholders should focus on their requirements and the expectations of the end users of the workload. Technical experts help the stakeholders assign realistic numerical values that meet those requirements. By exchanging information, technical experts enable discussion and agreement on feasible SLOs.

Consider an example of how to map requirements to measurable numerical values. Stakeholders estimate that for a critical user flow, an hour of downtime during regular business hours results in a loss of *X* dollars in monthly revenue. That dollar amount is compared to the estimated cost of designing a flow that has an availability SLO of 99.95 percent rather than 99.9 percent. Decision makers must discuss whether the risk of that revenue loss outweighs the added costs and management burden required to protect against it.

Follow this pattern as you examine flows and build a complete list of targets.

Remember that reliability targets differ from performance targets. Reliability targets focus on availability and recovery. To set reliability targets, start by defining the broadest requirements and then define more specific metrics to meet the high-level requirements.

Highest-level reliability and recovery requirements and correlated metrics might include, for example, an application availability of 99.9 percent for all regions or a target RTO of 5 hours for the Americas region. Defining these types of targets helps you identify which critical flows are involved in those targets. Then you can consider component-level targets.

### Availability metrics

Availability targets correspond to SLO, SLA, and SLI metrics.

#### SLOs and SLAs

Availability metrics correlate to SLOs, which you use to define SLAs. The workload SLO determines how much downtime is tolerable in a given period; for example, less than 1 hour per month. To make sure you can meet the SLO target, review the Microsoft SLAs for each component.

To establish your SLOs, think about:

- Non-functional requirements of your workload (for example, peak request rates, concurrent users) over the next 1-2 years.

- Available metrics on what you can measure, over a specific period of time. This data will inform what SLIs to specify.

After you gather the SLAs for the individual workload components, calculate a composite SLA. The composite SLA should match the workload's target SLO. Calculating a composite SLA involves several factors, depending on your architecture design.

Defining proper SLOs takes time and careful consideration. Business stakeholders should understand the reliability tolerance. This feedback should inform the targets.

#### SLA values

The following table defines common SLA values.

| SLA     | Downtime per week     | Downtime per month     | Downtime per year     |
|---------|-----------------------|------------------------|-----------------------|
| 99%     | 1.68 hours            | 7.2 hours              | 3.65 days             |
| 99.9%   | 10.1 minutes          | 43.2 minutes           | 8.76 hours            |
| 99.95%  | 5 minutes             | 21.6 minutes           | 4.38 hours            |
| 99.99%  | 1.01 minutes          | 4.32 minutes           | 52.56 minutes         |
| 99.999% | 6 seconds             | 25.9 seconds           | 5.26 minutes          |

When you think about composite SLAs in the context of user and system flows, remember that different user and system flows have different criticality definitions. Consider these differences when you build your composite SLAs. Noncritical flows might have components that you should omit from your calculations because they don't affect the customer experience if they're briefly unavailable.

#### SLIs

Think of SLIs as component-level metrics that contribute to an SLO. The most significant SLIs are the ones that affect your critical flows from the perspective of your customers. For many flows, SLIs include latency, throughput, error rate, and availability. A good SLI helps you identify when an SLO is at risk of being breached. Correlate the SLI to specific customers when possible.

To avoid collecting useless metrics, limit the number of SLIs for each flow. Aim for three SLIs per flow if possible.

### Recovery metrics

Recovery targets correspond to RTO, RPO, MTTR, and MTBF metrics. In contrast to availability targets, recovery targets for these measurements don't depend heavily on Microsoft SLAs. Microsoft publishes RTO and RPO guarantees only for some products, like [SQL Database](/azure/azure-sql/database/business-continuity-high-availability-disaster-recover-hadr-overview).

Definitions for realistic recovery targets rely on your [failure mode analysis](failure-mode-analysis.md) and your plans and testing for business continuity and [disaster recovery](disaster-recovery.md). Before you finish this work, discuss aspirational targets with stakeholders and ensure that your architecture design supports the recovery targets to the best of your understanding. Clearly communicate to stakeholders that any parts of the workload that aren't thoroughly tested for recovery metrics shouldn't have guaranteed SLAs. Make sure that stakeholders understand that recovery targets can change over time as workloads are updated. The workload can become more complex as you adopt new technologies to improve the user experience. These changes can increase or decrease your recovery metrics.

> [!NOTE]
> MTBF can be challenging to define and guarantee. Platforms as a service (PaaS) or software as a service (SaaS) can fail and recover without any notification from the cloud provider, and the process can be completely transparent to you. If you define targets for this metric, cover only components that are under your control.

### Building a health model

Use the data you gathered for your reliability targets to build your health model for each workload and associated critical flows. A health model defines *healthy*, *degraded*, and unhealthy* states for the flows and workloads. The states ensure appropriate operational prioritization. This model is also known as a *traffic light model*. The model assigns green for healthy, yellow for degraded, and red for unhealthy. A health model ensures that you know when a flow's state changes from healthy to degraded or unhealthy.

How you define healthy, degraded, and unhealthy states depends on your reliability targets. Here are some examples of ways you might define the states:

- A **green or healthy** state indicates that key nonfunctional requirements and targets are fully satisfied and that resources are used optimally.

- A **yellow or degraded** state indicates that one or more components of the flow are alerting against their defined threshold, but the flow is operational. For example, storage throttling has been detected.

- A **red or unhealthy** state indicates that degradation has persisted longer than allowable by your reliability targets or that the flow has become unavailable.

> [!NOTE]
> The health model shouldn't treat all failures the same. The health model should distinguish between *transient* and *nontransient* faults. It should clearly distinguish between expected-transient but recoverable failures and a true disaster state.

This model works by using a monitoring and alerting strategy that is developed and operated on the principles of continuous improvement. As your workloads evolve, your health models must evolve with them.

For detailed guidance about monitoring and alerting configurations, see the [health monitoring](monitoring-alerting-strategy.md) guide.

### Visualization

To keep your operations teams and workload stakeholders informed about the real-time status and overall trends of the workload health model, consider creating [dashboards](/azure/azure-monitor/visualize/tutorial-logs-dashboards) in your monitoring solution. Discuss visualization solutions with the stakeholders to ensure that you deliver the information that they value and that's easy to consume. They might also want to see generated reports weekly, monthly, or quarterly.

## Power Platform facilitation

Power Platform SLAs provide the Microsoft commitments for uptime and connectivity. Different services have different SLAs, and sometimes SKUs within a service have different SLAs. For more information, see [Service-level agreements for online services](https://www.microsoft.com/licensing/docs/view/Service-Level-Agreements-SLA-for-Online-Services).

The Power Platform SLA includes procedures for obtaining a service credit if the SLA isn't met, along with definitions of availability for each service. That aspect of the SLA acts as an enforcement policy.

Microsoft Business Applications provides Business Continuity and Disaster Recovery (BCDR) capabilities to all [production type](/power-platform/admin/environments-overview) environments in Dynamics 365 and Power Platform SaaS applications. [Learn how Microsoft ensures your production data is resilient during regional outages](/power-platform/admin/business-continuity-disaster-recovery).

## Organizational alignment

Cloud Adoption Framework provides guidance for recommendations for SLOs and SLIs related to monitoring across the organization.

For more information, see [Cloud monitoring SLOs](/azure/cloud-adoption-framework/manage/monitor/service-level-objectives#how-do-you-define-slis).

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
