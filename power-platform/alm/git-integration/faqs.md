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


### Related content

[Overview of Dataverse Git integration](/power-platform/alm/git-integration/overview.md)  
[Dataverse Git integration setup](/power-platform/alm/git-integration/connecting-to-git.md)  
[Source control operations](/power-platform/alm/git-integration/source-control-operations.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
