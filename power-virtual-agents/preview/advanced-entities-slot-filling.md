---
title: Use entities in Power Virtual Agents bots (preview)
description: Use entities to capture information in bot conversations using natural language understanding in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/08/2022
ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---
<!-- EDITOR'S NOTE: This article doesn't mention "slot filling" at all, and it's not a particularly advanced use of entities. Would it make sense to change the file name to reflect its actual contents? -->

# Use entities in Power Virtual Agents bots (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

A significant part of bot conversations in Power Virtual Agents is natural language understanding, which is the ability of the AI to understand a user's intent. For example, a customer might say, "I tried to use my gift card, but it doesn't work." That exact phrase isn't listed as a trigger for the "gift card doesn't work" topic, but the bot routes the customer to it anyway. That's natural language understanding at work.

One fundamental aspect of natural language understanding is to identify _entities_ in a conversation. An entity is an information unit that represents a type of real-world data. That data can include things like a phone number, a zip code, a city, or even a person's name.

Power Virtual Agents comes with prebuilt entities that represent the types of information that are most commonly found in real-world conversations. Entities allow a bot to intelligently recognize the relevant information in a user's input and save it for later use.

## Use entities in a conversation

1. Go to your bot's [**Topics page**](./authoring-create-edit-topics.md) and open the authoring canvas for the topic you want to add an entity to.

1. Select the plus (**+**) icon to add a node, and then select **Ask a question**.

1. Under **Identify**, select an entity.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-6(draft).png" alt-text="Screenshot of adding a question node with an entity.":::

1. Name the variable that will store the user's response.

[!INCLUDE[footer-include](includes/footer-banner.md)]
