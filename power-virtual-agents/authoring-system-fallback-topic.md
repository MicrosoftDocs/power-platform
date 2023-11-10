---
title: "Use a system fallback topic"
description: "A system fallback topic can be triggered when the bot doesn't understand the user's questions."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: authoring, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure the system fallback topic

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

During a conversation, a Microsoft Copilot Studio bot [triggers the appropriate topic based on the user's input](authoring-create-edit-topics.md). If the bot can't determine the user's intent, it prompts the user again. After two prompts, the bot escalates to a live agent through the system **Escalate** topic.

In some scenarios, you might want to customize how the bot behaves when user input doesn't trigger any topic. For example, you can build a catchall topic to capture unrecognized user intent, or use a topic to call back-end systems or route to existing services.

Customize these fallback behaviors by adding the system **Fallback** topic. You can also customize the **Fallback** topic itself, similar to most other system topics.

This topic also includes the unique variable `UnrecognizedTriggerPhrase` to capture the unrecognized input.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Add a system fallback topic

1. On the top pane, select **Settings** :::image type="content" source="media/authoring-system-fallback-topic/settings-icon.png" alt-text="Settings icon." border="false":::, and then go to the **System fallback** tab.

    >[!NOTE]
    > In Microsoft Teams, **Settings** is located at the bottom of the navigation menu.

1. Select **"+Add"**.

  :::image type="content" source="media/authoring-system-fallback-topic/settings-system-fallback-pane.png" alt-text="Open System fallback settings.":::

A system fallback topic is added. The bot will go to this topic when it can't find an appropriate topic or doesn't understand the user's input.

A new option will appear on the **Settings** pane under the **System fallback** section: **Go to fallback topic**, which lets you customize the topic.

## Customize the system fallback topic

After you add the system fallback topic, you can open it by selecting **Go to fallback topic** on the **Settings** pane.

You'll also see the **Fallback** topic listed in the topic list.

:::image type="content" source="media/authoring-system-fallback-topic/system-fallback-topic-list.png" alt-text="Fallback in the topic list." border="false":::

When you open this topic in the authoring canvas, you'll see that the default fallback topic contains two nodes: a **Message** node that rephrases the user input and an **Escalate** node that redirects to a live agent.

:::image type="content" source="media/authoring-system-fallback-topic/system-fallback-default-content.png" alt-text="Fallback topic default content." border="false":::

You can customize this topic as with any other [system topic](authoring-create-edit-topics.md). You can also use the *_UnrecognizedTriggerPhrase_ variable that stores the user input the bot couldn't understand. For example, you can use the variable as an input and pass it to a [Power Automate flow](advanced-flow-input-output.md) or [Bot Framework skill](advanced-use-skills.md).

> [!NOTE]
> The system fallback topic doesn't have a trigger phrase.

## Reset system fallback behavior by deleting the fallback topic

To reset the system fallback behavior and return it to its default behavior, go to **Settings** and then **System Fallback**. In the **System fallback** section, select **Delete** to remove the fallback topic.

:::image type="content" source="media/authoring-system-fallback-topic/delete-system-fallback-topic.png" alt-text="Delete the fallback topic." border="false":::

> [!WARNING]
> This will remove the fallback topic and any changes you made to it.

[!INCLUDE[footer-include](includes/footer-banner.md)]
