---
title: AI-based chatbot authoring overview
description: Create instantly useful chatbots quickly with natural language understanding-based authoring capabilities in Power Virtual Agents.
keywords: "Power Virtual Agents, bot, chatbot, GPT, OpenAI, PVA"
ms.date: 3/16/2023
ms.topic: overview
author: iaanw
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---
# AI-based chatbot authoring overview

By leveraging recent advancements in AI large language models, Power Virtual Agents transforms how you build chatbots, increasing a chatbot's usefulness and significantly reducing manual authoring and configuration. You can:

- **Create an instantly useful chatbot.** With no manual authoring, an "empty" chatbot can respond to your users with relevant information, even if you haven't manually created a topic for it. 

- **Author topics by describing what you want.** Describe what you want your topic to do, and Power Virtual Agents creates it for you, complete with conversational responses and multiple types of nodes. Use the suggested topic as is, or as a starting point for further iteration. 

## Prerequisites

> [!CAUTION] 
> Your bot must be created in the US region. 
>  
> Other regions, and languages other than English, aren't supported.

- You'll need an account for Power Virtual Agents. 

    > [!NOTE]
    > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots with GPT](nlu-gpt-quickstart.md).

- You must be using the [current version of Power Virtual Agents](unified-authoring-conversion.md), and the bot type mustn't be **Classic**. Classic chatbots have **(classic)** added to their name. 

    :::image type="content" source="media/nlu-gpt/nlu-boost-bots.png" alt-text="Screenshot of the list of chatbots with one bot with clasic added to its name.":::

- This capability may be subject to usage limits or capacity throttling.

## Generate a bot's responses on-the-fly

Power Virtual Agents uses an underlying natural language understanding model for understanding a bot user's question and determining the right topic. Typically, [you create multiple topics](authoring-create-edit-topics.md) within a bot to account for what a user might ask. But, sometimes, a bot user might ask a question for which there is no built topic. 

When this happens, by default the bot prompts the user to rephrase their query. If, after two prompts, the bot still can't determine the user's intent, the bot escalates to a live agent through the [system **Escalate** topic](authoring-system-topics.md).

You can specify a [system **Fallback** topic](authoring-system-fallback-topic.md) to customize the response and actions the bot takes - but this isn't always helpful for the bot user.

The **Boost conversations** option in Power Virtual Agents helps to solve that issue by connecting the natural language processing capabilities of Azure OpenAI, which includes use of OpenAI's GPT technology, with [the AI already in Power Virtual Agents](advanced-ai-features.md) (including transformer-based natural language understanding) to:

- Understand a user's intent by parsing what they type, and determining what they're asking
- Find, collate, and parse relevant information from a URL you specify
- Create a plain language response and deliver that to the bot user

In other words, if the bot doesn't already have an answer for what the user is asking, it can get the information and create one "on-the-fly".

See the [Boost conversations](nlu-boost-conversations.md) topic for how to set up and use **Boost conversations**, along with tips for getting the best from the AI.

### Create and edit topics by talking to AI

As part of creating a bot, a bot maker usually creates multiple, [individual topics](authoring-create-edit-topics.md), with each topic corresponding to a particular issue or action. 

This can require a large amount of time, and often requires specialized knowledge in the field of conversational user experiences, along with deep technical or domain knowledge. This isn't always possible in every organization - especially those that rely on fusion teams where multiple disciplines work directly in the Power Virtual Agents authoring canvas.

The **Create with Copilot** option in the Power Virtual Agents canvas lets bot makers simply describe what they want to achieve, and then produces a topic path that achieves that goal. It does this by combining the natural language understanding models already in Power Virtual Agents with Azure OpenAI to:

- Understand what the bot maker wants to achieve by parsing their request
- Apply knowledge of how nodes within a topic work together, and how a topic should be constructed for the best effect
- Generate a series of connected nodes that together form a full topic
- Use plain language in any node that contains user-facing text that corresponds with the bot maker's request

This capability means that what previously might have taken several hours can instead take minutes to complete.

See the [Create (and edit) with Copilot](nlu-authoring.md) topic for how to set up and use the feature, along with tips to get the best from the AI.



## Next steps

- Get up and running with the [Quickstart guide for building bots with GPT](nlu-gpt-quickstart.md)
- Dive in and start using the [Boost conversations](nlu-boost-conversations.md) capability in your chatbots
- Have a conversation with the AI to [Create (and edit) with Copilot](nlu-authoring.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
