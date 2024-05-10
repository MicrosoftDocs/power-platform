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

The Operational Excellence pillar defines processes for development practices, monitoring, and release management. The goal is to establish standards that reduce development time, human error and user disruption. By following Fusion development practices, your team will also collaborate better.

To assess your operational health, start with these questions:

- How do you drive continuous improvement and learn from experience?
- Do you have development and deployment standards that reduce friction and drive consistency?
- Is your workload meeting user expectations and requirements?

Without standards and clear leadership, workload teams often resort to methods that aren't following best practices which can lead to poor user and support experiences.

These design principles, based on the Operational Excellence principles in the [Microsoft Azure Well-Architected Framework](/azure/well-architected/reliability/principles) provide guidelines for operational strategies that must be considered to address the underlying causes and not just treat symptoms. Start with the recommended approaches, and then observe what works and what doesn't to identify areas of improvement. After you set your strategy, continue to drive action by using the [Operational Excellence checklist](./checklist.md).

Your workload needs to meet both operational and business requirements. Efficient processes help the workload reach business goals whilst following compliance and governance standards. The key is to find repeatability with consistency.

If you meet these goals, workloads will run reliably and predictably even during times of change. Not focusing on operational requirements may lead to failed and inconsistent deployments, added cost and time, and disrupted user experience.

## Embrace Fusion development and DevOps culture

|![Goal icon](../_images/goal.svg) Empower development and operations teams to continuously improve the workload and processes by working together with a mindset of collaboration, shared responsibility, and ownership.|
|--|

Fusion development, or fusion teams development, is defined by Gartner as "distributed and multidisciplinary digital business teams that blend technology and other types of domain expertise." (Source: 2019 Gartner Digital Business Teams Survey)

Fusion development is a strategy aimed at scaling application development by leveraging low-code methodologies. Fusion development allows your business to build better applications faster, by bringing together professional developers with citizen, or low-code, developers. It can also include using low-code capabilities and combining them with code-first components to meet business needs and create Fusion applications.

A good fusion development and DevOps culture fosters a collaborative environment of shared knowledge and thrives on shared responsibility. Development and operations teams are aligned on goals and priorities work keeping business focus and goals in mind. Feedback is shared between all teams - for example, operations teams share feedback from supporting the workload with the development team to improve the workload over time. At the same time, IT professionals and operations team create a secure and governed environment where citizen developers can be empowered to achieve more with minimum friction.

DevOps practices assign clear roles and responsibilities to each team and streamline operational tasks so that they're efficient but not overwhelming. To maximize the value of DevOps, the culture should improve processes with technology and have ways for people in the organization to foster open communication.

Learn more about [embracing DevOps culture](/azure/well-architected/operational-excellence/principles#embrace-devops-culture) in Azure Well-Architected Framework.

## Establish development standards

|![Goal icon](../_images/goal.svg) Optimize productivity by standardizing development practices, enforcing quality gates, and tracking progress and success through systematic change management.|
|--|

Technology and coding standards, style guides and tools are in place to drive consistency and easier maintenance. Quality assurance processes ensure that functional and nonfunctional requirements are met and emphasize testing early in the development lifecycle. Effective processes are in place to standardize technical activities and drive consensus within the team and stakeholders. Developers are supported by standards and process but not burdened by them.

Learn more about [establishing development standards](/azure/well-architected/operational-excellence/principles#establish-development-standards) in Azure Well-Architected Framework.

## Improve operations with monitoring and insights

|![Goal icon](../_images/goal.svg) Gain visibility into the workload, and use insights to make data-driven decisions.|
|--|

Continuously improve the quality of your workload by monitoring the workload and taking all the pillars of the Power Platform Well-Architected into consideration. Build a monitoring system that allows you to monitor all parts of the workload. Collect data that you can learn from and that can drive improvements. Monitoring is key in proactive maintenance of the workload, quality and security assurance, performance and capacity planning, and product management. Efficient monitoring can reduces reactive cycles and incident response times.

Learn more about [evolving operations with observability](/azure/well-architected/operational-excellence/principles#evolve-operations-with-observability) in Azure Well-Architected Framework.

## Deploy with confidence

|![Goal icon](../_images/goal.svg) Reach the desired state of deployment with predictability.|
|--|

Build a workload supply chain that enables you to consistently deploy your workload to all your environments. Choose tooling that is capable of automation, testing, monitoring, and versioning. Upskill your team so they can use the chosen technology and increase productivity. Aim to achieve immutable assets that deploy through automation, and avoid configuration drift and manual changes in downstream environments.

Learn more about [deploying with confidence](/azure/well-architected/operational-excellence/principles#deploy-with-confidence) in Azure Well-Architected Framework.

## Automate for efficiency

|![Goal icon](../_images/goal.svg) Replace repetitive manual tasks with automation that completes them quicker, with greater consistency and accuracy, and reduces risks.|
|--|

Evaluate repetitive tasks that may be time-consuming and error-prone. Identify opportunities for automation so that your team's time can be spent on higher value work and you can increase productivity and consistency. Design your automation with the same principles you apply to your overall workload, avoiding anti-patterns and keeping security threats in mind. 

Learn more about [automating for efficiency](/azure/well-architected/operational-excellence/principles#automate-for-efficiency) in Azure Well-Architected Framework.

## Adopt safe deployment practices

|![Goal icon](../_images/goal.svg) Implement guardrails in the deployment process to minimize the effect of errors or unexpected conditions.|
|--|

Standardize the process to deploy any changes by using automated deployment processes, such as pipelines. Consistent deployment methods ensure the deployment is completed safely, reliably, and with repeatability. Catch issues in early stages of deployment by testing changes rigorously. Ensure you have a mitigation strategy in place to quickly recover from deployment failures.

Learn more about [adopting safe deployment practices](/azure/well-architected/operational-excellence/principles#adopt-safe-deployment-practices) in Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
