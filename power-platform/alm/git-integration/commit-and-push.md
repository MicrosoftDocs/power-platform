---
title: "View changes, commit, and push solution changes"
description: "This page discusses the integration of Dataverse with Git, focusing on viewing changes, committing and pushing changes to the repository."
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

# View changes, commit, and push solution changes

When you make changes to solution components in Dataverse, you can view the changes in the solution explorer. The solution explorer shows the unmanaged changes that you made to the solution components in the solution.  The files in your commit are equivalent to the unmanaged layers in your environment. Components that are part of the managed layer aren't included in the commit.

## View changes in solution explorer

1. After making a change or adding a component in unmanaged solution, navigate to the solution explorer in the maker portal.
1. Select and open the solution that you  made changes to and select the **Source Control** menu item on the left navigation.
1. Here you can view the current branch your solution is bound to and you see the changes made to the solution that are available to commit to source control.
1. To commit the changes to source control, select **Commit** from the top menu, enter a comment about your commit and select **Commit** again.

Once your changes are committed, you can either navigate directly to Azure DevOps to view your commit or click the commit number provided on the information bar item that notifies you of your successful commit.

## Folder and file naming conventions

Unique folders and files are created for each component when committing to source control. To ensure that component names and paths are unique the following general rules are applied. There are some exceptions to these rules, specifically with tables and all components that are related to tables, and relationships.

- The logical name of the component type will be used at the root folder.
- Each component instance is a child folder, using the export key as the name, then the component logical name for the filename to represent that record in YAML format.
- Other fields that export as files are at the same level using the unique name of the attribute they're stored in.

## Conflict resolution process

The system will detect if there are conflicting changes in your source repository.  It will move your component to the **conflicts** tab.  You should resolve all conflicts prior to making any commits by switching to the conflicts tab, selecting each component listed, and making a choice to **keep existing changes** if you wish to keep the changes originated in your environment or **accept incoming changes** if you wish to accept the changes that were made in your source code repository.  For components that you choose to keep existing changes, the component will be moved to the **Changes** tab and be available to commit to your source code repository.  For components that you choose to accept incoming changes, the component will be moved to the **Updates** tab and be available to pull into your environment.  Making the selection in the **Conflicts** tab does not perform any immediate action with source control, but resolves the conflict so that your next pull or commit action will perform the changes that you have selected without further conflict.

>[!NOTE]
>It is best practice to resolve your conflicts first, then pull any changes from source code into your environment, validate your application is stil functional and operating as designed, then commit your changes to source control.  This practice will ensure that source code commits will be of the best quality.

### Related content

[Getting started with Git integration](/power-platform/alm/git-integration/connecting-to-git)  
[Pull changes from Git](/power-platform/alm/git-integration/pull-changes-from-git)  

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
