---
title: "Connect Dataverse Git integration to a Git provider"
description: "Learn about Git provider setup options and common connection tasks for Dataverse Git integration."
author: caburk
ms.subservice: alm
ms.author: caburk
ms.date: 08/19/2026
ms.custom:
ms.topic: how-to
ms.reviewer: matp
ms.collection:
ms.contributors:
- mikefactorial
---
# Connect to Git

You can initiate Git integration from Power Platform in the **Solutions** area within Power Apps, Copilot Studio, Power Automate, and Power Pages. As your team develops, you can commit customizations within an environment to Git and pull changes made within Git into connected environments.

To connect Dataverse Git integration, choose a Git provider:

- [Azure DevOps](connecting-to-azure-devops.md). Connect to an Azure DevOps project and Git repository.
- [GitHub](connecting-to-github.md). Connect to a GitHub repository by using a GitHub app and Azure Key Vault.

Provider-specific articles cover prerequisites and initial setup. This article covers common connection options and tasks that apply after you connect to Git.

## How to choose between environment and solution binding

If you're not sure which binding strategy to use, environment binding is the recommended approach to get started with Git integration in Dataverse. Here are some key differences between environment and solution binding to help you decide which approach is right for you.

### Environment binding

Environment binding is a single process for binding your entire Dataverse environment and all of the unmanaged solutions and objects in the environment to a single repository and folder. When you choose to bind the entire environment, all unmanaged customizations done in any custom unmanaged solution are stored in a single Git folder and branch and you don't need to set up any other solutions once selected. The system allows for multiple solutions to use a single root folder location and keeps track of which objects belong to each solution in a separate file. It's no longer a requirement to use a unique root folder for each solution. If you're using environment binding, you can select the repository, branch, and folder to bind the environment to during the initial setup.

### Solution binding

Solution binding can be used to source control multiple solutions within the same environment to separate branches or folders. Solution binding provides additional flexibility in your source files organization but requires more management on the part of the makers to onboard new solutions to source control. The system requires that there only be one location in source control for each and every solution object, which means that if you're going to choose to bind solutions to different source locations, the system doesn't allow you to have the same object in multiple solutions. For this reason, different solutions in an environment can not be bound to different repositories.

### Other considerations

If you select environment binding, all new unmanaged solutions are automatically synced with source code with no further actions, and if you select per solution binding, creation of a new solution later requires that the solution also be configured for source control before being synced to source control. Consider the safety of having all solutions synced versus the flexibility of having different folders and source code linkages for each solution.

## Bind a solution to a repository and folder (when using the solution binding strategy)

After you connect your environment to Git by using the solution binding strategy, you can bind a solution to a repository and folder in the same Git location.

1. In the **Solutions** area, select the three vertical dots next to the solution you want to bind to source control, and then select **Connect to Git**.
1. Select an existing branch, or create a new branch, enter a Git folder to bind the solution to, and then select **Connect**.

## Validate your connection

To validate your connection to Git, create a new solution or make changes to an existing solution and view the changes using these steps:

1. On the **Solutions** page, open the solution where you want to view changes.
1. On the left pane, select **Source control** to view the changes made to the solution.

Now you can view the changes made to the solution and can commit and push the changes to the repository as well as view the current branch your solution is bound to.

## Disconnect from Git

Environments and solutions can be disconnected and then reconnected to different Git locations.
With environment or solution binding, all solutions can be disconnected. With solution binding, you can also disconnect a specific solution.

For information about disconnecting from Git using code see [Connect and disconnect Dataverse from a Git repository by using code](git-api.md).

### Disconnect all solutions

1. On the Solutions page, select **Git connection** (environment binding) or **Connect to Git** (solution binding).
1. Select **Disconnect all solutions from Git**.
1. Select **Continue** on the confirmation dialog.

### Disconnect a specific solution

1. On the **Solutions** or **Source control** page, select **Git connection**.
1. Select **Disconnect solution from Git**.
1. Select **Continue** on the confirmation dialog.

## Connect multiple development environments to Git

Multiple development environments can be connected to the same Git location. This feature provides developer isolation with the ability to quickly push your changes to Git and pull others' changes into your environment.

> [!IMPORTANT]
> Every environment must be connected with the same binding type, repository, branch, and Git folder.

1. Export the desired solutions as unmanaged from the original development environment, then import into the second environment.
1. Alternatively, create a solution in the second environment with the same exact name and publisher.
1. In other environments, repeat the setup steps for [Azure DevOps](connecting-to-azure-devops.md) or [GitHub](connecting-to-github.md). Use the same Git provider, connection type, repository, branch, and Git folder.

Now you can synchronize changes across multiple environments.

## Next steps

After your environments and solutions are connected to Git, you can start making changes to your solutions and committing those changes to the repository. For more information about source control operations, go to [Source control repository operations](source-control-operations.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
