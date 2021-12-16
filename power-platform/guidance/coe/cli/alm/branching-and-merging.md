---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator Branching and Merging"
description: "Discussion of branching and merging for ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Branching and merging

Development as a team of Makers, Advanced Makers, and Professional developers often uncovers new concepts. Often one area of complexity is branching and merging. Using the links below different [Personas](./personas.md) to can review each concept and determine their level of comfort.

1. [Branching and Merging](/azure/devops/repos/git/git-branching-guidance) - Review approaches to branching and merge changes between team members and push changes to test and production environments.

1. [Pull Request](/azure/devops/repos/git/git-branching-guidance?#review-and-merge-code-with-pull-requests) - Determine how changes will be reviewed and merged.

1. [Build Pipelines](/azure/devops/pipelines/get-started/key-pipelines-concepts) - What build pipelines are and how they help automate the integration and deployment process.

The ALM Accelerator for Power Platform (AA4PP) builds on these concepts to allow Power Platform solutions to be managed.

## Example

The example below illustrates two parts of the organization the HR and Finance teams using different DevOps Projects to manage related solutions for each department.

![Branching and Merging Strategy](../media/branching-and-merging-example.png)

### Human Resources team

The Human Resources team manages one Azure DevOps git repository that stores each solution as a folder within the repository. This approach allows Makers in the HR team to see and collaborate on Human Resources related solutions.

#### Human Resources team steps

1. Create a new Azure DevOps Project and from the main branch for a new solution branch named Onboarding.

```bash
coe alm branch \
    -o https://dev.azure.com/contoso \
    -p HR \
    -r HR-Solutions \
    -d Onboarding \
    -s validation=https://contoso-hr-validation.crm.dynamics.com,test=https://contoso-hr-test.crm.dynamics.com,https://contoso-hr.crm.dynamics.com
```

More information: [coe alm branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/branch.md) command

1. After this command is run, a default branch with Azure Pipelines has been created in the repository.

1. The Advanced Maker **Alan Steiener** creates an unmanaged Solution named **Onboarding** in his development environment.

1. Using the AA4PP administration application Alan Created a new feature branch and **Push changes to Git**.

1. Once the initial set of features is complete **Create Pull Request** using the AA4PP Administration application. The validation build pipeline is executed. The Pull Request is approved and then the feature branch is committed to the solution branch.

1. The merged commit can trigger a Continuous Deployment to the test environment.

1. The sets of features are ready for a production deployment a Pull Request can be made to merge changes into the main branch.

1. The build and deployment pipelines can be configured to package the solution to the production environment.

### Finance

The Finance team maintains a separate Azure DevOps Project for Finance related solutions. This Azure DevOps project could be in any of the following locations:

1. The same Azure DevOps project with a different repository from the HR team. For example, there could be different repositories named HR-Solutions and Fin-Solutions.

1. A separate Azure DevOps project and repository. This approach of separate projects and repositories could allow different Role-based security rights to be defined for team department.

1. A separate Azure DevOps Organization, Project, and repository. This configuration would allow different Azure Active Directory tenants to be used.

#### Finance steps

Karen as the Advanced Maker in the finance team follows a similar process to what Alan did inside the HR team.

1. **Karen** creates a new Azure DevOps solution branch for the Expense application.

```bash
coe alm branch \
    -o https://dev.azure.com/contoso \
    -p Finance \
    -r Finance-Solutions \
    -d Expense \
    -s validation=https://contoso-fin-validation.crm.dynamics.com,test=https://contoso-fin-test.crm.dynamics.com,https://contoso-fin.crm.dynamics.com
```

More information: [coe alm branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs//help/alm/branch.md) command

1. After this command is run, a default branch with Azure Pipelines has been created in the repository.

1. **Karen Berg** creates an unmanaged Solution named **Expense** in her development environment.

1. Using the AA4PP Administration application Karen creates a new feature branch with the ID of the work item that has been assigned **385** and **Push changes to Git**.

1. Once the initial set of features is complete **Create Pull Request** using the AA4PP Administration application. The validation build pipeline is executed. The Pull Request is approved and then the feature branch is committed to the solution branch.

1. The merged commit can trigger a Continuous Deployment to the test environment.

1. When the features are ready for a production deployment, a Pull Request can be made to merge changes into the main branch.

1. The build and deployment pipelines can be configured to package the solution to the production environment.

Steps 9 through 14 repeat the process of 3-8 to contribute a new feature to the solution.

### PowerApps Component Framework (PCF)

In this example, the Finance application makes use of a common component to visually interact with their data.

This PCF component is managed in a separate code repository. As new releases are created, they are tagged with release versions.

A release version is imported into a feature branch for a Power Platform solution. This approach allows different versions of the PCF control to be developed and integrated with different solutions over time. In the Finance example version 1.0 to 1.1, which is committed to the **Expense-435** branch to update the PCF control being used.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
