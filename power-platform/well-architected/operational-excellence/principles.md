---
title: Operational Excellence cloud design principles for well-architected Power Platform workloads
description: Understand the design principles of the Power Platform Well-Architected Operational Excellence pillar.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/10/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Operational Excellence design principles

At the core of the Operational Excellence pillar are Fusion development and DevOps practices that ensure workload quality through standardized workflows and team cohesion. This pillar defines operating procedures for development practices, observability, and release management. The goal is to minimize process variance, chances of human error, and disruption to customers. To assess your operational health, start with these questions:

- Do you execute operations with discipline?
- Are customers using the workload with maximum predictability?
- How do you learn from experience and collected data to drive continuous improvement?

Workload operations can devolve into chaotic practices when there's no clear ownership or leadership. In this type of environment, teams often resort to methods that are executed with high effort and produce low outcomes, which leads to poor user experience. These approaches meet only short-term goals. Long-term benefits are realized through continuous evaluation and strategic investments.

These design principles, based on the Reliability principles in the [Microsoft Azure Well-Architected Framework](/azure/well-architected/reliability/principles) provide guidelines for operational strategies that must be considered to address the underlying causes and not just treat symptoms. Start with the recommended approaches, and then observe what works and what doesn't to identify areas of improvement. After you set your strategy, continue to drive action by using the [Operational Excellence checklist](./checklist.md).

The operational requirements of a workload are as important as its business requirements. Efficient processes ensure the workload achieves business outcomes within the constraints of compliance, whether that compliance is organizational or external. The key is to find repeatability with consistency.

The goals of the Operational Excellence pillar are to do the right thing, to do it the right way, and to solve the right problems as a team.

If you meet these goals, workloads will run reliably and predictably even during times of change. Inability to fulfill operational requirements can lead to failed deployments, inconsistent user experience, and added costs that could have been avoided through proper planning and streamlined execution.

## Embrace Fusion development and DevOps culture

|![Goal icon](../_images/goal.svg) Empower development and operations teams to continuously improve their system design and processes by working together with a mindset of collaboration, shared responsibility, and ownership.|
|--|

Fusion development, or fusion teams development, is defined by Gartner as "distributed and multidisciplinary digital business teams that blend technology and other types of domain expertise." (Source: 2019 Gartner Digital Business Teams Survey)

Fusion development is a strategy aimed at scaling application development by leveraging low-code methodologies. Fusion development allows your business to build better applications faster, by bringing together professional developers with citizen, or low-code, developers. It can also include using low-code capabilities and combining them with code-first components to meet business needs and create Fusion applications.

DevOps is a community of practice where diversity of perspective and skills drives toward one mission. Teams must foster a collaborative environment of shared knowledge instead of siloed learning. Use shared functions to strive to overcome resource constraints.

A good fusion development and DevOps culture thrives on shared responsibility. Development and operations teams should align their goals and priorities with the expectations of their customers and keep business focus in mind. The development team should involve the operations team in the feedback loop so the improvements are driven upstream and other teams benefit equally. Conversely, operations teams are responsible for making the development team successful in their business outcomes by sharing resources and feedback that are relevant to the workload. At the same time, IT professionals and operations team must create a secure and governed environment where citizen developer can be empowered to achieve more with minimum friction.

DevOps practices apply clear lines of ownership and accountability to each team. Regardless of where the application runs, the workload team is responsible for that application. DevOps optimizes operational tasks so that they're effective but not burdensome. To reap the full benefit of DevOps, the culture should optimize processes through technology and have processes for people in the organization to promote transparent communication.

Learn more about [embracing DevOps culture](/azure/well-architected/operational-excellence/principles#embrace-devops-culture) in Azure Well-Architected Framework.

## Establish development standards

|![Goal icon](../_images/goal.svg) Optimize productivity by standardizing development practices, enforcing quality gates, and tracking progress and success through systematic change management.|
|--|

The development team is responsible for addressing workload issues prior to release with minimal friction. Be mindful of developer efficiency and optimize for fast turnaround cycles, from coding to testing results. Implement effective and right-sized processes that plan and standardize technical activities and also drive consensus within the team and the stakeholders.

Learn more about [establishing development standards](/azure/well-architected/operational-excellence/principles#establish-development-standards) in Azure Well-Architected Framework.

## Evolve operations with observability

|![Goal icon](../_images/goal.svg) Gain visibility into the system, derive insight, and make data-driven decisions.|
|--|

Build a culture that continuously improves quality by monitoring the workload and taking all the pillars of the Power Platform Well-Architected into consideration. Enable the team and stakeholders to make both short-term and long-term decisions across many facets by providing the necessary data, statistics, and trends. Learn from your data and drive improvements. Operations built for the purposes of observability are key in proactive maintenance of the application, quality and security assurance, capacity planning, and product management. A crucial aspect of monitoring is application using health modeling to help you anticipate issues before they become incidents and affect customer experience. Efficient monitoring reduces reactive cycles spent on incident management.

Learn more about [evolving operations with observability](/azure/well-architected/operational-excellence/principles#evolve-operations-with-observability) in Azure Well-Architected Framework.

## Deploy with confidence

|![Goal icon](../_images/goal.svg) Reach the desired state of deployment with predictability.|
|--|

Build a workload supply chain that enables you to consistently reach the goal of predictability in all of your environments, across the workload's hosting platforms, applications, data, and configuration resources. The deployment mechanism must be capable of automation, testing, monitoring, and versioning. It should be modularized and ready to execute on demand. It shouldn't be represented as a monolithic end-to-end process. The supply chain isn't necessarily for faster execution, but to achieve consistency and self-documentation over multiple iterations.

Learn more about [deploying with confidence](/azure/well-architected/operational-excellence/principles#deploy-with-confidence) in Azure Well-Architected Framework.

## Automate for efficiency

|![Goal icon](../_images/goal.svg) Replace repetitive manual tasks with automation that completes them quicker, with greater consistency and accuracy, and reduces risks.|
|--|

The workload might have workflows with processes that involve team members doing mundane, repetitive, and time-consuming tasks that don't actually need human intellect. Depending on the frequency, you might spend considerable time on these efforts, investing more time as the workload grows. Also, these processes are often error-prone due to human input. Through automation, you save time, effort, and money, and you avoid mistakes.

Learn more about [automating for efficiency](/azure/well-architected/operational-excellence/principles#automate-for-efficiency) in Azure Well-Architected Framework.

## Adopt safe deployment practices

|![Goal icon](../_images/goal.svg) Implement guardrails in the deployment process to minimize the effect of errors or unexpected conditions.|
|--|

During the development cycle, workload artifacts go through many changes as they get implemented and tested and as bugs are fixed. The deployment process must follow a standard operating procedure. Any change must be deployed with the same level of rigor. This principle applies equally to code, configuration, and all related artifacts. The key is to apply safe practices as early as possible so that you have predictability in production. Even if errors reach the customers, you should be able to roll out recovery changes as soon as possible.

Learn more about [safe deployment practices](/azure/well-architected/operational-excellence/principles#adopt-safe-deployment-practices) in Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
