---
title: Recommendations for designing a workload development supply chain
description: Learn how to build a workload supply chain that drives changes through automated pipelines and ensures an efficient workload life cycle.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for designing a workload development supply chain

**Applies to this Power Platform Well-Architected Operational Excellence checklist recommendation:**

|[OE:06](checklist.md)| **Build a workload supply chain that drives proposed changes through predictable, automated pipelines. The pipelines test and promote those changes across environments. Optimize a supply chain to make your workload reliable, secure, cost-effective, and performant.** |
|---|---|

This guide describes the recommendations for designing a workload development supply chain that's based on continuous integration and continuous delivery (CI/CD) pipelines. In cloud workloads, a supply chain is a standardized suite of tools and processes that you use to affect configuration and workload change across environments. Develop a supply chain to ensure that you have a predictable, standardized method of maintaining your workload. CI/CD pipelines are the manifestation of the supply chain, but you should have a single supply chain. You might have several pipelines that follow the same processes and use the same tools.

Incorporate a supply chain to protect your workload from damage that can occur when you don't properly manage workload changes. Always be aware of the state of your workload, so that you're not at risk of experiencing unpredictable behavior. This risk compounds if you need to spend critical time retracing unaccounted-for changes when issues arise. To minimize these risks, standardize the processes and tools that define your supply chain, and ensure that your workload team fully commits to their use.

## Key design strategies

The following recommendations can help you define the core tenets of your supply chain.

**Make proposed workload changes through supply chain processes and tools.** Enforce a strict policy of automated template-based deployments. This method helps ensure that your workload's configuration across all environments is standardized, well-defined, and tightly controlled. For environments in a code promotion chain, don't perform updates by using manual processes or human interaction. Incorporate all changes to the environment through a pipeline by following deployment practices that you define. To help enforce this policy, consider limiting access to read-only as a default and using an access authorization gate to allow write access.

An important aspect of this tenet is that all changes are *proposed changes* until they're deployed into production. Through automated testing, like integration and smoke testing, you enable your supply chain to automatically reject changes.

**Use one set of code assets and artifacts across all environments and pipelines.** A common pain point for organizations is when nonproduction environments are different from production environments. Building production and nonproduction environments manually can result in mismatched configurations between the environments. This mismatch slows down testing and makes it more likely that changes might harm a production system.

**Reflect your organizational structure in your supply chain and pipeline designs.** Your organization might be siloed among teams. Each team might manage a part of the supply chain. For example, many organizations have teams that manage security and compliance settings, or environment configurations. These teams are separate from development teams that manage application development, testing, and deployments. There are many ways to organize the teams that are involved in a supply chain. Your supply chain relies on all the teams seamlessly working together. Ensure that all teams follow standard processes and use standard tools to make the supply chain as efficient as possible.

Your supply chain might rely on third-party vendors if you outsource parts of the workload life cycle. These vendors are as critical to the success of your supply chain as internal resources. Ensure that there's mutual agreement across all teams about the processes and tools that you use.

**Standardize your deployment method.** Talk to the product owner about the acceptable amount of production downtime for your workload. Depending on how much, if any, downtime is acceptable, you can choose the deployment method that's right for your requirements. Ideally, you should perform deployments during a maintenance window to reduce complexity and risk.

**Plan for a holistic testing strategy.** A core tenet of system reliability is the "shift left" principle. Developing and deploying an application is a process that's depicted as a series of steps going from left to right. You shouldn't limit testing to the end of the process. As much as possible, shift testing to the beginning, or to the left. Errors are cheaper to repair when you catch them early. They can be expensive or impossible to fix later in the application life cycle.

When possible, use automated testing to ensure consistency. Include the following types of testing in your supply chain design:

- Unit testing: Unit tests are typically run as part of a continuous integration routine. Unit tests should be extensive and quick. They should ideally cover 100 percent of the code. Apply unit tests to all code assets, including templates and scripts.

- Smoke testing: Smoke tests verify that a workload can be stood up in a test environment and performs as expected. Smoke tests don't verify the interoperability of components. Smoke tests verify that the deployment methodology for the infrastructure and the application works, and that the system responds as intended after the process finishes.

- Integration testing: Integration tests ensure that the application components operate individually, and then determine whether components can interact with each other as they should. It can take a considerable amount of time to run a large integration test suite. That's why it's best to incorporate the shift-left principle and perform testing early in the software development life cycle. Reserve integration tests for scenarios that you can't test with a smoke test or unit test. You can run long-running test processes on a regular interval if needed. A regular interval offers a good compromise and detects interoperability issues between application components no later than one day after they're introduced. Some testing scenarios benefit from manual runs. Use manual testing when you need to introduce human interactivity elements into tests.

- Acceptance testing: Depending on the context, you can manually perform acceptance testing. It can be partially or fully automated. Acceptance testing determines whether the software system meets the requirement specifications. The main purpose of this test is to evaluate the system's compliance with the business requirements and determine whether the system meets the required criteria for delivery to users.

**Implement quality gates throughout your code promotion process through testing**. Deploy your code into lower environments, like quality assurance and testing, and up through higher environments, like staging and production. As your deployment passes through quality gates, ensure that it meets your quality targets before changes go to production. Your business requirements determine what the focus of your quality gates are. Also consider the fundamental Power Platform Well-Architected principles: Security, Reliability, and Performance Efficiency.

Also integrate approval workflows into your quality gates. Clearly define and automate approval workflows when appropriate. Define quality acceptance criteria into your automation, so that you can move through your gates efficiently and safely.

## Power Platform facilitation

The [Deployment page](/power-platform/alm/admin-deployment-hub) in the Power Platform Admin Center. This page provides a streamlined experience to help administrators navigate the complexities of managing Power Platform application lifecycle management (ALM) workloads, including managing pipelines deployments at enterprise scale. Admins have visibility to all the deployments in their tenant and can approve deployment requests and troubleshoot issues.

[Pipelines in Power Platform](/power-platform/alm/pipelines) aim to democratize application lifecycle management (ALM) for Power Platform and Dynamics 365 customers by bringing ALM automation and continuous integration and continuous delivery (CI/CD) capabilities into the service. Pipelines can be custom tailored to serve the unique needs of an organization, For example you can add approvals, deploy via service rpincipals, and integrate with internal systems of record, Azure DevOps, GitHub, and more. Learn more: [Extend pipelines in Power Platform](/power-platform/alm/extend-pipelines)

[Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) can be used to automate common build and deployment tasks related to apps built on Power Platform.

[GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) enable developers to build automated software development life cycle workflows. With [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions), you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Power Platform.

[ALM Accelerator](/power-platform/guidance/coe/setup-almaccelerator) is an open-source tool that consists of a set of applications, scripts, and pipelines designed to automate the continuous integration/continuous delivery process.

[Automate tests with Azure Pipelines](/power-apps/maker/canvas-apps/test-studio-classic-pipeline-editor).

[Power Apps checker Web API](/power-platform/alm/checker-api/overview) provides a mechanism to run static analysis checks against customizations and extensions to the Microsoft Dataverse platform.

[Microsoft Power Platform CLI](/power-platform/developer/cli/introduction) (PAC CLI) is a command-line tool that supports the import and export of Power Platform solutions, and packing to and unpacking from Power Platform solutions source files. PAC CLI is available as a [standalone command-line tool](https://aka.ms/PowerAppsCLI) or as an [extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode).

You can use Terraform, Bicep, and Azure Resource Manager for immutable infrastructure as code (IaC) deployments. Depending on your requirements and your team's familiarity with the tools, you might use one or more of these tools for your deployments and management of the resources.

## Organizational alignment

Cloud Adoption Framework provides guidance for central teams to provide workload landing zones. The workload landing zones are where the workload's custom supply chain deploys applications to.

Learn more in [What is an Azure landing zone?](/azure/cloud-adoption-framework/ready/landing-zone) and the [Azure landing zone design principles](/azure/cloud-adoption-framework/ready/landing-zone/design-principles).

## Related information

- [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops)
- [Reliability pillar](../reliability/checklist.md)
- [Security pillar](../security/checklist.md)

## Next steps

> [!div class="nextstepaction"]
> [Operational Excellence checklist](checklist.md)
