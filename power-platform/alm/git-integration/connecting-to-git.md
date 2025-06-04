---
title: "Dataverse Git integration setup"
description: "This article discusses the integration of Dataverse with Git, focusing on connecting to Azure DevOps and binding your environment for Dynamics 365 and Power Platform."
author: caburk
ms.subservice: alm
ms.author: matp
ms.date: 04/21/2025
ms.custom: 
ms.topic: install-set-up-deploy
ms.reviewer: matp
ms.collection: 
ms.contributors:
- mikefactorial
---
# Dataverse Git integration setup

Git integration is initiated from Power Platform in the **Solutions** area within Power Apps, Copilot Studio, Power Automate, and Power Pages. This article discusses connecting environments and solutions to an Azure DevOps Git repository.

As the team develops, customizations within an environment can be committed to Git and changes made within Git can be pulled into connected environments.

## Prerequisites for Git integration with Dataverse

- Dataverse Git integration is a feature of [Managed Environments](../../admin/managed-environment-overview.md). Development and target environments must be enabled as Managed Environments.
- An Azure DevOps subscription and licenses for users who interact with source control are required when connecting your Dataverse environment to Git.

   > [!NOTE]
   > A limited number of licenses are available in Azure DevOps in the Basic Plan of the service. Go to [Azure DevOps Services](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/) for more information on pricing and licensing for Azure DevOps.

- Azure DevOps Services permission for making commits and reading source files is required. Members of the Contributors security group have permission.
- A Power Platform environment with Dataverse and the system administrator security role is required to connect to Git, which completes the initial binding of your environment or solution to a project in Azure DevOps.

## Azure DevOps setup

To get started, you need an [Azure DevOps project and repository](/azure/devops/repos/git/create-new-repo?view=azure-devops) to connect your Dataverse environment. If you don't have an Azure DevOps project and repository setup, follow these steps to create a new project and repository in Azure DevOps.

1. Sign in to [Azure DevOps](https://azure.microsoft.com/products/devops/) and select your organization.
1. Select **New project**, enter a name, and ensure that your version control is set to Git for your project, and select **Create**.
1. In the new project, select **Repos** and then select **Initialize** at the bottom of the page to initialize the default repository.

Make sure that all users who are making changes in your environment have access to your repository and to commit changes. Review your Azure DevOps licensing configuration and security groups to ensure that they're able to use the solution source control panel.

## Connect to Git

Connecting to Git binds solutions in your environment to a specific location and branch within the Azure DevOps repository. You can bind your environment to a project using either environment or solution binding. To learn more about the differences between environment and solution binding, go to [How to choose between environment and solution binding](#how-to-choose-between-environment-and-solution-binding).

1. Enable all development and target environments as Managed Environments within the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Sign in to [Power Apps](https://make.powerapps.com) (or [Copilot Studio](https://copilotstudio.microsoft.com), [Power Automate](https://make.powerautomate.com), [Power Pages](https://make.powerpages.microsoft.com)) and then go to **Solutions**.
1. On the **Solutions** page, or the **Source control** page within a custom unmanaged solution, select **Connect to Git**.
1. Select either [**Environment**](#environment-binding) or [**Solution**](#solution-binding) from the connection type options, and select your Azure DevOps organization and project.
   For more information about the differences between environment and solution binding, go to [How to choose between environment and solution binding](#how-to-choose-between-environment-and-solution-binding).
1. Depending on your binding type, you can select a project, repository, or branch and enter a folder to bind the environment or solution to.
1. Optionally, create a new branch.
1. Select **Connect**.

   > [!NOTE]
   > By design, the Default Solution and Common Data Service Default Solution can't be connected to Git. Use a custom solution for app and solution development.

### How to choose between environment and solution binding

If you're not sure which binding strategy to use, environment binding is the recommended approach to get started with Git integration in Dataverse. Here are some key differences between environment and solution binding to help you decide which approach is right for you.

#### Environment binding

Environment binding is a single process for binding your entire Dataverse environment and all of the unmanaged solutions and objects in the environment to a single repository and folder. When you choose to bind the entire environment, all unmanaged customizations done in any custom unmanaged solution are stored in a single Git folder and branch and you don't need to set up any other solutions once selected. The system allows for multiple solutions to use a single root folder location and keeps track of which objects belong to each solution in a separate file. It's no longer a requirement to use a unique root folder for each solution. If you're using environment binding, you can select the repository, branch, and folder to bind the environment to during the initial setup.

#### Solution binding

Solution binding can be used to source control multiple solutions within the same environment to separate repositories or folders. Solution binding provides additional flexibility in your source files organization but requires more management on the part of the makers to onboard new solutions to source control. The system requires that there only be one location in source control for each and every solution object, which means that if you're going to choose to bind solutions to different source locations, the system doesn't allow you to have the same object in multiple solutions. Solution binding doesn't require a repository or solution to be selected during the initial setup. Instead, you select the repository and folder to bind each solution to when you're ready to bind the solution to source control.

#### Other considerations

If you select environment binding, all new unmanaged solutions are automatically synced with source code with no further actions, and if you select per solution binding, creation of a new solution later requires that the solution also be configured for source control before being synced to source control. Consider the safety of having all solutions synced versus the flexibility of having different folders and source code linkages for each solution.

### Binding a solution to a repository and folder (when using the solution binding strategy)

Once you've connected your environment to Git using the solution binding strategy, you can bind a solution to a repository and folder in the same Azure DevOps project.

1. In the **Solutions** area, select the three vertical dots next to the solution you want to bind to source control, and then select **Connect to Git**.
1. Select an existing branch, or create a new branch, enter a Git folder to bind the solution to, and then select **Connect**.

### Validate your connection

To validate your connection to Git, create a new solution or make changes to an existing solution and view the changes using these steps:

1. On the **Solutions** page, open the solution where you want to view changes.
1. On the left pane, select **Source control** to view the changes made to the solution.

Now you can view the changes made to the solution and can commit and push the changes to the repository as well as view the current branch your solution is bound to.

## Disconnect from Git

Environments and solutions can be disconnected and then reconnected to different Git locations.
With environment or solution binding, all solutions can be disconnected. With solution binding, you can also disconnect a specific solution.

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
1. In other environments, repeat the [Connect to Git](#connect-to-git) steps described earlier. Use the same connection type (binding), organization, project, repository, branch, and Git Folder.

Now you can synchronize changes across multiple environments.

## Next steps

After your environments and solutions are connected to Git, you can start making changes to your solutions and committing those changes to the repository. For more information about source control operations, go to [Source control repository operations](source-control-operations.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
