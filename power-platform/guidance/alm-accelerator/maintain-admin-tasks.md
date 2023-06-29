---
title: "Maintain the ALM Accelerator for Microsoft Power Platform | MicrosoftDocs"
description: "The ALM Accelerator for Microsoft Power Platform helps you follow ALM patterns and practices to move your solutions from your development environment to test and production environments by using Azure DevOps. This guide walks through the maintenance tasks and Azure DevOps project configurations you need to perform for new solutions and projects."
author: mikefactorial
ms.topic: conceptual
ms.date: 05/22/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---

# Maintain the ALM Accelerator for Microsoft Power Platform

Once a project is onboarded to the ALM Accelerator, there are many tasks you can perform to maintain the project. This guide walks through the maintenance tasks and Azure DevOps project configurations you need to perform for new solutions and projects.

## Onboarding new users to Azure DevOps

1. Open the ALM Accelerator Admin app and select your Azure DevOps organization from the drop-down list.
1. Select a project from the list to add a new user to.
1. Under **Team Members**, view the current list of users in the project.
1. Add and remove users from your Azure DevOps project based on current users in the organization.

## View existing pipelines in Azure DevOps

1. Open the ALM Accelerator Admin app and select your Azure DevOps organization from the drop-down list.
1. Select a project from the list to view existing pipelines.
1. View the current list of pipelines in the project. From here, you can view the pipeline details and the YAML for the pipeline by selecting the pipeline name and selecting **View**,

## View and create repositories in Azure DevOps

1. Open the ALM Accelerator Admin app and select your Azure DevOps organization from the drop-down list.
1. Select a project from the list to view or create repositories in your project.
1. Under repositories, view the current list of repositories in the project. From here, you can view the repository details by selecting **View**.
1. Create new repositories by selecting **New**.
1. If you set up your project using the project wizard, you can upgrade an existing ALM Accelerator template repository to the latest version by selecting **Upgrade**. For more information on how the upgrade process works, see [Upgrade the ALM Accelerator for Power Platform app](setup-upgrade-configuration.md). If your project wasn't setup using the setup wizard, creating the sync-pipeline-repo pipeline manually will allow you to use the upgrade feature in the future.

## Onboarding new maker or deployment environments
When new maker or deployment environments are joining the ALM process, you'll need to on-board those environments. This includes creating app users in Dataverse and new service connections in Azure DevOps to allow the pipelines to connect to the environment.

### Create an app user in your Dataverse environments

Before creating new service connections for new environments, you'll need to configure an app user in the Dataverse environment using the following steps for each environment.

1. Go to [Power Platform admin center](https://aka.ms/ppac).

1. Select your environment, and then select **Settings**.

1. Select **Users + permissions** > **Application users**.

1. Select **New app user** to add a new application user.

1. Select the Azure app registration you created, **Business Unit**, and **Security Role**.

    > [!NOTE]
    > We recommend that you give this user system administrator role privileges, so that the user can perform the required functions in each of the environments.

### Create, edit, and delete service connections

When onboarding a new maker environment or deployment environment, you need to create a service connection to the environment. This service connection is used to deploy the solution to the environment. You can create, edit, and delete service connections from the ALM Accelerator Admin app.

1. Open the ALM Accelerator Admin app and select your Azure DevOps organization from the drop-down list.
1. Select a project from the list to add a new service connection or view existing service connections.
1. Create a new service connection by selecting **New**.
1. Delete an existing service connection by selecting the **Delete** button.
1. Edit an existing service connection by selecting the **Edit** button.

## View existing variable groups

A default variable group is created when setting up a new project using the project wizard. This variable group is used to drive many of the pipelines in the ALM Accelerator. You can view the variable group by selecting the **View** button.

## Read more

- [Use the ALM Accelerator for Power Platform app](overview.md)
- [Configure deployment user settings](setup-deployment-user-settings.md)
- [Configuring deployment profiles](setup-deployment-user-profiles.md)
- [Configuration and data deployment in pipelines](setup-data-deployment-configuration.md)
- [Configuring pipeline sync](setup-pipeline-sync.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
