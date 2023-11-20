---
title: "Test your Microsoft Copilot Studio bot"
description: "The Test bot lets you check how well your topics are working, and lets you navigate topic nodes."
keywords: "PVA"
ms.date: 04/14/2023
ms.topic: article

author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: authoring, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Test your Microsoft Copilot Studio bot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

As you design your bot in Microsoft Copilot Studio, you can use the **Test bot** pane to see how the bot leads a customer through the bot conversation.

To help you find and fix unexpected behavior, you can enable tracking between topics to take you through the bot conversation step-by-step, and go to the corresponding node in the authoring canvas.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/webApp)

Use the **Test bot** pane to walk through your bot conversations as the user. It's a good way to make sure your topics are working and that conversations flow as you expect.
### Follow a conversation through a topic 

1. If the **Test bot** pane is hidden, open it by selecting **Test your bot**.  

   :::image type="content" source="media/authoring-test-bot/test-bot-button.png" alt-text="Screenshot of the Test bot button.":::

1. In the *Type your message* field, enter some text. If the text is similar to a trigger phrase for a topic, that topic will begin. 

   :::image type="content" source="media/authoring-test-bot/type-your-message.png" alt-text="Screenshot of the Type your message field.":::

1. Select the bot response in the **Test bot** pane. This takes you to the topic and the node that sent the response. Nodes that have fired display a colored checkmark and a colored bottom border. 

   :::image type="content" source="media/authoring-test-bot/colored-checkmark.png" alt-text="Screenshot of the node displaying a colored checkmark and border.":::

    >[!NOTE] 
    > As you continue the conversation with the test bot in the same topic, each node that fires is marked with the checkbox and bottom border and centered in the canvas. 

1. Continue the conversation, testing that the bot flows as intended in the topic.  

You can update a topic at any time while interacting with the test bot. Simply save your topic to apply changes and continue the conversation with your bot.  
 
Your conversation is not automatically cleared when you save a topic. If at any point you want to clear the conversation from your test bot and start over, select the **Reset** button. 

   :::image type="content" source="media/authoring-test-bot/test-bot-reset.png" alt-text="Screenshot of the Test reset button.":::

### Track topic-to-topic

You can automatically navigate across topics to each node that fires, by using the **Track topic-to-topic** setting. 
 
1. At the top of the **Test bot** pane, set **Track topic-to-topic** to **On**. 

   :::image type="content" source="media/authoring-test-bot/track-topic-to-topic.png" alt-text="Screenshot of the topic-to-topic toggle.":::

1. Continue interacting with your bot. As you navigate to each node that fires, you can switch topics along with the conversation. 

### Test variable values

You can observe the values of your variables as you test your bot. 

1. Open the test bot. 

1. Open the **Variables** pane and select the **Test** tab. If a variable has values, it appears here. Any empty variables appear as *undefined*. 

   :::image type="content" source="media/authoring-test-bot/variables-pane.png" alt-text="Screenshot of the Variables Test pane."::: 

1. To inspect variable properties, select the link in the value to display variable details. 

   :::image type="content" source="media/authoring-test-bot/complex-values.png" alt-text="Screenshot of the Variables list details pane.":::

For information about using the variable test pane to test slot filling, see [Use entities and slot filling](advanced-entities-slot-filling.md).

 
### Save conversation snapshots

While you're testing your bot, you can capture the content of and diagnostics data about the conversation, and save it as a file. You can then analyze the data to troubleshoot issues, such as the bot not responding in the way you expect.

> [!WARNING]
> The snapshot file contains all your bot content, which may include sensitive information.

1. At the top of the **Test bot** pane, select the menu icon (⋮), then select **Save snapshot**. 

   :::image type="content" source="media/authoring-test-bot/save-snapshot.png" alt-text="Screenshot of the Save Snapshot option.":::

1. Select **Save** to save the bot content and conversational diagnostics in a .zip archive file named *botContent.zip*.

   :::image type="content" source="media/authoring-test-bot/save-snapshot-window.png" alt-text="Screenshot of the Save Snapshot window.":::

The *botContent.zip* file contains two files:

- *dialog.json* contains conversational diagnostics, including detailed descriptions of errors.  

- *botContent.yml* contains the bot's topics and other content, including entities and variables used. 


# [Classic](#tab/classic)

### Test a topic in the Test bot pane

Use the **Test bot** pane to walk through your bot conversations as the user. It's a good way to make sure your topics are working and that conversations flow as you expect.

1. If the **Test bot** pane is hidden, select **Test your bot** at the bottom of the left side panel to open it.

   :::image type="content" source="media/authoring-test-bot/test-bot-menu.png" alt-text="Screenshot of the Microsoft Copilot Studio left side panel, with the Test your bot button highlighted.":::

1. Select **Reset** at the top of the **Test bot** pane to clear previous conversations.

    Resetting makes it easier to follow the flow of the current topic without getting confused by previous conversations.

   :::image type="content" source="media/authoring-test-bot/test-bot-reset.png" alt-text="Screenshot of the Test bot pane, with the Reset button highlighted.":::

1. At the **Type your message** prompt, enter one of the topic's trigger phrases.

### Track through the topic's conversation path
 
The trigger phrase starts the conversation. The **Test bot** pane displays the bot's response and the user response choices you specified.

1. Continue the conversation, testing that it flows as intended when you [designed in the topic](authoring-create-edit-topics.md).

1. You can return to a topic's authoring canvas at any time to revise the conversation path. The **Test bot** pane automatically refreshes when you save changes to a topic.

### Save conversation snapshots

While you're testing your bot in the **Test bot** pane, you can capture the content of, and diagnostics data about, the conversation and save it in a file. You can analyze the data to troubleshoot issues, such as the bot not responding in the way you expect.

> [!WARNING]
> The snapshot file contains all your bot content, which may include sensitive information.

1. At the top of the **Test bot** pane, select the **More** icon (**&vellip;**), and then select **Save snapshot**.

### Save conversation snapshots

:::image type="content" source="media/authoring-test-bot/save-snapshot.png" alt-text="Screenshot of the Test bot pane, with the More menu icon and Save snapshot button highlighted.":::

1. Select **Save**.

The bot's content and conversational diagnostics are saved in a .zip archive file called _DSAT.zip_. The _DSAT.zip_ file contains two files, _botContent.json_ and _dialog.json_:

- _dialog.json_ contains conversational diagnostics, including detailed descriptions of errors.

- _botContent.json_ contains the bot's topics and other content, including entities and variables used in the bot.

### Report issues with your bot conversations

Help us improve Microsoft Copilot Studio by using the **Flag an issue** command in the **Test bot** pane to tell us about issues with your conversations.

1. At the top of the **Test bot** pane, select the flag icon (**Flag an issue**)

    :::image type="content" source="media/authoring-test-bot/flag-issue-icon.png" alt-text="Screenshot of the Test bot pane, with the Flag an issue icon highlighted.":::

1. Select **Flag issue**.

    :::image type="content" source="media/authoring-test-bot/flag-issue.png" alt-text="Screenshot of the Flag an issue confirmation message.":::

The **Flag an issue** command sends the conversation ID to Microsoft. The conversation ID is a unique identifier that Microsoft uses to troubleshoot an issue with the conversation. Other information, such as the contents of the _DSAT.zip_ file, isn't sent when you flag an issue.

All information collected is anonymous and will be used to help improve bot quality.


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
> Help us improve Microsoft Copilot Studio by flagging issues with the **Flag an issue** command on the **Test bot** pane. This submits your conversation ID to Microsoft; the ID is a unique identifier that Microsoft uses to troubleshoot the issue of the conversation. Other information, such as is stored in the *DSAT.zip* file, is not sent when you flag an issue. All information collected remains anonymous and will be used to help improve bot quality. 
