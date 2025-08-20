---
title: Recommendations for enabling automation in your workload
description: Learn how to design and implement automation up front to simplify maintenance tasks, apply governance, and address deployment concerns. 
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for enabling automation in your workload

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:09](checklist.md)| **Design and implement automation up front for operations such as life cycle concerns, and apply governance and compliance guardrails. Don't try to retrofit automation later. Choose automation features that your platform provides.** |
|---|---|

This guide describes the recommendations for designing and implementing your workload to enable automation. Design your workload with automation in mind to ensure that routine tasks such as provisioning resources, scaling, and deployments are performed quickly and reliably. Automation simplifies maintenance tasks and allows you to update, patch, and upgrade your systems more efficiently.

## Key design strategies

As you develop your workload, consider the following key strategies to enable automation.

### Workload design

You can design your workload to support automation from the ideation phase to the ongoing improvement phase. First, consider how you want to apply automation in your workload to help ensure that you're putting the necessary pieces in place. Think about your workload in terms of the Power Platform Well-Architected pillars to help plan for the types of automation you'll use. You can automate many functions of security, reliability, performance, and operations.

Design with automation in mind to minimize refactoring after your workload is running. Consider your workload requirements when deciding which automation tools to use. There might be off-the-shelf or open-source automation tools that your team is already familiar with. Adopting those tools can make the path to automating your workload easier, but be mindful of their limitations. Always investigate the tools that your cloud platform provides to ensure they're compatible and provide the functionality you require. Examples of ways that you can proactively plan for automation include:

- **Deployment**: Automate your application deployments to ensure a predictable standard. Plan for automated deployment by developing deployment standards, training your team on the tools that you'll use, and implementing the necessary infrastructure.
- **Validation**: Automatically validate compliance requirements against your workload using orchestration or policy tools. Identify the appropriate validation tool for your workload and plan to implement the required systems, such as orchestration servers.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: When designing your workload to enable automation, consider the degree of control that you want to maintain versus the efficiency you can gain through automation. In some cases, your workload might not be mature enough to automate some functions or you might need a level of flexibility that automation doesn't provide.

Also consider the skill set of your team when designing your workload. If a high degree of automation requires tools that your team isn't equipped to support, then you might need to use a less comprehensive design as an intermediate step.

### Continuous workload improvements

Observe your workload in production, analyze usage patterns, and review user behavior and feedback related to your workload to identify areas where you can improve automation. Look for ways to enhance existing automation or introduce new automation to improve your customer experience.

The following sections of this guide offer recommendations for specific areas of automation that can help you in your workload design and implementation.

### Authentication and authorization

Take automation into account when designing your authentication and authorization strategy. It's important to maintain the highest level of security in production workloads, but this strategy can affect automation. For example, the use of multifactor authentication adds complexity that must be accounted for in your automation design. Use nonhuman, secure accounts for automated authentication, such as managed identities, workload identities, or certificates. Ensure that you include secret and key management in your automation for increased authentication security.

### Design variability into your workload

Avoid unnecessarily deploying new solutions when small changes are made by building flexibility into your artifacts. For example, rather than redeploying your solution when a feature flag changes, you can use environment variables in your solution that update app configurations. Be sure to clearly define and document how variability is used to avoid overuse and configuration drift.

### Build a control plane

A control plane is the back-end system or suite of tools that you use to manage the application and its dependencies through a unified interface. Build your control plane like a REST interface, CLI, or webhook to support automation by external tools.

Expose maintenance operations through the control plane that allow you to coordinate workload components, like orderly backup and restore, bootstrapping, configuration, import/export, and batching operations. Be careful to choose the right level of granularity when deciding which operations to expose through the control plane.

### Monitor and log

Develop a monitoring strategy to capture metrics that drive the type of automation you require. Use structured logging and custom metrics to provide the information that's required by automation in a format that's easy to recognize with automation tools. The metrics that you capture should be paired with thresholds defined in the monitoring system that trigger alerts and automated actions.

### User life cycle

Design your workload to allow for automated user onboarding and offboarding. Plan for automated scripts that update permissions, share resources, and provide credential and secret management.

### Orchestration and policy use

As part of your continuous workload management, you can automate Desired State Configuration (DSC) in your resources to help ensure that they meet compliance and business requirements. DSC automation helps ensure that configuration drift is caught and remediated quickly.

You can automate DSC using orchestration tools or policy management tools. Think of orchestration tools, like Azure DevOps or Jenkins, as push-based mechanisms. Orchestration tools allow configuration updates to be pushed out through a workflow event, like a manual or automated deployment. These updates are run as part of a task sequence that's defined in your deployment script. Policy management tools use pull-based mechanisms, meaning that a system runs at the foundational level of your workload that periodically polls the workload to check its state against your DSC. If the poll identifies a misalignment or configuration drift, the tool takes corrective action.

Consider the following factors when deciding between orchestration and policy management tools:

- Orchestration tools don't have built-in capabilities to proactively poll your workload for configuration drift. Orchestration tools should be integrated into your continuous integration and continuous delivery (CI/CD) pipeline to maintain a standard for infrastructure as code (IaC) deployment and management. An advantage of using orchestration tools is that resources are always fully configured when deployed.

- Policy management tools allow you to define policies that affect one or more groups of resources. These policies are enforced when the resource checks in with the policy management system. An advantage of using policy management is that these systems aren't code-driven, so they might be easier for operators on your team to adopt.

Also consider whether the configuration updates you're planning to make on new resources must be made at the time of deployment, whether defining updates in code fits your operational practices, and how many resource types you plan to deploy. If there are many different configurations across resource types, policy tools might be an easier way to manage updates.

## Power Platform facilitation

[Environment groups](/power-platform/admin/environment-groups) are designed to help administrators organize their flat list of environments into structured groups based on different criteria, such as business unit, project, and location. Administrators can apply rules to groups to govern environments in bulk, reducing manual effort and ensuring consistency.

[Programmability and extensibility](/power-platform/admin/programmability-extensibility-overview#available-tools) tools are available for administrators to orchestrate and automate routine activities for their tenants. Available tools include connectors, the Power Platform CLI, PowerShell cmdlets, and APIs.

[Environment variables in solutions](/power-apps/maker/data-platform/environmentvariables) support design variability in the workload; for example, to store parameter keys and values, which then serve as input to other application objects. Separating the parameters from the consuming objects allows you to change the values within the same environment or when you migrate solutions to other environments.

[Conditional Access](/azure/active-directory/conditional-access/overview) is a feature of Microsoft Entra ID that lets you control how and when users can access applications and services. Follow the recommendations for [conditional access and multifactor authentication](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow) when automating processes with Power Automate.

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
