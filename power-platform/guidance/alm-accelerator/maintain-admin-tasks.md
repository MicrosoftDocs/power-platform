---
title: Maintain ALM Accelerator projects
description: Learn how to perform maintenance tasks and Azure DevOps project configurations in the ALM Accelerator for Power Platform.
ms.topic: how-to
ms.date: 08/05/2025
ms.subservice: guidance-toolkit
author: mikefactorial
ms.author: jeschro
ms.reviewer: jhaskett-msft
ms.custom: bap-template
---

# Maintain ALM Accelerator projects

After you onboard a project to the ALM Accelerator, you need to perform certain tasks to maintain it. This article describes the maintenance tasks and Azure DevOps project configurations you need to perform for new solutions and projects.

## Onboard new users to Azure DevOps

1. Open the ALM Accelerator administration app and select your Azure DevOps organization.
1. Select a project.
1. Under **Team Members**, add users to the project. You can also remove users from the project here.

## View pipelines in Azure DevOps

1. Open the ALM Accelerator administration app and select your Azure DevOps organization.
1. Select a project.
1. View the list of pipelines in the project.
    To view the pipeline's details and the YAML for the pipeline, select its name, and then select **View**.

## View, create, and upgrade repositories in Azure DevOps

1. Open the ALM Accelerator administration app and select your Azure DevOps organization.
1. Select a project.
1. Under **Repositories**, view the list of repositories in the project.
    From here, select **New** to view the repository's details.

To create a repository, select **New**.

If you set up your project using the project wizard, you can select **Upgrade** to [upgrade an ALM Accelerator template repository](setup-upgrade-configuration.md) to the latest version. If your project didn't use the wizard, [create the sync-pipeline-repo pipeline manually](setup-pipeline-sync.md) to use the upgrade feature in the future.

## Onboard new maker or deployment environments

When a new maker or deployment environment joins the ALM process, you need to onboard it to the ALM Accelerator. Onboarding includes creating app users in Dataverse and new service connections in Azure DevOps to allow the pipelines to connect to the new environment.

### Create an app user in your Dataverse environments

1. Go to the [Power Platform admin center](https://aka.ms/ppac).

1. Select your environment, and then select **Settings**.

1. Select **Users + permissions** > **Application users**.

1. Select **New app user**.

1. Select the Microsoft Entra application, **Business Unit**, and **Security Role**.

    > [!NOTE]
    > We recommend that you give this user system administrator role privileges, so the user can perform the required functions in each of the environments.

### Create, edit, and delete service connections

Create a service connection to the new environment to deploy the solution to it. Create, edit, and delete service connections in the ALM Accelerator administration app.

1. Open the ALM Accelerator administration app and select your Azure DevOps organization.
1. Select a project to add a new service connection or view existing service connections.
    - To create a service connection, select **New**.
    - To delete a service connection, select **Delete**.
    - To edit a service connection, select **Edit**.

## View variable groups

A variable group is created when you set up a new project using the project wizard. This variable group drives many of the pipelines in the ALM Accelerator. To view the variable group, select the **View** button.

## Related information

- [ALM Accelerator for Power Platform](overview.md)
- [Configure deployment user settings](setup-deployment-user-settings.md)
- [Configure deployment profiles](setup-deployment-user-profiles.md)
- [Deployment configuration guide](setup-data-deployment-configuration.md)
- [Configure pipeline sync](setup-pipeline-sync.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
