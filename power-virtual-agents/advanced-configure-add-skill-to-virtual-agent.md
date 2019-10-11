---
title: "Extend your virtual agent using Bot Framework Skills"
description: "Extend your virtual agent by leveraging conversational skills. Skills extend your bots's conversational capabilities by automating a series of actions within a topic. They enable the bot to book an appointment, send a confirmation email, manage tasks, and more."
keywords: "extensibility, integration, extend bot, bot framework, skills, custom capabilities"
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

## Steps
Once you've created your virtual agent and built a Skill you are now ready to register that Skill in Power Virtual Agents.

### Add your bot to Skill's allowlist
You will need provide your virtual agent's ID to your Skill developer prior to being authorized to add a new Skill.

* Go to **Skills** --> **Provide ID for allow listing**
(IMAGE TO SHOW MODAL POPUP)

### Enter Skill manifest URL
A Skill's manifest contains vital information that your virtual agent will need to trigger actions within a Skill. Once the Skill is deployed, enter the URL to the Skill manifest. We perform a few checks (see full list of possible errors in the table below) to validate the manifest prior to adding the Skill into your bot.

(IMAGE SHOWING VALIDATED SKILLS PAGE)

### Review and use Skill in topics
Once you click on **Save**, your Skill is added to your bot. You can now use this Skill in your topics. [Click here to learn more](#link to authoring skills page)

## Compliance considerations
Please be aware that your virtual agent may send customer information to a Skill if your Skill and bot are deployed in different regions. We restrict users from adding Skills that are deployed outside of your Azure tenant to protect your users privacy.

## Sample skills
You can start using some sample Skills provided by Microsoft Bot Framework - [click here](https://docs.microsoft.com/en-us/azure/bot-service/bot-builder-skills-overview?view=azure-bot-service-4.0#bot-framework-skills).

## References
* [No-cliff development with Skills](link to Pawan's blog post)
