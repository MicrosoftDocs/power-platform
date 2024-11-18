---
title: "FAQs about Dataverse and Git integration"
description: "This article includes answers to commonly asked questions about Git integration with Microsoft Dataverse."
author: shmcarth
ms.subservice: alm
ms.author: matp
ms.date: 10/30/2024
ms.custom: 
ms.topic: article
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
---

# FAQs about Dataverse and Git integration (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article includes answers to commonly asked questions about Git integration with Microsoft Dataverse.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]
> - This feature is currently only available to environments that have been created for early release cycles. Go to [Early release cycle environments](/power-platform/admin/early-release#create-early-release-cycle-environments).

## What is Git integration with Dataverse?

Git integration with Dataverse provides a way of storing your solutions and their components in a Git repository. The solutions and their components are stored in human readable formats in the repository, which allows you to easily search, track changes, and manage your solutions in a source control system.

## What are the prerequisites for using Git integration with Dataverse?

You need a Power Platform environment with the necessary permissions to connect to Azure DevOps and bind your environment to a project in Azure DevOps. It requires a system administrator role in the Dataverse environment to bind to Git.  

You need an Azure DevOps subscription and licenses for users who interact with source control. These users need **Contributors** permissions in your Git repository.

The Dataverse environment must be a managed environment, which will be enforced upon general availability (GA) of this feature.

## What other source control systems are supported with source control integration in Dataverse?

Git is the only source control technology supported by source control integration in Dataverse and currently only Azure DevOps Git repositories are supported.

## What licenses do I need to use Git integration with Dataverse?

Your need a premium Power Apps license appropriate to use a managed environment and an Azure DevOps license to interact with the source code repository.

## Why am I getting the message "Failed to retrieve the default branch for the selected repository. Choose a default branch to allow creating new branches"?

Make sure that your Azure DevOps Git repo is initialized. New projects and repos by default have an uninitialized repository, and you have to manually initialize the repo to create the default branch.

## Do I integrate my dev, test, and prod environments with source code and use branch merging to push configuration to another environment?

This feature is designed to only have your development environments tied to source control where Dataverse persists all of your solution customizations in source. Getting those customizations into an upstream environment is done by building a managed solution and deploying it as a managed solution.

## How do I work with branches?

The feature currently works with a single branch that you specify when you bind the environment or solutions to your repository. You can still use Git operations to work with other branches, including raising pull requests (PRs) and merging with other branches.

## Why isn't there unmanaged and managed solution representation for different components?

The feature works with unmanaged layers and doesn't work with managed layers. The solution system removes the difference in component representations between unmanaged and managed files and a single representation of all components is now supported.

## Why are my source code files in YAML yet the solution export is still primarily XML?

The feature uses YAML to represent solution content because it is easier to read, understand, and facilitates easier merges.

## How can I deploy a solution from source code?

Currently, deployment requires a fresh solution export from the source environment and for deploying that solution to a target environment.

## How do I develop with code-first components where I don't want my compiled binaries checked into source code?

Currently, you can still author different components, such as Power Apps component framework controls and plug-ins, using a different folder (similar to what you are doing today), but the binaries are checked into source code when you commit from the environment.

## Can I use an API to bind to Git and trigger commits and pulls?

Power Platform APIs are currently for internal use only.

## Can I now make changes directly in source control in a supported manner?

Support for direct modifications to solution customizations isn't changing with this feature. Our recommendation is to continue the practice of making your changes directly in the environment, then committing those changes to source control. Changes to localized labels are permitted directly in source. Code-first components that are supported using our developer tools are also supported, and include plug-ins, PCF controls, and web resources.

## How can I work with Power Pages source files as they are not organized as effectively as previously when I use PAC CLI to unpack solutions?

Support for a more efficient organization of Power Pages source files is currently under development and will come with a future update.

## What can I do when I get an error that states "Activity failing with unmonitored exception: Microsoft.Crm.CrmException: The maximum request size of 26214400 bytes was exceeded."?
There are limits in the Azure DevOps APIs that we are exceeding.  This is usually because you have imported a large unmanaged solution and the total number of commits has exceeded that limit.  It is recommended that you remove solution components from the solution until you can get a successful commit, then add back those removed components, making commits along the way until you are successful.  Pay attention to components that have large solution files, including media files like web resources or canvas applications with embedded media as those might need to be added one at a time if they are approaching that limit.  Once you think you have all of your solution components back in your solution and the commits have been successful, you may consider re-importing the unmanaged solution again to ensure you did not miss adding back any components.

### Related content

[Overview of Dataverse Git integration](overview.md)

[Dataverse Git integration setup](connecting-to-git.md)

[Source control repository operations](source-control-operations.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
