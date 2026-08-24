---
title: "Connect Dataverse Git integration to Azure DevOps"
description: "Learn how to configure Dataverse Git integration with Azure DevOps and connect an environment or solution to an Azure DevOps Git repository."
author: caburk
ms.subservice: alm
ms.author: matp
ms.date: 08/19/2026
ms.custom:
ms.topic: how-to
ms.reviewer: matp
ms.collection:
ms.contributors:
- mikefactorial
---
# Connect to Azure DevOps

To connect a Microsoft Dataverse environment or solution to Microsoft Azure DevOps, create or use an Azure DevOps project and repository, and then connect from the source control experience in your solution.

You can access solutions from Power Apps, Power Automate, Power Pages, and Copilot Studio.

## Prerequisites

- Dataverse Git integration is a feature of [managed environments](/power-platform/admin/managed-environment-overview). Development and target environments must be enabled as managed environments.
- An Azure DevOps subscription and licenses for users who interact with source control are required when connecting your Dataverse environment to Git.

   > [!NOTE]
   > A limited number of licenses are available in Azure DevOps in the Basic Plan of the service. Go to [Azure DevOps Services](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/) for more information on pricing and licensing for Azure DevOps.

- Azure DevOps Services permission for making commits and reading source files is required. Members of the Contributors security group have permission.
- You need a Dataverse environment where you have the System Administrator security role.
- A custom unmanaged solution that you want to connect to source control. Create one if you don't have one yet.

## Azure DevOps setup

To get started, you need an [Azure DevOps project and repository](/azure/devops/repos/git/create-new-repo?view=azure-devops&preserve-view=true) to connect your Dataverse environment. If you don't have an Azure DevOps project and repository set up, follow these steps to create a new project and repository in Azure DevOps.

1. Sign in to [Azure DevOps](https://azure.microsoft.com/products/devops/) and select your organization.
1. Select **New project**, enter a name, make sure version control is set to **Git**, and then select **Create**.
1. In the new project, select **Repos**, and then select **Initialize** at the bottom of the page to initialize the default repository.

Ensure that all users who make changes in your environment have access to your repository and can commit changes. Review your Azure DevOps licensing configuration and security groups to ensure they can use the solution source control panel.

## Connect to Azure DevOps from a solution

When you connect to Git, you bind solutions in your environment to a specific location and branch within the Azure DevOps repository. You can bind your environment to a project by using either environment or solution binding. To learn more about the differences between environment and solution binding, see [How to choose between environment and solution binding](connecting-to-git.md#how-to-choose-between-environment-and-solution-binding).

1. Enable all development and target environments as managed environments within the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Sign in to [Power Apps](https://make.powerapps.com) (or [Copilot Studio](https://copilotstudio.microsoft.com), [Power Automate](https://make.powerautomate.com), [Power Pages](https://make.powerpages.microsoft.com)) and then go to **Solutions**.
1. On the **Solutions** page, or the **Source control** page within a custom unmanaged solution, select **Connect to Git**.
1. Select either [**Environment**](connecting-to-git.md#environment-binding) or [**Solution**](connecting-to-git.md#solution-binding) from the connection type options, and select your Azure DevOps organization and project. More information: [How to choose between environment and solution binding](connecting-to-git.md#how-to-choose-between-environment-and-solution-binding)
1. Depending on your binding type, select a project, repository, or branch, and enter a folder to bind the environment or solution to.
1. Optionally, create a new branch.
1. Select **Connect**.

   > [!NOTE]
   > By design, you can't connect the Default Solution and Common Data Service Default Solution to Git. Use a custom solution for app and solution development.

For information about connecting to Git by using code, see [Connect and disconnect Dataverse from a Git repository by using code](git-api.md).

## Next steps

- [Review common Git connection tasks](connecting-to-git.md).
- [Source control repository operations](source-control-operations.md).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
