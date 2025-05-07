---
title: ALM Accelerator for Power Platform
description: Learn how the ALM Accelerator for Power Platform helps you to follow ALM practices and enables you to establish source control for your solutions and move them from your development environment to test and production environments using Azure DevOps.
ms.topic: concept-article
ms.date: 04/09/2024
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
contributors:
- mikefactorial
---

# ALM Accelerator for Power Platform

The ALM Accelerator for Power Platform is a canvas app that provides a simplified interface to Azure Pipelines and Git source control for application lifecycle management (ALM). It's a reference implementation of ALM patterns and practices that uses built-in platform capabilities to help you get started with ALM in Power Platform. It's built using a combination of low-code maker- and administrator-focused canvas apps and Azure Pipelines YAML and PowerShell templates.

With the ALM Accelerator for Power Platform app, makers can perform source control, enable version history, and deploy their solutions in Power Platform. To use the ALM Accelerator, all your Power Platform components&mdash;apps, flows, customizations, and so on&mdash;must be contained in a solution.

You don't need advanced knowledge of ALM to use the accelerator. However, you should understand how to use solutions in Power Platform. Learn more about solutions and ALM:

- [Manage solutions in Power Apps and Power Automate](/learn/modules/manage-solutions-power-automate/)
- [Develop an Application Lifecycle Management strategy](/training/modules/application-lifecycle-management-strategy/)

## License requirements

ALM Accelerator for Power Platform uses the following premium Power Platform features:

- Dataverse
- Custom Connector
- HTTP with Microsoft Entra connector

To use the ALM Accelerator, you need the following licenses:

- Power Apps Per User or Per App license
- Azure DevOps Basic Plan

## Demo: ALM Accelerator for Power Platform

Watch the [demo videos](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md) to learn how to use the ALM Accelerator.

## Who should use the ALM Accelerator?

The ALM Accelerator is targeted at Power Platform makers and maker teams:

- Makers who are unfamiliar with ALM concepts, but want to be able to save their work, along with a history of changes, and share those changes with other users

- Makers who are comfortable with the advanced concepts of using Git, such as pull requests, branching, and merging, and want to work in a familiar way with source control and deployment automation

To [set up and configure](./setup-admin-tasks.md) the ALM Accelerator, you should be an administrator with a deeper understanding of Power Platform environments, solutions, and Azure Pipelines. You should also be familiar with Microsoft Entra and Dataverse administration.

The following diagram illustrates how the ALM Accelerator facilitates interactions between a maker team and development, validation, test, and production environments.

:::image type="content" source="media/TheMakerTeam2.png" alt-text="Diagram that illustrates how the ALM Accelerator facilitates interactions between a maker team and development, validation, test, and production environments." lightbox="media/TheMakerTeam2.png":::

Makers work in isolation in their personal development environments. They use the ALM Accelerator canvas app to import solutions from source control, export changes to source control, and create pull requests to merge changes. Customizable templates for Azure Pipelines automate ALM tasks and support a staged deployment from development to production.

## What are my options for ALM in Power Platform?

The ALM Accelerator is one of many options for ALM in Power Platform. Others include:

- [Pipelines for Power Platform](/power-platform/alm/pipelines) aim to democratize ALM by bringing ALM automation capabilities to Power Platform and Dynamics 365 services in a way that's more approachable for all makers, admins, and developers.

- [Power Platform Build Tools](/power-platform/alm/devops-build-tools) tasks can be used with other Azure DevOps tasks to compose your build and release pipelines. Pipelines that teams commonly put in place include Initiate, Export from Dev, Build, and Release.

- [GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) enable developers to build automated software development lifecycle workflows to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Power Platform.

## What's the right choice for my organization?

There's no one right answer for every organization. The following table and the descriptions that follow can help you decide which option is right based on your organization's current capabilities and future plans. This table isn't exhaustive. It's meant to help you make an informed decision. It will evolve over time as we add more capabilities to the ALM Accelerator and the ALM capabilities in Power Platform.

| Capability | Pipelines | ALM Accelerator | DevOps/GitHub |
| :---: | :---: | :---: | :---: |
| *IT/Developer involvement* | Not required | Up-front setup | Required for every project |
| *Source code integration* | No, but planned | Yes | Yes |
| *Maker requires elevated privileges in target environment* | No, service principal is supported | No, service principal is supported | No, service principal is supported |
| *Quality control* | Customizable with extensions | Customizable with extensions | Unlimited |
| *Democratized for citizen development* | Yes | Yes | No |
| *In-product experience* | Yes |  Canvas app provided, but no in-maker experience | No |
| *Support* | Microsoft-supported | Power CAT-supported through GitHub issues | Microsoft-supported and GitHub issues |
| *Customization and extensibility* | Yes | Yes | Yes |
| *Code-first development* | No, but planned | Yes | Yes |

### Pipelines for Power Platform (Pipelines)

Pipelines are intended to simplify ALM for makers. They're the strategic, in-product experience for maker-initiated ALM in Power Platform. Pipelines provide similar capabilities to the manual export and import functionality available in Power Platform for moving solutions from one environment to another.

With service principal support, users don't require elevated permissions to deploy to other environments. Also, pre- and post-deployment customizations allow organizations to layer their business processes on top of Pipelines. This gives organizations control over the approval processes as well as providing the ability to insert custom steps into the deployment pipeline.

Generally, you would choose Pipelines if your organization doesn't need to control your solutions' source code files and wants to get started with ALM quickly.

### Power Platform Build Tools/GitHub Actions and Power Platform CLI (Build Tools)

Build Tools are intended to give IT administrators and developers the tools to expedite the automation of highly customized ALM. You can address the limitations in Pipelines with Build Tools&mdash;control solution code, enable code-first scenarios, remove the need for makers to have elevated permissions in downstream environments, and include specific organizational and business processes in your ALM process.

Generally, you would choose Build Tools if your organization has DevOps or GitHub and developer resources available and requires granular control over your ALM processes.

### ALM Accelerator for Power Platform (ALM Accelerator)

The ALM Accelerator is intended to simplify ALM for both low-code makers and more advanced code-first makers. The ALM Accelerator is built on top of the Build Tools and accelerates getting started with them, avoiding the need to start from scratch. The ALM Accelerator pipelines and the related canvas app are open source. You can use it as-is or as a reference implementation that you can customize.

Generally, you would choose the ALM Accelerator if your organization requires granular control over your ALM processes but doesn't have the resources to build them from scratch, and wants to provide a maker experience on top of the Azure DevOps processes that drive ALM.

> [!div class="nextstepaction"]
> [Set up the ALM Accelerator](./setup-admin-tasks.md)

<!--
## Read next

- [What's In the ALM Accelerator?](./kit-contents.md)
- [Set up the ALM Accelerator](./setup-admin-tasks.md)
- [Use the ALM Accelerator](./new-maker-experience.md)
- [Hands on Lab](https://github.com/microsoft/coe-starter-kit/tree/main/CenterofExcellenceALMAccelerator/Labs/Demo%20tenant%20setup/)
-->

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
