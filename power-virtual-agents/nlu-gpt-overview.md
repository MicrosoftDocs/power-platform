---
title: AI-based copilot authoring overview
description: Create copilots with natural language understanding-based authoring capabilities in Microsoft Copilot Studio.
keywords: "Power Virtual Agents, bot, chatbot, GPT, OpenAI, PVA"
ms.date: 12/8/2023
ms.topic: overview
author: iaanw
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope: "Power Virtual Agents"
---
# AI-based copilot authoring overview

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

With large AI language models, Microsoft Copilot Studio transforms how you build copilots. A copilot can significantly reduce manual authoring and configuration.

- **Create an instantly useful copilot.** With no manual authoring of topics required, an "empty" copilot can respond to your users with relevant information.

- **Author topics, using natural language.** Describe what you want your topic to do, and Copilot Studio creates it for you. Your copilot includes conversational responses and multiple types of nodes. Use the suggested default topic or as a starting point for further development.

## Prerequisites

- An account for Microsoft Copilot Studio.

  > [!NOTE]
  > If you need a Microsoft Copilot Studio account or want to see how to build a copilot, see the [Quickstart guide for building copilots with generative AI](nlu-gpt-quickstart.md).

- The [current version of Microsoft Copilot Studio](unified-authoring-conversion.md). The copilot type shouldn't be **Classic**. Classic copilots have **(classic)** added to their name, for example "Contoso store hours (classic)".

  :::image type="content" source="media/nlu-gpt/nlu-boost-bots.png" alt-text="Screenshot of the list of copilots with one copilot with clasic added to its name.":::

- AI-based authoring might be subject to usage limits or capacity throttling.

## Generate a copilot's responses on-the-fly

Copilot Studio uses a natural language understanding model to analyze the user's question and determine the right topic. Typically, [you create multiple topics](authoring-create-edit-topics.md) within a copilot to account for what a user might ask.

Sometimes, a copilot user asks a question that has no built topic. By default, the copilot prompts the user to rephrase their query. After two prompts, if the copilot still can't determine the user's intent, the copilot escalates to a live agent through the [system **Escalate** topic](authoring-system-topics.md).

You can specify a [system **Fallback** topic](authoring-system-fallback-topic.md) to customize the response and actions the copilot takes, but this topic isn't always helpful for the user.

The **Boost conversations** option in Copilot Studio helps solve that issue by using the natural language processing capabilities of Azure OpenAI. OpenAI's GPT technology with [the AI already in Copilot Studio](advanced-ai-features.md) include transformer-based natural language understanding that helps the copilot to:

- Understand a user's intent by parsing what they type and determining what they're asking.
- Find, collate, and parse relevant information from a URL you specify.
- Create a plain language response for the copilot user.

In other words, if the copilot doesn't have an answer for the user's question, it can get the information and create an "on-the-fly" answer.

See the [Boost conversations](nlu-boost-conversations.md) article for how to set up and use **Boost conversations**. You also learn how to select effective URLs.

### Create and edit topics by talking to AI

A copilot author usually creates multiple, [individual topics](authoring-create-edit-topics.md), with each topic relating to an issue or action.

Topic authoring can take time, which often requires specialized knowledge in conversational user experiences and deep technical or domain knowledge. These requirements aren't always possible in every organization. For example, [fusion teams](/power-platform/developer/fusion-development) work in multiple disciplines directly in the Copilot Studio authoring canvas.

The **Create with Copilot** option in the Copilot Studio canvas lets you describe what you want, then the AI produces a topic path that achieves your goal. Copilot Studio combines natural language understanding models with Azure OpenAI to:

- Understand what the copilot author wants to achieve by parsing their request.
- Make nodes within a topic work together and construct each topic for the best effect.
- Generate a series of connected nodes that together form one full topic.
- Use plain language in user-facing node text that aligns with the copilot author's request.

Instead of copilot authoring that takes several hours, it can instead take minutes to complete.

To create and edit topics with AI, see the [Create (and edit) with Copilot](nlu-authoring.md) article.

## Next steps

- Get up and running with the [Quickstart guide for building copilots with generative AI](nlu-gpt-quickstart.md)
- Dive in and start using the [Boost conversations](nlu-boost-conversations.md) capability in your copilots.
- Have a conversation with the AI to [Create (and edit) with Copilot](nlu-authoring.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
