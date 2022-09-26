---
title: Move between topics
description: Learn how to insert nodes to switch to other topics.
keywords: "PVA"
ms.date: 10/10/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics
ms.collection: virtual-agent
---

# Move between topics

Normally, a topic starts when a user sends a message to the bot, based on their message and the topic trigger phrases. To shift the conversation from the current topic to another topic, without starting the conversation over, add a **Redirect** node. When the conversation reaches the end of the new topic, the conversation resumes in the original topic.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Redirect to another topic

1. Open your topic.
1. Select **+** to add a node where you want to insert the transition to occur, then **Topic Management**, then **Go to another topic**.

    :::image type="content" source="media/authoring-moving-between-topics/topics-redirect-add-subtopic.png" alt-text="Screenshot showing redirection to another topic node with options for other topics.":::

1. Select an existing topic from the list; it can be a system or custom topic. A **Redirect** node is then added to your topic.

    :::image type="content" source="media/authoring-moving-between-topics/topics-redirect-select-topic.png" alt-text="Screenshot of redirect topic list.":::

1. You can [pass variables between topics](authoring-variables.md#passing-variables-between-topics). If there are any [input](/authoring-variables.md#receive-values-from-other-topics) or [output](/authoring-variables.md#return-values-to-original-topics) variables in the topic you are redirecting to, enter or select a value for each one.

1. Save your topic, then use the test bot pane to confirm that your bot successfully calls the next topic.

In the authoring canvas for the original topic, you can insert additional nodes after the **Redirect** node. When the topic that is redirected to is finished, the bot will return to the original topic and continue with any nodes after the **Redirect** node.

:::image type="content" source="media/authoring-moving-between-topics/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

## End the current or all active topics

By default, the conversation returns to the calling topic, once the redirected-to topic has completed. However, the **End Current Topic** and **End All Topics** nodes alter the normal course of the conversation.

- An **End Current Topic** node ends the current topic. If the current topic was called from another topic, the conversation returns to the original topic immediately. A common use of this node is within a condition branch, where one branch exits the topic early, while another branch continues the current topic.
- An **End All Topics** node clears all active topics. Your bot will treat the next message from the user as the first message in a new conversation. Your bot will choose a topic based on the user message.
<!--TODO Cut or add, based on Gary's reply.
- An **End Conversation** node...
-->

Many of the system topics use these nodes to control how conversations end or start over. For more information, see [Use system topics in Power Virtual Agents public preview](authoring-system-topics.md).

> [!TIP]
> Using the **End All Topics** node does not clear or reset any global variables. To clear global variables, use a **Clear all variables** first. For an example, see the default **Start Over** system topic.
