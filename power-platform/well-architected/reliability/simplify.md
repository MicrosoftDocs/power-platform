---
title: Recommendations for designing for simplicity and efficiency
description: Learn how to minimize unnecessary complexity and overhead by keeping your workloads simple and efficient.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: robstand
ms.date: 03/01/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for designing for simplicity and efficiency

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

| [RE:01](checklist.md) | **Design your workload to align with business objectives and avoid unnecessary complexity or overhead. Use a practical and balanced approach to make design decisions that deliver the desired results. Contain your design to the necessities to reduce inefficiencies and potential problems.** |
| --- | --- |

This guide describes the recommendations for minimizing unnecessary complexity and overhead to keep your workloads simple and efficient. Choose the best components to perform the necessary workload tasks to optimize the reliability of your workload. To lessen your development and management burdens, take advantage of efficiencies that platform-provided services offer. This design helps you create a workload architecture that's resilient, repeatable, scalable, and manageable.

**Definitions**

| Term | Definition |
| --- | --- |
| Workload | A discrete capability or computing task that you can logically separate from other tasks. |

## Key design strategies

A key tenet of designing for reliability is to keep things simple and efficient. Focus your workload design on meeting business requirements to reduce the risk of unnecessary complexity or excess overhead. Consider the recommendations in this article to help you make decisions about your design to create a lean, efficient, and reliable workload. Different workloads might have different requirements for availability, scalability, data consistency, and disaster recovery.

You must justify every design decision with a business requirement. This design principle might seem obvious, but it's crucial for workload design. Does your application support millions of users, or a few thousand? Are there large traffic bursts, or a steady workload? What level of application outage is acceptable? Business requirements drive these design considerations.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff:** A complex solution can offer more features and flexibility, but it might affect the reliability of the workload because it requires more coordination, communication, and management of components. Alternatively, a simpler solution might not fully meet user expectations, or it might have a negative effect on extensibility as the workload evolves.

### Collaborative design exercises

Work with stakeholders to:

- **Define and assign a criticality level to your workload and its components**. This exercise will help you determine the required components and the best approach to achieve the required resiliency level. See [Define tiers of applications](/power-platform/guidance/adoption/support-strategy-solutions#define-tiers-of-applications) for more information.

- **Define functional and nonfunctional requirements**. Functional requirements define the features and behavior of the system. They're specified by the user and captured in use cases. Nonfunctional requirements define the performance and quality attributes of the system. Ensure that you understand nonfunctional requirements like availability, compliance, data retention/residency, performance, privacy, recovery time, security, and scalability. These requirements influence design decisions and technology choices.

    Here are some examples of functional and nonfunctional requirements, in the context of a workload that handles expense reports:

    | **Functional requirements** | **Nonfunctional requirements** |
    | --- | --- |
    | The workload should allow users to log in with their credentials and only access their personal data. | The workload should be available at least 99.9% of the time. |
    | The workload should include a dashboard that provides an overview of open, approved, and declined expense reports. | The workload should comply with the relevant regulations and standards for data protection and privacy. |
    | The workload should support backup and restore operations for the workload data. | The workload should have a response time of less than 5 seconds for most user requests. |
    | The workload should send notifications to users and administrators when certain events or thresholds are triggered. | The workload should have a high level of security and encryption for the data in transit and at rest. |

    For more information, see the training module entitled [Work with requirements for Microsoft Power Platform and Dynamics 365](/training/modules/work-with-requirements/).

- **Break down the workload into components**. During the discovery and requirement gathering process, some solution ideas should start to become clear. Identify solution components that might make up the proposed solution to meet your business requirement. Prioritize simplicity, efficiency, and reliability in your design. Determine the components that you need to support your workload. Highlight where out-of-the-box capabilities can be used, and where custom development may be needed.

- **Use failure mode analysis** to identify single points of failure and potential risks. Clearly understand your business's tolerance for risk. For more information, see [Recommendations for performing failure mode analysis](failure-mode-analysis.md).

- **Define availability and recovery targets** for your workload to inform the architecture decisions. Business metrics include service-level objectives (SLOs), service-level agreements (SLAs), mean time to recover (MTTR), mean time between failure (MTBF), recovery time objectives (RTOs), and recovery point objectives (RPOs). Define target values for these metrics. This exercise might require compromise and mutual understanding between technology and business teams to ensure that each team's goals meet business objectives and are realistic. For more information, see [Recommendations for defining reliability targets](metrics.md). Power Platform SLAs provide the Microsoft commitments for uptime and connectivity. Different services have different SLAs, and sometimes SKUs within a service have different SLAs. For more information, see [Service-level agreements for online services](https://www.microsoft.com/licensing/docs/view/Service-Level-Agreements-SLA-for-Online-Services).

### Additional design recommendations

You can perform the following recommendations without stakeholder engagement:

- **Strive for simplicity and clarity** in your design. Use the appropriate level of abstraction and granularity for your components and services. Avoid overengineering or underengineering your solution. For example:

  - If you solve a process automation requirement with Power Automate, breaking a large process into multiple smaller cloud flows might make it more difficult to understand, test, and maintain. On the other hand, keeping everything in a large flow might have a negative impact on performance and API call volume.

  - If you solve a user-facing requirement with Power Apps, a large monolithic canvas app with many controls might have a negative impact on performance. Breaking it down into single apps or custom pages might make testing more difficult, but it could have a significant positive impact on performance.

- **Anticipate change over time**, whether to fix bugs, implement new features or technologies, or make existing systems more scalable and resilient.

- **Offload cross-cutting concerns to a separate service**. Minimize the need to duplicate code across different functions. Prefer reusing services with well-defined interfaces that can be easily consumed by different components. For example, if a set of data operations needs to be performed from different places, you can move this functionality to a low-code plug-in.

- **Evaluate the suitability of common patterns and practices** for your needs. Avoid following trends or recommendations that might not be best for your context or requirements. For example, implementing custom code components might not be the best option for every application because they can introduce complexity, overhead, and dependency issues.

### Develop just enough code

The principles of simplicity, efficiency, and reliability also apply to your development practices. Consider these recommendations:

- Use platform capabilities when they meet your business requirements. For example, use modern controls instead of developing your own code components to achieve a Fluent 2 design standard.

- Introduce dedicated code review sessions as a development practice.

- Implement an approach to identify *dead code*. Be skeptical of the code that your automated tests don't cover.

- Consider the skill set of your development team. It takes time to learn a new skill or adopt a new technology.

### Consider where your data is

As part of your architectural design, you need to consider how to store your data or how to retrieve your data for read activities. Data can be retrieved and stored in different ways:

- **New data**: If your app creates data that doesn't already exist, such as when the existing business process was done on paper, we recommend storing the data in Microsoft Dataverse.

- **Read/write from an existing system**: If your app needs to retrieve data from an existing database or system, you need to evaluate the best way to connect to the database or system: using an out-of-the-box connector, a custom connector, or virtual tables.

- **Make a copy of the data**: In situations where original data should never be modified or overwritten, you can copy the data to another data store such as Dataverse. This ensures that the data in the original system isn't be changed, yet your app can work with it. This scenario is common when working with data in accounting and revenue-related systems. You need to consider how data is copied, how often it's updated, and whether a two-way sync needs to take place.

## Power Platform facilitation

These Power Apps articles provide practical design advice:

- Determining [where to place logic in your system: Canvas apps, model-driven apps, Microsoft Dataverse, or Power Automate flows](/power-apps/guidance/planning/logic)
- [Determining which type of app to make](/power-apps/guidance/planning/app-type): model-driven or canvas apps
- [Date modeling: Designing your data structure](/power-apps/guidance/planning/data-modeling)
- Data design: [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

## See also

- [Service-level agreements for online services](https://www.microsoft.com/licensing/docs/view/Service-Level-Agreements-SLA-for-Online-Services)
- [Work with requirements for Microsoft Power Platform and Dynamics 365](/training/modules/work-with-requirements/)
- [Planning a Power Apps project ](/power-apps/guidance/planning/planning-phase)
