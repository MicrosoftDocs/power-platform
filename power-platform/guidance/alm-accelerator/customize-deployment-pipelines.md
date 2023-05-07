---
title: Customizing the ALM Accelerator for Power Platform Azure DevOps deployment pipelines 
description: This article describes how to customize ALM Accelerator Azure Pipelines for Microsoft Power Platform using the **Bring your own template** approach.
author: RobStand
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: rstand
ms.reviewer: sericks
---

# Customizing the ALM Accelerator Azure DevOps deployment pipelines

The ALM Accelerator includes out-of-the-box pipelines for deploying to environments, based on a [default environment and branching strategy](branching-environment-strategy.md). The ALM Accelerator pipelines can be easily customized to meet your organization’s needs. This article describes how to customize ALM Accelerator Azure Pipelines for Microsoft Power Platform using the "bring your own template" (BYOT) approach. BYOT allows you to control what triggers a deployment based on your branching strategy. BYOT also allows you to create pipelines for more or less environments than the default three deployment environments (Validation, Test, Production).

The scenario below is only one of many possible scenarios that can be implemented using a BYOT approach.

## How to use BYOT to customize your deployment pipelines

When you install the ALM Accelerator for Power Platform, the pipeline templates in our repository are copied to your Azure DevOps Git repository. Having a copy of the pipeline templates allows you to own and change or extend the pipeline templates without being affected by changes in the CoE Starter Kit GitHub repository. There are three pipeline templates that are copied to your Azure DevOps Git repository that are used by the ALM Accelerator as templates for the deployment pipelines. They are as follows:

| Pipeline template | Description | GitHub location |
| ----------------- | ----------- | --------------- |
build-deploy-validation-SampleSolution.yml | Validation environment deployment pipeline. | [Link](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-validation-SampleSolution.yml)
build-deploy-test-SampleSolution.yml | Test environment deployment pipeline. | [Link](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-test-SampleSolution.yml)
build-deploy-prod-SampleSolution.yml | Production environment deployment pipeline. | [Link](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-prod-SampleSolution.yml)

By copying these out-of-the-box pipeline templates in your Azure DevOps Git repository, you can make changes to them without affecting the upgrade path of the solution. Then you can direct the ALM Accelerator to use these customized templates when generating the deployment pipelines. You can also create new pipeline templates based on these templates for more or less environments than the default three deployment environments or any other custom functionality you want to add to them.

## How to customize the pipeline templates to include a new acceptance environment

### Create a new pipeline template for the acceptance environment

Start by copying the build-deploy-test-SampleSolution.yml file and committing it to your template repository with a new name. For example, you could name the file build-deploy-acceptance-SampleSolution.yml. There are a few placeholders within the pipeline template that are updated when the deployment pipelines are created by the ALM Accelerator. These placeholders are as follows:

| Placeholder | Description | Example |
| ----------- | ----------- | ------- |
| RepositoryContainingTheBuildTemplates | The name of your Azure DevOps Git repository that contains the pipeline templates. | coe-alm-accelerator-templates |
| BranchContainingTheBuildTemplates | The branch in your Azure DevOps Git repository that contains the pipeline templates. | main |
| SampleSolutionName | The name of your solution. | MyNewSolution |
| alm-accelerator-variable-group | The global variable group in your Azure DevOps project the build templates will use for the deployment pipeline.| alm-accelerator-variable-group |

There's no reason to change these placeholders in the pipeline template. The placeholders are replaced by the ALM Accelerator when the deployment pipelines are created. The only thing you need to do is to change the name of the pipeline template to match the name of the environment you want to deploy to. In this example, we want to deploy to an acceptance environment, so we change the name of the pipeline template to build-deploy-acceptance-SampleSolution.yml.

### Update the deployment profile to include the acceptance environment

Deployment profiles in the ALM Accelerator contain the information needed to create the deployment pipelines for a solution. The deployment profile for a solution is stored in the ALM Accelerator solution tables. When you create a new solution and associate it with a profile for the first time, on the first export of that solution the ALM Accelerator export pipeline generates deployment pipelines for the solution based on the information in the deployment profile. The deployment profile for a solution can be updated at any time, and the ALM Accelerator pipelines will update the deployment pipelines for the solution based on the information in the deployment profile.

#### Prerequisites

Create a profile for an existing solution in the ALM Accelerator for Power Platform app. More information: [Create a profile for an existing solution](setup-deployment-user-profiles.md)

#### Add a new deployment step and update the pipeline template name

1. Open the **ALM Accelerator for Power Platform Administration** app.
1. Navigate to the **Deployment Profiles** tab.
1. Open the profile for the solution you want to update.
1. Under **Deployment Steps** select **New Deployment Step**.
1. Name the new deployment step **Acceptance**.
1. Set the **Step Number** to **2**.
1. Create a new **Deployment Environment** for your deployment step and name it **Acceptance**. Set the URL to the URL of your acceptance environment, such as `https://myacceptanceenvironment.crm.dynamics.com/`.
1. Set the **Build Template Path** to the pats of the new pipeline template that you created in your template repository, such as **Pipelines/build-deploy-acceptance-SampleSolution.yml**.
1. Set **Deployable** to **Allowed**, **Approval Type** to **Pull Request**, and **Target Branch** to **[Use Solution Branches]**. These settings are the same as the default value for the test environment, and you can reference the defaults for this step by looking at the test deployment step.

### Validate the new deployment step and pipeline template

After the steps are completed, you can validate the new deployment step and pipeline template by exporting the solution again. The ALM Accelerator creates a new deployment pipeline for the solution based on the new deployment step and pipeline template. You can validate the new deployment pipeline by running a build and deploying to the acceptance environment. You should now have four deployment pipelines for the solution, three for the default environments, and one for the acceptance environment.

## Next steps

> [!div class="nextstepaction"]
> [Configure the pipeline extension points](./setup-hook-extensions.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
