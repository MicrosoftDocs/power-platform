---
title: "FAQs about source code integration"
description: "This article includes answers to commonly asked questions about Git integration with Microsoft Dataverse."
author: caburk
ms.subservice: alm
ms.author: caburk
ms.date: 10/13/2025
ms.custom: 
ms.topic: faq
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
- suskumar-MSFT
---

# FAQs about source code integration

This article includes answers to commonly asked questions about Git integration with Microsoft Dataverse.

## What is source code integration in Power Platform?

Git integration provides an easier way of syncing Power Platform customizatinos (solutions and their objects) with a Git repository. The solutions and their objects are stored in human readable formats in the repository, which allows you to easily search, track changes, and manage your solutions in a source control system.

## What's the difference between Git integration and pre-existing Developer tools?

Git integration is built into Power Platform and is more performant, democratized for makers and admins, has more robust safeguards, and uses an optimized file format.
Developer tools currently provide more flexibility for code-first developers.

## What are the prerequisites for using Git integration?

You need a Power Platform environment with the necessary permissions to connect to Azure DevOps and bind your environment to a project in Azure DevOps. It requires a system administrator role in the Dataverse environment to bind to Git.  

You need an Azure DevOps subscription and licenses for users who interact with source control. These users need **Basic** access level in the Azure DevOps organization and access to contribute to the project and repository.

Development and target environments must be enabled as Managed Environments.

## What other Git providers are supported?

Azure DevOps Git repositories are currently the only Git provider supported. This capability uses the Git provider model so that others might be supported later.

## What licenses do I need to use Git integration with Dataverse?

All users within the environment must meet license requirements for [Managed Environments](../../admin/managed-environment-overview.md). Managed Environments is required regardless of environment type.

Developers using source code integration also need an Azure DevOps license to gain access to the repository. For more information, go to [Azure DevOps Services](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/)

## Can developers collaborate on a solution while working in different development environments?

Yes. Import the solution to each additional environment and then connect to the same Git location. For more information, go to [Connect multiple development environments to Git](connecting-to-git.md)

## Why am I getting the error "Source Control Integration is not enabled for this environment?"

This error typically occurs when **File Storage** is disabled in your environment. The most common reason is that your environment is encrypted using [Bring Your Own Key (BYOK)](../../admin/manage-encryption-key.md).

The source control integration feature depends on **File Storage**, which is disabled by design in BYOK environments.

To enable source control integration, follow these steps: 

1. Migrate your environments encryption key to [customer-managed key (CMK)](../../admin/cmk-migrate-from-byok.md).
1. After migration make sure **File Storage** is enabled. 
1. [Reconnect](connecting-to-git.md) to source control and retry the operation.

If your environment isn't encrypted with BYOK, contact Microsoft Support for assistance.

## Why am I getting the message "Failed to retrieve the default branch for the selected repository. Choose a default branch to allow creating new branches?"

Make sure that your Azure DevOps Git repo is initialized. New projects and repos by default have an uninitialized repository, and you have to manually initialize the repo to create the default branch.

## Do I integrate my dev, test, and prod environments with source code and use branch merging to push configuration to another environment?

This feature is designed to only have your unmanaged solutions in development environments connected to Git. Deployment to upstream environments currently requires exporting the managed solution from a development environment or using pipelines in Power Platform.

## How do I work with branches?

The feature currently works with a single branch that you specify when you bind the environment or solutions to your repository. You can disconnect and reconnect to different branches as well as use Azure DevOps for pull requests (PRs), merging, and other advanced Git operations.

For example, you can connect your development to a developer branch, PR the changes into a feature branch, then disconnect your solution and reconnect to the feature branch to pull the latest changes into an environment.

## Why isn't there unmanaged and managed solution representation for different objects in Git?

Before this feature became available, it was common to store managed and unmanaged solution versions in Git. That's no longer needed. Git should only include your source code and unmanaged customizations. Managed versus unmanaged is determined when building and releasing the solution.

## Why are my source code files in YAML yet the solution export is still primarily XML?

The feature uses YAML to represent solution content because it's easier to read, understand, and facilitates easier merges.

## How can I build and deploy a solution from source code?

Currently, deployment requires synchronizing the Git release branch with a development environment and exporting the managed artifact from the environment. <!-- Update this FAQ when expanded feature becomes available.-->

## How do I develop with code-first objects where I don't want my compiled binaries checked into source code?

Currently, you can still author different objects, such as Power Apps component framework controls and plug-ins, using a different solution and Git folder.

## How do I resolve conflicts?

Simple conflicts can be resolved on the solution's source control page by selecting which version to keep (environment versus Git).

Merge conflicts detected when merging branches is currently managed within Git.

## Can I commit specific changes instead of all changes for a solution?

Currently, you need to commit all pending object changes within a solution. However, you can move objects to a different solution and add them back later.

## Can I use an API to bind to Git and trigger commits and pulls?

Yes. Go to the [Web API reference](/power-apps/developer/data-platform/webapi/reference/about) for developer documentation about connecting to Git, `CommitToGit`, `RefreshChangesFromGit`, and `PullChangesFromGit`.

## Can I now make changes directly in source control in a supported manner?

Support for direct modifications to solution customizations isn't changing with this feature. Our recommendation is to continue the practice of making your changes directly in the environment, then committing those changes to source control. Changes to localized labels are permitted directly in source. Code-first objects that are supported using our developer tools are also supported, and include plug-ins, PCF controls, and web resources.

## Can Git integration be disabled?

There is no tenant or environment level setting to prevent connecting to Git. However, access to Git can be managed within the Git repository. You can also disconnect environments within the Git connection panel.

## Can I commit large solutions?

Yes. However, there's a 17 MB limit for single file commits withing Azure DevOps. The system chunks large solutions, containing multiple files into multiple commits and squash-merges them.

## Are all object types supported?

Currently, some low-usage legacy object types are unsupported. You receive an error in the solution objects view when unsupported object types are detected.

## How can I upgrade existing solutions?

You can connect existing solutions in an environment to Git and commit them. If the solution is only in Git, first use developer tools to pack and import the unmanaged solution into a new development environment. We recommend a new source code location to avoid disruptive changes between old and new file formats.

## Can I use Git integration to audit metadata changes? Even for citizen developers?

Yes, this is common. Dataverse API's can also be used to commit changes automatically.

## Is Git integration available in sovereign clouds?

Yes.

## Can I automatically deploy changes pushed to Git?

Support is currently limited, but you can use pipelines in Power Platform and pac pipeline deploy.

## Can I connect environments located in a different geo than the ADO repo?

Consent is needed when the environment is in a different geography than the ADO repo. A message and consent are shown when connecting.

## Does Git integration support cross tenant (x-tenant) workloads? For example, if the Power Platform / Dataverse environment is in a different tenant than Azure DevOps. 

Not currently. 

## Does Git integration support security scanning?
You can integrate your scanning tool of choice into your Azure DevOps tooling. 


### Related content

[Overview of Dataverse Git integration](overview.md)

[Dataverse Git integration setup](connecting-to-git.md)

[Source control repository operations](source-control-operations.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
