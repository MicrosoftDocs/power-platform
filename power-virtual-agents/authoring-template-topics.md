---
title: "Use lesson topics to understand capabilities"
description: "Use specific template topics to understand the capabilities when authoring topics for use in Power Virtual Agents bots."
keywords: "PVA"
ms.date: 01/06/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: authoring, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Use lesson topics in Power Virtual Agents

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-template-topics.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-template-topics-teams.md)

Power Virtual Agents includes a set of four lessons from which you can see examples of topics. These lessons range from simple to complex scenarios that use [conditional branching](authoring-create-edit-topics.md) and [custom entities](advanced-entities-slot-filling.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Access and use lesson topics for new bots

When a bot is created, several lessons are automatically created as topics.

While the topics are functional, they are examples for the purposes of learning how to create content for your bots. The topics aren't designed for production use.

**Use lesson topics to understand how topics work:**

1. Go to the **Topics** tab.

1. Select **Lesson 1** and work through to **Lesson 4**. Review the title and description, and see what trigger phrases are being used.  

1. To see the bot's flow, select each topic. The flow includes the bot's comments, expected user responses, decision points, and entity references.

   :::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="List of lesson topics." border="false":::

> [!IMPORTANT]
> You will see these lessons when you create a new bot. If you have previously created a bot and don't see them, try creating a new bot and then going to the **Topics** tab.

## Available lesson topics

Each lesson is designed to teach you how to use the authoring canvas to create basic and advanced bot conversations.

You should start with **Lesson 1** and work through each lesson in order.

### Lesson 1 - A simple topic

This lesson shows you how to create a simple topic with one conditional branch.

### Lesson 2 - A simple topic with a condition and variable

This lesson shows you how you can create a simple topic with one conditional branch and [a variable](authoring-variables.md).

A variable is a name for an item that will be used later in the topic flow. In this example, `pva_StoreLocation` is the variable to store the user's response when you ask for their preferred store location.

### Lesson 3 - A topic with a conditions, variables, and a pre-built entity

This lesson shows you how you can create a simple topic with one conditional branch, [a variable](authoring-variables.md), and [an entity](advanced-entities-slot-filling.md).

When you use entities in your topic, the bot can identify key information from what the user types and automatically fill in that information into your variables.

For example, if you type "I want to buy a red car," the bot doesn't need to ask which color car, because the bot recognizes the Color entity in what you typed. The bot will then skip the question where you asked for color.

In this lesson, the bot uses the State entity and will recognize any US state the user enters.

### Lesson 4 - A topic with conditions, variables, and a custom entity

This lesson shows a topic with a conditional branch, [a variable](authoring-variables.md), and [a custom entity](advanced-entities-slot-filling.md#custom-entities).

You can see the bot bypass a follow-up question. For example, try testing with "I want a business laptop."

[!INCLUDE[footer-include](includes/footer-banner.md)]
