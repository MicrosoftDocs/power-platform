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

# Moving between topics and managing the conversation

When you add a node, the **Topic Management** sub menu contains several nodes to allow you to move between topics and to manage your conversation, including options for ending the conversation.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

1. To have the bot move to a different topic, select **+** to add a node, and then select **Topic Management**, then **Go to another topic**.

    :::image type="content" source="media/authoring-moving-between-topics/topics-redirect-add-subtopic.png" alt-text="Screenshot showing redirection to another topic node with options for other topics.":::

1. Select an existing topic from the list, or **Create a topic**.

    > [!TIP]
    > Before creating a new topic, save your current topic first.
    > Creating a new topic will open the new topic in the authoring canvas, and any unsaved edits you have in the current topic will be lost.

    :::image type="content" source="media/authoring-moving-between-topics/topics-redirect-select-topic.png" alt-text="Screenshot of redirect topic list.":::

1. If there are any [input](/authoring-variables.md#receive-values-from-other-topics) or [output](/authoring-variables.md#return-values-to-original-topics) variables in the next topic, enter or select a value for each one.

1. Save your topic, then use the test bot pane to confirm that your bot successfully calls the next topic.

In the authoring canvas for the original topic, you can insert additional nodes under the **Redirect** node.

When the path for the topic chosen in the **Redirect** node is finished, the bot will return to the original topic. The bot will then follow the nodes that are under the **Redirect** node.

:::image type="content" source="media/authoring-moving-between-topics/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

#### End the conversation or topic

If you redirect to any of the following [system topics](#use-system-and-sample-topics), the current conversation flow will end. Unless modified, these topics have the following behavior. To provide a consistent user experience at the end of a conversation, you can redirect to these topics or implement your own.

| Topic | Behavior |
|:-|:-|
| Confirmed Failure| The user can ask another question or request to talk to an agent, which redirects to the Escalate topic.|
| Confirmed Success| The user is presented with a satisfaction survey, and then can ask another question or leave the conversation, which redirects to the Goodbye topic. The survey response is collected on the [customer satisfaction analytics page](analytics-csat.md). |
| End of Conversation | The user is asked if their question was answered. Based on their response, the bot redirects to the Confirmed Success or the Confirmed Failure topic. |
| Escalate | This topic is incomplete. You can hand the conversation over to a live agent if you're using a suitable customer service portal, such as Omnichannel for Customer Service. |
| Goodbye | Thanks the user and indicates to the user's client that the session is over. The behavior varies based on the client. On the telephony channel, for example, the client will hang up. |
| Start over | Resets the conversation and resets [global variables](authoring-variables-bot.md) for the current session. |

Use the following nodes to design conversation flow in your bots.

1. Select **+** to add a node, and then select **Topic Management**, then one of the following:

    :::image type="content" source="media/authoring-moving-between-topics/topics-nodes-end.png" alt-text="Screenshot showing options for ending a conversation.":::

   - Select **End conversation** to notify the user's client that the session is over. The behavior varies based on the client. On the telephony channel, for example, the client ends the call.
   - Select **End all topics** to clear all active topics and start the conversation from the beginning. However, this does not clear or reset any global variables. To clear global variables, redirect to the Start over system topic.
   - Select **End current topic** to end the current topic and return to the calling topic, if any. You can use this node to create a conversation branch that exits the topic while another branch continues.
   - Select **Go to another topic** to _call_ or redirect to another topic. When that topic ends, control returns to the calling topic.
