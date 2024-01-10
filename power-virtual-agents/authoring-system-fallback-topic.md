---
title: "Use a system fallback topic"
description: "A system fallback topic can be triggered when the copilot doesn't understand the user's questions."
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

During a conversation, a Microsoft Copilot Studio copilot [triggers the appropriate topic](authoring-create-edit-topics.md) based on the user's input. If the copilot can't determine the user's intent, it prompts the user again. After two prompts, the copilot escalates to a live agent through a system topic called **Escalate**.

You can customize how the copilot behaves when user input doesn't trigger any topic. For example, you can build a catchall topic to capture unrecognized user intent, create a topic to call back-end systems, or route a topic to existing services.

Customize the fallback topic and behavior in the default system **Fallback** topic.

A fallback topic triggers **On Unknown Intent** to capture the unrecognized input.

## Prerequisites

- You need an existing copilot. To create one, see [Quickstart: Create and deploy a Microsoft Copilot Studio copilot](fundamentals-get-started.md).
- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## View the default system fallback topic

1. Open your copilot in Copilot Studio.

1. From the navigation menu, select **Topics & Plugins** > **System**, then open the **Fallback** topic.

   :::image type="content" source="media/authoring-system-fallback-topic/fallback-system-topic.png" alt-text="Screenshot showing where the system fallback topic is located.":::

   You see the flow for the system fallback topic with two main nodes: **Message** and **Redirect**. The topic has a condition to ask the user no more than twice to rephrase their question. If the copilot still doesn't understand the question, the conversation is redirected. The redirection causes the **Escalate** system topic to trigger.

   :::image type="content" source="media/authoring-system-fallback-topic/fallback-topic-flow.png" alt-text="Screenshot showing the fallback topic flow." lightbox="media/authoring-system-fallback-topic/fallback-topic-flow.png":::

   >[!NOTE]
   > In Microsoft Teams, there's no default system fallback topic. But you can always create one.

## Customize the system fallback topic

You can customize this topic as with any other [system topic](authoring-create-edit-topics.md). You can also use [variables](authoring-variables.md), such as the _UnrecognizedTriggerPhrase_, that store the user's input if the copilot can't understand.

For example, you can use a variable as an input and pass it to a [Power Automate flow](advanced-flow-input-output.md) or [Bot Framework skill](advanced-use-skills.md).

> [!NOTE]
> Since the fallback topic captures unknown content from the user, it doesn't have any trigger phrases.

## Reset system fallback behavior by deleting the fallback topic

You can return a system fallback topic to its default behavior.

1. Select the `...` on the top menu bar.
1. Select **Reset to default**.

:::image type="content" source="media/authoring-system-fallback-topic/reset-to-default.png" alt-text="Screenshot that shows where the reset button is located.":::

> [!WARNING]
> Setting a topic back to its default removes any changes you made to it.

[!INCLUDE[footer-include](includes/footer-banner.md)]
