---
title: What's in the kit?
description: Learn about the components of the ALM Accelerator for Power Platform that help you follow ALM patterns and practices.
ms.topic: concept-article
ms.date: 04/10/2023
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# What's in the kit?

The ALM Accelerator includes several tools and components that help you implement application lifecycle management (ALM) in your Power Platform environments.

## Azure Pipelines

The ALM Accelerator includes a set of YAML pipelines intended to be used with Azure DevOps. These reference pipelines were written to demonstrate an end-to-end ALM process for Power Platform solutions. The pipelines use tasks provided by Microsoft, some third-party tasks, and low-level PowerShell scripts to automate ALM scenarios related to unpacking, source-controlling, building, and deploying a solution from a development environment. Although the pipelines support deployment to many environments, they only demonstrate the ALM process that's used by the CoE Starter Kit development team: deployment from a development environment to a build validation environment to a test environment and, ultimately, to a production environment.

The pipelines handle the following actions.

### Import a solution

- Select a solution from source control.
- Import a build of that solution from source control.

### Delete a solution

- Export an unmanaged solution from a development environment as managed.
- Import the managed solution to the development environment.
- Delete the managed solution from the development environment.

### Configure solution deployment settings

- Configure connection references and create connections in target deployment environments.
- Configure environment variable values in target deployment environments.
- Configure solution component ownership in target deployment environments.
- Configure and create teams in Dataverse for Microsoft Entra groups in target deployment environments.
- Configure custom connector sharing in target deployment environments.
- Configure webHooks in target deployment environments.
- Configure Power Pages site settings in target deployment environments.

### Commit a solution to a Git repository

- Create a branch based on an existing branch.
- Export an unmanaged solution from a development environment.
- Unpack the solution to a human-readable format.
- Store unpacked files in a Git repository branch.

### Deploy a solution

- Create a pull request in Azure DevOps for a new branch.
- Run a build on the pull request using branch policy to validate changes, including running the [solution checker](/powerapps/maker/data-platform/use-powerapps-checker).
- Include branch policies to require more checks, such as identifying reviewers and linking work items.

### Deploy the solution to an environment

- Create a trigger for when a solution is deployed to an environment.
- Build a managed solution and deploy it based on the trigger.
- Handle upgrading or updating the solution based on changes in the solution.
- Handle the setup of the solution in the target environment:
  - Deploy configuration data.
  - Update connection references.
  - Update environment variable values.
  - Share apps with Microsoft Entra Groups.
  - Activate flows.
  - Create teams in Dataverse for Microsoft Entra Groups.
  - Update solution component ownership.

## ALM Accelerator maker app

A canvas app included with the ALM Accelerator provides a convenience layer on top of Azure Pipelines. The app allows makers to easily invoke pipelines to perform their complex tasks without context-switching between the Power Apps environment and Azure DevOps. The app provides makers with a friction-free way to perform common development and ALM tasks:

- Target multiple personas, such as the new maker, advanced maker, or team maker.
- Target multiple organizations, projects, and repos in Azure DevOps.
- Get the latest version of a solution into the development environment by importing it.
- Remove work that needs to be rebased from source control by deleting a solution.
- Push the latest changes from the development environment to source control by committing a solution.
- Submit the changes tied to a work item for review by creating a pull request.
- Monitor the progress of moving changes between environments.

## ALM Accelerator administration app

Administrators can use the ALM Accelerator administration app to target specific personas and enable functions based on a maker's needs. For example, some makers might need the ability to import changes made by others into their maker environments. Others might work in isolation and might be confused about the purpose of the import feature. Makers who are comfortable with navigating between Azure DevOps and the app might want to be able to drill into a process in Azure DevOps to view details about a pipeline's execution. Others might be confused by the drill-through feature.

Realizing that ALM isn't a one-size-fits-all experience, we've included the ability for administrators to cater experiences to their users. We've created examples of a user experience to explore for specific roles:

> [!div class="nextstepaction"]
> [Set up the ALM Accelerator](./setup-admin-tasks.md)

> [!div class="nextstepaction"]
> [New maker experience](new-maker-experience.md)

> [!div class="nextstepaction"]
> [Advanced maker experience](advanced-maker-experience.md)

> [!div class="nextstepaction"]
> [Administrator experience](setup-deployment-user-profiles.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
