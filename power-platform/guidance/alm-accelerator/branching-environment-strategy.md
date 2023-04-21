---
title: "ALM Accelerator for Power Platform branching and environment strategy | MicrosoftDocs"
description: "The ALM Accelerator includes out-of-the-box pipelines for deploying to environments based on a default environment and branching strategy. The ALM Accelerator pipelines are designed to be easily customized to meet your organization’s needs, but customers who adopt the default strategy can use the out-of-the-box pipelines without any customization."
author: mikefactorial
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: rusant
ms.reviewer: sericks
---

# ALM Accelerator for Power Platform branching and environment strategy

The ALM Accelerator provides a default environment and branching strategy that is designed to help you get started quickly. The default strategy is based on the [CoE Starter Kit](../coe/overview.md) development team’s ALM process. The default strategies are designed to be [customized to meet your organization’s needs](customize-deployment-pipelines.md), but customers who adopt the default strategy can use the out-of-the-box pipelines without any customization.

## ALM Accelerator for Power Platform branching strategy

### Initial Commit Branching

The first time a solution is committed using the ALM Accelerator app, a maker must create a new branch for their feature, based on the main branch.

:::image type="content" source="media/almaccelerator-branching/FirstRun.png" alt-text="Default, initial commit branch strategy":::

1. The main branch is where the current production release of the solution is stored. The main branch is where the solution branch will be merged when the solution is ready to be deployed to the production environment.
1. When a new solution is being committed to source control, the maker will create a new branch from the main branch. This will also create a new solution branch.
1. When a maker is ready to commit their changes to the solution branch, they'll use the ALM Accelerator app to create a pull request from their feature branch to the solution branch. This triggers a deployment to the validation environment.
1. Once all checks have passed on the pull request, the pull request can be merged. This triggers a deployment to the test environment.
1. If the solution is ready to be deployed to the production environment, a pull request can be created from the solution branch to the main branch. This triggers a deployment to the production environment.
1. Once the solution is deployed to the production environment, both the main branch and the solution branch contain the latest source code for the solution. From this point on, the solution branch will be used to create new feature branches.

### Feature Commit Branching

When subsequent features are created by the maker a **new feature branch** should be **created from the solution branch**. The branching strategy is similar to the initial commit strategy, but the feature branch is created from the solution branch instead of the main branch. In this case the main branch remains unchanged and the solution branch is updated with the latest source code until the solution is ready to be deployed to the production environment again providing a version next branch sometimes referred to as a release branch or v-next branch.

:::image type="content" source="media/almaccelerator-branching/FeatureRun.png" alt-text="Default, feature branch strategy":::

## ALM Accelerator for Power Platform environment strategy

By default when you create a deployment profile using the ALM Accelerator app, it will assume that you are using the following environment strategy and the branching strategy described in the previous section.

| Environment | Purpose | Notes |
| --- | --- | --- |
| Dev | Development environment for makers to test and validate changes. | Makers can either work in a shared environment or their own isolated environment.|
| Validation | Environment for validating that a solution built from source control can be deployed. | Deployment to the validation environment happens automatically, based on a branch policy, when a new pull request is created from a maker's feature branch to the solution branch. |
| Test | Environment for testing a solution built from source control. | Deployment to the test environment happens automatically when a pull request is merged from a maker's feature branch to the solution branch. |
| Production | Production environment for the solution. | Deployment to the production environment happens automatically when a pull request is merged from the solution branch to the main branch. |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
