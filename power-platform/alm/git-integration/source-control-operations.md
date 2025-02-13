---
title: "Source control operations"
description: "This article discusses the integration of Dataverse with Git, focusing on viewing changes, committing and pulling changes."
author: shmcarth
ms.subservice: alm
ms.author: matp
ms.date: 10/29/2024
ms.custom: 
ms.topic: article
ms.reviewer: tapanm
ms.collection: 
ms.contributors:
- mikefactorial
---
# Source control repository operations (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

When you make changes to solution components in Dataverse, you can view the changes in the **Solutions** area in Power Apps (make.powerapps.com). The solutions area shows the unmanaged changes that you made to the solution components in the solution. The files in your commit are equivalent to the unmanaged layers in your environment. Components that are part of the managed layer aren't included in the commit.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

## View changes in the solutions area

1. After making a change or adding a component in an unmanaged solution, go to the **Solutions** area in Power Apps.
1. Open the solution that you made changes to and select **Source Control** on the left navigation pane.

   :::image type="content" source="../media/git-integration-changes.png" alt-text="List of changes in solution ready to commit to Git" lightbox="../media/git-integration-changes.png":::

The source control screen provides a list of **Changes** available to commit to source control. Select **Refresh** to refresh the list if you made changes in another browser tab. Selecting **Check for updates** queries your source code repository and identifies whether there are updates available or conflicts for you to resolve.

From the source control screen you view the current branch your solution is bound to and view the changes made to the solution that are available to commit to source control, changes that have been made in source control and are available to pull into your environment, or conflicts that are present because there are changes in your environment and in source code.

## Conflict resolution

The system detects if there are conflicting changes to your source repository. It lists these issues on the **conflicts** tab. You should resolve all conflicts before making any commits by switching to the conflicts tab, selecting each component listed, and then making a choice to **keep existing changes** if you want to keep the changes originated in your environment or **accept incoming changes** if you want to accept the changes that were made in your source code repository. 

If you choose to keep existing changes, those components are moved to the **Changes** tab and are available to commit to your source code repository. If you choose to accept incoming changes, those components are moved to the **Updates** tab and are available to pull into your environment. Making the selection in the **Conflicts** tab doesn't perform any immediate action with source control, but it resolves the conflict so that your next pull or commit action performs the changes that you selected without further conflict.

## Pull changes available from source control repository

To import updates available from your source control repository into your environment, switch to the **Updates** tab, review the updates available, and then select **Pull** on the command bar. We recommend that you close the source code screen at this point and validate the application experiences that might have been impacted by those incoming changes.

## Commit changes to source control repository

To commit the changes to source control, switch to the **Changes** tab and review the changes. Select **Commit** from the top menu, enter a comment about your commit and then select **Commit** again.

Once your changes are committed, you can either navigate directly to Azure DevOps to view your commit or select the commit number provided on the information bar item that notifies you of your successful commit.

> [!NOTE]
> It's a best practice to resolve your conflicts first, then pull any changes from source code into your environment, validate your application is still functional and operating as designed, and then commit your changes to source control. This practice ensures that source code commits are of the best quality.

### Next steps

[Dataverse Git integration setup](/power-platform/alm/git-integration/connecting-to-git)  


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
