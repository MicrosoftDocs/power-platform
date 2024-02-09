---
title: Recommendations for enabling automation in a workload
description: Learn how to design your workload to enable automation. Automation simplifies maintenance tasks, allowing you to update, patch, and upgrade your systems more efficiently and reliably.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: robstand
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for enabling automation in your workload

**Applies to this Power Well-Architected Operational Excellence checklist recommendation:**

|[OE:10](checklist.md)| Design and implement automation upfront for operations such as lifecycle concerns, bootstrapping, and applying governance and compliance guardrails. Don't try to retrofit automation later. Choose automation features that your platform provides..|
|---|---|

This guide describes the recommendations for designing and implementing your workload to enable automation. Design your workload with automation in mind to ensure that routine tasks such as provisioning resources, scaling, and deployments are performed quickly and reliably. Automation simplifies maintenance tasks and allows you to update, patch, and upgrade your systems more efficiently.

## Key design strategies

### Workload design

You can design your workload to support automation from the ideation phase to the on-going improvement phase. First, consider how you want to apply automation in your workload to help ensure that you're putting the necessary pieces in place. Think about your workload in terms of the Power Well Architected pillars to help plan for the types of automation you'll use. You can automate many functions of security, reliability, performance, and operations.

Design with automation in mind to minimize refactoring after your workload is running. Consider your workload requirements when deciding which automation tools to use. There might be off-the-shelf or open-source automation tools that your team is already familiar with. Adopting those tools can make the path towards automating your workload easier but be mindful of their limitations. Always investigate the tools that your cloud platform provides to ensure they're compatible and provide the functionality you require. Examples of ways that you can proactively plan for automation include:

- _Deployment_: Automate your application deployments to ensure a predictable standard. Plan for automated deployment by developing deployment standards, training your team on the tools that you'll use, and implementing the necessary infrastructure.
- _Validation_: Automatically validate compliance requirements against your workload using orchestration or policy tools. Identify the appropriate validation tool for your workload and plan to implement the required systems, for example, orchestration servers.

> :::image type="icon" source="../_images/trade-off.svg"::: > :::image type="icon" source="../_images/trade-off.svg"::: > :::image type="icon" source="../_images/trade-off.svg"::: > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: When designing your workload to enable automation, consider the degree of control that you want to maintain versus the efficiency you can gain through automation. In some cases, your workload might not be mature enough to automate some functions or you might need a level of flexibility that automation doesn't provide.

Also consider the skill set of your team when designing your workload. If a high degree of automation requires tools that your team isn’t equipped to support, then you might need to use a less comprehensive design as an intermediate step.

### Continuous workload improvements

Observe your workload in production, analyze usage patterns, and review user behavior and feedback related to your workload to identify areas where you can improve automation. Look for ways to enhance existing automation or introduce new automation to improve your customer experience. For example, you might have automated scaling enabled, but the workload increase is short-lived. You can integrate scale-in automation to decrease CPU usage when the load drops below the threshold.

The following sections of this guide offer recommendations on specific areas of automation that can help you in your workload design and implementation.

### Authentication and authorization

Take automation into account when designing your authentication and authorization strategy. It's important to maintain the highest level of security in production workloads, but this can affect automation. For example, the use of multifactor authentication adds complexity that must be accounted for in your automation design. Use nonhuman, secure accounts for automated authentication, such as managed identities, workload identities, or certificates. Ensure that you have included secret and key management in your automation for increased authentication security.

### Design variability into your workload

Avoid unnecessarily deploying new infrastructure when small changes are made by building flexibility into your artifacts. For example, rather than redeploying your infrastructure when a feature flag changes, you can use environment variables in your solution that update app configurations. Be sure to clearly define and document how variability is used to avoid overuse and configuration drift.

### Build a control plane

A control plane is the back-end system or suite of tools that you use to manage the application and its dependencies through a unified interface. Build your control plane like a REST interface, CLI, or webhook to support automation by external tools.

Expose maintenance operations through the control plane that allow you to coordinate workload components, for example orderly backup and restore, bootstrapping, configuration, import/export, and batching operations. Be careful to choose the right level of granularity when deciding the operations to expose through the control plane.

### Monitor and log

Develop a monitoring strategy to capture metrics that drive the type of automation you require. Use structured logging and custom metrics to provide the information required by automation in a format that's easy to recognize with automation tools. The metrics that you capture should be paired with thresholds defined in the monitoring system that trigger alerts and automated actions. 

### User lifecycle

Design your workload to allow for automated user onboarding and offboarding. Plan for automated scripts that update permissions, share resources, and provide credential and secret management.

### Orchestration and policy use

As part of your continuous workload management, you can automate Desired State Configuration (DSC) in your resources to help ensure that they meet compliance and business requirements. DSC automation helps ensure that configuration drift is caught and remediated quickly. You can automate DSC using orchestration tools or policy management tools. Think of orchestration tools, like Azure DevOps services or Jenkins, as push-based mechanisms. Orchestration tools allow configuration updates to be pushed out through a workflow event, like a manual or automated deployment. These updates are run as part of a task sequence defined in your deployment script. Policy management tools use pull-based mechanisms, meaning that a system runs at the foundational level of your workload that periodically polls the workload to check its state against your defined DSC. If the poll identifies a misalignment or configuration drift, the tool takes corrective action. Consider the following factors when deciding between orchestration and policy management tools:

- Orchestration tools don't have built-in capabilities to proactively poll your workload for configuration drift. Orchestration tools should be integrated into your continuous integration and continuous delivery (CI/CD) pipeline to maintain a standard for infrastructure as code (IaC) deployment and management. An advantage of using orchestration tools is that resources are always fully configured when deployed.
- Policy management tools allow you to define policies that affect one or more groups of resources. These policies are enforced when the resource checks in with the policy management system. An advantage of using policy management is that these systems aren't code driven, so they might be easier for operators on your team to adopt.

When deciding between orchestration or policy tools, consider whether the configuration updates you're planning to make on new resources must be made at the time of deployment. Also consider if defining updates in code fits your operational practices and how many resource types you plan to deploy. If there are many different configurations across resource types, policy tools might be an easier way to manage updates.

## Power Platform facilitation

### Policy management

Environment Groups / Policy

**Azure Policy**: Using Azure Policy, you can enforce standards and assess compliance at scale. Azure Policy provides an aggregated view to evaluate the overall state of the workload environment in the compliance dashboard. Or you can use Azure Policy to evaluate each resource and policy on a granular level. You can also use Azure Policy to remediate new resources automatically or remediate existing resources in bulk.

![TODO alt text](media/enable-automation/image1.png)

**Azure Virtual Machines extensions:** Virtual Machines extensions are small packages that run post-deployment configuration and automation on VMs. Several extensions are available for different configuration tasks, such as running scripts, configuring anti-malware solutions, and configuring logging solutions. Install and run these extensions on VMs by using an Azure Resource Manager template, Azure CLI, Azure PowerShell module, or the Azure portal. Each VM has a VM agent installed that manages the lifecycle of the extension.

Typically, VM extensions use a custom script extension to install software, run commands, and perform configurations on a VM or Azure Virtual Machine Scale Sets. You can set these extensions up to run as part of IaC deployments so that they run on new VMs using the Azure VM Agent. Extensions can also be run outside of an Azure deployment by using the Azure CLI, PowerShell module, or the Azure portal.

**Cloud-init:** Cloud-init is an industry tool for configuring Linux VMs on first boot. Much like Azure custom script extensions, cloud-init lets you install packages and run commands on Linux VMs. You can use cloud-init for software installation, system configuration, and content staging. Azure includes many cloud-init-enabled VM images across well-known Linux distributions. For a full list, see cloud-init support for VMs in Azure.

**Azure deployment script resource:** When you deploy using Azure, you might need to run arbitrary code for bootstrapping the management of user accounts, Kubernetes pods, or querying data from a non-Azure system. Because none of these operations are accessible through the Azure control plane, a separate mechanism is required. For more information, see Microsoft.Resources deploymentScripts. Like any other Azure resource, the deployment script resource:

- Can be used in an Azure Resource Manager template.
- Contains Azure Resource Manager template dependencies in other resources.
- Consumes input and produces output.
- Uses a user-assigned managed identity for authentication.

When deployed, the deployment script runs PowerShell or Azure CLI commands and scripts. Script runs and logging can be observed in the Azure portal or with the Azure CLI and PowerShell module. You can customize the variables for the run environment, timeout options, and resource management after a script failure.

**Bootstrap AKS clusters with GitOps**: You can bootstrap a newly provisioned AKS cluster using GitOps and the Flux v2 cluster extension by declaring your configuration settings in GitHub repositories. Because AKS cluster files are stored in a GitHub repository, they're versioned, and changes between versions are easily tracked. Kubernetes controllers run in the clusters and continually reconcile the cluster state with the desired state declared in the Git repository by pulling the files from the repository. For more information, see AKS baseline reference architecture.

### CDesign variability into your workloadonfiguration management

**Azure Automanage State Configuration is a DSC management tool built on top of Azure Policy that performs as an orchestration tool. Using a VM extension, you can directly apply predefined configuration updates to individual VMs or groups of VMs as defined within Azure Policy.**

**Azure App Configuration provides a service to centrally manage application settings and feature flags. It works with Azure Key Vault to let you securely manage a wide variety of application configurations across your environment.Environment Variables** store the parameter keys and values, which then serve as input to various other application objects. Separating the parameters from the consuming objects allows you to change the values within the same environment or when you migrate solutions to other environments. Learn more: Use environment variables in solutions - Power Apps | Microsoft Learn

### Authentication and authorization

Conditional Access is a feature of Microsoft Entra ID that lets you control how and when users can access applications and services. Follow the recommendations for conditional access and multi-factor authentication when automating processes with Power Automate. Learn more: Conditional access and multi-factor authentication in Flow - Power Automate | Microsoft Learn

## Related links

- [Conditional access and multi-factor authentication in Flow - Power Automate | Microsoft Learn](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow)
- Use environment variables in solutions - Power Apps | Microsoft Learn
- AKS baseline reference architecture
- Azure App Configuration
- Azure Automanage State Configuration
- Azure Policy
- Cloud-init support for VMs in Azure
- GitOps Flux v2 configurations with AKS and Azure Arc-enabled Kubernetes
- Microsoft.Resources deploymentScripts
- Recommendations for self-healing and self-preservation
