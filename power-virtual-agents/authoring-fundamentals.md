---
title: "Chatbot authoring"
description: "Discover how to create bots and topics easily in Power Virtual Agents with no coding or long deployment times."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "authoring, fundamentals, ce06092020"
ms.collection: virtual-agent
---

# Key concepts - Authoring Power Virtual Agents bots

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](authoring-fundamentals.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-fundamentals-teams.md)

When you create bots with Power Virtual Agents, you author and edit topics. 

Topics are discrete conversation paths that, when used together within a single bot, allow for users to have a conversation with a bot that feels natural and flows appropriately.

Creating a bot with Power Virtual Agents is easy to do with the [no-code authoring canvas](authoring-create-edit-topics.md), and there are a number of ways you can [manage how topics interact](authoring-topic-management.md), how you want the conversation to flow, and what it should feel like. 

It's also easy to [test the bot](authoring-test-bot.md) without having to fully deploy the bot whenever you make a small change.

There are also [lesson topics](authoring-template-topics.md) that guide you through topic authoring - from simple to complex scenarios, as well as default [system topics](authoring-create-edit-topics.md#use-system-and-sample-topics).

You can also [choose what language you want your bot to use](authoring-language-support.md).

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


## Accessibility

Microsoft wants to provide the best possible experience for all customers, including customers with disabilities. The bot **Authoring canvas** is built to be accessible from the get-go. 

In general, using the authoring canvas follows standard navigation patterns. For complex scenarios, we've built keyboard shortcuts tailored to help users authoring content using keyboard navigation.

###  Routing anchors
Press enter or space on a route anchor to go into editing mode for that route. Once in the editing mode, you can tab to other node anchors. Once the anchor is selected, you can:

- Press ```Delete``` to delete the route, and make the target node of the route an orphan node if this route is the only route leading to that node.
- Press ```Escape``` to take the user out of tab mode and resume normal tabbing.
- Press ```Enter``` or ```Space``` on a different node to reconnect the route to the new node (same source node, new target node).
- Press ```Tab``` to take you to the next available location to drop this route.

At any time, pressing these hotkeys on a route anchor will read out the properties of the route:
- ```Alt + Shift + A``` will read out the source node.
- ```Alt + Shift + B``` will read out the target node.

> [!NOTE] 
> If you are using a screen reader, note that the sidebar menu entry labeled **Manage** might not get read as "Collapsed", but it is an expandable control which can be selected and expanded. This is a known issue with our menu control which will be fixed at a future date.

## In this section

Topic | Description
- | -
[Create your first bot](authoring-first-bot.md) | Create your first bot in less than 30 minutes.
[Use lesson topics](authoring-template-topics.md) | Use a series of prebuilt topics that guide you through authoring topics - from simple to advanced.
[Create and edit topics](authoring-create-edit-topics.md) | Create and edit topics using the no-code authoring canvas.
[Use system fallback topic](authoring-system-fallback-topic.md) | Use a system fallback topic for when your bot can't find an answer.
[Manage topics](authoring-topic-management.md) | Copy, edit, and manage which topics should be available in your bot.
[Test your bot](authoring-test-bot.md) | Test your bot directly within the Power Virtual Agents portal without needing to deploy or publish it.
[Supported languages](authoring-language-support.md) | Choose from a number of languages when you create your bot, with user interface, system, and template topic localization.
