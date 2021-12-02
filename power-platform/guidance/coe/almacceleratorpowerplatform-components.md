---
title: "Use the ALM Accelerator for Power Platform App | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform will help you follow ALM patterns and practices. It enables you to source control your solutions and move them from your development environment to test and production environments using DevOps"
author: jenschristianschroder
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use the ALM Accelerator for Power Platform App (Preview)

> [!NOTE]
> ALM Accelerator for Power Platform is currently in public preview. Please see Issues currently tagged as [vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While in Public Preview it can be expected that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

## Demo: ALM Accelerator for Power Platform

Watch how to use the ALM Accelerator for Power Platform solution
[Demo Videos](https://github.com/microsoft/coe-starter-kit/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md)

## What's in the solution?

The ALM Accelerator for Power Platform (AA4PP) is an application that allows makers and maker teams to source control and deploy solutions in the Power Platform. With the ALM Accelerator for Power Platform, makers can source control, enable version history, and deploy their solutions in the Power Platform simply. The combination of the Azure Pipelines and the App is what make up the full ALM Accelerator for Power Platform (AA4PP) solution.

While an advanced knowledge of ALM is not required to use AA4PP. It's important that makers understand how to use solutions in the Power Platform. To use the AA4PP all of your components (Apps, Flows, Customizations, and other components) must be contained in a solution. To learn more about solutions, check out this overview [Manage solutions in Power Apps and Power Automate](/learn/modules/manage-solutions-power-automate/).

The target users for AA4PP are both Power Platform Makers who are unfamiliar with ALM concepts but want to be able to save their work and a history of changes and share those changes with other users. AA4PP also enables makers who are comfortable with advanced concepts like Git, Pull Requests, Branching, and Merging to work in a familiar way with source control and deployment automation.

The target user for setting up AA4PP is an Administrator with a deeper understanding of Power Platform Environments, Solutions, Azure Pipelines, and familiarity with Azure Active Directory and Dataverse Administration.

![The Maker Team](media/almacceleratorpowerplatform-components/TheMakerTeam.png "The Maker Team")

## Pipelines

The AA4PP Pipelines are a set of YAML pipelines intended to be used with DevOps. Eventually, these pipelines will be ported to support GitHub workflows, but currently only support Azure Pipelines. These reference pipelines were written to demonstrate an end-to-end ALM process for Power Platform solutions. The pipelines use first-party tasks provided by Microsoft, some third-party tasks, and low-level PowerShell scripts to automate all of the ALM scenarios. As such, the pipelines support scenarios related to unpacking / source controlling / building and deploying a solution from a development environment. The pipelines support the ability to deploy to many environments, but only currently demonstrate deployment from a Development environment to a Build Validation to Test and ultimately to Production based on the ALM process used by the CoE Starter Kit development team.

The Pipelines handle the following.

### Import Solution

1. Select an existing Solution from Source Control
1. Import a build of that Solution from Source Control
1. Future: Handle seeding environments with Data and configuring Connection References, Environment Variables, Sharing, and Ownership

### Delete Solution

1. Export an Unmanaged Solution from a Development Environment as Managed.
1. Import Managed Solution to Development Environment
1. Delete the Managed Solution from a Development Environment.

### Commit Solution

1. Create a New Branch Based on an Existing Branch
1. Export an Unmanaged Solution from a Development Environment
1. Unpack Solutions to Human Readable Format
1. Store Unpacked Files in a Git Repository Branch

### Deploy Solution

1. Create a Pull Request in DevOps for your New Branch
1. Run a Build on a Pull Request via Branch Policy to validate your changes including running Solution Checker
1. Include Branch Policies to require more checks such as Reviewers, Work Items Linking

### Deploy to Environment

1. Create a trigger for when your Solution is deployed to an environment
1. Build Managed Solution and Deploy based on Trigger
1. Handle Upgrade vs Update of Solution based on changes in the Solution
1. Handle Setup of the Solution in the Target Environment
   - Deploy configuration data
   - Update Connection References
   - Update Environment Variable Values
   - Share Apps with Azure Active Directory Groups
   - Activate Flows
   - Create Teams in Dataverse for Azure Active Directory Groups
   - Update Solution Component Ownership

## ALM Accelerator App

The AA4PP Canvas App provides a convenience layer on top of the AA4PP Pipelines. The AA4PP Canvas App allows Power Platform Makers to easily invoke the Azure Pipelines to perform their complex tasks without context switching between the Power Apps environment and the DevOps. The goal of the App is to provider Makers with a friction-free way of performing common Development and ALM tasks as described in the following.

1. Target multiple personas (for example: New Maker, Advanced Maker, Team Maker)
1. Target multiple Organization / Projects and Repos in DevOps
1. Get the latest version of a solution into the development environment by importing the solution
1. Remove existing work that needs to be rebased from source control by deleting a solution
1. Push the latest changes from the development environment to source control by committing your solution.
1. Submit the changes tied to a Work Item for Review by creating a pull request
1. Monitor the progress of moving the changes between environments

## ALM Accelerator Flow and Maker Experience

The ALM Accelerator provides the ability for administrators to target specific personas and enable functions based on a maker's needs. For example, teams of makers may require the ability to get others' changes into their isolated maker environment. Retrieving others' changes is possible by using the Import function in the App. However, makers building in isolation on their own solutions may not need this capability and could be confused by its purpose. Additionally, makers who are comfortable with navigating between DevOps and the App may want to be able to drill into a particular process in DevOps to view details about a pipeline's execution. The Drillthrough experience can be enabled for these users or turned off for others to avoid confusion.

Realizing that ALM isn't a one-size-fits-all experience we've included the ability for administrators to cater experiences to their varying users. As such we've created examples of a user experience to explore for the following scenarios.

1. [New Maker Experience](almacceleratorpowerplatform-newmaker.md)
1. [Advanced Maker Experience](almacceleratorpowerplatform-advancedmaker.md)
1. [Administrator Experience](setup-almacceleratorpowerplatform-deployment-profiles.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
