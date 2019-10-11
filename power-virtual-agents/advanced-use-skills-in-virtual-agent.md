---
title: "Author dialogs with conversational Skills"
description: "Author complex dialogs by leveraging conversational skills. Skills extend your bots's conversational capabilities by automating a series of actions within a topic. They enable the bot to book an appointment, send a confirmation email, manage tasks, and more."
keywords: "authoring, extensibility, integration, extend bot, bot framework, skills, custom capabilities"
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


# How to use Skills to extend your virtual agent
Power Virtual Agents offers a no-cliff bot building experience to users. Using Skills, we allow customers and partners to extend a bot's existing conversational capabilities by adding conversational actions within any topic. Using skills, you can embed re-usable converational multi-turn actions to perform complex tasks like book an appointment, manage tasks, and more.

## Pre-requisites
* [Create a virtual agent](link to trial or homepage)
* [Create a new Skill](link to Bot Fx. create a skill page)
* [Add a new skill to your bot](#link to configuration page)

## Steps
Once you've created your virtual agent, built a Skill and added the Skill to your bot, you are ready to use Skill actions as part of your conversation dialog.

### Add Skill into a conversation
* Open a new or existing topic that you would like to use your added Skill for

* In the topic's authoring canvas, add the Skill node by click on (+) --> **Call an action** and click on the Skill action that you would like to add

(IMAGE SHOWING ACTION PICKER)

* If your Skill has inputs, assign variables to those inputs.

* If your Skill emits output, you can use those variables in nodes that follow.

* Click on **Save** to persist your changes to the topic.

See note below for [supported simple and complex data types](#href to section below).

### Test dialog with Skill
Once you have saved your Skill, you can test Skills using the test canvas.

* Open the test canvas and trigger the topic using a trigger phrase for the topic you added the Skill in.

* Test if the Skill is performing as it should.

(IMAGE SHOWING TESTING SKILLS WITH TRACING)

## Troubleshooting steps

### Support for simple and complex data types
Skills can accept simple types (integer, boolean, string) and complex data types as JSON strings. If you need to extract variables from complex, you must use Flow to further parse and break down complex JSON strings into key value pairs for use in your bot.

## References
* [No-cliff development with Skills](link to Pawan's blog post)

