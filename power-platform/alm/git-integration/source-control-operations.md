---
title: "Source control operations"
description: "This page discusses the integration of Dataverse with Git, focusing on viewing changes, committing and pulling changes."
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

# Source control repository synchronization

When you make changes to solution components in Dataverse, you can view the changes in the solution explorer. The solution explorer shows the unmanaged changes that you made to the solution components in the solution.  The files in your commit are equivalent to the unmanaged layers in your environment. Components that are part of the managed layer aren't included in the commit.

## View changes in solution explorer

1. After making a change or adding a component in unmanaged solution, navigate to the solution explorer in the maker portal.
1. Select and open the solution that you  made changes to and select the **Source Control** menu item on the left navigation.
1. Here you can view the current branch your solution is bound to and you see the changes made to the solution that are available to commit to source control, changes that have been made in source control and available to pull into your environment, or conflicts that are present because there are changes in your environment and in source code.

When you first enter the source control screen you will see that the list of **Changes** available to commit to source control. You can click the **Refresh** button if you wish to refresh the list because you have made changes in another window.  Clicking the **Check for updates** button will query your source code repository and identify if there are updates available or conflicts for you to resolve.

## Conflict resolution

The system will detect if there are conflicting changes in your source repository.  It will list these in the **conflicts** tab.  You should resolve all conflicts prior to making any commits by switching to the conflicts tab, selecting each component listed, and making a choice to **keep existing changes** if you wish to keep the changes originated in your environment or **accept incoming changes** if you wish to accept the changes that were made in your source code repository.  For components that you choose to keep existing changes, the component will be moved to the **Changes** tab and be available to commit to your source code repository.  For components that you choose to accept incoming changes, the component will be moved to the **Updates** tab and be available to pull into your environment.  Making the selection in the **Conflicts** tab does not perform any immediate action with source control, but resolves the conflict so that your next pull or commit action will perform the changes that you have selected without further conflict.

## Pull changes available from source control repository
To import updates available from your source control repository into your environment, switch to the **Updates** tab, review the updates available, and click the **Pull* button in the command bar.  It is recommended to exit the source code screen at this point and validate the application experiences that might have been impacted by those incoming changes.

## Commit changes to source control repository
To commit the changes to source control, switch to the **Changes** tab and review the changes. Select **Commit** from the top menu, enter a comment about your commit and select **Commit** again.
Once your changes are committed, you can either navigate directly to Azure DevOps to view your commit or click the commit number provided on the information bar item that notifies you of your successful commit.

>[!NOTE]
>It is best practice to resolve your conflicts first, then pull any changes from source code into your environment, validate your application is stil functional and operating as designed, then commit your changes to source control.  This practice will ensure that source code commits will be of the best quality.

### Related content

[Getting started with Git integration](/power-platform/alm/git-integration/connecting-to-git)  
[Pull changes from Git](/power-platform/alm/git-integration/pull-changes-from-git)  

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
