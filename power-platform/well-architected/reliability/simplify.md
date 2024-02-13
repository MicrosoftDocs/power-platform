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

**Applies to this Power Well-Architected Reliability checklist recommendation:**

|[RE:01](checklist.md)| Design your workload to align with business objectives and avoid unnecessary complexity or overhead. Use a practical and balanced approach to make design decisions that deliver the desired results. Contain your design to the necessities to reduce inefficiencies and potential problems. |
|---|---|

This guide describes the recommendations for minimizing unnecessary complexity and overhead to keep your workloads simple and efficient. Choose the best components to perform the necessary workload tasks to optimize the reliability of your workload. To lessen your development and management burdens, take advantage of services and features that the platform provides. This design helps you create a workload architecture that's resilient, repeatable, scalable, and manageable.

**Definitions**

| **Term** | **Definition** |
|---|---|
| **Workload** | The collection of apps and services that, used together, provide business value |

## Key design strategies

A key tenet of designing for reliability is to keep things simple and efficient. Focus your workload design on meeting business requirements to reduce the risk of unnecessary complexity or excess overhead. Consider the recommendations in this article to help you make decisions about your design to create a lean, efficient, and reliable workload. 

You must justify every design decision with a business requirement. This design principle might seem obvious, but it's crucial for workload design. Is the user base for your workload small – for example, individual users, direct colleagues or a small team – or large – for example spanning multiple business units or the entire enterprise? Are you solving a productivity use case, or enterprise-wide initiatives or mission-critical workloads that would result in significant business impact during downtime? Business requirements drive these design considerations.

**Tradeoff**: A complex solution can offer more features and flexibility, but it might affect the reliability of the workload because it requires more coordination, communication, and management of components. Alternatively, a simpler solution might not fully meet user expectations, or it might have a negative effect on extensibility as the workload evolves.

### Collaborative design exercises

Work with stakeholders to:

- **Define and assign a criticality level to your workload, and** **it’s components.** This will help you determine the required components and the best approach to achieve the required resiliency level.
- **Define functional and nonfunctional requirements**. Functional requirements define the features and behavior of the system. They are specified by the user and captured in use cases. Nonfunctional requirements define the performance and quality attributes of the system. Ensure that you understand nonfunctional requirements like availability, compliance, data retention/residency, performance, privacy, recovery time, security and scalability. These requirements influence design decisions and technology choices.
- **Break down the workload into components**. During the discovery and requirement gathering process, some solution ideas should start to become clear. Identify solution components that might make up the proposed solution to meet your business requirement. Prioritize simplicity, efficiency, and reliability in your design. Determine the components that you need to support your workload. Highlight where out of the box capabilities can be used, and where custom development may be needed. 
- **Use failure mode analysis** to identify single points of failure and potential risks. Clearly understand your business's tolerance for risk. For more information, see Recommendations for performing failure mode analysis.
- **Define availability and recovery targets** for your workload to inform the architecture decisions. Business metrics include service-level objectives (SLOs), service-level agreements (SLAs), mean time to recover (MTTR), mean time between failure (MTBF), recovery time objectives (RTOs), and recovery point objectives (RPOs). Define target values for these metrics. This exercise might require compromise and mutual understanding between technology and business teams to ensure that each team's goals meet business objectives and are realistic. For more information, see Recommendations for defining reliability targets.

### Additional design recommendations

You can perform the following recommendations without stakeholder engagement:

- **Strive for simplicity and clarity** in your design. Use the appropriate level of abstraction and granularity for your components and services. Avoid overengineering or under-engineering your solution. For example:
  - If you solve a process automation requirement with Power Automate breaking a large process into multiple smaller cloud flows might make it more difficult to understand, test and maintain. On the other hand, keeping everything in a large flow might have a negative impact on performance and API call volume. 
  - If you solve a user facing requirement with Power Apps, a large monolithic canvas app with many controls might have a negative impact on performance. Breaking it down into single apps or custom pages might make testing more difficult, however could have a significant positive impact on performance. 
- **Anticipate change over time.** Whether to fix bugs, implement new features or technologies, or make existing systems more scalable and resilient – your workload will change over time. 
- **Offload cross-cutting concerns to a separate service**. Minimize the need to duplicate code across different functions, prefer reusing services with well-defined interfaces that can be easily consumed by different components. For example, if a set of data operations need to be performed from different places, you can move this functionality to a low code plugin. 
- **Evaluate the suitability of common patterns and practices** for your needs. Avoid following trends or recommendations that might not be best for your context or requirements. For example, implementing custom code-components might not be the best option for every application because they can introduce complexity, overhead, and dependency issues.

### Develop just enough code

The principles of simplicity, efficiency, and reliability also apply to your development practices. 

Consider these recommendations for your development practices:

- Use platform capabilities when they meet your business requirements. For example, use modern controls instead of developing your own code-components to achieve a Fluent 2 design standard. 
- Introduce dedicated code review sessions as a development practice.
- Implement an approach to identify _dead code_. Be skeptical of the code that your automated tests don't cover.
- Consider the skill set of your development team. It takes time to learn a new skill or adopt a new technology.

### Consider where your data is

As part of your architectural design, you will have to consider how to store your data or how to retrieve your data for read activities. Data can be retrieved in stored in multiple different ways:

- **New data:** If your app is creating data that doesn't already exist anywhere, such as in situations where the existing business process was done using paper, we recommend storing the data either in Microsoft Dataverse.
- **Read/write from an existing system:** This is a type of data where you need to retrieve the latest information from an existing database or system. In these cases, data needs to be requested at the time you need it. You will have to evaluate the best way to connect to the data – either using an out of the box connector, a custom connector, or virtual tables. 
- **Make a copy of the data:** In situations where original data should never be modified or overwritten, you can copy the data to another data store such as Dataverse. This ensures that the data in the original system won't be changed, yet your app can work with it. This scenario is common when working with data in accounting and revenue-related systems. You will have to consider how data is copied, how often it is updated, and if a two-way sync needs to take place.

## Power Platform facilitation

For more information, see:

- [Power Apps architectural design - Where to place logic - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/guidance/planning/logic)
- [Designing - Which type of app to make - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/guidance/planning/app-type)
- [Designing your data structure - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/guidance/planning/data-modeling)
- [Data design - Working with enterprise systems - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/guidance/planning/enterprise-systems)

## Related links

- [Work with requirements for Microsoft Power Platform and Dynamics 365 - Training | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/work-with-requirements/)
- [Planning a Power Apps project - planning phase overview - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/guidance/planning/planning-phase)
- [Use Dataverse low-code plug-ins - Power Apps | Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant)
- [powerapps-tools/Tools/Apps/Microsoft.PowerApps.CodeReview/readme.md at master · microsoft/powerapps-tools (github.com)](https://github.com/microsoft/powerapps-tools/blob/master/Tools/Apps/Microsoft.PowerApps.CodeReview/readme.md)

