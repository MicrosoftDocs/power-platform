---
title: Create an import deployment configuration
description: Learn how to create a deployment configuration file that contains connection information, environment variables, and other settings that are used to configure a solution that's imported from source control in ALM Accelerator for Power Platform.
ms.topic: how-to
ms.date: 05/22/2023
ms.subservice: guidance-toolkit
author: alvarezskinner
ms.author: mapichle
ms.reviewer: sericks
ms.custom: bap-template
---

# Create an import deployment configuration

Makers can use ALM Accelerator components to apply source control strategies with Azure DevOps, including fully automated builds and deployments, without needing intimate knowledge of downstream technologies or manual intervention. The ability to import solutions from source control into a maker environment is a key component of the ALM Accelerator. When makers import a solution from source control, they can select a deployment configuration file that contains connection information, environment variables, and other settings that are used to configure the solution.

## Prerequisites

- The unmanaged solution must exist in an environment before the deployment configuration is created.
- The environment into which the solution is imported must exist and have connections configured, either using the ALM Accelerator when creating the deployment configuration or manually in the environment.
- To import a solution from source control into an empty environment, first create a deployment configuration based on the unmanaged solution.

## Create a development environment step in your deployment profile

1. Create a deployment step in the [deployment profile](./setup-deployment-user-profiles.md) for your solution.
1. Open the ALM Accelerator administration app.
1. Select **Deployment Profiles**, and then select the deployment profile for your solution.
1. Select **New Deployment Step**, and then provide a unique name for the step, such as *My Development Environment*.
1. Set **Step Type** to **Development**.
1. Set **Step Number** to *4*.
1. Set **Build Template Path** to, for example, */Pipelines/build-deploy-dev-SampleSolution.yml*.
1. Create a new environment and set the **Environment Name** and **URL** based on your development environment.
1. Save the deployment step.

## Create an import deployment configuration for your solution

1. Open the ALM Accelerator app.
1. Make sure the profile you updated is selected as the solution deployment profile, and then select **Configure Deployment Settings** under your solution.
    Your new deployment step should be listed in the **Select an Environment to Configure** section.
1. Select the environment you created.
1. Configure the deployment settings for the development environment.
1. Select **Save and Close**.

## Commit deployment settings to source control

1. On the ALM Accelerator app home page, select **Commit Solution** in the solution list.
1. Enter notes and select or create a branch.
1. Select **Commit Solution**.

## Validate the import deployment configuration

1. On the ALM Accelerator app home page, select **Import Solution**.
1. Select the profile you updated, and then select the branch you committed as the **Solution Source**.
1. Select the solution folder.
    You may need to refresh (Ctrl+F5) the app to see the new solution folder.
1. Select the deployment configuration you committed to source control, and then select **Import Solution**.

    :::image type="content" source="media/ImportConfiguration.png" alt-text="Screenshot of the Import Configuration page in the ALM Accelerator app.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
