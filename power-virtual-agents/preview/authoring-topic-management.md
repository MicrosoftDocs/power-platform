---
title: Manage topics (preview)
description: Learn how to switch to other topics and end a topic in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/13/2022

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
ms.custom: authoring, topics, bap-template
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Manage topics (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

To shift the conversation from the current topic to another topic without starting over, add a **Redirect** node. When the conversation reaches the end of the new topic, it resumes in the original topic by default. However, you can use two special nodes, **End current topic** and **End all topics**, to change the normal course of the conversation.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Redirect to another topic

1. Open your topic in the authoring canvas.

1. Where you want the transition to occur, select **+** to add a node, then select **Topic management**, and then select **Go to another topic**.

    :::image type="content" source="media/authoring-topic-management/topics-redirect-add-subtopic.png" alt-text="Screenshot of the Topic management menu, with Topic management highlighted.":::

1. Select a custom or system topic from the list.

    :::image type="content" source="media/authoring-topic-management/topics-redirect-select-topic.png" alt-text="Screenshot of the list of topics to redirect to.":::

1. [Pass variables between topics](authoring-variables.md#pass-variables-between-topics) if needed. If the topic you're redirecting to requires any [input](/authoring-variables.md#receive-values-from-other-topics) or [output](/authoring-variables.md#return-values-to-original-topics) variables, enter or select a value for each one.

1. Save your topic, and then use the **Test bot** pane to confirm that your bot successfully calls the redirect topic.

You can insert more nodes after the **Redirect** node if you need to. When the topic that's redirected to ends, the bot returns to the original topic and continues with any nodes that follow the **Redirect** node.

:::image type="content" source="media/authoring-topic-management/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes that follow a redirected topic node.":::

## End the current topic or all topics

By default, a redirected conversation returns to the original topic at the end of the called topic. Use the **End current topic** and **End all topics** nodes to exit a topic&mdash;or the conversation&mdash;early.

- An **End current topic** node ends the current topic at that point. If the current topic was called from another topic, the conversation returns to the original topic immediately. A common use of this node is in a condition branch. One branch exits the topic early, while another branch continues the current topic.
- An **End all topics** node ends all active topics immediately. Your bot treats the next message from the user as the first message in a new conversation.

    To signal to the user's channel that the bot thinks the conversation has ended, add an **End Conversation** node before the **End all topics** node.

Many of the system topics use these nodes to control how conversations end or start over. Learn how to [use system topics in Power Virtual Agents](authoring-system-topics.md).

> [!TIP]
> The **End all topics** node doesn't clear or reset any global variables. To clear global variables, use a **Clear all variables** node first. For an example, see the default [Reset Conversation system topic](authoring-system-topics.md#reset-conversation).
