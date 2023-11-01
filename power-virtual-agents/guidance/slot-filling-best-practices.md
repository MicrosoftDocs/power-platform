---
title: "Slot filling best practices"
description: "Guidance and best practices for slot filling and entity extraction in Power Virtual Agents."
author: HenryJammes
ms.date: 05/23/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.reviewer: iawilt
---

# Entities and slot filling best practices in Power Virtual Agents

## What is slot filling?

Slot filling is related to the use of [entities](/power-virtual-agents/advanced-entities-slot-filling) that let a chatbot acquire and use information more easily by identifying and extracting them from the user query.

A chatbot typically needs several pieces of information from a user to do its job. To acquire this information, you would typically ask separate questions, one for each fact the chatbot needs. When you use entities in your questions, Power Virtual Agents detects the required information and skips the questions where the information could be identified in the triggering user query.

For example, when a user asks:
 > **I’d like to order 3 large blue t-shirts**

 Power Virtual Agents Natural Language Understanding (NLU) can immediately understand:
 >
 > - Topic is **Order**.
 > - Quantity is **3**.
 > - Color is **Blue**.
 > - Item Type is **T-Shirt**.

And the chatbot can then skip unnecessary questions. If some pieces of information are missing, for example *Size*, it asks the unanswered questions before moving forward. Slot filling lets your chatbot acquire and use information more easily and reduces the number of questions you need to ask.

You first define which entities you want to use, and their types.

## Defining entities

Power Virtual Agents provides several built-in entities for the most common use cases, such as *Email*, *Date and time*, *Person name*, *Phone number*, *Color*, *Country*, *City*, *Number*, *Money*, and more.

Built-in entities are powerful as they can handle many variations of the form an information can take. For example, when using *Money* in a conversation, the user might enter a value as "$100" or "a hundred dollars" or "100 dollars". The NLU model in Power Virtual Agents figures out that the value is a monetary value of 100 dollars.

> [!TIP]
> However values are entered, as long as they're requested with questions in your conversation flow, they're stored in variables that you can re-use.

You can also define your own custom entities, such as *Item Type* from the previous example. Custom entities can be of two types:

- **Closed list**: for a predefined list of values.
- **Regular expressions** (RegEx): for information matching a specific pattern. RegEx is ideal when you need to capture data that always follows the same format (for example, _INC000001_ for a ticket number)

## Improving the user experience

Using entities makes your life simpler by letting Power Virtual Agents more intelligently gather information from user queries. More importantly, it makes life better for users, since entities can find and store information from user queries, then make that information available later in the conversation. Entities improve the user experience—they make your chatbot seem smarter—and using them whenever possible is definitely a best practice.

## Entity best practices

### Use synonyms

You can add synonyms to closed list entities values to manually expand the matching logic for each item in the entity's list. For example, in the _"hiking"_ item, you can add _"trekking"_ and _"mountaineering"_ as synonyms.

> [!TIP]
>
> - Using synonyms can also help topic triggering, as they increase the weight of a trigger phrase by adding related words as synonyms of an entity it contains. For example, for a "Complaint" option, add similar negative words or phrases as synonyms.
> - The NLU model also generalizes on all entity variations (that is, all of their values and their synonyms) in case a topic trigger phrase includes at least one variation of this entity. In other words, chatbot authors should include one example of a trigger phrase with one usage of this entity for the NLU to generalize on other entity variations.

### Enable Smart Matching

For each closed list entity, you can also enable Smart Matching.

Smart Matching is part of the intelligence supported by the chatbot's NLU model. With this option enabled, the chatbot interprets the user's input using fuzzy logic, based on the listed items in the entity.

In particular, the bot automatically corrects misspellings and expands its matching logic semantically. For example, the bot can automatically match _"softball"_ to _"baseball"_.

### Be creative with regular expressions

Sometimes, entity extraction from a user query can lead to confusion for the NLU model, especially when several entities of the same type are present in the user query.

For example, if a user says:
> can you bring 2 towels and 1 pillow to room 101

Using the built-in *Number* entity would be confused between 2, 1, and 101. To work around this confusion, you could define the following regular expression entities:
>
> - Towel Quantity: [1-9] towel
> - Pillow Quantity: [1-9] pillow
> - Room Number: [0-9]{3}

## Alternatives to entities to store referential data

For large or evolving datasets (for example a list of products or customers), instead of using Power Virtual Agents closed list entities, you might want to check external sources. You need to pass the user utterance to the external service using a Power Automate cloud flow.

Your topic logic can then validate the accuracy of the result (or ask the user to validate it) before moving forward in the conversation.

Dataverse is a good candidate to store such data, as it has a built-in [Dataverse Search](/power-platform/admin/configure-relevance-search-organization) capability that supports fuzzy matching to return the best results along with a confidence score. Even if searching with a full sentence, it's able to retrieve potential matches.

> [!TIP]
> See an example implementation here: [return a list of results](/power-virtual-agents/advanced-flow-list-of-results)
