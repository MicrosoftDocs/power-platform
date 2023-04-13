---
title: "Slot filling best practices"
description: "Best practices for slot filling and entity extraction in Power Virtual Agents"
author: hejammes

ms.date: 04/13/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Slot filling best practices in Power Virtual Agents

Entities let a chatbot acquire and use information more easily.

A chatbot typically needs several pieces of information from a user to do its job. For example, a retail chatbot might need to know what item someone is looking for, what color the item should be, and approximately how much it should cost. One way to acquire this information is by asking three separate questions, one for each fact the chatbot needs.
But Power Virtual Agents provides a better way to do this: your chatbot can use entities. This feature lets your chatbot acquire and use information more easily—it reduces the number of questions you need to ask. 
To do this, you first choose which entities you want to use. 

Once you choose the entities you'd like to use, Power Virtual Agents will automatically extract information that matches those entity types from user responses. 

PVA NLU generalizes on all entity variations (other values and synonyms) in case a trigger phrase includes at least one variation (option) of this entity. In other words, bot authors need to include one example of a trigger phrase with one usage of this entity for the PVA NLU to generalize on other entity variations.

## You choose the entities your chatbot should use by selecting them 
from a list

Power Virtual Agents provides several built-in entities, including Age, Color, 
Country, and Money. You can also define your own custom entities, such as ClothingItem in this example.
Suppose you’ve chosen the entities ClothingItem, Color, and Money from the list above. Power Virtual Agents will now automatically examine user inputs for information that matches these entities, a process known as slot filling. For example, if you choose to use the built-in entity Money in a conversation, the user might enter a value as “$100” or “a hundred dollars” or in some other way, and the natural language model in Power Virtual Agents will figure out that this is a monetary value of one hundred dollars. However values are entered, they’re stored in variables.

## Once you choose the entities you'd like to use, Power Virtual Agents will automatically extract information that matches those entity types from user responses.

In this example, your retail chatbot asks the user what they’d like to purchase (step 1). The user responds with “I want to buy a black skirt for under $100” (step 2). Because you’re using the entities ClothingItem, Color, and Money for this chatbot, Power Virtual Agents will extract these Whitepaper 14 three pieces of information from the response, storing this information in three different variables (step 3). Your chatbot can then access these variables directly (step 4). 
Using entities makes your life simpler by letting Power Virtual Agents more intelligently gather information from user responses. More important, it makes life better for users, since entities can find and store information from user responses, then make that information available later in the conversation. Entities improve the user experience—they make your chatbot seem smarter—and using them whenever possible is definitely a best practice

## Use synonyms

- Increase the weight of a trigger phrase by adding related words as synonyms of an entity it contains.
- E.g. for a “Complaint” option, add similar negative words or phrases as synonyms.

## Enable Smart Matching

## Leverage Dataverse Search for large datasets

- or large or evolving datasets, instead of Power Virtual Agents fixed-list entities, leverage Dataverse to store your data.
- Call the Dataverse Search with Power Automate: it supports fuzzy matching to return the best results along with a score 
- Works even if the occurrence is contained in a full utterance
