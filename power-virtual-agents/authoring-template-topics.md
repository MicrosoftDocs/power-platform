---
title: "Use lesson topics to understand capabilities"
description: "Use specific template topics to understand the capabilities when authoring topics for use in Microsoft Copilot Studio bots."
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

# Use lesson topics in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio includes sample topics with every new bot to help you understand the capabilities of bot topics. These samples range from simple to complex scenarios that use [conditional branching](authoring-create-edit-topics.md), [variables](authoring-variables.md), and [custom entities](advanced-entities-slot-filling.md).

The topics are functional, but they aren't designed for production use. They're examples to help you learn how to create content for your bots.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- If you're using a bot that has **Classic** added to the name, you'll need to upgrade your bot to see the latest versions of the sample topics. If you can't upgrade, see the [archived version of this content](#).


## Use sample topics to understand how topics work

1. Open your bot, or create one, and go to the **Topics** tab.

   > [!IMPORTANT]
   > The sample topics are listed on the **Topics** page when you create a bot. If you don't see them in an existing bot, create one.

1. To view the bot's conversation flow, select each topic in turn to open it in the authoring canvas.

    The flow includes the bot's comments, expected user responses, decision points, and entity references used in each topic. Review these and the topic's title, description, and trigger phrases.

   :::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="Screenshot of sample topics in Microsoft Copilot Studio.":::

### Available sample topics

Each sample is designed to teach you how to use the authoring canvas to create basic and advanced bot conversations. We recommend that you start with **Lesson 1** and work through each topic in order.

**Lesson 1 - A simple topic**

This sample shows you how to create a topic that responds to a question about store hours.

**Lesson 2 - A simple topic with a condition and a variable**

This sample shows you how to create a question that asks customers which store they're interested in and stores the response in a variable. The condition uses the variable to determine which store's hours to return.

**Lesson 3 - A topic with a condition, variables, and a prebuilt entity**

This sample asks customers to enter the state to ship their order to. The bot uses the prebuilt **State** [entity](advanced-entities-slot-filling.md) to recognize the US state in the user's response, and stores it in the **State** variable. A condition uses this variable to determine which shipping message to send the user. Another condition uses the customer's response to a multiple-choice question, stored in the variable **Item**, to determine which product to order.

**Lesson 4 - A topic with a condition, variables, and custom entity**

This sample uses [a custom entity](advanced-entities-slot-filling.md), **Usage Type**, to recognize the user's response to a multiple-choice question, and stores it in the **UsageType** variable. A condition uses this variable to suggest a product to order.



### Access and use lesson topics for new bots

When a bot is created, several lessons are automatically created as topics.

While the topics are functional, they are examples for the purposes of learning how to create content for your bots. The topics aren't designed for production use.

**Use lesson topics to understand how topics work:**

1. Go to the **Topics** tab.

1. Select **Lesson 1** and work through to **Lesson 4**. Review the title and description, and see what trigger phrases are being used.  

1. To see the bot's flow, select each topic. The flow includes the bot's comments, expected user responses, decision points, and entity references.

   :::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="List of lesson topics." border="false":::

> [!IMPORTANT]
> You will see these lessons when you create a new bot. If you have previously created a bot and don't see them, try creating a new bot and then going to the **Topics** tab.

### Available lesson topics

Each lesson is designed to teach you how to use the authoring canvas to create basic and advanced bot conversations.

You should start with **Lesson 1** and work through each lesson in order.

**Lesson 1 - A simple topic**

This lesson shows you how to create a simple topic with one conditional branch.

**Lesson 2 - A simple topic with a condition and variable**

This lesson shows you how you can create a simple topic with one conditional branch and [a variable](authoring-variables.md).

A variable is a name for an item that will be used later in the topic flow. In this example, `pva_StoreLocation` is the variable to store the user's response when you ask for their preferred store location.

**Lesson 3 - A topic with a conditions, variables, and a prebuilt entity**

This lesson shows you how you can create a simple topic with one conditional branch, [a variable](authoring-variables.md), and [an entity](advanced-entities-slot-filling.md).

When you use entities in your topic, the bot can identify key information from what the user types and automatically fill in that information into your variables.

For example, if you type "I want to buy a red car," the bot doesn't need to ask which color car, because the bot recognizes the Color entity in what you typed. The bot will then skip the question where you asked for color.

In this lesson, the bot uses the State entity and will recognize any US state the user enters.

**Lesson 4 - A topic with conditions, variables, and a custom entity**

This lesson shows a topic with a conditional branch, [a variable](authoring-variables.md), and [a custom entity](advanced-entities-slot-filling.md#custom-entities).

You can see the bot bypass a follow-up question. For example, try testing with "I want a business laptop."

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
