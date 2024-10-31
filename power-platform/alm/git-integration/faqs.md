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

## What is Git integration with Dataverse?

Git integration with Dataverse provides a way of storing your solutions and their components in a Git repository. The solutions and their components are stored in human readable formats in the repository, which allows you to easily search, track changes, and manage your solutions in a source control system.

## What are the prerequisites for using Git integration with Dataverse?

You need a Power Platform environment with the necessary permissions to connect to Azure DevOps and bind your environment to a project in Azure DevOps. It will require System Administrators role in the Dataverse environment to bind to Git.  

You need an Azure DevOps subscription and licenses for users who interact with source control.  These users will need ##Contributors## permissions in your Git repository.

The Dataverse environment must be a managed environment, which will be enforced upon general availability (GA) of this feature.

## What other source control systems are supported with source control integration in Dataverse?

Git is the only source control technology supported by source control integration in Dataverse and currently only Azure DevOps Git repositories are supported in the maker experience.

## What licenses do I need to use Git integration with Dataverse?

Your need a premium Power Apps license appropriate to use a managed environment and an Azure DevOps license to interact with the source code repository.

## Why am I getting the message "Failed to retrieve the default branch for the selected repository. Choose a default branch to allow creating new branches?"

Make sure that your Azure DevOps Git repo is initialized. New projects and repos by default have an uninitialized repository, and you have to manually initialize the repo to create the default branch.

## Do I integrate my dev, test, and prod environments with source code and use branch merging to push configuration to another environment?

This feature is designed to only have your development environments tied to source control where Dataverse will persist all of your solution customizations in source. Getting those customizations into an upstream environment is done by building a managed solution and deploying it as a managed solution.

## How do I work with branches?

The feature currently works with a single branch that you specify when you bind the environment or solutions to your repository.  You can still use Git operations to work with other branches, including raising pull requests (PRs) and merging with other branches.

## Why isn't there unmanaged and managed solution representation for different components?

The feature works with unmanaged layers and doesn't work with managed layers. The solution system has been modified to remove the difference in component representations between unmanaged and managed files and a single representation of all components is now supported.

## Why is my source code files in YAML yet the solution export is still primarily XML?

The feature is using YAML to represent solution content as it is easier to read, understand, and facilitates easier merges.

## How can I deploy a solution from source code?

Currently, deployment remains a fresh solution export from the source environment and deploying that solution to a target environment.

## How do I develop with code-first components where I don't want my compiled binaries checked into source code?

Currently, you can still author different components, such as like Power Apps component framework (PCF) controls and plug-ins, using a different folder similar to what you are doing today, but the binaries will be checked into source code when you commit from the environment.

## Can I use an API to bind to Git and trigger commits and pulls?
Our APIs are currently for internal use only, but we are planning on making them available for customers to use for integration purposes with the general availability (GA) release of the feature.

## Can I now make changes directly in source control in a supported manner?
Our approach to supporting direct modifications to solution customizations is not changing with this feature and our recommendation is to continue the practice of making your changes directly in the environment, then committing those changes to source control. Changes to localized labels are permitted directly in source.  Code-first components that are supported using our developer tools are also supported, and this includes plugins, PCF controls, and web resources.

### Related content

[Overview of Dataverse Git integration](overview.md)

[Dataverse Git integration setup](connecting-to-git.md)

[Source control operations](source-control-operations.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
