---
title: "CoE ALM Accelerator for Power Platform branching and merging (Deprecated)"
description: "Discussion of branching and merging for ALM Accelerator using the Center of Excellence (CoE) command line interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 05/22/2023
ms.subservice: guidance-toolkit
ms.topic: concept-article
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# CoE ALM Accelerator for Power Platform branching and merging (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Please use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Development as a team of makers, advanced makers, and professional developers often uncovers new concepts. One area of complexity is branching and merging. Using the links below, different [personas](./personas.md) can review each concept and determine their level of comfort.

1. [Branching and merging](/azure/devops/repos/git/git-branching-guidance) - Review approaches to branching and merge changes between team members and push changes to test and production environments.

1. [Pull request](/azure/devops/repos/git/git-branching-guidance?#review-and-merge-code-with-pull-requests) - Determine how changes will be reviewed and merged.

1. [Build pipelines](/azure/devops/pipelines/get-started/key-pipelines-concepts) - What build pipelines are and how they help automate the integration and deployment process.

The ALM Accelerator for Power Platform (AA4PP) builds on these concepts to allow Power Platform solutions to be managed.

## Example

The example below illustrates two parts of the organization the HR and Finance teams use different DevOps projects to manage related solutions for each department.

![Branching and merging strategy](../media/branching-and-merging-example.png)

### Human Resources team

The Human Resources team manages one Azure DevOps Git repository that stores each solution as a folder within the repository. This approach allows makers in the HR team to see and collaborate on Human Resources related solutions.

#### Human Resources team steps

1. Create a new Azure DevOps project and from the main branch for a new solution branch named Onboarding.

   ```bash
   coe alm branch \
      -o https://dev.azure.com/contoso \
      -p HR \
      -r HR-Solutions \
      -d Onboarding \
      -s validation=https://contoso-hr-validation.crm.dynamics.com,test=https://contoso-hr-test.crm.dynamics.com,https://contoso-hr.crm.dynamics.com
   ```

More information: [CoE ALM branch](https://aka.ms/coe-cli/help/alm/branch)

1. After this command is run, a default branch with Azure Pipelines is created in the repository.

1. The advanced maker Alan creates an unmanaged solution named **Onboarding** in the development environment.

1. Using the AA4PP administration application Alan created a new feature branch and pushes the changes to Git.

1. Once the initial set of features is complete, select **Create Pull Request** using the AA4PP Administration application. The validation build pipeline is executed. The pull request is approved and then the feature branch is committed to the solution branch.

1. The merged commit triggers a continuous deployment to the test environment.

1. The sets of features are ready for a production deployment. A pull request can be made to merge changes into the main branch.

1. The build and deployment pipelines can be configured to package the solution to the production environment.

### Finance

The Finance team maintains a separate Azure DevOps project for finance related solutions. This Azure DevOps project could be in any of the following locations:

The same Azure DevOps project with a different repository from the HR team. For example, there could be different repositories named HR-Solutions and Fin-Solutions.

- A separate Azure DevOps project and repository. This approach of separate projects and repositories could allow different role-based security rights to be defined for team department.

- A separate Azure DevOps organization, project, and repository. This configuration would allow different Microsoft Entra tenants to be used.

#### Finance steps

Karen as the advanced maker in the Finance team follows a similar process to what Alan did inside the HR team.

1. Karen creates a new Azure DevOps solution branch for the Expense application.

   ```bash
   coe alm branch \
      -o https://dev.azure.com/contoso \
      -p Finance \
      -r Finance-Solutions \
      -d Expense \
      -s validation=https://contoso-fin-validation.crm.dynamics.com,test=https://contoso-fin-test.crm.dynamics.com,https://contoso-fin.crm.dynamics.com
   ```

   More information: [CoE ALM branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs//help/alm/branch.md) command

1. After this command is run, a default branch with Azure Pipelines is created in the repository.

1. Karen creates an unmanaged solution named **Expense** in the development environment.

1. Using the AA4PP Administration application, Karen creates a new feature branch with the ID of the work item that has been assigned **385** and **Push changes to Git**.

1. Once the initial set of features is complete, select **Create Pull Request** using the AA4PP Administration application. The validation build pipeline is executed. The pull request is approved and then the feature branch is committed to the solution branch.

1. The merged commit triggers a continuous deployment to the test environment.

1. When the features are ready for a production deployment, a pull request can be made to merge changes into the main branch.

1. The build and deployment pipelines can be configured to package the solution to the production environment.

Contribute a new feature to the solution by repeating steps 4 through 8.

### PowerApps Component Framework (PCF)

In this example, the finance application makes use of a common component to visually interact with their data.

This PCF component is managed in a separate code repository. As new releases are created, they are tagged with release versions.

A release version is imported into a feature branch for a Power Platform solution. This approach allows different versions of the PCF control to be developed and integrated with different solutions over time. In the finance example, version 1.0 to 1.1, which is committed to the **Expense-435** branch to update the PCF control, is used.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
