---
title: Test your Power Virtual Agents bot (preview)
description: Use the Test bot to check how well your topics are working and navigate topic nodes in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/13/2022
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.custom: authoring, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Test your Power Virtual Agents bot (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Use the **Test bot** pane to walk through your bot conversations as the user. It's a good way to make sure your topics are working and that conversations flow as you expect.

## Test a topic in the Test bot pane

1. If the **Test bot** pane is hidden, select **Test your bot** at the bottom of the left side panel to open it.

   :::image type="content" source="media/authoring-test-bot/test-bot-menu.png" alt-text="Screenshot of the Power Virtual Agents left side panel, with the Test your bot button highlighted.":::

1. Select **Reset** at the top of the **Test bot** pane to clear previous conversations.

    Resetting makes it easier to follow the flow of the current topic without getting confused by previous conversations.

   :::image type="content" source="media/authoring-test-bot/test-bot-reset.png" alt-text="Screenshot of the Test bot pane, with the Reset button highlighted.":::

1. At the **Type your message** prompt, enter one of the topic's trigger phrases.

    It's a good idea to test variations of the topic's trigger phrases to make sure your bot is as responsive as possible.

    The trigger phrase starts the conversation. The **Test bot** pane displays the bot's response and the user response choices you specified.

1. Continue the conversation, testing that it flows as intended when you [designed in the topic](authoring-create-edit-topics.md).

You can return to a topic's authoring canvas at any time to revise the conversation path. The **Test bot** pane automatically refreshes when you save changes to a topic.

## Save conversation snapshots

While you're testing your bot in the **Test bot** pane, you can capture the content of, and diagnostics data about, the conversation and save it in a file. You can analyze the data to troubleshoot issues, such as the bot not responding in the way you expect.

> [!WARNING]
> The snapshot file contains all your bot content, which may include sensitive information.

1. At the top of the **Test bot** pane, select the **More** icon (**&vellip;**), and then select **Save snapshot**.

    :::image type="content" source="media/authoring-test-bot/save-snapshot.png" alt-text="Screenshot of the Test bot pane, with the More menu icon and Save snapshot button highlighted.":::

1. Select **Save**.

The bot's content and conversational diagnostics are saved in a .zip archive file called _DSAT.zip_. The _DSAT.zip_ file contains two files, _botContent.json_ and _dialog.json_:

- _dialog.json_ contains conversational diagnostics, including detailed descriptions of errors.

- _botContent.json_ contains the bot's topics and other content, including entities and variables used in the bot.

## Report issues with your bot conversations

Help us improve Power Virtual Agents by using the **Flag an issue** command in the **Test bot** pane to tell us about issues with your conversations.

1. At the top of the **Test bot** pane, select the flag icon (**Flag an issue**)

    :::image type="content" source="media/authoring-test-bot/flag-issue-icon.png" alt-text="Screenshot of the Test bot pane, with the Flag an issue icon highlighted.":::

1. Select **Flag issue**.

    :::image type="content" source="media/authoring-test-bot/flag-issue.png" alt-text="Screenshot of the Flag an issue confirmation message.":::

The **Flag an issue** command sends the conversation ID to Microsoft. The conversation ID is a unique identifier that Microsoft uses to troubleshoot an issue with the conversation. Other information, such as the contents of the _DSAT.zip_ file, isn't sent when you flag an issue.

All information collected is anonymous and will be used to help improve bot quality.

[!INCLUDE[footer-include](includes/footer-banner.md)]
