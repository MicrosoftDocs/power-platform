---
ROBOTS: NOINDEX,NOFOLLOW
title: "Create and use entities (contains video)"
description: "Entities can be used to streamline bot conversations by allowing custom lists, information type mapping, and proactive slot filling."
keywords: "PVA"
ms.date: 01/25/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Use entities and slot filling in Power Virtual Agents bots

A big part of bot conversations in Power Virtual Agents is natural language understanding, which is the ability for the AI to understand a user's intent. For example, natural language understanding is involved when a user might say "I tried to use my gift card but it doesn't work" and the bot is able to route the user to the topic related to gift cards not working—even if that exact phrase isn't listed as a trigger phrase.

One fundamental aspect of natural language understanding is to identify *entities* in a user dialog. An entity can be viewed as an information unit that represents a certain type of a real-world subject, like a phone number, zip code, city, or even a person's name.

>
> 
>

## Prebuilt entities

Out of the box, Power Virtual Agents comes with a set of prebuilt entities, which represent the most commonly used stereotype information in real-world dialogs, such as age, colors, numbers, and names.

With the knowledge granted by entities, a bot can smartly recognize the relevant information from a user input and save it for later use.

## Use entities in a conversation

1. Go to the [**Topics page**](./authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to add an entity to.

1. Select the plus (**+**) icon and then select **Ask a question**.

   ![Screenshot of adding a node." border="false](media/advanced-entities-slot-filling/handoff-add-node.png)

1. Under **Identify**, select an entity.

   ![Question node with entity selection." border="false](media/advanced-entities-slot-filling/entities-6(draft).png)

1. Name the variable for the output of the user's response, if necessary.


