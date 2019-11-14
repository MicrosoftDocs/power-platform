---
title: "Use lesson topics to understand capabilities in Power Virtual Agents"
description: "Use specific template topics to understand the capabilities when authoring topics for use in Power Virtual Agents bots"
keywords: ""
ms.date: 11/13/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring
ms.collection: virtual-agent
---



# Use lesson topics in Power Virtual Agents

Power Virtual Agents includes a set of four lessons from which you can learn how a topic can be created, conditionals used, and leverage an out-of-the-box pre-built entity as well as a custom entity.


## Access and use lesson topics for new bots

When a bot is created, a number of lessons are automatically created as topics. 

While the topics work as they are, they are examples for the purposes of learning how to create and use bots and are not designed for production use.

**Use lesson topics to understand how topics work:**

1. Go to the **Topics** tab.

1. Select **Lesson 1** and work through to **Lesson 4**.  Review the title and description, and see what trigger phrases are being used.  

1. Select **Authoring canvas** to see the bot's flow, including the bot's comments, expected user responses, decision points, and entity references.

>[!WARNING]
>Where can I test these lessons?

## Available lesson topics

Each lesson is designed to teach you how to use the **Authoring canvas** to create basic and advanced bot conversations.

You should start with **Lesson 1** and work through each lesson in order.

### Lesson 1 - A simple topic

This lesson shows you how to create a simple topic with one conditional branch.

### Lesson 2 - A simple topic with a condition and variable

This lesson shows you how you can create a simple topic with one conditional branch and [a variable](authoring-variables.md).

A variable is a name for an item which will be used later in the topic flow.  In this example, `pva_StoreLocation` is the name for the variable when you ask the user for their preferred store location.

### Lesson 3 - A topic with a conditions, variables and a pre-built entity

This lesson shows you how you can create a simple topic with one conditional branch, [a variable](authoring-variables.md), and [an entity](advanced-entities-slot-filling.md).

When you use entities in your topic, the bot can identify key information in what the user types and proactively fill in that information in your variables. For example, if you type "I want to buy a red car," the bot doesn't need to ask which color car, because the bot recognizes the **Color** entity in what you typed. The bot will then skip the question where you asked for color. 

You can also use entities to recognize a specific list of options. In this lesson, we identify **State** as the entity, and the bot will recognize any US state the user types.

### Lesson 4 - A topic with conditions, variables and a custom entity

This lesson continues to show you how you can create a topic with a conditional branch, [a variable](authoring-variables.md#prebuilt-entities), and [a custom entity](advanced-entities-slot-filling.md#custom-entities)

In particular it will allow an entity to bypass a follow-up question. For example, try testing with "I want a business laptop."

These topics demonstrate how you can name a topic, set its description and create basic topic flows including variables, decision points and entities and slots.


