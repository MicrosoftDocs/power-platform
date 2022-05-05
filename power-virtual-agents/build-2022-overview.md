---
title: "Technology preview for Build 2022"
description: ""
keywords: ""
ms.date: 04/04/2022
ms.topic: overview
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.custom: fundamentals, ceX, intro-internal
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Technology preview for Build 2022

<!-- FIXME: blurb about PVA at Build -->
<!-- FIXME: link to quickstart article -->

## New features

<!-- FIXME: merge PRs and link relevant docs -->
- Redesigned authoring canvas
- [Enhanced variable management]()
- [Power FX support]()
- [Rich Response Authoring​]()
- [Speech authoring]()
- [Telephony channel]()
- [Bot response variations](authoring-create-edit-topics.md#message-variations)
- [Quick responses]()

## Limitations of technology preview

The following features are not supported in the technology preview:

- Authoring bots in the Power Virtual Agents app in Microsoft Teams
- Creating bots in other languages other than English
- Customization of system fallback topic
- Analytics
- Entities
- Skills
- Agent transfers
- Publishing bots on Teams channel
- Bots setup with application lifecycle management (ALM)
    <!-- FIXME: button missing, confirm it wasn't moved -->
- Extending bots in Composer

## For desktop Composer users

There are a number of differences and similarities in how bots are designed in Bot Framework Composer and in the Power Virtual Agents technology preview.
The following table list some key concepts in Composer and describes where to find information about similar concepts in Power Virtual Agents.

| Composer concept | Power Virtual Agents concept | Description |
|:-|:-|:-|
| Dialogs and triggers | [Topics][] | Use topics to organize conversation flow or paths. A topic has a set of _trigger phrases_ that indicate when the bot should start the topic and a set of _nodes_ that describe the conversation path for the topic. |
| Intents | [Trigger phrases][] | Add trigger phrases to a topic for phrases, keywords, and questions that a user is likely to type that are related to a specific issue. Natural language understanding is used to parse what a customer types and find the most appropriate topic. |
| Actions and prompts | [Nodes][] | Use nodes on the authoring canvas to create the conversation path for each topic, such as messages, questions, and conditional branches. |
| Bot response variation | [Response variations][] and [question variations][] | Use response and question variations to add variety to your bot's messages and questions. |
| Suggested actions | [Quick replies][] | Use quick replies to provide default reply options to the user. |
| Entities | [Entities][] | Define and use entities to extract semantic information from a user's utterance. |
| State, storage, and properties | [Variables][] | Use variables to track state. |
| Formulas and expressions | [Power FX][] | Use Power FX to create expressions. |

[Entities]: #where-to-find
[Nodes]: #where-to-find
[Power FX]: #where-to-find
[question variations]: #where-to-find
[Quick replies]: #where-to-find
[Response variations]: #where-to-find
[Topics]: #where-to-find
[Trigger phrases]: #where-to-find
[Variables]: #where-to-find
