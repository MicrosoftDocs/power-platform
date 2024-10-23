---
title: "Getting started with Dataverse Git integration"
description: "This page discusses the integration of Dataverse with Git, focusing on connecting to Azure DevOps and binding your environment for Dynamics 365 and Power Platform."
author: shmcarth
ms.subservice: alm
ms.author: matp
ms.date: 04/16/2024
ms.custom: 
ms.topic: article
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
---

# Getting started with Dataverse Git integration

Git integration in Dataverse is initiated from the Power Platform on the Solutions page in Dataverse. This page discusses the integration of Dataverse with Git, focusing on connecting to Azure DevOps and binding your environment for Dynamics 365 and Power Platform.

## Prerequisites

- Git integration for Dataverse is a Managed Environment feature and requires that your maker environments be converted to managed environments during the initial setup if the environment isn't already a managed environment.
- An Azure DevOps subscription and licenses for users who interact with source control are required when connecting your Dataverse environment to Git.

> [!NOTE]
> A limited number of licenses are available in Azure DevOps in the Basic Plan of the service. See [Azure DevOps Services](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/) for more information on pricing and licensing for Azure DevOps.

- A Power Platform environment with the necessary permissions to connect to Azure DevOps and bind your environment to a project in Azure DevOps.

## Azure DevOps setup

To get started, you need an Azure DevOps project and repository to connect your Dataverse environment to. If you don't have an Azure DevOps project and repository set up, follow these steps to create a new project and repository in Azure DevOps.

1. Sign in to [Azure DevOps](https://dev.azure.com/) and select your organization.
1. Select **New project**, enter a name and ensure that your Version control is set to Git for your project, and select **Create**.
1. In the new project, select **Repos** and then select **Initialize** at the bottom of the page to initialize the default repository.

## Connect Dataverse to Git

To connect your Dataverse environment to Git, you need to bind your environment to a project in Azure DevOps. You can bind your environment to a project using either environment or solution binding. You can read more about the differences between environment and solution binding in the following sections.

1. Sign in to the [Power Platform maker portal](https://make.powerapps.com) and navigate to the **Solutions** page.
1. On the Solutions page, select **Connect to Git** from the command bar.
1. Select either [**Environment**](#environment-binding) or [**Solution**](#solution-binding) from the connection type options and select your Azure DevOps organization and project. You can read more about the differences between environment and solution binding [in the following section](#how-to-choose-between-environment-and-solution-binding).
1. Depending on your binding type, you can select a project, repository, branch and enter a folder to bind the environment or solution to and select **Connect**.

### How to choose between Environment and Solution binding

> [!IMPORTANT]
> These bindings are not modifiable after the initial setup, so it's important to choose the right binding strategy for your organization and environment.

If you're not sure which binding strategy to use, environment binding is the recommended approach to get started with Git integration in Dataverse. Here are some key differences between environment and solution binding to help you decide which approach is right for you.

#### Environment binding

Environment binding is a single process for binding your entire Dataverse environment and all of the unmanaged solution and components in the environment to a single repository and folder. When you choose to bind the entire environment, all unmanaged customizations done in any custom unmanaged solution will be stored in a single Git folder and branch and you don't need to set up any other solutions once selected. Multiple solutions can be source controlled in the same folder as components aren't required to be replicated for each solution in source control. If you're using environment binding, you can select the repository and folder to bind the environment to during the initial setup.

#### Solution binding

Solution binding can be used to source control multiple solutions within the same environment in separate repos or folders. Solution binding provides more flexibility in your solution to source control binding strategy but requires more management on the part of the makers to onboard new solutions to source control. Additionally, having the same component in multiple solutions isn't supported with solution binding as the components are replicated in the source control repository for each solution. However, if you want to isolate solutions from each other in source control, solution binding is the recommended approach. Solution binding doesn't require a repository or solution to be selected during the initial setup. Instead, you can select the repository and folder to bind the solution to when you're ready to bind the solution to source control.

#### Other considerations

If you select environment binding, all new unmanaged solutions are automatically synchronized with source code with no further actions, and if you select per solution binding, creation of a new solution later requires that the solution also be configured for source control before being synced to source control. Consider the safety of having all solutions synchronized versus the flexibility of having different folders and source code linkages for each solution.

### Binding a solution to a repository and folder

Once you connected your environment to Git, you can bind a solution to a repository and folder in the same Azure DevOps project.

1. On the Solutions page, select the 3 dots next to the solution you want to bind to source control and select **Connect to Git**.
1. Select an existing branch, or create a new branch, and enter a Git folder to bind the solution to and select **Connect**. For more information on branching and merging in Git, see [Branching and merging in Git](/power-platform/alm/git-integration/branching-and-merging).

### Validate your connection

To validate your connection to Git, you can create a new solution or make changes to an existing solution and view the changes using the following steps.

1. On the Solutions page, open the solution you want to view changes for.
1. On the left pane, select **Source control** to view the changes made to the solution.
1. Here you see the changes made to the solution and can commit and push the changes to the repository as well as view the current branch your solution is bound to.

Now that your environment and solutions are connected to Git, you can start making changes to your solutions and committing and pushing those changes to the repository. For more information on how to commit and push changes to the repository, see [Commit and push changes to Git](/power-platform/alm/git-integration/commit-and-push).

## Disconnecting Dataverse from Git (coming soon)

Although you can't change your binding type after the initial setup, you can disconnect your environment or solution from Git by selecting **Disconnect from Git** on the Solutions page. When you disconnect your environment or solution from Git, the source control information is removed from the environment or solution and the environment or solution is no longer connected to the repository. To disconnect your environment or solution from Git, follow these steps.

### Related content

[Commit and push changes to Git](/power-platform/alm/git-integration/commit-and-push)  
[Branching and merging in Git](/power-platform/alm/git-integration/branching-and-merging)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
