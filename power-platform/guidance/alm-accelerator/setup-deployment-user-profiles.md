---
title: Configure deployment profiles
description: Learn how to use deployment profiles to direct the ALM Accelerator for Power Platform how to connect to your Azure DevOps organization and to provide a default branching strategy for your solutions.
ms.topic: how-to
ms.date: 04/10/2023
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# Configure deployment profiles

Deployment profiles are linked to [deployment user settings](./setup-deployment-user-settings.md). The ALM Accelerator app uses deployment profiles to make decisions for deployment users about where and how to create branches and approvals when they deploy solutions. It also uses them to know how to connect to your Azure DevOps projects and repositories.

## Create deployment profiles using the ALM Accelerator app

Create a profile for your solutions so that you can apply source control and deploy them automatically.

1. Open the ALM Accelerator for Power Platform app. If you have more than one user setting, select an experience in the list. Otherwise, the app uses a default UI.

    If a user setting has been shared with you, you can only perform functions on solutions that have a deployment profile. If a user setting that's shared with you doesn't have a profile for a solution, you can't perform actions on that solution.

1. For a solution that doesn't have a profile assigned, select **Choose a Profile**.

1. Select a profile from the list. Or, select **+** to create one, enter a name for the new profile, select the **Organization**, **Project**, **Repo**, and **Target Branch**, and then select **Create**.

    Creating a new profile automatically populates the deployment environments with the default configuration for validation, test, and production. These environments' URLs contain a placeholder for your environment's actual URL.

1. Enter the URLs for your validation, test, and production environments.

1. Select **Save** to save your changes to the profile, and then save the profile as the default for the solution.

## Update deployment profiles using the ALM Accelerator admin app

You can easily create profiles in the ALM Accelerator app. You can also create and update profiles using the ALM Accelerator admin app. We recommend that you use the ALM Accelerator app to create deployment profiles, and then use the admin app to update them.

The following fields appear in the deployment profile form:

- **Name**: Identifies the profile in the ALM Accelerator app.
- **AzDO Organization**: Identifies the Azure DevOps organization that contains the project and repository for the solution.
- **AzDO Project**: Identifies the Azure DevOps project that contains the repository for the solution.
- **Repository**: Identifies the Azure DevOps repository that contains the solution.
- **Target Branch**: Identifies the branch in the repository that new feature branches are created from and the target branch for new pull requests when a deployment request is made.
    A special value for this field called **[Use Solution Branches]** is the default when you create a profile using the app. This value tells the app to use the branch name of the solution as the target branch for the deployment. This is the recommended value to use. If you decide to use a different value, you may need to [update your pipeline templates](./customize-deployment-pipelines.md) to trigger appropriately.
- **AzDO Pipeline Project**: Identifies the Azure DevOps project that contains the pipelines for the solution.
    If you don't specify a value, the app uses the value in the **AzDO Project** field. This field is rarely used. It's only necessary if you're hosting the export, import, and delete pipelines in a different project than the solution.
- **Service Connection Name**: Identifies the name of the service connection in Azure DevOps to use to connect to Dataverse environments.
    This field allows you to have a single service connection in the Azure DevOps project for all your solutions and pipelines rather than a separate service connection for each. If you don't specify a value, the app assumes the service connection name you're using has the same name as the URL of the Dataverse environment.
- **Repository ID**: Identifies the repository in Azure DevOps and uniquely identifies the repository in the ALM Accelerator app.
    To find this value in Azure DevOps, navigate to the repository in the project settings and copy the value in the URL. For example, if the URL is `https://dev.azure.com/cattools/Project/_settings/repositories?repo=123b59bc-f413-432b-bae5-1d754b725ca9`, the repository ID is `123b59bc-f413-432b-bae5-1d754b725ca9`.

## Next steps

> [!div class="nextstepaction"]
> [Deployment configuration guide](./setup-data-deployment-configuration.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
