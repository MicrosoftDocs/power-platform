---
title: "ALM Accelerator for Power Platform import configuration | MicrosoftDocs"
description: "On import of a solution from source control, the user can select a deployment configuration file that contains connection information, environment variables, and other settings that are used to configure the solution."
author: alvarezskinner
ms.topic: conceptual
ms.date: 05/22/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
---
# ALM Accelerator for Power Platform import configuration

The ALM Accelerator components enable makers to apply source-control strategies with Azure DevOps and use automated builds and deployment of solutions to downstream environments, as well as into their maker environments. The ability to import solutions from source control into a maker environment is a key component of the ALM accelerator. On import of a solution from source control, the user can select a deployment configuration file that contains connection information, environment variables, and other settings that are used to configure the solution.

## Prerequisites

1. The unmanaged solution must exist in an environment prior to creating deployment configuration for the solution.
1. The environment into which the solution is imported must exist and have connections configured. This can be done using the ALM Accelerator when creating the deployment configuration or manually in the environment.
1. It's currently not possible to hydrate an empty environment with a solution from source control without first creating a deployment configuration based on the unmanaged solution.

## Create a development environment step in your deployment profile

1. Create a new deployment step in the [deployment profile](./setup-deployment-user-profiles.md) for your solution.
1. Open the ALM Accelerator for the Power Platform Administration app.
1. Select **Deployment Profiles** and select the deployment profile for your solution.
1. Select **New Deployment Step** and provide a unique name for the step, such as **My Development Environment**.
1. Set **Step Type** to **Development**.
1. Set **Step Number** to **4**.
1. Set **Build Template Path** to **/Pipelines/build-deploy-dev-SampleSolution.yml**.
1. Create a new environment and set the **Environment Name** and **URL** based on your development environment, such as **My Development Environment** and `https://dev.crm.dynamics.com/`.
1. Save the deployment step.

## Create an import deployment configuration for your solution

1. Open the ALM Accelerator for the Power Platform app.
1. Ensure that the profile you just updated is selected as the solution deployment profile, and then select the **Configure Deployment Settings** link under your solution.
1. Your new deployment step should be listed in the **Select an Environment to Configure** section.
1. Select the environment you just created.
1. Configure your deployment settings for the development environment.
1. Select **Save and Close**.

## Commit deployment settings to source control

1. Select **Commit Solution** from the solution list on the ALM Accelerator for Power Platform app home page.
1. Enter notes and select an existing branch, or create a new branch.
1. Select **Commit Solution**.

## Validate the import deployment configuration

1. From the ALM Accelerator for Power Platform app home page, select **Import Solution**.
1. Select the profile you just updated, and select the branch you just committed to as the **Solution Source**.
1. Select the solution folder.
    > [!NOTE]
    > You may need to refresh (**Ctrl + F5**) the app to see the newly, created solution folder.
1. Select the deployment configuration you just committed to source control and select **Import Solution**.

    :::image type="content" source="media/ImportConfiguration.png" alt-text="Import Configuration Dialog":::

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
