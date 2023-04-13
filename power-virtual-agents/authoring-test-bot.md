---
title: "Test your Power Virtual Agents bot"
description: "The Test bot lets you check how well your topics are working, and lets you navigate topic nodes."
keywords: "PVA"
ms.date: 04/13/2023
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

In Power Virtual Agents, you can design and test your bot simultaneously by opening the **Test bot** pane and the authoring canvas side-by-side. As you interact with the bot, nodes that fire are highlighted in the authoring canvas to help you find and fix unexpected behavior. 

When you turn on the **Tracking topic-to-topic** feature, you can automatically navigate across topics to each node as it fires. You can also use the **Variables** pane to see the values of your variable change through the course of the conversation. 

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

# [Preview](#tab/preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Use the **Test bot** pane to walk through your bot conversations as the user. It's a good way to make sure your topics are working and that conversations flow as you expect.

### Follow a conversation through a topic 

1. If the **Test bot** pane is hidden, open it by selecting **Test your bot**.  

   [new PVA2 screenshot] 

1. In the *Type your message* field, enter some text. If the text is similar to a trigger phrase for a topic, that topic will begin. 

   [new PVA2 screenshot] 

1. Select the bot response in the **Test bot** pane. This takes you to the topic and the node that sent the response. Nodes that have fired display a colored checkmark and a colored bottom border. 

1. If you continue the conversation with the test bot in the same topic, each node that fires is marked with the checkbox and bottom border and centered in the canvas. 

   [new PVA2 screenshot] 

1. Continue the conversation, testing that the bot flows as intended in the topic.  

You can update a topic at any time while interacting with the test bot. Simply save your topic to apply changes and continue the conversation with your bot.  
 
Your conversation is not automatically cleared when you save a topic. If at any point you want to clear the conversation from your test bot and start over, select the **Reset** button. 

[new PVA2 screenshot] 

### Track topic-to-topic

You can automatically navigate across topics to each node that fires, by using the **Track topic-to-topic** setting. 
 
1. At the top of the **Test bot** pane, set **Track topic-to-topic** to **On**. 

   [new PVA2 screenshot] 

1. Continue interacting with your bot. As you navigate to each node that fires, you can switch topics along with the conversation. 

### Test variable values

You can observe the values of your variables as you test your bot. 

1. Open the test bot. 

1. Open the **Variables** pane and select the **Test** tab. If a variable has values, it appears here. Any empty variables appear as *undefined*. 

   [new PVA2 screenshot] 

1. To inspect complex values, such as a *list* or *record*, select the link in the value to see more details. 

   [new PVA2 screenshot]  

For information about using the variable test pane to test slot filling, see [Slot filling](advanced-entities-slot-filling#slot-filling.md).

 
### Save conversation snapshots

While you're testing your bot, you can capture the content of and diagnostics data about the conversation, and save it as a file. You can then analyze the data to troubleshoot issues, such as the bot not responding in the way you expect.

> [!WARNING]
> The snapshot file contains all your bot content, which may include sensitive information.

1. At the top of the **Test bot** pane, select the menu icon (⋮), then select **Save snapshot**. 

   [new PVA2 screenshot] 

1. Select **Save** to save the bot content and conversational diagnostics in a .zip archive file named *botContent.zip*.

   [new PVA 2 screenshot] 
  
The *botContent.zip* file contains two files: *botContent.yml* and *dialog.json*. 

[new screenshot from Windows file explorer] 

- *dialog.json* contains conversational diagnostics, including detailed descriptions of errors.  

- *botContent.yml* contains the bot's topics and other content, including entities and variables used. 


# [Classic](#tab/web)

### Test a topic in the Test bot pane

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

### Track through the topic's conversation path

As you fine-tune your bot, it can be useful to enable tracking between topics so you can follow through the conversation path step by step.

1. At the top of the **Test bot** pane, set **Track between topics** to **On**.

   :::image type="content" source="media/authoring-test-bot/test-bot-track.png" alt-text="Switch the track between topics toggle at the top of th test bot pan." border="false":::

1. Enter a trigger phrase for the topic you want to check, and then continue testing the conversation.

1. As you move through the conversation in the **Test bot** pane, the authoring canvas highlights the current place in the conversation path. The authoring canvas displays highlighted nodes in green.

1. To navigate to an earlier place in the conversation path in the authoring canvas, select it in the **Test bot** pane.

If the conversation path in the **Test your bot** pane moves from one topic to another topic, the authoring canvas refreshes and moves between topics to the appropriate highlighted nodes.

### Save conversation snapshots

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


# [Teams](#tab/teams)

### Test a topic in the Test bot pane

1. If the **Test bot** pane is hidden, open it by selecting **Test your bot** in the navigation menu.

   :::image type="content" source="media/authoring-test-bot/test-bot-menu-teams.png" alt-text="The Test your bot button is at the bottom of the navigation menu.":::

1. It's a good idea to select **Reset** at the top of the **Test bot** pane to clear previous conversations. Clearing previous conversations makes it easier to see the flow of the topic you want to see without getting confused by previous conversations.

   :::image type="content" source="media/authoring-test-bot/test-bot-reset-teams.png" alt-text="Click Reset at the top of the Test bot pane to clear conversation history." border="false":::

1. At the **Type your message** prompt at the bottom of the **Test bot** pane, enter a trigger phrase for the topic.

   The trigger phrase starts the topic's conversation, and the **Test bot** pane displays the bot responses and user response choices you specified.

1. Continue the conversation, testing that it flows in the intended as [designed in the topic](authoring-create-edit-topics.md).

1. Select a response in the **Test bot** pane, which will take you to the response in the conversation editor for that topic. The authoring canvas displays highlighted nodes in green.

    :::image type="content" source="media/authoring-test-bot/test-bot-response-teams.png" alt-text="Select any response in the conversation to see the authoring canvas highlighted to that response.":::

You can return to the authoring canvas for the topic  at any time to revise it's conversation path. The **Test chat** pane will automatically refresh itself when you save changes to a topic.

### Track through the topic's conversation path

As you fine-tune your bot, it can be useful to enable tracking between topics so you can follow through the conversation path step by step.

1. If the **Test bot** pane is hidden, open it by selecting **Test your bot** in the navigation menu.

   :::image type="content" source="media/authoring-test-bot/test-bot-menu-teams.png" alt-text="The Test your bot button is at the bottom of the navigation menu.":::

1. At the top of the **Test bot** pane, set **Track between topics** to **On**.

   :::image type="content" source="media/authoring-test-bot/test-bot-track-teams.png" alt-text="Switch the track between topics toggle at the top of the test bot pan." border="false":::

1. Enter a trigger phrase for the topic you want to check, and then continue testing the conversation.

1. As you move through the conversation in the **Test bot** pane, the authoring canvas highlights the current place in the conversation path. The authoring canvas displays highlighted nodes in green.

1. To navigate to an earlier place in the conversation path in the authoring canvas, select it in the **Test bot** pane.

If the conversation path in the **Test your bot** pane moves from one topic to another topic, the authoring canvas refreshes and moves between topics to the appropriate highlighted nodes.

---

> [!NOTE]
> Help us improve Power Virtual Agents by flagging issues with the **Flag an issue** command on the **Test bot** pane. This submits your conversation ID to Microsoft; the ID is a unique identifier that Microsoft uses to troubleshoot the issue of the conversation. Other information, such as is stored in the *DSAT.zip* file, is not sent when you flag an issue. All information collected remains anonymous and will be used to help improve bot quality. 

[!INCLUDE[footer-include](includes/footer-banner.md)]
