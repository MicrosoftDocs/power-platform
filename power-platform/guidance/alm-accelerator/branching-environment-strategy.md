---
title: Branching and environment strategy
description: Learn about the default environment and branching strategy that ALM Accelerator for Power Platform employs to help you get started with ALM quickly.
author: mikefactorial
ms.author: rusant
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/10/2023
ms.subservice: guidance-toolkit
ms.custom: bap-template
---

# Branching and environment strategy

The ALM Accelerator provides a default environment and branching strategy to help you get started quickly with application lifecycle management (ALM). The default strategy is based on the [CoE Starter Kit](../coe/overview.md) development team's ALM process. It can be [customized to meet your organization's needs](customize-deployment-pipelines.md), but you can adopt the default strategy and use the out-of-the-box pipelines without any customization.

## Branching strategy

The ALM Accelerator's default branching strategy relies on an initial commit branch off the main branch, followed by feature commit branches off the solution branch.

### Initial commit branching

The first time a solution is committed using the ALM Accelerator app, a maker must create a branch for their feature based on the main branch.

:::image type="content" source="media/almaccelerator-branching/FirstRun.png" alt-text="Diagram of the default initial commit branch strategy used by the ALM Accelerator for Power Platform.":::

1. The main branch stores the current production release of the solution. It's where the solution branch is merged when the solution is deployed to the production environment.
1. When a new solution is being committed to source control, the maker creates a branch (the feature branch) from the main branch. A solution branch is also created.
1. When changes are ready to be committed to the solution branch, the maker uses the ALM Accelerator app to create a pull request from the feature branch to the solution branch. The request triggers a deployment to the validation environment.
1. When the pull request has passed all checks, it can be merged. Merging the request triggers a deployment to the test environment.
1. If the solution is ready to be deployed to the production environment, the maker creates a pull request from the solution branch to the main branch. The request triggers a deployment to the production environment.
1. When the solution is deployed to the production environment, both the main branch and the solution branch contain the latest source code for the solution. From this point on, new feature branches are created from the solution branch.

### Feature commit branching

Makers should create a **new feature branch** for subsequent features **based on the solution branch**. The branching strategy here is similar to the initial commit strategy, but the feature branch is created from the solution branch instead of the main branch. The main branch remains unchanged. The solution branch is updated with the latest source code until the solution is ready to be deployed to the production environment, creating a "version next" branch, sometimes referred to as a release branch or v-next branch.

:::image type="content" source="media/almaccelerator-branching/FeatureRun.png" alt-text="Diagram of the default feature commit branch strategy used by the ALM Accelerator for Power Platform.":::

## Environment strategy

By default, when you create a deployment profile using the ALM Accelerator app, it assumes you're using the [default branching strategy](#branching-strategy) and the environment strategy described in the following table.

| Environment | Purpose | Notes |
| --- | --- | --- |
| Dev | Development environment for makers to test and validate changes | Makers can either work in a shared environment or their own isolated environment. |
| Validation | Environment for validating that a solution built from source control can be deployed | Deployment to the validation environment happens automatically based on a branch policy, when a pull request is created from a maker's feature branch to the solution branch. |
| Test | Environment for testing a solution built from source control | Deployment to the test environment happens automatically when a pull request is merged from a maker's feature branch to the solution branch. |
| Production | Production environment for the solution | Deployment to the production environment happens automatically when a pull request is merged from the solution branch to the main branch. |

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
