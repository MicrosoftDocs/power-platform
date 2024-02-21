---
title: "Create and reply to comments in bot topics"
description: "Add new comments, reply to existing comments, and resolve or delete comments and comment threads for topics within a Microsoft Copilot Studio copilot."
keywords: "PVA"
ms.date: 03/24/2023
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: gitikag
manager: leeclontz
ms.custom: authoring, ceX
---

# Add comments to copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Comments are notes that are associated with items in your copilot. Use comments to help your team collaborate on the copilot and provide feedback, or provide additional information on implementation details in your copilot.  

In Microsoft Copilot Studio comments can be attached to topics and individual nodes within topics. The comments are stored in a table in Dataverse in the default solution.  

Comments are commonly questions, feedback, or ideas that can provide important context for other makers who work on your copilot's topics.

You can create comment threads to track a single or multiple issues, and you can delete or resolve them if they're no longer relevant.

Comment threads are created when someone replies to an existing comment. Using threads means you can discuss a single issue without getting confused with lots of replies about different things.

:::image type="content" source="media/authoring-comments/authoring-comments-window.png" alt-text="Screenshot of the Comments pane.":::

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-copilot-studio.md).

## Manage comments

The **Comments** pane lets you create new comment threads, resolve or delete comment threads, and add or delete individual comments.

You open the pane by selecting the **Comments** icon at the top of the authoring canvas for a topic.

:::image type="content" source="media/authoring-comments/authoring-comments-open.png" alt-text="Screenshot with the Open comments menu icon selected, the menu icon looks like a chat box.":::

Comment threads can be created at both the topic level and for individual nodes within the topic.

Both types of comment threads are shown in the **Comments** pane. Topic-level topics are displayed first, in order of when they were created, and node-level topics are displayed in the order of where the node appears in the topic.

Selecting a node-level comment thread moves the authoring canvas to the associated node and highlight it.

Selecting a topic-level comment thread moves the authoring canvas to the last selected node.

### Create a topic-level comment thread

To create a new topic-level comment thread, open the **Comments** pane and select **New**.

Enter your comment and select **Post comment** at the bottom of the comment entry field. You can also press **Ctrl+Enter** to post the comment.

### Create a node-level comment thread

To create a new topic-level comment thread, select the menu icon (. . .) at the top of the node, and then **New comment**.

Enter your comment and select **Post comment** at the bottom of the comment entry field. You can also press **Ctrl+Enter** to post the comment.

A comment icon appears next to a node that has comments. You can select the icon to open the **Comments** pane and go to the first comment for that node.

### Edit, delete, and resolve comment threads

Select the menu icon at the top of the comment thread to edit the initial comment, delete the entire thread, or resolve the entire thread.

:::image type="content" source="media/authoring-comments/authoring-comments-thread.png" alt-text="Screenshot of the menu that appears with the items Edit comment, Delete thread, and Resolve thread.":::

- Editing the initial comment lets you change only that comment. Other comments in the thread aren't affected.
- Deleting a thread removes it completely. You can't restore deleted comments or threads.
- Resolving a thread causes it to appear faded, and places the label **Resolved** at the top of the thread. Select the arrow icon at the top of the thread to unresolve a thread. Unresolving a thread lets you add more comments.

### Edit and delete individual comments

Select the menu icon at the top of an individual comment, next to the your name, to edit or delete a comment.

You can only edit or delete comments that you created.

- Editing the comment lets you change that comment.
- Deleting the comment removes it completely from that thread. You can't restore deleted comments.

## Additional notes

- Comments aren't exported when you [export a copilot with a solution](authoring-export-import-bots.md).
- You can't @ mention other copilot makers in a comment.
- New comments are displayed for [other copilot makers who are editing the same topic](admin-share-bots.md#collaborate-on-copilots) when they refresh the page. The topic doesn't need to be saved for new comments to show.

[!INCLUDE[footer-include](includes/footer-banner.md)]
