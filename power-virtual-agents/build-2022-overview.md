---
title: "Overview of technology preview"
description: "Overview of new features and improvements in the technology preview."
ms.date: 05/10/2022
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

This year at Microsoft Build 2022, we are excited to announce the evolution of Power Virtual Agents.

Power Virtual Agent's new intelligent bot authoring experience unifies the sophistication of Azure Bot Framework Composer's pro-code capabilities with the simplicity of Power Virtual Agent's low-code platform, making it even easier for professional developers and subject matter experts to build collaboratively in one Microsoft bot building studio.

This evolution brings new features including:
<!-- FIXME: merge PRs and link relevant docs -->
- [Enhanced variable management](authoring-variables.md)
- [Power FX support](advanced-power-fx.md)
- [Multimedia cards​](advanced-cards.md)
- [Speech authoring]()
- [Voice font selection](advanced-speech-settings.md)
- [Telephony channel](publication-connect-bot-to-telephony.md)
- [Bot response variations](authoring-create-edit-topics.md#message-variations)
- [Quick replies](authoring-create-edit-topics.md#quick-replies)
- [YAML code editor](authoring-create-edit-topics.md#edit-topics-with-the-code-editor)

For a guided tutorial on how to use these new features, please refer to the [Build 2022 quickstart](build-2022-quickstart.md).

To get answers and tips directly from other users in the technology preview, visit the [community forums](https://aka.ms/PVABuild22Forum).

This technology preview doesn't yet support some of the existing features you're used to in Power Virtual Agents, such as, custom entities, agent transfers, and bot authoring in Teams. For the full list, see [Limitations of technology preview](build-2022-limitations.md).

## For desktop Composer users

There are a number of differences and similarities in how bots are designed in Bot Framework Composer and in the Power Virtual Agents technology preview.
The following table lists some key concepts in Composer and describes where to find information about similar concepts in Power Virtual Agents.

<!-- best viewed without wordwrap -->
| Composer concept               | Power Virtual Agents concept                        | Description                                                                                                                                                                                                                                        |
| :----------------------------- | :-------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dialogs and triggers           | [Topics][]                                          | Use topics to organize conversation flow or paths. A topic has a set of _trigger phrases_ that indicate when the bot should start the topic and a set of _nodes_ that describe the conversation path for the topic.                                |
| Intents                        | [Trigger phrases][]                                 | Add trigger phrases to a topic for phrases, keywords, and questions that a user is likely to type that are related to a specific issue. Natural language understanding is used to parse what a customer types and find the most appropriate topic. |
| Actions and prompts            | [Nodes][]                                           | Use nodes on the authoring canvas to create the conversation path for each topic, such as messages, questions, and conditional branches.                                                                                                           |
| Bot response variation         | [Response variations][] and [question variations][] | Use response and question variations to add variety to your bot's messages and questions.                                                                                                                                                          |
| Suggested actions              | [Quick replies][]                                   | Use quick replies to provide default reply options to the user.                                                                                                                                                                                    |
| Entities                       | [Entities][]                                        | Define and use entities to extract semantic information from a user's utterance.                                                                                                                                                                   |
| State, storage, and properties | [Variables][]                                       | Use variables to track state.                                                                                                                                                                                                                      |
| Formulas and expressions       | [Power Fx][]                                        | Use Power Fx to create expressions.                                                                                                                                                                                                                |

[Entities]: advanced-entities-slot-filling.md
[Nodes]: authoring-create-edit-topics.md
[Power Fx]: advanced-power-fx.md
[question variations]: authoring-create-edit-topics.md#message-variations
[Quick replies]: authoring-create-edit-topics.md#quick-replies
[Response variations]: authoring-create-edit-topics.md#message-variations
[Topics]: authoring-create-edit-topics.md
[Trigger phrases]: authoring-create-edit-topics.md
[Variables]: authoring-variables.md
