---
title: "Configure deployment profiles for the ALM Accelerator for Power Platform app | MicrosoftDocs"
description: "Deployment profiles direct the ALM Accelerator for Power Platform how to connect to your Azure DevOps organization and provide a default branching strategy for your solutions."
author: jenschristianschroder
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---
# Configure deployment profiles for the ALM Accelerator for Power Platform app

Deployment profiles are linked to [deployment user settings](./setup-deployment-user-settings.md). The app uses deployment profiles to make decisions for the user on where and how to create branches and approvals for deployment as well as how to connect to your Azure DevOps projects and repositories.

## Create deployment profiles by using the ALM Accelerator app

1. Open the ALM Accelerator for Power Platform app.

   - If the user has more than one deployment user setting shared with them, the app displays a drop-down list for the user to choose their experience.

   - If a user only has one deployment user setting shared with them, the drop-down list to choose their experience isn't displayed. Instead, their default user setting is used by the app.

   - If no user setting is shared with the user, the app creates a new user deployment setting for the user and uses the default interface for the app.

2. Create a new profile for your solution. To begin source-controlling and deploying a solution, you must have a profile associated with that solution.

   > [!NOTE]
   > Users who have a user setting shared with them can only perform functions on solutions to which they've been assigned a profile already. If a user has a user setting shared with them that doesn't have a profile that's already assigned to a solution, they won't be able to perform actions on that solution.

   1. For a solution that doesn't have a profile assigned, select **Choose a Profile**.

   1. Choose an existing profile from the drop-down list, or select **+** to create a new profile.

   1. Enter a name for the profile, and select the **Organization**, **Project**, **Repo**, and **Target Branch**.

   1. Select **Create**. Creating a new profile automatically populates the deployment environments with the default configuration for validation, test, and production. These environments' URLs contain a placeholder for your environment's actual URL.

   1. Enter the URLs for your validation, test, and production environments.

   1. Select **Save** to save your changes to the profile, and save the profile as the default for the solution.

After the profile is saved, you'll be able to commit and deploy your solution.

## Update deployment profiles by using the ALM Accelerator admin app

Creating a new profile from the ALM Accelerator app makes it easy to get started. However, you can also create and update profiles by using the ALM Accelerator admin app. It's recommended that you use the ALM Accelerator app to create deployment profiles initially, and then update them by using the ALM Accelerator admin app.

In this section, we'll describe the fields in the deployment profile form.

- **Name** - The name of the profile. This name is used to identify the profile in the ALM Accelerator app.
- **AzDO Organization** - The Azure DevOps organization that contains the project and repository for the solution.
- **AzDO Project** - The Azure DevOps project that contains the repository for the solution.
- **Repository** - The Azure DevOps repository that contains the solution.
- **Target Branch** - The branch in the repository that new feature branches are created from and the target branch for new pull requests when a deployment request is made. There's a special value for this field called **[Use Solution Branches]** that is the default when you create a profile using the app. This value tells the app to use the branch name of the solution as the target branch for the deployment. This is the recommended value to use. If you decide to choose another value, you may need to update your pipeline templates to trigger appropriately. For more on updating pipeline templates, see [Bring Your Own Templates](./customize-deployment-pipelines.md).
- **AzDO Pipeline Project** - This field is used to specify the Azure DevOps project that contains the pipelines for the solution. If you don't specify a value, the app uses the value in the **AzDO Project** field. This is rarely used and only necessary if you're hosting the export, import, and delete pipelines in a different project than the solution.
- **Service Connection Name** - The name of the service connection in Azure DevOps to use to connect to Dataverse environments. This allows you to have a single service connection in the Azure DevOps project for all of your solutions and pipelines rather than a service connection per pipeline and solution. If you don't specify a value, the app assumes the service connection name being used has the same name as the URL of the Dataverse environment.
- **Repository ID** - The ID of the repository in Azure DevOps. This is used to uniquely identify the repository in the ALM Accelerator app. This value can be found in Azure DevOps by navigating to the repository in the project settings and copying the value from the URL. For example, if the URL is `https://dev.azure.com/cattools/Project/_settings/repositories?repo=123b59bc-f413-432b-bae5-1d754b725ca9`, the repository ID is `123b59bc-f413-432b-bae5-1d754b725ca9`.

## Next steps

> [!div class="nextstepaction"]
> [Configuration and data deployment in pipelines](./setup-data-deployment-configuration.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
