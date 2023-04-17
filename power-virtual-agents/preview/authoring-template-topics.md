---
title: Start with sample topics (preview)
description: Start with template topics to understand the capabilities when authoring topics for use in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/13/2022
ms.topic: conceptual
author: iaanw
ms.author: iawilt
ms.custom: authoring, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Start with sample topics (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Power Virtual Agents includes sample topics with every new bot to help you understand the capabilities of bot topics. These samples range from simple to complex scenarios that use [conditional branching](authoring-create-edit-topics.md), [variables](authoring-variables.md), and [custom entities](advanced-entities-slot-filling.md).

The topics are functional, but they aren't designed for production use. They're examples to help you learn how to create content for your bots.

## Use sample topics to understand how topics work

1. Open your bot, or create one, and go to the **Topics** tab.

   > [!IMPORTANT]
   > The sample topics are listed on the **Topics** page when you create a bot. If you don't see them in an existing bot, create one.

1. To view the bot's conversation flow, select each topic in turn to open it in the authoring canvas.

    The flow includes the bot's comments, expected user responses, decision points, and entity references used in each topic. Review these and the topic's title, description, and trigger phrases.

   :::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="Screenshot of sample topics in Power Virtual Agents.":::

## Available sample topics

Each sample is designed to teach you how to use the authoring canvas to create basic and advanced bot conversations. We recommend that you start with **Lesson 1** and work through each topic in order.

### Lesson 1 - A simple topic

This sample shows you how to create a topic that responds to a question about store hours.

### Lesson 2 - A simple topic with a condition and a variable

This sample shows you how to create a question that asks customers which store they're interested in and stores the response in a variable. The condition uses the variable to determine which store's hours to return.

### Lesson 3 - A topic with a condition, variables, and a pre-built entity

This sample asks customers to enter the state to ship their order to. The bot uses the pre-built **State** [entity](advanced-entities-slot-filling.md) to recognize the US state in the user's response, and stores it in the **State** variable. A condition uses this variable to determine which shipping message to send the user. Another condition uses the customer's response to a multiple-choice question, stored in the variable **Item**, to determine which product to order.

### Lesson 4 - A topic with a condition, variables, and custom entity

This sample uses [a custom entity](advanced-entities-slot-filling.md), **Usage Type**, to recognize the user's response to a multiple-choice question, and stores it in the **UsageType** variable. A condition uses this variable to suggest a product to order.

[!INCLUDE[footer-include](includes/footer-banner.md)]
