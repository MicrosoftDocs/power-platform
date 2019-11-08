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
Power Virtual Agents offers a no-cliff bot building experience to customers. Customers will be able to use pro-code tools and build Skills and embed those into any topic within Power Virtual Agent. Existing Bot Framework customers can convert their bot to a Skill and empower their subject matter experts to use them. Most customers use Skills to embed re-usable converational multi-turn actions to perform complex tasks like book an appointment, manage tasks, and more.

## Pre-requisites
* [Create a bot in Power Virtual Agents](https://aka.ms/TryPVA)
* [Create a new Skill using pro-code tools](https://go.microsoft.com/fwlink/?linkid=2110533)

## Steps
Once a bot has been created in Power Virtual Agents and developers have build and deployed the Skill you want to add, you need to  register that Skill.

### Add your bot to Skill's allowlist
You will need provide your bots ID to your Skill developer prior to being authorized to add a new Skill.

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

## Troubleshooting
| Error name | Error code | Description / Mitigation |
| --- | :--: | -- |
| Skill manifest URL is invalid | URL_MALFORMED(100), URL_NOT_HTTPS(101) | Skill manifest entered is invalid. Please check the URL and try again |
| Network errors while getting the manifest | MANIFEST_FETCH_FAILED(200) | Network timed out. Please check if the Skill manifest URL is valid | 
| Skill manifest can't be read | MANIFEST_TOO_LARGE(201), MANIFEST_MALFORMED(202)	| Skill manifest either does not contain all required properties or properties has syntax error or is great than 500 KB |
| Skill manifest does not have a Skill version | MANIFEST_UNVERSIONED(203) | Skill manifest must contain a Skill version |
| Skill already added to your bot | MANIFEST_ALREADY_IMPORTED(204) | Skill you are trying to add is already registered with the bot |

(please update this table from aka.ms/cci/skillchecks)

### Validation performed during registering a Skill


