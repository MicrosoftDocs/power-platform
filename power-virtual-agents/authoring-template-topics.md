---
title: "Use lesson topics in Microsoft Copilot Studio"
description: "Use template topics for Microsoft Copilot Studio copilots."
keywords: "PVA"
ms.date: 12/29/2023

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

Copilot Studio includes sample topics with every new copilot to help you understand the capabilities of copilot topics. These samples range from simple to complex scenarios that use [conditional branching](authoring-create-edit-topics.md), [variables](authoring-variables.md), and [custom entities](advanced-entities-slot-filling.md).

The topics are functional, but they aren't designed for production use. The templates are examples to help you learn how to create content for your copilot.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- If you need to create a copilot, see [Quickstart: Create and deploy a Microsoft Copilot Studio copilot](fundamentals-get-started.md).
- If you're using a copilot with **classic** added to the name, you must upgrade your copilot to the latest version. For more information on upgrading your copilot, see [Considerations for the latest Microsoft Copilot Studio unified authoring release](unified-authoring-conversion.md).

## Use sample topics to understand how topics work

1. Open your copilot, or create one, and go to the **Topics & Plugins** tab.

   > [!IMPORTANT]
   > Sample topics are listed on the **Topics & Plugins** page once a copilot is created.

1. To view the copilot's conversation flow, select each topic to open it.

   The flow includes the copilot's comments, expected user responses, decision points, and entity references used in each topic. Review these features and the topic's title, description, and trigger phrases.

   :::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="Screenshot of sample topics in Copilot Studio.":::

### Available sample topics

Each sample teaches you how to create basic and advanced copilot conversations. We recommend you start with **Lesson 1** and work through each topic in order.

#### Lesson 1 - A simple topic

This sample template is a topic that responds to a question about store hours.

#### Lesson 2 - A simple topic with a variable and conditions

This sample template asks customers, which store they want.

- The response is stored in a variable.
- The condition uses the variable to determine which store's hours to return.

#### Lesson 3 - A topic with variables, conditions, and a prebuilt entity

This sample template asks customers to enter a US shipping state.

- The copilot uses the prebuilt **State** [entity](advanced-entities-slot-filling.md) to recognize and store the user's response in a **State** variable.
- A condition uses this variable to determine which shipping message to send the user.
- Another condition uses the customer's response to a multiple-choice question, which is stored in the variable **Item**, to determine which product to order.

### Access and use lesson topics for new copilots

When a copilot is created, several lessons are automatically created as topics.

While the topics are functional, they're examples showing how to create content for your copilots. The topics aren't designed for production use.

#### Use lesson topics to understand how topics work

1. Go to the **Topics & Plugins** tab.

1. Select **Lesson 1** and work through to **Lesson 3**. Review the title and description, and see what trigger phrases are used.  

1. To see the copilot's flow, select each topic. The flow includes the copilot's messages, expected user responses (phrases), decision points, and entity references.

   :::image type="content" source="media/authoring-template-topics/topic-flow.png" alt-text="Screenshot that shows a list of lesson topics.":::

#### Lesson topics explained

Each lesson topic teaches you how to create basic and advanced copilot conversations.

You should start with **Lesson 1** and work through each lesson in order.

##### Lesson 1 - A simple topic

This lesson shows you how to create a simple topic with one conditional branch.

##### Lesson 2 - A simple topic with a variable and conditions

This lesson shows you how to create a simple topic with a [a variable](authoring-variables.md) and conditions.

A variable gets used later in the topic flow. In this example, `StoreLocation` is the variable that stores the user's response when you ask for their preferred store location.

##### Lesson 3 - A topic with variables, conditions, and a prebuilt entity

This lesson shows you how to create a simple topic with conditional branches, [a variable](authoring-variables.md), and [an entity](advanced-entities-slot-filling.md).

When you use entities in your topic, the copilot can identify key information from what the user types. The copilot automatically saves the user responses into your variables.

For example, if you type "I want to buy a red car," the copilot doesn't need to ask car color, because it recognizes the **Color** entity in what you typed. The copilot skips the question where you asked for color.

:::image type="content" source="media/authoring-template-topics/color-entity.png" alt-text="Screenshot that shows the entity for color on the Entities page." lightbox="media/authoring-template-topics/color-entity.png":::

Similarly, the copilot uses the **State** entity to recognize any US state the user enters.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
