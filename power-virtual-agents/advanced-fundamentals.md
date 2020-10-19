---
title: "Advanced authoring of chatbots"
description: "Go beyond basic authoring by using slot filling, entities, variables, sign-in, live hand-off, and Power Automate flows."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "authoring, fundamentals, advanced-authoring, ceX"
ms.collection: virtual-agent
---


# Key concepts - Enhanced authoring in Power Virtual Agents

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](advanced-fundamentals.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/advanced-fundamentals-teams.md)

You can go beyond basic authoring in Power Virtual Agents by taking advantage of a number of advanced features. These features enhance and improve upon the [authoring experience](authoring-fundamentals.md) by letting you:
- Expand the types of information the bot understands and can parse back
- Use variables to retrieve information from one part of a topic and use it in another, to ensure a consistent experience for your bot users
- Utilize existing support content from website pages, such as FAQ pages, to quickly create a robust set of topics that can be used in a bot
- Allow users to sign in directly within a bot, and then use that authentication to retrieve information from backend systems
- Use advanced Power Automate flows to retrieve and send information to other databases
- Add special nodes that take the context of the entire bot conversation and share it with a human help support agent


## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]



## In this section

Topic | Description
- | -
[Use entities and slot filling](advanced-entities-slot-filling.md) | Use prebuilt entities, and define custom ones, to expand the types of information the bot can parse.
[Use variables](authoring-variables.md) | Retrieve information for consistent usage across topics.
[Create topics from existing support content](advanced-create-topics-from-web.md) | Utilize your existing web content to quickly create bots and topics.
[Add end-user authentication](advanced-end-user-authentication.md) | Allow users to sign in from within the bot.
[Add actions using Power Automate](advanced-flow.md) | Connect to existing and create new flows that let you automate and send and receive data.
[Trigger hand-off to a live agent](advanced-hand-off.md) | Send entire transcripts of a bot conversation to a live agent when the bot isn't able to resolve the issue.