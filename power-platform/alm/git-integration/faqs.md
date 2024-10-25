---
title: "FAQs about Dataverse Git integration"
description: "This page includes answers to commonly asked questions about Git Integration with Dataverse."
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

# FAQs about Dataverse Git integration

This page includes answers to commonly asked questions about Git Integration with Dataverse. The content on this page is updated regularly to include new questions and answers.

## What is Git integration with Dataverse?

Git integration with Dataverse provides a way of storing your solutions and their components in a Git repository. The solutions and their components are stored in human readable formats in the repository, which allows you to easily search, track changes, and manage your solutions in a source control system.

## What are the prerequisites for using Git integration with Dataverse?

You'll need a Power Platform environment with the necessary permissions to connect to Azure DevOps and bind your environment to a project in Azure DevOps. You'll also need an Azure DevOps subscription and licenses for users who interact with source control and your Dataverse environment must be a managed environment.

## What other source control systems are supported with source control integration in Dataverse?

Git is the only source control technology supported by source control integration in Dataverse and currently only Azure DevOps Git repositories are supported in the maker experience. There are plans to extend support to other Git providers in the future.

## What licenses do I need to use Git integration with Dataverse?
Your will need a premium PowerApps license appropriate to use a managed environment and an Azure DevOps license to interact with the source code repository.

## Why am I getting the message “Failed to retrieve the default branch for the selected repository. Choose a default branch to allow creating new branches.”?

Make sure that your Azure DevOps Git repo has been initialized. New projects/repos by default will have an uninitialized repository, and you will need to manually initialize the repo to create the default branch.

## Do I integrate my dev, test, and prod environments with source code and use branch merging to push configuration to another environment?

This feature is designed to only have your development environments tied to source control where we will persist all of your solution customizations in source. Getting those customizations into an upstream environment will be done by building a managed solution and deploying it as a managed solution.

## How do I work with branches?
The feature currently works with a single branch that you specify when you bind the environment or solutions to your repository.  You can still use git operations to work with other branches, including raising PRs and merging with other branches.  The feature will support working with multiple branches in the future.

## Why do I not see unmanaged and managed solution representation for different components?
The feature works with unmanaged layers and does not work with managed layers.  The solution system has been modified to remove the difference in component representations between unmanaged and managed files and a single representation of all components is now supported.

## Why is my source code files in YAML yet the solution export is still primarily XML?
The feature is using YAML to represent solution content as it is easier to read, understand, and it facilitates easier merges.  Future versions of PAC CLI will be able to build a valid solution file directly from this new source format.

## How can I deploy a solution from source code?
Future versions of PAC CLI will be able to build a valid managed solution file from the source files, and future versions of pipelines will be able to deploy from source code, but for now, deployment will remain a fresh solution export from the source environment and deploying that to a target environment.

## How do I develop with code-first components like PCF controls and plugins where I don't want my compiled binaries checked into source code?
Future versions of PAC CLI will support the new source format and allow you to freshly compile your code-first components and inject them into a solution file built from source code and this feature will have the capability of not storing the binaries for these components in source code.  Until then, you can still author those different components using a different folder like you do today, but the binaries will be checked into source code when you commit from the environment.

### Related content

[Overview of Dataverse Git integration](/power-platform/alm/git-integration/overview.md)  
[Dataverse Git integration setup](/power-platform/alm/git-integration/connecting-to-git.md)  
[Source control operations](/power-platform/alm/git-integration/source-control-operations.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
