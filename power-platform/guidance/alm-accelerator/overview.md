---
title: "ALM Accelerator for Power Platform | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform helps you follow ALM patterns and practices. It enables you to establish source control for your solutions and move them from your development environment to test and production environments by using Azure DevOps"
author: jenschristianschroder
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---
# ALM Accelerator for Power Platform

To use the ALM Accelerator for Power Platform, you need to have all of your Power Platform components in a solution. Solutions are the basis of all ALM in the Power Platform and will be going forward. To learn more about solutions and ALM in the Power Platform, see [Develop an Application Lifecycle Management strategy](/training/modules/application-lifecycle-management-strategy/).

## License requirements for users of ALM Accelerator for Power Platform

ALM Accelerator for Power Platform uses the following premium Power Platform features:

- Dataverse
- Custom Connector
- HTTP with Azure Active Directory (AD) connector

For makers to use the features of the ALM Accelerator they need the following licenses:

- Power Apps Per User or Per App license
- Azure DevOps Basic Plan

## Demo: ALM Accelerator for Power Platform

Watch the [demo videos](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md) to see how to use the ALM Accelerator for Power Platform.

## Who should use the ALM Accelerator for Power Platform?

Makers and maker teams can use the ALM Accelerator for Power Platform to implement source control and deploy solutions. With the ALM Accelerator for Power Platform app, makers can perform source control, enable version history, and deploy their solutions in Power Platform. The combination of Azure pipelines and the maker and administrator focused apps are what makes up the ALM Accelerator.

While an advanced knowledge of ALM isn't required to use the accelerator, it's important that makers understand how to use solutions in Power Platform. To use the ALM Accelerator, all of your components—including apps, flows, customizations, and other components—must be contained in a solution. To learn more about solutions, see [Manage solutions in Power Apps and Power Automate](/learn/modules/manage-solutions-power-automate/).

### Target users
The target users for the ALM Accelerator app include:

- Power Platform makers who are unfamiliar with ALM concepts, but want to be able to save their work along with a history of changes, and share those changes with other users.
- Makers who are comfortable with the advanced concepts of using Git—such as pull requests, branching, and merging—to work in a familiar way with source control and deployment automation.

The target user for [setting up and configuring](./setup-admin-tasks.md) the ALM Accelerator is an administrator with a deeper understanding of Power Platform environments, solutions, Azure pipelines, and familiarity with Azure AD and Dataverse administration.

The following image shows how target users for the ALM Acceleratior start the process.

Makers work in isolation in their personal development environments. Their interaction with the ALM process is via the ALM Accelerator canvas app. 
 
Makers use the ALM Accelerator canvas app for their ALM tasks such as import solution from source control, export changes to source control, and create pull request to merge changes. ALM Accelerator templates for Azure DevOps pipelines facilitate the automation of ALM tasks based on the makers interaction with the ALM Accelerator canvas app. 
  
ALM Accelerator includes pipeline templates to support a three-stage deployment to production. Templates can be customized to fit specific needs and scenarios. 

The ALM Accelerator is a canvas app that sits on top of Azure DevOps pipelines to provide a simplified interface for makers to regularly commit and create pull requests for their development work in the Power Platform. The combination of the Azure DevOps pipelines and the canvas app are what make up the full ALM Accelerator solution. The pipelines and the app are reference implementations. They were developed for use by the development team for the COE Starter Kit internally but have been open sourced and released in order to demonstrate how healthy ALM can be achieved in the Power Platform. They can be used as is or customized for specific business scenarios.

:::image type="content" source="media/TheMakerTeam2.png " alt-text="Description.":::

## What are my options for ALM in the Power Platform?

Today there are many options for ALM in the Power Platform. The ALM Accelerator is one of the options. The ALM Accelerator is a solution that is built as a reference implementation of ALM patterns and practices using other in-built platform capabilities. The ALM Accelerator is built using a combination of low-code solutions and Azure DevOps pipeline templates (YAML and PowerShell). It's designed to help you get started with ALM in the Power Platform.

There are, however, other options for getting started with ALM in the Power Platform including the following tools:

- [Pipelines for Power Platform](/power-platform/alm/pipelines) - Pipelines for Power Platform aim to democratize ALM for Power Platform and Dynamics 365 customers by bringing ALM automation capabilities into the service in a manner that's more approachable for all makers, admins, and developers.

- [Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) - Power Platform Build Tools tasks can be used along with any other available Azure DevOps tasks to compose your build and release pipelines. Pipelines that teams commonly put in place include Initiate, Export from Dev, Build, and Release.

- [GitHub Actions for Power Platform](/power-platform/alm/devops-github-actions) - GitHub Actions enable developers to build automated software development lifecycle workflows. With GitHub Actions for Power Platform, you can create workflows in your repository to build, test, package, release, and deploy apps; perform automation; and manage bots and other components built on Power Platform.

## What's the right choice for my organization?

Depending on the needs of your organization, you may decide to use one or more of these options, including the ALM Accelerator as an option. While there's no one right answer for every organization, the following table and descriptions of each option can help you decide which option is right for you based on current capabilities and future plans. This table isn't exhaustive and is meant to help you make an informed decision. It's also going to evolve with time as more capabilities are added to the ALM Accelerator and to the built-in Power Platform ALM capabilities.

| Capability | Pipelines | ALM Accelerator | DevOps/GitHub |
| :---: | :---: | :---: | :---: |
| *IT / Developer involvement* | Not required | Up-front set up | Required for every project |
| *Source Code integration* | No, but planned | Yes | Yes |
|  *Maker requires elevated privileges in target environment*  |  Yes, but service principal support planned  |  No, service principal supported  |  No, service principal Supported  |
| *Quality Control* | Minimal | Best practices | Unlimited |
| *Democratized for Citizen Development* | Yes | Yes | No |
| *In-Product Experience* | Yes |  Canvas app provided, but not in maker experience  | No |
| *Support* | Microsoft supported |  Power CAT support via GitHub Issues and Discussions  |  Microsoft supported and GitHub Issues  |
| *Customization* | No | Yes | Yes |
| *Code-first development* | No | Yes | Yes |

### Pipelines for Power Platform (Pipelines)

Pipelines for Power Platform are intended to simplify ALM for makers, and is the strategic, in-product experience for maker-initiated ALM in the Power Platform. Today Pipelines provide similar capabilities to manual export and import functionality available in Power Platform for moving solutions from one environment to another. Users are required to have elevated permissions to perform these actions today, however, service principal support is planned soon to remove the need for those permissions going forward. The ability to introduce pre/post deployment customization is planned to allow organizations to add their business processes on top of Pipelines. However, more advanced customization is limited. Generally, an organization that doesn’t have a requirement for controlling their solution’s source code files is looking to get started quickly with ALM and don’t require specific business processes in their ALM process, would choose to use Pipelines.

### Power Platform Build Tools/GitHub Actions and Power Platform CLI (Build Tools)

The Build Tools provided by Microsoft for Power Platform are intended to provide IT administrators and developers with tools to expedite the automation of Power Platform ALM in organizations that have highly-customized ALM requirements. The current limitations in Pipelines for Power Platform can be addressed using these tools, including controlling solution code, enabling code-first scenarios, removing the need for makers to have elevated permissions in downstream environments, and including specific organization, business processes into their overall ALM process. Generally, an organization with DevOps and developer resources available and requires granular control over their ALM processes, would choose to use Build Tools for setting up their own custom, ALM process.

### ALM Accelerator for Power Platform (ALM Accelerator)

The ALM Accelerator is intended to simplify ALM for makers and more advanced, code-first makers. The ALM Accelerator is built on top of the Build Tools and therefore serves as an accelerator to getting started with the Build Tools, rather than requiring organizations to start from scratch. The ALM Accelerator pipelines and the related, canvas app are open source and intended to be used as is, or as a reference implementation that an organization can customize to suit their specific needs. Generally, an organization that has similar requirements as one who would use Build Tools, doesn't have the resources to build their own ALM processes from scratch, and wants to provide a maker experience on top of the Azure DevOps processes that drive ALM, would choose to use the ALM Accelerator.

> [!div class="nextstepaction"]
> [Set up the ALM Accelerator](./setup-admin-tasks.md)

<!--
## Read next

- [What's In the ALM Accelerator?](./kit-contents.md)
- [Set up the ALM Accelerator](./setup-admin-tasks.md)
- [Use the ALM Accelerator](./new-maker-experience.md)
- [Hands on Lab](https://github.com/microsoft/coe-starter-kit/tree/main/CenterofExcellenceALMAccelerator/Labs/Demo%20tenant%20setup/)
-->

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
