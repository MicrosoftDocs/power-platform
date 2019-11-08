---
title: "TITLE"
description: "DESCRIPTION"
keywords: "KEYWORDS"
ms.date: 09/04/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---



# Learn with Power Virtual Agent Bot through lessons
The Power Virtual Agent includes a set of four lessons from which you can learn how a topic can be created, conditions used, and out-of-the-box pre-built entity as well as a custom entity.

* Lesson 1 - A simple topic
** This lesson will show you how you can create a simple topic with one conditional branch.

* Lesson 2 - A simple topic with a condition and variable
** This lesson will show you how you can create a simple topic with one conditional branch and a variable.

A variable is a name for an item which will be used later in the topic flow.  In this example, "pva_StoreLocation" is the name for the variable when you ask the user for their preferred Store Location.

* Lesson 3 - A topic with a conditions, variables and a pre-built entity
** This lesson will show you how you can create a simple topic with one conditional branch, variable, and entity.

When you use entities in your topic, the bot can identify key information in what the user types and proactively fill in that information in your variables. For example, if the customer says "I want to buy a red car," you don't need to ask them which color car, because the bot recognizes the Color entity in what they typed. The bot will then skip the question where you asked for color. 

You can also use entities to recognize a specific list of options. In this lesson, we identify State as the entity, and the bot will recognize any US state the user types.

* Lesson 4 - A topic with a conditions, variables and custom entity
** This lesson continues to show you how you can create a topic with a conditional branch, variable, and custom entity.  

In particular it will allow an entity to bypass a follow up question. For instance, try testing with "I want a business laptop."


These topics demonstrate how you can name a topic, set its description and create up basic topic flows including variables, decision points and entities and slots.

## H2 Power Virtual Agent lessons for new Bots

When a bot is created the lessons are automatically applied and contains the topics noted above.  While the topics work as they are, they are examples for the purposes of learning how to create and use bots and are not designed for production use.

### Leveraging the topics

To learn from or use these topics, click on any Lesson 1 and work through to Lesson 4.  Review their titles and descriptions.  Next click on edit the canvas and you can see the virtual agent flow including bot comments, expected user responses, decision points and entity references.
