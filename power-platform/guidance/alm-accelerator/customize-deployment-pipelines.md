---
title: Customize deployment pipelines with templates
description: Learn how to use your own templates in ALM Accelerator to customize Azure Pipelines for deployments to Power Platform environments.
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/10/2023
ms.subservice: guidance-toolkit
author: RobStand
ms.author: rstand
ms.reviewer: sericks
ms.custom: bap-template
---

# Customize deployment pipelines with templates

The ALM Accelerator includes out-of-the-box pipelines for deploying to environments based on a [default environment and branching strategy](branching-environment-strategy.md). You can easily customize the ALM Accelerator pipelines using a "bring your own template" (BYOT) approach. BYOT allows you to control what triggers a deployment based on your branching strategy. BYOT also allows you to create pipelines for environments other than the default validation, test, and production environments.

The scenario described in this article, [customize the pipeline template to include a new acceptance environment](#customize-the-pipeline-template-for-a-new-acceptance-environment), is only one of many possible scenarios that can be implemented using a BYOT approach.

## Use BYOT to customize your deployment pipelines

When you install the ALM Accelerator for Power Platform, the pipeline templates in the CoE Starter Kit GitHub repository are copied to your Azure DevOps Git repository. With your own copy of the pipeline templates, you can change them without their being affected by changes in our repository or affecting the upgrade path of the solution.

The following table describes the three deployment pipeline templates that are copied to your Azure DevOps Git repository.

| Pipeline template | Description | GitHub location |
| ----------------- | ----------- | --------------- |
| build-deploy-validation-SampleSolution.yml | Validation environment deployment pipeline | [Link](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-validation-SampleSolution.yml) |
| build-deploy-test-SampleSolution.yml | Test environment deployment pipeline | [Link](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-test-SampleSolution.yml) |
| build-deploy-prod-SampleSolution.yml | Production environment deployment pipeline | [Link](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-prod-SampleSolution.yml) |

Direct the ALM Accelerator to use your customized templates when it generates the deployment pipelines. You can use them to deploy solutions to environments other than the default validation, test, and production environments or for any other custom functionality you want to add.

### Placeholders in the pipeline templates

The pipeline templates include placeholders for the templates' location and the global variable group to use for the deployment pipeline. You don't need to change these values. They're updated when the ALM Accelerator creates the deployment pipelines. The only thing you need to do is to change the name of the pipeline template to match the name of the environment you want to deploy to. In the scenario described in this article, the new template is named *build-deploy-acceptance-SampleSolution.yml* because we're deploying to a new acceptance environment.

The following table describes the placeholders in the pipeline templates.

| Placeholder | Description | Example |
| ----------- | ----------- | ------- |
| RepositoryContainingTheBuildTemplates | The name of your Azure DevOps Git repository that contains the pipeline templates | *coe-alm-accelerator-templates* |
| BranchContainingTheBuildTemplates | The branch in your Azure DevOps Git repository that contains the pipeline templates | main |
| SampleSolutionName | The name of your solution | *MyNewSolution* |
| alm-accelerator-variable-group | The global variable group in your Azure DevOps project the build templates use for the deployment pipeline. | *alm-accelerator-variable-group* |

## Customize the pipeline template for a new acceptance environment

In this scenario, you want to use a pipeline template to deploy a solution to your acceptance environment. Acceptance isn't one of the three default environments for which a pipeline template is provided. You need to create one.

Copy one of the default templates, for example, *build-deploy-test-SampleSolution.yml*, and commit it to your template repository with a new name that's based on the environment to deploy to. In this example, name it *build-deploy-acceptance-SampleSolution.yml*.

### Update the deployment profile to include the acceptance environment

In the ALM Accelerator, deployment profiles contain the information needed to create the deployment pipelines for a solution. The deployment profile for a solution is stored in the ALM Accelerator solution tables. When you associate a solution with a profile and export it, the ALM Accelerator export pipeline generates deployment pipelines for the solution based on the information in the deployment profile. The deployment profile can be updated at any time.

#### Prerequisites

[Create a profile for a solution](setup-deployment-user-profiles.md) in the ALM Accelerator app.

#### Add a new deployment step and update the pipeline template name

1. Open the ALM Accelerator app.
1. Select the **Deployment Profiles** tab, and then open the profile for the solution you want to update.
1. Under **Deployment Steps**, select **New Deployment Step**.
1. Name the new deployment step *Acceptance*.
1. Set the **Step Number** to *2*.
1. Create a **Deployment Environment** for your deployment step and name it *Acceptance*.
1. Set the URL to the URL of your acceptance environment; for example, *`https://myacceptanceenvironment.crm.dynamics.com/`*.
1. Set the **Build Template Path** to the path to the pipeline template you created; for example, *Pipelines/build-deploy-acceptance-SampleSolution.yml*.
1. Set **Deployable** to **Allowed**, **Approval Type** to **Pull Request**, and **Target Branch** to **[Use Solution Branches]**.  

    These settings are the same as the default values for the test environment. You can find the defaults for this step by looking at the test deployment step.

### Validate the new deployment step and pipeline template

To validate the new deployment step and pipeline template, export the solution again. The ALM Accelerator creates a deployment pipeline for the solution based on the new deployment step and pipeline template.

To validate the new deployment pipeline, run a build and deploy it to the acceptance environment.

You should now have four deployment pipelines for your solution: three for the default environments and one for the acceptance environment.

## Next steps

> [!div class="nextstepaction"]
> [Configure the pipeline extension points](./setup-hook-extensions.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
