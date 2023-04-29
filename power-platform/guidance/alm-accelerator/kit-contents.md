---
title: "ALM Accelerator for Power Platform what's in the kit? | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform includes tools that will help you follow ALM patterns and practices."
author: jenschristianschroder
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---
# ALM Accelerator for Power Platform: What's in the kit?

## Azure Pipelines

The pipelines in the ALM Accelerator for Microsoft Power Platform are a set of YAML pipelines intended to be used with Azure DevOps. These reference pipelines were written to demonstrate an end-to-end ALM process for Power Platform solutions. The pipelines use tasks provided by Microsoft, some third-party tasks, and low-level PowerShell scripts to automate all of the ALM scenarios. As such, the pipelines support scenarios related to unpacking, source-controlling, building, and deploying a solution from a development environment. The pipelines support the ability to deploy to many environments, but currently they only demonstrate the ALM process used by the CoE Starter Kit development team: deployment from a development environment to a build validation to a test environment and, ultimately, to a production environment.

The pipelines handle the following actions.

### Import a solution

1. Select an existing solution from source control.
1. Import a build of that solution from source control.

### Delete a solution

1. Export an unmanaged solution from a development environment as managed.
1. Import the managed solution to the development environment.
1. Delete the managed solution from the development environment.

### Configure solution deployment settings

1. Configure connection references and create connections in target deployment environments.
1. Configure environment variable values in target deployment environments.
1. Configure solution component ownership in target deployment environments.
1. Configure and create teams in Dataverse for Azure Active Directory groups in target deployment environments.
1. Configure custom connector sharing in target deployment environments.
1. Configure WebHooks in target deployment environments.
1. Configure Power Pages site settings in target deployment environments.

### Commit a solution to a Git repository

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
   - Share apps with Azure Active Directory (AD) groups.
   - Activate flows.
   - Create teams in Dataverse for Azure AD Groups.
   - Update solution component ownership.

## ALM accelerator maker app

The app included with the ALM accelerator for Microsoft Power Platform provides a convenience layer on top of the accelerator pipelines. The app allows Microsoft Power Platform makers to easily invoke Azure pipelines to perform their complex tasks without context switching between the Power Apps environment and Azure DevOps. The goal of the app is to provide makers with a friction-free way of performing common development and ALM tasks, which include:

- Target multiple personas, such as the new maker, advanced maker, or team maker.
- Target multiple organizations, projects, and repos in Azure DevOps.
- Get the latest version of a solution into the development environment by importing the solution.
- Remove existing work that needs to be rebased from source control by deleting a solution.
- Push the latest changes from the development environment to source control by committing your solution.
- Submit the changes tied to a work item for review by creating a pull request.
- Monitor the progress of moving changes between environments.

## ALM accelerator administration app

Administrators can use the ALM accelerator administration app to target specific personas and enable functions based on a makers' needs. For example, teams of makers might require the ability to get changes made by others into their isolated, maker environments. Retrieving changes made by others is possible by using the **Import** function in the app. However, when makers build in isolation on their own solutions, they might not need this capability and might be confused by its purpose. Additionally, makers who are comfortable with navigating between Azure DevOps and the app, might want to be able to drill into a particular process in Azure DevOps to view details about a pipeline's execution. The drill-through experience can be enabled for these users or turned off for others to avoid confusion.

Realizing that ALM isn't a one-size-fits-all experience, we've included the ability for administrators to cater experiences to their varying users. As such, we've created examples of a user experience to explore for specific roles:

> [!div class="nextstepaction"]
> [Set up the ALM Accelerator](./setup-admin-tasks.md)

> [!div class="nextstepaction"]
> [New maker experience](new-maker-experience.md)

> [!div class="nextstepaction"]
> [Advanced maker experience](advanced-maker-experience.md)

> [!div class="nextstepaction"]
> [Administrator experience](setup-deployment-user-profiles.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
