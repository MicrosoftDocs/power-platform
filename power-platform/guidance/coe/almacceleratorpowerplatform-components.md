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
# Use the ALM Accelerator for Power Platform App (preview)

> [!NOTE]
> ALM Accelerator for Power Platform (AA4PP) is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

## Demo: ALM Accelerator for Power Platform

Watch how to use the ALM Accelerator for Power Platform solution.
[Demo Videos](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md)

## What's in the solution?

The ALM Accelerator for Power Platform (AA4PP) is an application that allows makers and maker teams to source control and deploy solutions in the Power Platform. With the ALM Accelerator for Power Platform, makers can source control, enable version history, and deploy their solutions in the Power Platform. The combination of the Azure pipelines and the app is what make up the full ALM Accelerator for Power Platform (AA4PP) solution.

While an advanced knowledge of ALM is not required to use AA4PP, it's important that makers understand how to use solutions in the Power Platform. To use the AA4PP all of your components, such as apps, flows, customizations, and other components, must be contained in a solution. To learn more about solutions, go to this overview [Manage solutions in Power Apps and Power Automate](/learn/modules/manage-solutions-power-automate/).

The target users for AA4PP are both Power Platform makers who are unfamiliar with ALM concepts but want to be able to save their work and a history of changes and share those changes with other users. AA4PP also enables makers who are comfortable with advanced concepts using Git, such as pull requests, branching, and merging to work in a familiar way with source control and deployment automation.

The target user for setting up AA4PP is an administrator with a deeper understanding of Power Platform environments, solutions, Azure Pipelines, and familiarity with Azure Active Directory and Dataverse administration.

![The Maker Team](media/almacceleratorpowerplatform-components/TheMakerTeam.png "The Maker Team")

## Pipelines

The AA4PP pipelines are a set of YAML pipelines intended to be used with DevOps. These reference pipelines were written to demonstrate an end-to-end ALM process for Power Platform solutions. The pipelines use first-party tasks provided by Microsoft, some third-party tasks, and low-level PowerShell scripts to automate all of the ALM scenarios. As such, the pipelines support scenarios related to unpacking / source controlling / building and deploying a solution from a development environment. The pipelines support the ability to deploy to many environments, but only currently demonstrate deployment from a development environment to a build validation to test and ultimately to production based on the ALM process used by the CoE Starter Kit development team. Currently, the pipelines support only Azure Pipelines.

The pipelines handle the following actions.

### Import solution

1. Select an existing solution from source control.
1. Import a build of that solution from source control.

### Delete solution

1. Export an unmanaged solution from a development environment as managed.
1. Import the managed solution to the development environment.
1. Delete the managed solution from the development environment.

### Commit solution

1. Create a new branch based on an existing branch.
1. Export an unmanaged solution from a development environment.
1. Unpack solutions to human readable format.
1. Store unpacked files in a Git repository branch.

### Deploy solution

1. Create a pull request in DevOps for your new branch.
1. Run a build on the pull request via branch policy to validate your changes including running [Solution Checker](/powerapps/maker/data-platform/use-powerapps-checker).
1. Include branch policies to require more checks such as reviewers and work items linking.

### Deploy to environment

1. Create a trigger for when your solution is deployed to an environment.
1. Build managed solution and Deploy based on the trigger.
1. Handle upgrade or update of solution based on changes in the solution.
1. Handle set up of the solution in the target environment.
   - Deploy configuration data.
   - Update connection references.
   - Update environment variable values.
   - Share apps with Azure Active Directory Groups.
   - Activate flows.
   - Create teams in Dataverse for Azure Active Directory Groups.
   - Update solution component ownership.

## ALM Accelerator app

The AA4PP canvas app provides a convenience layer on top of the AA4PP pipelines. The AA4PP canvas app allows Power Platform makers to easily invoke the Azure Pipelines to perform their complex tasks without context switching between the Power Apps environment and the DevOps. The goal of the app is to provide makers with a friction-free way of performing common development and ALM tasks as described in the following.

1. Target multiple personas (for example: new maker, advanced maker, team maker).
1. Target multiple organization, projects, and repos in DevOps.
1. Get the latest version of a solution into the development environment by importing the solution.
1. Remove existing work that needs to be rebased from source control by deleting a solution.
1. Push the latest changes from the development environment to source control by committing your solution.
1. Submit the changes tied to a work item for review by creating a pull request.
1. Monitor the progress of moving the changes between environments.

## ALM Accelerator flow and maker experience

The ALM Accelerator provides the ability for administrators to target specific personas and enable functions based on a maker's needs. For example, teams of makers may require the ability to get others' changes into their isolated maker environment. Retrieving others' changes is possible by using the **Import** function in the app. However, makers building in isolation on their own solutions may not need this capability and could be confused by its purpose. Additionally, makers who are comfortable with navigating between DevOps and the app may want to be able to drill into a particular process in DevOps to view details about a pipeline's execution. The drill through experience can be enabled for these users or turned off for others to avoid confusion.

Realizing that ALM isn't a one-size-fits-all experience, we've included the ability for administrators to cater experiences to their varying users. As such, we've created examples of a user experience to explore for the following scenarios.

1. [New maker experience](almacceleratorpowerplatform-newmaker.md)
1. [Advanced maker experience](almacceleratorpowerplatform-advancedmaker.md)
1. [Administrator experience](setup-almacceleratorpowerplatform-deployment-profiles.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
