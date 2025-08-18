---
title: "CoE ALM Accelerator for Power Platform maker setup (Deprecated)"
description: "Summary of how to add a maker to the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 08/18/2025
ms.subservice: guidance-toolkit
ms.topic: install-set-up-deploy
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# CoE ALM Accelerator for Power Platform maker set-up (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

The first step is to ensure there's an environment to build and manage solutions. Normally each maker has a unique [development environment](./development-environments.md) created. Having successfully gained access to a development environment, the commands below allow either a Power Platform administrator or a maker to perform the following tasks:

1. [Set up service principal](#set-up-service-principal) - Provide access to the service principal used by the Azure DevOps Pipeline.

1. [Maker create solution](#maker-create-solution) - Create a solution branch in the Azure DevOps repository.

## Set up service principal

The ALM Accelerator for Power Platform uses the created Microsoft Entra service principal to connect to environments and import and export the solutions. The user add command enables the ALM Accelerator to access each environment. The user add command adds the service principal as a user and assigns the system administrator security role to the user.

1. Log out of any existing sessions if not the maker or a Power Platform tenant administrator.

   ```bash
   az logout

   ```

1. Add the service principal to the environment.

   ```bash
   coe alm user add -e https://contoso-dev-user1.crm.dynamics.com
   ```

More information: [CoE ALM user add](https://aka.ms/coe-cli/help/alm/user/add)

## Maker create solution

Power Platform solutions managed by the ALM Accelerator require a branch to be created in an Azure DevOps repository. This branch, called a "solution branch", allows the maker to build and test changes. Once changes have been verified, they can be merged back into the main branch to deploy to production. The branch command creates a solution branch in Azure DevOps and configures the required Azure Pipelines for the created branch.

1. Switch to the developer environment.

1. Create new solution, for example, *NewSolution1*.

1. Add items to the solution. For example:

   a. Select a solution.

   b. Add a canvas application.

   c. Add a button.

   d. Save the application and close.

1. Create a solution branch using the following CLI command.

   ```bash
   coe alm branch \
   -o https://dev.azure.com/dev12345 \
   -p alm-sandbox \
   -d MySolution1

   ```

More information: [CoE ALM branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/branch.md) command

NOTES:

1. **-o** is the name of your DevOps organization.

1. **-p** is the name of the Azure DevOps project.

1. **-d** is the name of the solution branch to create.

1. If the repository you want to create a branch for is empty, you'll need to commit an initial commit before a branch can be created.

1. Open ALM Accelerator for Power Platform application.

1. Create a new profile for the solution by selecting the organization, project, repo and target branch. 
   > [!NOTE]
   > Unless you plan to override the default pipelines the suggested value for target branch is '[Use Solution Branches]'.

1. Enter the target validation, test and production environment urls and save your profile.

1. Select **COMMIT SOLUTION**.

   a. Create a new Branch, for example, *MySolution1-WIP*.

   b. Select an existing solution branch, for example *MySolution1*.

   c. Add a comment, for example *Initial version*.

1. Select **Bypass Prepare**
1. Select **COMMIT SOLUTION**.
1. Select the icon to the right of **COMMIT SOLUTION** when it changes to the waiting icon.

   a. Permit permissions for pipeline to run (variable group, service connection, pipeline).
   b. Then re-run the pipeline job.

## Post set up checks

After setting up an advanced maker, you might need to verify the following set-up is correctly configured:

1. If this branch is the first branch you've created, you'll need to check variables applied for the created pipeline.

1. The first time that each pipeline is run from the administration application you'll need to open the pipeline in Azure DevOps and approve the resources used by the pipeline.

1. Select the blue icon for the Azure DevOps build in the application.

   ![Latest Push Status](../media/latest-push-status.jpg)

1. Check if there's a message similar to the screenshot below that requires approval of the pipeline to run.

   ![This pipeline needs permission to access 3 resources before this run can continue](../media/devops-pipeline-permissions.jpg)

1. If necessary, select **View** and permit the build pipeline to access the required resources, such as the variable group, repository, and service connection.

   ![Azure DevOps Permit](../media/devops-pipeline-permit.jpg)

1. **Optional**. By default, the global variables, service connections and repositories are restricted and access for each pipeline must be configured. To grant access to all pipelines follow the instructions:
     1. **Service Connections** - Go to Project Settings -> Service Connections -> Edit Service Connection -> Grant access permissions to all pipelines. This has to be done for each Service Connection.
     1. **Variable Group** - Go to Pipelines -> Library -> Edit alm-accelerator-variable-group -> Pipeline Permissions -> Select ... -> Open Access
     1. **Repository** - Go to Project Settings -> Repositories -> select each pipeline -> Security -> Pipeline permissions -> Select ... -> Open Access

NOTES:

If you're using a free Azure subscription, you may receive the error message "No hosted parallelism has been purchased or granted". To resolve this issue, go to [https://aka.ms/azpipelines-parallelism-request](https://aka.ms/azpipelines-parallelism-request) and request an Azure Pipeline build compute.

### Read next

- Complete the [Install Overview](./overview.md#install-overview)

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
