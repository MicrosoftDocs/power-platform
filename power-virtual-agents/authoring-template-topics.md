---
title: "Use lesson topics in Microsoft Copilot Studio"
description: "Use template sample topics for Microsoft Copilot Studio copilots."
keywords: "PVA"
ms.date: 12/29/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: authoring, ceX
ms.service: power-virtual-agents

---

# Use lesson topics in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Copilot Studio includes sample topics with every new copilot. These samples range from simple to complex scenarios that use [conditional branching](authoring-create-edit-topics.md), [variables](authoring-variables.md), and [custom entities](advanced-entities-slot-filling.md).

The topics are functional but aren't designed for production use. These examples help you learn how to create content for your copilots.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- An existing copilot, or if you need to create one, see [Quickstart: Create and deploy a Microsoft Copilot Studio copilot](fundamentals-get-started.md).
- If you're using a bot that has **classic** added to the name, you can [upgrade your bot](unified-authoring-conversion.md) to see the latest versions of the sample topics. All bots made in the Teams app are classic bots.

# [Web app](#tab/web)

### Use sample topics to understand how topics work

1. Open your copilot, or [create one](fundamentals-get-started.md), and go to the **Topics & Plugins** page.

1. Review the copilot's details for name and description. The copilot derives topic phrases from the description (if any). In this case, trigger phrases were added manually to the **Trigger** node.

   :::image type="content" source="media/authoring-template-topics/topic-details.png" alt-text="Screenshot of the location of the details button in Copilot Studio.":::

1. To view the copilot's conversation flow, select each topic from the **Topics & Plugins** page to open it.

    The flow includes the copilot's comments, expected user responses, decision points, and entity references used in each topic. This sample flow is for Lesson 3.

   :::image type="content" source="media/authoring-template-topics/template-flow.png" alt-text="Screenshot of lesson topic 3 on the Topics & Plugins page of Copilot Studio." lightbox="media/authoring-template-topics/template-flow.png":::

#### Available sample topics

Each sample lesson topic is designed to teach you how to create basic and advanced copilot conversations. We recommend that you start with **Lesson 1** and work through each topic in order.

##### Lesson 1 - A simple topic

This sample template is a topic that responds to a question about store hours.

##### Lesson 2 - A simple topic with a condition and a variable

This sample shows you how to create a question that asks customers which store they're interested in and keeps the response in a variable. The condition uses the variable to determine which store's hours to return.

##### Lesson 3 - A topic with a condition, variables, and a prebuilt entity

This sample asks customers to enter a shipping state. The copilot uses the prebuilt **State** [entity](advanced-entities-slot-filling.md) to recognize the US state in the user's response, and stores it in the **State** variable.

A condition uses the **State** variable to determine which shipping message to send to the user. Another condition uses the customer's response to a multiple-choice question, stored in the variable **Item**, to determine which product to order.

# [Teams](#tab/teams)

### Use sample topics to understand how topics work - Teams

1. Go to the **Topics** page.

1. Select **Lesson 1** and work through to **Lesson 4**. Review the title and description on the **Details** pane to see what trigger phrases are being used.

   :::image type="content" source="media/authoring-template-topics/topic-details-teams.png" alt-text="Screenshot that shows where the details button is located and how it reveals the topic name and description.":::

1. To see the bot's flow, select each topic. The flow includes the copilot's comments, expected user responses, decision points, and entity references. This sample is for **Lesson 2**.

   :::image type="content" source="media/authoring-template-topics/topic-flow-overview.png" alt-text="Screenshot that shows the topic flow overview for Lesson 2." lightbox="media/authoring-template-topics/topic-flow-overview.png":::

> [!IMPORTANT]
> You see these lessons when you create a new bot. If you have previously created a bot and don't see them, try creating a new bot and then going to the **Topics** page.

#### Available sample topics - Teams

Each lesson is designed to teach you how to use the authoring canvas to create basic and advanced bot conversations.

You should start with **Lesson 1** and work through each lesson in order.

##### Lesson 1 - A simple topic - Teams

This lesson shows you how to create a simple topic with one conditional branch.

##### Lesson 2 - A simple topic with a condition and variable - Teams

This lesson shows you how to create a simple topic with a [a variable](authoring-variables.md) and conditions.

A variable is a name for an item that is used later in the topic flow. In this example, `pva_StoreLocation` is the variable to store the user's response when you ask for their preferred store location.

##### Lesson 3 - A topic with a conditions, variables, and a prebuilt entity - Teams

This lesson shows you how to create a simple topic with one conditional branch, [a variable](authoring-variables.md), and [an entity](advanced-entities-slot-filling.md).

When you use entities in your topic, the bot can identify key information from what the user types and automatically stores that information in your variables.

For example, if you type "I want to buy a red car," the bot doesn't need to ask which color car, because the bot recognizes the **Color** entity in what you typed. The bot then skips the question where you asked for color.

In this lesson, the bot uses the **State** entity and recognizes any US state the user enters.

#### Lesson 4 - A topic with conditions, variables, and a custom entity - Teams

This lesson shows a topic with a conditional branch, [a variable](authoring-variables.md), and [a custom entity](advanced-entities-slot-filling.md#custom-entities).

You can see the bot bypass a follow-up question. For example, try testing with the phrase "I want a business laptop" in the testing pane.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
