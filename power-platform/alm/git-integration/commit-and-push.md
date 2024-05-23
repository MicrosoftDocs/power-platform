---
title: "View changes, commit, and push solution changes"
description: "This page discusses the integration of Dataverse with Git, focusing on viewing changes, committing and pushing changes to the repository."
author: caburk
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

When you make changes to solution components in Dataverse, you can view the changes in the solution explorer. The solution explorer shows the unmanaged changes that you made to the solution components in the solution. You can view the changes that you made in the solution explorer by selecting the solution components that you made changes to. The files in your commit are equivalent to the unmanaged layers in your environment. Components that are part of the managed layer aren't included in the commit.

## View changes in solution explorer

1. After making a change or adding a component in unmanaged solution, navigate to the solution explorer in the maker portal.
1. Select and open the solution that you  made changes to and select the **Source Control** menu item on the left navigation.
1. Here you can view the current branch your solution is bound to and you see the changes made to the solution.
1. To commit the changes to source control, select **Commit** from the top menu, enter a comment about your commit and select **Commit** again.

Once your changes are committed, you can either navigate directly to Azure DevOps to view your commit or select **Details** from the commit screen and select the **Microsoft Azure DevOps** link to navigate directly to your repository.

## Folder and file naming conventions

Unique folders and files are created for each component when committing to source control. To ensure that component names and paths are unique the following general rules are applied. There are some exceptions to these rules, specifically with tables and all components that are related to tables, and relationships.

- The logical name of the component type will be used at the root folder.
- Each component instance is a child folder, using the export key as the name, then the component logical name to represent that record.
- Other fields that export as files are at the same level using the unique name of the attribute they're stored in.

## Merge conflict resolution (Coming soon)

Merge conflict resolution in Dataverse allows you to resolve conflicts that occur when changes are made to the same solution component by multiple users. When a merge conflict occurs, you can resolve the conflict during the commit process by selecting to keep the component in source control or overwrite the changes with the component in your environment. You can then commit the changes to the repository to resolve the conflict.

In cases where merge conflicts can't be resolved on a component level during the commit process, you can resolve conflicts using tools available in your source control system to resolve line by line conflicts when create a Pull Request for your working branch.

>[!NOTE]
>In the situation where you are unable to resolve a conflict at the component level you will need to create a separate branch for resolving the conflicts. This can be done by pulling the changes into your branch and resolving the conflicts locally or via a pull request in your source control system using conflict resolution tools.

## Pulling changes from source control (Coming soon)

The ability to pull changes from source control allows you to refresh one or more unmanaged solutions in your environment with changes made by others or changes made in other branches. Pull changes into your environment is useful when you want to keep your environment in sync with the changes made in the source control repository outside of your environment. It can also be used to catch up with changes made in the main branch or other branches in the repository.

### Related content

[Getting started with Git integration](/power-platform/alm/git-integration/connecting-to-git)  
[Commit and push changes to Git](/power-platform/alm/git-integration/commit-and-push)  

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
