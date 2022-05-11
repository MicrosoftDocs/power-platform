---
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
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mTUN]
>

## Prebuilt entities

Out of the box, Power Virtual Agents comes with a set of prebuilt entities, which represent the most commonly used stereotype information in real-world dialogs, such as age, colors, numbers, and names.

With the knowledge granted by entities, a bot can smartly recognize the relevant information from a user input and save it for later use.

## Use entities in a conversation

1. Go to the [**Topics page**](./authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to add an entity to.

1. Select the plus (**+**) icon and then select **Ask a question**.

   :::image type="content" source="media/advanced-entities-slot-filling/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. Under **Identify**, select an entity.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-6(draft).png" alt-text="Question node with entity selection." border="false":::

1. You can also optionally select items to show as buttons. For example, if you'd like to show some categories as buttons for users to conveniently choose from as their input, you can simply choose **Select user options** and then pick them from the list that contains the items you added when you created the custom entity.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-8(draft).png" alt-text="Add condition nodes." border="false":::

   :::image type="content" source="media/advanced-entities-slot-filling/entities-9(draft).png" alt-text="More condition nodes." border="false":::

1. Name the variable for the output of the user's response, if necessary.

## Slot filling

*Slot filling* is a natural language understanding concept that means saving an extracted entity to an object. However, in Power Virtual Agents, slot filling means placing the extracted entity value into a variable.

We will continue to use the outdoor gear topic as an example, which is triggered by typing "I want to buy something" in the test chat.

The topic is successfully triggered and the bot asks for the product category, also showing the button choices specified when authoring the **Ask a question** node. In the dialog tree, tracking between topics also shows the bot is running to the question node you just edited.

:::image type="content" source="media/advanced-entities-slot-filling/entities-10(draft).png" alt-text="tracking between topics." border="false":::

A user can use the predefined choices by selecting one of the buttons. Alternatively, they can also type in something like "trekking" and see that it maps to "hiking", because those words were defined as synonyms.

:::image type="content" source="media/advanced-entities-slot-filling/entities-11(draft).png" alt-text="Additional tracking between topics." border="false":::

In tracking between topics, it shows the dialog is correctly routed to the path in which the product category value is "Hiking". You can inspect the variable value from the variable watch window at the bottom of the authoring canvas. In the watch window, it shows the variable value is "Hiking".

Essentially, slot filling has happened by inserting the extracted entity "Hiking" into the variable `VarProductCategory`.

:::image type="content" source="media/advanced-entities-slot-filling/entities-12(draft).png" alt-text="Variable watch window." border="false":::

You can also use what is known as "proactive slot filling" where the user can specify multiple pieces of information that map to multiple entities. The bot is able to understand what information belongs to which entity automatically. In cases where it is unsure of the intended mapping, it will prompt the user to be more specific by providing choices.

In this example, the user wrote "I want to buy some trekking gears". This includes both the trigger phrase that the user wants to buy gear and also provides a second piece of information—the actual type of gear. In this case, the bot fills in both the entity for buying gear, and for the type of gear.

:::image type="content" source="media/advanced-entities-slot-filling/entities-13(draft).png" alt-text="Multiple and proactive slot filling." border="false":::

In tracking between topics, you can see the bot takes in this user input, and intelligently skips the question node asking for the product category.

The bot is always actively listening to the user input, remembering information upfront so it can skip unnecessary steps as appropriate.

Let's restart the testing again and try another case. In this round, you can add a couple more question nodes asking for things like the type of hiking gear as well as the price range (using the **Money** entity).

This time when the product category question is presented, instead of telling the bot only the product category, the user can say "I want to buy a pair of hiking boots under $100". In this example, the bot is not only able to route to the correct hiking product category path, but also actively fill the slots asking for the type of hiking gear and the target price range information.

:::image type="content" source="media/advanced-entities-slot-filling/entities-14(draft).png" alt-text="tracking between topics for product and price categories." border="false":::

Proactive slot filling can be manually controlled at the node level. If you'd like to always prompt for the question within a specific node, regardless of whether the slot has been filled from previous user responses, you can disable the **Skip question** option for that question node.

:::image type="content" source="media/advanced-entities-slot-filling/entities-skip-node.png" alt-text="Skip question." border="false":::

## Watch a deep dive video

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4ncEw]

[!INCLUDE[footer-include](includes/footer-banner.md)]
