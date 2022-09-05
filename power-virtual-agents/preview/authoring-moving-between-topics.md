---
ROBOTS: NOINDEX,NOFOLLOW
title: Moving between topics
description: Redirect to other topics and how to use other topic management nodes.
keywords: "PVA"
ms.date: 09/05/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics
ms.collection: virtual-agent
---

# Moving between topics

When you add a node, the **Topic Management** sub menu contains several nodes to allow you to move between topics.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Redirecting to another topic

1. To have the bot move to a different topic, select **+** to add a node, and then select **Topic Management**, then **Go to another topic**.

    :::image type="content" source="media/authoring-moving-between-topics/topics-redirect-add-subtopic.png" alt-text="Screenshot showing redirection to another topic node with options for other topics.":::

2. Select an existing topic from the list, or **Create a topic**.

    > [!TIP]
    > Before creating a new topic, save your current topic first.
    > Creating a new topic will open the new topic in the authoring canvas, and any unsaved edits you have in the current topic will be lost.

    :::image type="content" source="media/authoring-moving-between-topics/topics-redirect-select-topic.png" alt-text="Screenshot of redirect topic list.":::

3. If there are any [input](/authoring-variables.md#receive-values-from-other-topics) or [output](/authoring-variables.md#return-values-to-original-topics) variables in the next topic, enter or select a value for each one.

4. Save your topic, then use the test bot pane to confirm that your bot successfully calls the next topic.

In the authoring canvas for the original topic, you can insert additional nodes under the **Redirect** node.

When the path for the topic chosen in the **Redirect** node is finished, the bot will return to the original topic. The bot will then follow the nodes that are under the **Redirect** node.

:::image type="content" source="media/authoring-moving-between-topics/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

## End the current or all active topics

By default, a topic being called from another will return to the calling topic that once the topic has completed but. you can use the **End current topic** and **End all topics** for other behavior.

   - Select **End all topics** to clear all active topics. This means that the next message recieved from the user will be treated in the same way as the first one in the conversation, with all topics being evaluated and the most appropriate one being started. 

    > [!TIP]
    > Using the **End all topics** node does not clear or reset any global variables. To clear global variables, use the **Clear variable values** node, as seen in the _Start over_ that is created as part of a bot's default content.

   - Select **End current topic** to end the current topic. If the current topic was called by another, the conversation will return to the calling topic immediately. A common use of this node is within a condition branch, where one branch exits the topic early, while another branch continues the current topic.
