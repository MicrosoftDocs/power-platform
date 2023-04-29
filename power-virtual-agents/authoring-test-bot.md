---
title: "Check your chatbot with the Test bot"
description: "The Test bot lets you check how well your topics are working, and lets you navigate topic nodes."
keywords: "PVA"
ms.date: 01/25/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: authoring, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Test your Power Virtual Agents bot

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-test-bot.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-test-bot-teams.md)

As you design your bot in Power Virtual Agents, you can use the **Test bot** pane to see how the bot leads a customer through the bot conversation.

To help you find and fix unexpected behavior, you can enable tracking between topics to take you through the bot conversation step-by-step, and go to the corresponding node in the authoring canvas.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Test a topic in the Test bot pane

1. If the **Test bot** pane is hidden, open it by selecting **Test your bot**.

   :::image type="content" source="media/authoring-test-bot/test-bot-menu.png" alt-text="The Test your bot button is at the bottom of the navigation menu." border="false":::

1. It's a good idea to select **Reset** at the top of the **Test bot** pane to clear previous conversations. Clearing previous conversations makes it easier to see the flow of the topic you want to see without getting confused by previous conversations.

   :::image type="content" source="media/authoring-test-bot/test-bot-reset.png" alt-text="Click Reset at the top of the Test bot pane to clear conversation history." border="false":::

1. At the **Type your message** prompt at the bottom of the **Test bot** pane, enter a trigger phrase for the topic.

   The trigger phrase starts the topic's conversation, and the **Test bot** pane displays the bot responses and user response choices you specified.

1. Continue the conversation, testing that it flows in the intended as [designed in the topic](authoring-create-edit-topics.md).

1. Select a response in the **Test bot** pane, which will take you to the response in the conversation editor for that topic. The authoring canvas displays highlighted nodes in green.

  :::image type="content" source="media/authoring-test-bot/test-bot-response.png" alt-text="Select any response in the conversation to see the authoring canvas highlighted to that response." border="false":::

You can return to the authoring canvas for the topic  at any time to revise it's conversation path. The **Test chat** pane will automatically refresh itself when you save changes to a topic.

## Track through the topic's conversation path

As you fine-tune your bot, it can be useful to enable tracking between topics so you can follow through the conversation path step by step.

1. At the top of the **Test bot** pane, set **Track between topics** to **On**.

   :::image type="content" source="media/authoring-test-bot/test-bot-track.png" alt-text="Switch the track between topics toggle at the top of th test bot pan." border="false":::

1. Enter a trigger phrase for the topic you want to check, and then continue testing the conversation.

1. As you move through the conversation in the **Test bot** pane, the authoring canvas highlights the current place in the conversation path. The authoring canvas displays highlighted nodes in green.

1. To navigate to an earlier place in the conversation path in the authoring canvas, select it in the **Test bot** pane.

If the conversation path in the **Test your bot** pane moves from one topic to another topic, the authoring canvas refreshes and moves between topics to the appropriate highlighted nodes.

## Save conversation snapshots

While testing your bot in the **Test bot** pane, you can use the **Save snapshot** command to get conversational diagnostics data. This data can help you troubleshoot issues, such as the bot not responding in the way you expect.

> [!WARNING]
> The snapshot contains all of your bot content, which may include sensitive information.

1. At the top of the **Test bot** pane, select the menu icon (**&vellip;**) and then **Save snapshot**.

    :::image type="content" source="media/authoring-test-bot/save-snapshot.png" alt-text="Save snapshot.":::

1. In the window that appears, select **Save**.

    :::image type="content" source="media/authoring-test-bot/save-snapshot-window.png" alt-text="Save snapshot message.":::

1. The bot's content and conversational diagnostics will be saved in a .zip archive file called *DSAT.zip*.

    :::image type="content" source="media/authoring-test-bot/dsat.png" alt-text="Conversational diagnostics archive.":::

1. The *DSAT.zip* file contains two files: *botContent.json* and *dialog.json*.

    1. *dialog.json* contains conversational diagnostics, including detailed descriptions of errors.

        :::image type="content" source="media/authoring-test-bot/conversation-file.png" alt-text="Conversational diagnostics file.":::

    1. *botContent.json* contains the bot's topics and other content, including entities and variables used in the bot.

Help us improve Power Virtual Agents by flagging issues with the **Flag an issue** command on the test bot pane. This submits your conversation ID to Microsoft, which is a unique identifier that Microsoft uses to troubleshoot the issue of the conversation. Other information, such as that in the *DSAT.zip* file, is not sent when you flag an issue.

:::image type="content" source="media/authoring-test-bot/flag-issue.png" alt-text="Flag an issue.":::

All information collected is anonymous and will be used to help improve bot quality.

[!INCLUDE[footer-include](includes/footer-banner.md)]
