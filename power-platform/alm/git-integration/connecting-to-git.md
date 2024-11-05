---
title: "Dataverse Git integration setup"
description: "This article discusses the integration of Dataverse with Git, focusing on connecting to Azure DevOps and binding your environment for Dynamics 365 and Power Platform."
author: shmcarth
ms.subservice: alm
ms.author: matp
ms.date: 10/29/2024
ms.custom: 
ms.topic: article
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
---
# Dataverse Git integration setup (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Git integration in Dataverse is initiated from Power Platform on the **Solutions** page within the maker experience. This article discusses the integration of Dataverse solutions with Git, focusing on connecting to Azure DevOps and binding your environment for Dynamics 365 and Power Platform.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

## Prerequisites

- Dataverse Git integration feature of [Managed Environments](../../admin/managed-environment-overview.md). Development environments must be enabled as Managed Environments to use the feature.
- An Azure DevOps subscription and licenses for users who interact with source control are required when connecting your Dataverse environment to Git.

   > [!NOTE]
   > A limited number of licenses are available in Azure DevOps in the Basic Plan of the service. Go to [Azure DevOps Services](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/) for more information on pricing and licensing for Azure DevOps.

- Azure DevOps Services permissions for making commits and reading source files is required. Members of the Contributors security group have permission.
- A Power Platform environment with Dataverse and the system administrator security role is required to connect to Git, which completes the initial binding of your environment or solution to a project in Azure DevOps.

## Azure DevOps setup

To get started, you need an Azure DevOps project and repository to connect your Dataverse environment to. If you don't have an Azure DevOps project and repository set up, follow these steps to create a new project and repository in Azure DevOps.

1. Sign in to [Azure DevOps](https://azure.microsoft.com/products/devops/) and select your organization.
1. Select **New project**, enter a name and ensure that your version control is set to Git for your project, and select **Create**.
1. In the new project, select **Repos** and then select **Initialize** at the bottom of the page to initialize the default repository.

Make sure that all users who are making changes in your environment have access to your repository and to commit changes.  Review your Azure DevOps licensing configuration and security groups to ensure that they're able to use the solution source control panel.

## Connect Dataverse to Git

To connect your Dataverse environment to Git, bind your environment to a project in Azure DevOps. You can bind your environment to a project using either environment or solution binding. You can read more about the differences between environment and solution binding in the following sections.

1. Sign in to [Power Apps](https://make.powerapps.com) and then go to **Solutions**.
1. On the **Solutions** page, select **Connect to Git** on the command bar.
1. Select either [**Environment**](#environment-binding) or [**Solution**](#solution-binding) from the connection type options, and select your Azure DevOps organization and project. 
   > [!IMPORTANT]
   > Once set, these settings can't be changed.
   For information more about the differences between environment and solution binding go to [the following section](#how-to-choose-between-environment-and-solution-binding).
1. Depending on your binding type, you can select a project, repository, or branch and enter a folder to bind the environment or solution to. Select **Connect**.

### How to choose between environment and solution binding

> [!IMPORTANT]
> These bindings can't be changed after the initial setup, so it's important to choose the right binding strategy for your organization and environment.

If you're not sure which binding strategy to use, environment binding is the recommended approach to get started with Git integration in Dataverse. Here are some key differences between environment and solution binding to help you decide which approach is right for you.

#### Environment binding

Environment binding is a single process for binding your entire Dataverse environment and all of the unmanaged solutions and components in the environment to a single repository and folder. When you choose to bind the entire environment, all unmanaged customizations done in any custom unmanaged solution are stored in a single Git folder and branch and you don't need to set up any other solutions once selected. The system allows for multiple solutions to use a single root folder location and keeps track of which components belong to each solution in a separate file. It's no longer a requirement to use a unique root folder for each solution. If you're using environment binding, you can select the repository, branch, and folder to bind the environment to during the initial setup.

#### Solution binding

Solution binding can be used to source control multiple solutions within the same environment to separate repositories or folders. Solution binding provides additional flexibility in your source files organization but requires more management on the part of the makers to onboard new solutions to source control. The system requires that there only be one location in source control for each and every solution object, which means that if you're going to choose to bind solutions to different source locations, the system doesn't allow you to have the same component in multiple solutions. Solution binding doesn't require a repository or solution to be selected during the initial setup. Instead, you can select the repository and folder to bind each solution to when you're ready to bind the solution to source control.

#### Other considerations

If you select environment binding, all new unmanaged solutions are automatically synchronized with source code with no further actions, and if you select per solution binding, creation of a new solution later requires that the solution also be configured for source control before being synced to source control. Consider the safety of having all solutions synchronized versus the flexibility of having different folders and source code linkages for each solution.

### Binding a solution to a repository and folder (when using the solution binding strategy)

Once you connected your environment to Git using the solution binding strategy, you can bind a solution to a repository and folder in the same Azure DevOps project.

1. On the **Solutions** page, select the 3 vertical dots next to the solution you want to bind to source control and select **Connect to Git**.
1. Select an existing branch, or create a new branch, and enter a Git folder to bind the solution to and select **Connect**.

### Validate your connection

To validate your connection to Git, create a new solution or make changes to an existing solution and view the changes using these steps:

1. On the **Solutions** page, open the solution where you want to view changes.
1. On the left pane, select **Source control** to view the changes made to the solution.

Now you can view the changes made to the solution and can commit and push the changes to the repository as well as view the current branch your solution is bound to.

## Next steps

After your environment and solutions are connected to Git, you can start making changes to your solutions and committing and pushing those changes to the repository. For more information about source control operations, go to [Source control repository operations (preview)](source-control-operations.md).


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
