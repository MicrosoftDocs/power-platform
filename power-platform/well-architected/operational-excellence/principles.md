---
title: Operational Excellence design principles
description: Understand the design principles of the Power Platform Well-Architected Operational Excellence pillar.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/16/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Operational Excellence design principles

The Operational Excellence pillar defines processes for development practices, monitoring, and release management. The goal is to establish standards that reduce development time, human error, and user disruption. By following fusion development practices, your team will also collaborate better.

To assess your operational health, start with these questions:

- How do you drive continuous improvement and learn from experience?
- Do you have development and deployment standards that reduce friction and drive consistency?
- Is your workload meeting user expectations and requirements?

Without standards and clear leadership, workload teams often resort to methods that don't follow best practices, which can lead to poor user and support experiences.

These design principles, based on the Operational Excellence principles in the [Microsoft Azure Well-Architected Framework](/azure/well-architected/reliability/principles), provide guidelines for operational strategies aimed at addressing root causes rather than merely treating symptoms. Start with the recommended approaches, and then observe what works and what doesn't to identify areas of improvement. After you set your strategy, continue to drive action by using the [Operational Excellence checklist](./checklist.md).

Your workload needs to meet both operational and business requirements. Efficient processes help the workload reach business goals while following compliance and governance standards. The key is to find repeatability with consistency.

If you meet these goals, workloads run reliably and predictably even during times of change. Not focusing on operational requirements might lead to failed and inconsistent deployments, added cost and time, and disrupted user experience.

## Embrace a fusion development and DevOps culture

|![Goal icon](../_images/goal.svg) Empower development and operations teams to continuously improve the workload and processes by working together with a mindset of collaboration, shared responsibility, and ownership.|
|--|

Gartner defines fusion development, or fusion teams development, as "distributed and multidisciplinary digital business teams that blend technology and other types of domain expertise." (Source: 2019 Gartner Digital Business Teams Survey.)

Fusion development is a strategy aimed at scaling application development by using low-code methodologies. Fusion development allows your business to build better applications faster, by bringing together professional developers with citizen, or low-code, developers. It can also include using low-code capabilities and combining them with code-first components to meet business needs and create fusion applications.

A good fusion development and DevOps culture fosters a collaborative environment of shared knowledge and thrives on shared responsibility. Development and operations teams who are aligned on goals and priorities keep business focus and goals in mind. Feedback is shared among all teams. For example, operations teams share feedback on supporting the workload with the development team to improve the workload over time. At the same time, IT professionals and operations teams establish a secure, governed environment that empowers citizen developers to achieve more with minimum friction.

DevOps practices assign clear roles and responsibilities to each team and streamline operational tasks so that they're efficient but not overwhelming. To maximize the value of DevOps, the culture should improve processes with technology and promote open communication within the organization.

Learn more in [Operational Excellence design principles](/azure/well-architected/operational-excellence/principles#embrace-devops-culture) in the Azure Well-Architected Framework.

## Establish development standards

|![Goal icon](../_images/goal.svg) Optimize productivity by standardizing development practices, enforcing quality gates, and tracking progress and success through systematic change management.|
|--|

Technology and coding standards, style guides, and tools are in place to drive consistency and easier maintenance. Quality assurance processes ensure that functional and nonfunctional requirements are met and emphasize testing early in the development life cycle. Effective processes are in place to standardize technical activities and drive consensus within the team and stakeholders. Developers are supported by standards and process but not burdened by them.

Learn more in [Operational Excellence design principles](/azure/well-architected/operational-excellence/principles#establish-development-standards) in the Azure Well-Architected Framework.

## Improve operations with monitoring and insights

|![Goal icon](../_images/goal.svg) Gain visibility into the workload, and use insights to make data-driven decisions.|
|--|

Continuously improve the quality of your workload by monitoring it in accordance with Power Platform Well-Architected pillars. Build a monitoring system that tracks every aspect of the workload. Collect data that you can learn from and that can drive improvements. Monitoring is key in proactive maintenance of the workload, quality and security assurance, performance and capacity planning, and product management. Efficient monitoring can reduce reactive cycles and incident response times.

Learn more in [Operational Excellence design principles](/azure/well-architected/operational-excellence/principles#evolve-operations-with-observability) in the Azure Well-Architected Framework.

## Deploy with confidence

|![Goal icon](../_images/goal.svg) Reach the desired state of deployment with predictability.|
|--|

Build a workload supply chain that enables you to consistently deploy your workload to all your environments. Choose tooling that is capable of automation, testing, monitoring, and versioning. Upskill your team so that they can use the chosen technology and increase productivity. Aim to achieve immutable assets that deploy through automation, and avoid configuration drift and manual changes in downstream environments.

Learn more in [Operational Excellence design principles](/azure/well-architected/operational-excellence/principles#deploy-with-confidence) in the Azure Well-Architected Framework.

## Automate for efficiency

|![Goal icon](../_images/goal.svg) Replace repetitive manual tasks with automation designed to complete tasks quicker, with greater consistency and accuracy, and reduce risk.|
|--|

Evaluate repetitive tasks that might be time-consuming and error-prone. Identify opportunities for automation to free up your team for higher-value tasks, increasing productivity and consistency. Design your automation with the same principles that you apply to your overall workload, avoiding anti-patterns and keeping security threats in mind.

Learn more in [Operational Excellence design principles](/azure/well-architected/operational-excellence/principles#automate-for-efficiency) in the Azure Well-Architected Framework.

## Adopt safe deployment practices

|![Goal icon](../_images/goal.svg) Implement guardrails in the deployment process to minimize the effect of errors or unexpected conditions.|
|--|

Standardize deployment of any changes by using automated deployment processes, such as pipelines. Consistent deployment methods ensure the deployment is completed safely, reliably, and with repeatability. Catch issues in early stages of deployment by testing changes rigorously. Ensure you have a mitigation strategy in place to quickly recover from deployment failures.

Learn more in [Operational Excellence design principles](/azure/well-architected/operational-excellence/principles#adopt-safe-deployment-practices) in the Azure Well-Architected Framework.

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
