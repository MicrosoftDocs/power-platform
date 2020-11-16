---
title: "Check your chatbot with the Test bot in Microsoft Teams"
description: "The Test bot lets you check how well your topics are working, and lets you navigate topic nodes in the Power Virtual Agents app in Microsoft Teams."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Test your Power Virtual Agents bot in Teams

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../authoring-test-bot.md)
> - [Power Virtual Agents app in Microsoft Teams](authoring-test-bot-teams.md)



As you design your bot in Power Virtual Agents, you can use the **Test bot** pane to see how the bot leads  a user through the bot conversation. 

To help you find and fix unexpected behavior, you can enable tracking between topics to take you through the bot conversation step-by-step, and go to the corresponding node in the authoring canvas.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]


## Test a topic in the Test bot pane

1. If the **Test bot** pane is hidden, open it by selecting the test bot icon at the bottom of the side navigation pane.


   :::image type="content" source="media/test-bot-menu-teams.png" alt-text="The Test your bot button is at the bottom of the side navigation pane":::

1. It's a good idea to select **Reset** at the top of the **Test bot** pane to clear previous conversations. Clearing previous conversations makes it easier to see the flow of the topic you want to see without getting confused by previous conversations.

   ![Click Reset at the top of the Test bot pane to clear conversation history](media/test-bot-reset-teams.png)

1. At the **Type your message** prompt at the bottom of the **Test bot** pane, enter a trigger phrase for the topic.

   The trigger phrase starts the topic's conversation, and the **Test bot** pane displays the bot responses and user response choices you specified.

1. Continue the conversation, testing that it flows in the intended as [designed in the topic](authoring-create-edit-topics-teams.md).

1. Select a response in the **Test bot** pane, which will take you to the response in the conversation editor for that topic. The authoring canvas displays highlighted nodes in green.


    :::image type="content" source="media/test-bot-response-teams.png" alt-text="Select any response in the conversation to see the authoring canvas highlighted to that response":::

You can return to the authoring canvas for the topic  at any time to revise it's conversation path. The **Test chat** pane will automatically refresh itself when you save changes to a topic.



## Track through the topic's conversation path

As you fine-tune your bot, it can be useful to enable tracking between topics so you can follow through the conversation path step by step.

1. If the **Test bot** pane is hidden, open it by selecting the test bot icon at the bottom of the side navigation pane.

   :::image type="content" source="media/test-bot-menu-teams.png" alt-text="The Test your bot button is at the bottom of the side navigation pane":::


1. At the top of the **Test bot** pane, set **Track between topics** to **On**.

   ![Switch the track between topics toggle at the top of the test bot pan](media/test-bot-track-teams.png)

1. Enter a trigger phrase for the topic you want to check, and then continue testing the conversation.

1. As you move through the conversation in the **Test bot** pane, the authoring canvas highlights the current place in the conversation path. The authoring canvas displays highlighted nodes in green.

1. To navigate to an earlier place in the conversation path in the authoring canvas, select it in the **Test bot** pane.

If the conversation path in the **Test your bot** pane moves from one topic to another topic, the authoring canvas refreshes and moves between topics to the appropriate highlighted nodes.




