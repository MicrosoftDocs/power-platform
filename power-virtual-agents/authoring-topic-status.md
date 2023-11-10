---
title: View topic status
description: Resolve errors, set the status of individual topics, and copy topics when creating new topics to save time in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 04/13/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.custom: ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# View topic status (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio offers many ways to manage your topics. It includes a topic checker that flags topics that contain errors. You can turn topics on or off so that they don't appear to people chatting with your bot. And you can copy topics to make it easier to create new ones.

## Topic errors

When you save a topic, Microsoft Copilot Studio notifies you if it contains an error or raises a warning. Errors will stop your bot from working. You must fix them before you can publish your bot. Warnings won't stop your bot from working, but they may cause individual topics not to work as expected. You should fix them when you see them.

:::image type="content" source="media/authoring-topic-status/topics-errors-save.png" alt-text="Screenshot of the message that indicates a topic has errors that you must fix.":::

You can see whether a topic has errors, and how many errors it has, in the Topics page. The Topics page only shows errors, not warnings, because errors will prevent your bot from working.

:::image type="content" source="media/authoring-topic-status/topics-errors.png" alt-text="Screenshot of the Topics page, with the number of errors in a topic highlighted.":::

### View topic errors

1. In the **Topics** page, select the error count to open the authoring canvas to where the first error is.

1. Select **Topic checker** to view a list of the topic's errors and warnings.

    :::image type="content" source="media/authoring-topic-status/topic-checker.png" alt-text="Screenshot of the Topic checker and the list of errors in the topic.":::

1. Select an error to go directly to the node that contains the error.  

### Types of errors

The topic checker flags four types of errors:

- _Node_: The entire node is incorrect. It's highlighted in red.
- _Field_: The field might be missing required data. It's highlighted in red.
- _Expression_: The expression might be invalid. It's highlighted in red.
- _Variable deletion_: A variable was deleted, causing it to become "orphaned." It must be either removed or replaced. It's highlighted in red wherever it was used.

## Topic status

Topics can have a status of **On** or **Off** to indicate whether they can be used or triggered in a bot conversation. By default, new topics are created with their status set to **On**. Change it using the toggle in the **Status** column in the Topics page.

When a topic is **On**, it will trigger as expected, either as a result of its trigger phrases or when another topic redirects to it.

When a topic is **Off**, it won't trigger at all. It won't trigger if its trigger phrases are used in a conversation or if another topic redirects to it. As far as your bot knows, the topic doesn't exist. The topic checker will identify an error if another topic redirects to an **Off** topic.

When you publish your bot, all topics are published whether they're **On** or **Off**.

> [!TIP]
> Turn a topic **Off** to work on it in a draft state. Leave its status at **Off** while publishing changes to other topics that are ready to go live.

:::image type="content" source="media/authoring-topic-status/topics-status.png" alt-text="Screenshot of the Topics page, with the Status column highlighted.":::

## Copy a topic

After you've created a few topics, you may want to use a previous topic as a baseline when creating new topics.

In the **Topics** page, select the **More actions** menu (**&vellip;**), and then select **Make a copy**.

:::image type="content" source="media/authoring-topic-status/topics-menu-icon.png" alt-text="Screenshot of a topic's More actions menu, with the Make a copy option highlighted.":::

This option duplicates the selected topic with _(Copy)_ added to the name. All the topic content, such as the description, trigger phrases, and the entire conversation, is copied over to the new topic.

A copied topic is **Off** by default to avoid confusion with the original topic, which has the same trigger phrases.

When you're done editing the new topic, turn it **On** to [test it](authoring-test-bot.md). When it's ready, publish the new topic.

There's no limit to the number of times you can copy a topic. A number will be added to the name and each topic will have its own internal ID.

[!INCLUDE[footer-include](includes/footer-banner.md)]
