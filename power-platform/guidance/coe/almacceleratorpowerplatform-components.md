---
title: "Use the ALM Accelerator for Power Platform app | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform app will help you follow ALM patterns and practices. It enables you to establish source control for your solutions and move them from your development environment to test and production environments by using Azure DevOps"
author: jenschristianschroder
manager: devkeydet
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
# Use the ALM accelerator for Power Platform app (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. While in preview we will be prioritizing feedback and bugs via GitHub [New issue](https://github.com/microsoft/coe-starter-kit/labels/alm-accelerator). If the issue is something in the platform all we can do is funnel feedback to the responsible product teams. For more information on the current preview status of the ALM Accelerator for Power Platform [follow this link](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/PREVIEW.md).

## License requirements for users of ALM Accelerator for Power Platform

ALM Accelerator for Power Platform uses the following premium Power Platform features

- Dataverse
- Custom Connector
- HTTP with Azure AD connector

For Makers to use the features of the ALM Accelerator they need the following licenses

- Power Apps Per User or Per App license
- Azure DevOps Basic Plan

## Demo: ALM Accelerator for Power Platform

Watch how to use the ALM accelerator for Microsoft Power Platform.
[Demo Videos](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md)

## What's in the ALM accelerator for Microsoft Power Platform?

Makers and maker teams can use the ALM accelerator for Microsoft Power Platform to implement source control and deploy solutions in Microsoft Power Platform. With the ALM Accelerator for Power Platform app, makers can perform source control, enable version history, and deploy their solutions in Power Platform. The combination of Azure Pipelines and the app is what makes up the full ALM accelerator for Microsoft Power Platform.

While an advanced knowledge of ALM isn't required to use the accelerator, it's important that makers understand how to use solutions in Microsoft Power Platform. To use the ALM accelerator for Microsoft Power Platform, all of your components—such as apps, flows, customizations, and other components—must be contained in a solution. To learn more about solutions, go to [Manage solutions in Power Apps and Power Automate](/learn/modules/manage-solutions-power-automate/).

The target users for the ALM Accelerator for Power Platform app include:

- Power Platform makers who are unfamiliar with ALM concepts but want to be able to save their work along with a history of changes, and share those changes with other users.
- Makers who are comfortable with the advanced concepts of using Git—such as pull requests, branching, and merging—to work in a familiar way with source control and deployment automation.

The target user for setting up the ALM accelerator for Microsoft Power Platform is an administrator with a deeper understanding of Power Platform environments, solutions, Azure Pipelines, and familiarity with Azure Active Directory (Azure AD) and Microsoft Dataverse administration.

![The maker team.](media/almacceleratorpowerplatform-components/TheMakerTeam.png "The maker team")

## Pipelines

>[!NOTE]
>Currently, the accelerator only supports Azure Pipelines.

The pipelines in the ALM accelerator for Microsoft Power Platform are a set of YAML pipelines intended to be used with Azure DevOps. These reference pipelines were written to demonstrate an end-to-end ALM process for Microsoft Power Platform solutions. The pipelines use tasks provided by Microsoft, some third-party tasks, and low-level PowerShell scripts to automate all of the ALM scenarios. As such, the pipelines support scenarios related to unpacking, source-controlling, building, and deploying a solution from a development environment. The pipelines support the ability to deploy to many environments, but currently they only demonstrate the ALM process used by the CoE Starter Kit development team: deployment from a development environment to a build validation to a test environment and, ultimately, to a production environment.

The pipelines handle the following actions.

### Import a solution

1. Select an existing solution from source control.
1. Import a build of that solution from source control.

### Delete a solution

1. Export an unmanaged solution from a development environment as managed.
1. Import the managed solution to the development environment.
1. Delete the managed solution from the development environment.

### Commit a solution

1. Create a new branch based on an existing branch.
1. Export an unmanaged solution from a development environment.
1. Unpack the solution to a human-readable format.
1. Store unpacked files in a Git repository branch.

### Deploy a solution

1. Create a pull request in Azure DevOps for your new branch.
1. Run a build on the pull request via branch policy to validate your changes, including running [Solution Checker](/powerapps/maker/data-platform/use-powerapps-checker).
1. Include branch policies to require more checks, such as identifying reviewers and linking work items.

### Deploy the solution to an environment

1. Create a trigger for when your solution is deployed to an environment.
1. Build a managed solution, and deploy it based on the trigger.
1. Handle upgrading or updating the solution based on changes in the solution.
1. Handle the setup of the solution in the target environment:
   - Deploy configuration data.
   - Update connection references.
   - Update environment variable values.
   - Share apps with Azure AD Groups.
   - Activate flows.
   - Create teams in Dataverse for Azure AD Groups.
   - Update solution component ownership.

## ALM accelerator app

The canvas app included with the ALM accelerator for Microsoft Power Platform provides a convenience layer on top of the accelerator pipelines. The canvas app allows Microsoft Power Platform makers to easily invoke Azure Pipelines to perform their complex tasks without context switching between the Power Apps environment and Azure DevOps. The goal of the app is to provide makers with a friction-free way of performing common development and ALM tasks, which include:

- Target multiple personas (for example, new maker, advanced maker, or team maker).
- Target multiple organizations, projects, and repos in Azure DevOps.
- Get the latest version of a solution into the development environment by importing the solution.
- Remove existing work that needs to be rebased from source control by deleting a solution.
- Push the latest changes from the development environment to source control by committing your solution.
- Submit the changes tied to a work item for review by creating a pull request.
- Monitor the progress of moving changes between environments.

## ALM accelerator flow and the maker experience

Administrators can use the ALM accelerator for Microsoft Power Platform to target specific personas and enable functions based on a maker's needs. For example, teams of makers might require the ability to get others' changes into their isolated maker environments. Retrieving others' changes is possible by using the **Import** function in the app. However, makers building in isolation on their own solutions might not need this capability and might be confused by its purpose. Additionally, makers who are comfortable with navigating between Azure DevOps and the app might want to be able to drill into a particular process in Azure DevOps to view details about a pipeline's execution. The drillthrough experience can be enabled for these users or turned off for others to avoid confusion.

Realizing that ALM isn't a one-size-fits-all experience, we've included the ability for administrators to cater experiences to their varying users. As such, we've created examples of a user experience to explore for the following scenarios:

- [New maker experience](almacceleratorpowerplatform-newmaker.md)
- [Advanced maker experience](almacceleratorpowerplatform-advancedmaker.md)
- [Administrator experience](setup-almacceleratorpowerplatform-deployment-profiles.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
