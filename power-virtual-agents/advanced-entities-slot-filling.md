---
title: "Create and use entities (contains video)"
description: "Entities can be used to streamline bot conversations by allowing custom lists, information type mapping, and proactive slot filling."
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

# Use entities and slot filling in Power Virtual Agents bots

A big part of bot conversations in Power Virtual Agents is natural language understanding, which is the ability for the AI to understand a user's intent. For example, natural language understanding is involved when a user might say "I tried to use my gift card but it doesn't work" and the bot is able to route the user to the topic related to gift cards not working, even if that exact phrase isn't listed as a trigger phrase.

One fundamental aspect of natural language understanding is to identify _entities_ in a user dialog. Watch the video to get started with entities.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mTUN]
>

An entity can be thought of as a unit of information that represents a certain type of a real-world subject, like a phone number, zip code, city, or even a person's name. With the knowledge granted by entities, a bot can smartly recognize the relevant information from a user input and save it for later use.


## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Prebuilt entities

Entities in chatbots let you store information in similar groups.

Out of the box, Power Virtual Agents comes with a set of prebuilt entities, which represent the most commonly used stereotype information in real-world dialogs, such as age, colors, numbers, and names.

With the knowledge granted by entities, a bot can smartly recognize the relevant information from a user input and save it for later use.

To help understand that notion, the **Money** entity can be used as an example.

1. In Power Virtual Agents, in the navigation menu, select **Entities**.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-menu.png" alt-text="Go to the Entities tab.":::

   You'll see a list of the prebuilt entities available.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-1(draft).png" alt-text="Entities pane." border="false":::

1. Select the **Money** entity, which will open the details pane for the entity.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-2(draft).png" alt-text="Money entity description." border="false":::

Here you can see an explanation of this entity and the ways it can be used to look for information related to money or currency from a user's input.

For example, when a user inputs "It costs 1000 dollars", using this money entity the bot knows the "1000 dollars" represents the **money type** of information. When the bot extracts this entity and saves it to a variable, it will save "1000" as a number even though the surrounding information was text.

## Custom entities

The prebuilt entities cover commonly used information types, but on some occasions, such as when building a bot that serves a specific purpose, you'll need to teach the bot's language understanding model some domain-specific knowledge.

For instance, let's say you want to build a bot for an outdoor store. In this case, you'll need to teach the bot to acknowledge the "outdoor gears product" category in a dialog.

To do this, you need to create a custom entity. In this case, you can create an entity that gives the bot the knowledge of all outdoor product categories.

1. In Power Virtual Agents, in the navigation menu, select **Entities**.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-menu.png" alt-text="Go to the Entities tab to create a new entity.":::

1. Select **New entity** on the main menu.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-new.png" alt-text="Select New entity.":::

1. This opens a pane where you can choose the type of entity: either a [**Closed list** entity](#closed-list-entities) or a [**Regular expression (regex)** entity](#regular-expression-regex-entities).

### Closed list entities

Closed list entities let you define a list of items. This is best used for small lists that are easy to manage and that have simple item labels.

:::image type="content" source="media/advanced-entities-slot-filling/create-entities-closed.png" alt-text="Screenshot of the entity creation window, with the Closed list option highlighted.":::

Selecting this option when creating an entity will show a pane where you can specify the name of the entity, an optional description, and enter the items you want included in the entity.

:::image type="content" source="media/advanced-entities-slot-filling/edit-closed-list.png" alt-text="Screenshot of the entities list pane.":::

When you enter items you can:

- Select each item to change its name.
- Select the trash can icon to delete the item from the list.
- Select **+ Synonyms** (or select the listed synonyms if they've already been added) to open the **Edit synonyms** pane.

You can add synonyms to manually expand the matching logic for each item in the entity's list. For example, in the "hiking" item, you can add "trekking" and "mountaineering" as synonyms.

:::image type="content" source="media/advanced-entities-slot-filling/edit-synonyms.png" alt-text="Screenshot of the Edit synonyms pane.":::

For each entity you can also enable **Smart matching**.

Smart matching is part of the intelligence supported by the bot's language understanding model. With this option enabled, the bot will interpret the user's input using fuzzy logic, based on the listed items in the entity.

In particular, the bot will autocorrect misspellings and expand its matching logic semantically. For example, the bot can automatically match "softball" to "baseball".

:::image type="content" source="media/advanced-entities-slot-filling/entities-smart-match.png" alt-text="Screenshot of the smart matching option toggle.":::

When you're finished creating or editing your entity, select **Save** to save and return to the list of entities. Select **Close** to discard your changes (you will be given an option to go back to editing the entity in case you accidentally selected the wrong option).

### Regular expression (regex) entities

Regular expression (regex) entities let you define logical patterns that you can use to match and extract information from an input. Regex entities are great for complex pattern matching against a user's input, or if you need to allow for specific variations in how a user might format or enter their input in a conversation.

For example, you could use a regex entity to identify items such as a tracking ID, a license number, a credit card number, or an IP address from a string the user enters into the bot.

:::image type="content" source="media/advanced-entities-slot-filling/create-entities-regex.png" alt-text="Screenshot of the entity creation window, with the Regex option highlighted.":::

Selecting this option when creating an entity will show a pane where you can specify the name of the entity, an optional description, and enter the regex pattern that should be used to match and extract entity items from the input.

:::image type="content" source="media/advanced-entities-slot-filling/edit-regex-list.png" alt-text="Screenshot of the regex entity pane.":::

A Power Virtual Agents regex entity uses the [.NET regular expressions syntax](/dotnet/standard/base-types/regular-expressions).

By default, pattern matching is case sensitive, to make it case insensitive use the `(?i)` regular expression option in your pattern string. Some basic examples are included in the regex entity pane, and additional information on the syntax and more examples can be found in the [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference) topic.

If you need to make the regular expression accommodate multiple patterns you can use the alternation operator `|` to concatenate regular expressions. For example, you could combine two regex patterns to look for both the old and new formats of a product ID code.

When you're finished creating or editing your entity, select **Save** to save and return to the list of entities. Select **Close** to discard your changes (you will be given an option to go back to editing the entity in case you accidentally selected the wrong option).

## Use entities in a conversation

Now that you've done the work of giving the bot the knowledge about outdoor gear by creating that product category entity and a few other custom entities, you can start to use them when constructing a bot conversation.

1. Go to the [**Topics page**](./authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to add an entity to.

1. Select **Add node** (**+**) and then select **Ask a question**.

   :::image type="content" source="media/advanced-entities-slot-filling/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. Under **Identify**, select the entity you created in [Custom entities](#custom-entities).

   :::image type="content" source="media/advanced-entities-slot-filling/entities-6(draft).png" alt-text="Question node with entity selection." border="false":::

1. You can also optionally select items to show as buttons. For example, if you'd like to show some categories as buttons for users to conveniently choose from as their input, you can simply choose **Select user options** and then pick them from the list that contains the items you added when you created the custom entity.

   :::image type="content" source="media/advanced-entities-slot-filling/entities-8(draft).png" alt-text="Add condition nodes." border="false":::

   :::image type="content" source="media/advanced-entities-slot-filling/entities-9(draft).png" alt-text="More condition nodes." border="false":::

1. Name the variable for the output of the user's response, if necessary.

## Slot filling

_Slot filling_ is a natural language understanding concept that means saving an extracted entity to an object. However, in Power Virtual Agents, slot filling means placing the extracted entity value into a variable.

We will continue to use the outdoor gear topic as an example, which is triggered by typing "I want to buy something" in the test chat.

The topic is successfully triggered and the bot asks for the product category, also showing the button choices specified when authoring the **Ask a question** node. In the dialog tree, tracking between topics also shows the bot is running to the question node you just edited.

:::image type="content" source="media/advanced-entities-slot-filling/entities-10(draft).png" alt-text="tracking between topics." border="false":::

A user can use the predefined choices by selecting one of the buttons. Alternatively, they can also type in something like "trekking" and see that it maps to "hiking", because those words were defined as synonyms.

:::image type="content" source="media/advanced-entities-slot-filling/entities-11(draft).png" alt-text="Additional tracking between topics." border="false":::

In tracking between topics, it shows the dialog is correctly routed to the path in which the product category value is "Hiking". You can inspect the variable value from the variable watch window at the bottom of the authoring canvas. In the watch window, it shows the variable value is "Hiking".

Essentially, slot filling has happened by inserting the extracted entity "Hiking" into the variable `VarProductCategory`.

:::image type="content" source="media/advanced-entities-slot-filling/entities-12(draft).png" alt-text="Variable watch window." border="false":::

You can also use what is known as "proactive slot filling" where the user can specify multiple pieces of information that map to multiple entities. The bot is able to understand what information belongs to which entity automatically. In cases where it is unsure of the intended mapping, it will prompt the user to be more specific by providing choices.

In this example, the user wrote "I want to buy some trekking gears". This includes both the trigger phrase that the user wants to buy gear and also provides a second piece of information&mdash;the actual type of gear. In this case, the bot fills in both the entity for buying gear, and for the type of gear.

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
