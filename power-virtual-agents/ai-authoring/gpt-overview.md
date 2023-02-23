---
title: AI in Power Virtual Agents overview
description: Create instantly useful chatbots and publish them quickly with AI capabilities in Power Virtual Agents.
keywords: "Power Virtual Agents, bot, chatbot, ChatGPT, GPT, Open AI"
title: Develop chatbots with AI
description: Desc for overview
keywords: "PVA"
ms.date: 2/14/2023
ms.topic: overview
author: iaanw
ms.author: iawilt
ms.reviewer: 
manager: shellyha
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---
# AI in Power Virtual Agents overview 

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

By leveraging recent advancements in AI language models, Power Virtual Agents (preview) transforms how you build chatbots, increasing a chatbot's ability to respond to user input while at the same time significantly reducing manual authoring and configuration.

Here's what you can do with the two new AI capabilities in Power Virtual Agents (preview):

- **Create an instantly useful chatbot.** With no manual authoring, an "empty" chatbot will be able to respond to users with information from your website, including in conversations you haven't already created a topic for. 
- **Author a topic by describing in natural language how you want a chatbot to respond to user input.** Power Virtual Agents (preview) uses AI to generate the content and business logic of the conversation for you. Use the suggested topic as is, or as a starting point for further iteration.

## How AI works in Power Virtual Agents (preview)

Power Virtual Agents (preview) uses a natural language understanding (NLU) model to interpret a bot user's input and then respond correctly. Typically, you author [multiple topics](../authoring-create-edit-topics.md) within a bot to account for the most common questions a user might ask. However, it's impossible to anticipate every question, so occasionally the bot receives input with no pre-built topic. That's where AI steps in. 

The AI for these features is powered by Azure OpenAI, which includes use of OpenAI's GPT-3 series of models. [Learn more about Azure OpenAI](https://learn.microsoft.com/legal/cognitive-services/openai/transparency-note). 

<!-- replace with relative link -->

## Prerequisites
- You must be using the [preview version of Power Virtual Agents](../preview/overview.md), and the bot type must be **Preview**.  
  
  Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.

In the past, when a bot couldn't determine a user's intent, it asked the user to rephrase their question. If, after two prompts, the bot still couldn't determine the user's intent, the bot escalated to a live agent by using the [system **Escalate** topic](../authoring-system-fallback.md).

Now, before involving a live agent, the bot uses natural language processing to:
- Parse what a user types to determine what they're asking
- From a specified URL (for example, your website), find, collate, and parse relevant information
- Create a plain language response and then deliver that to the bot user

See [How to use GPT AI to generate a bot's responses](gpt-answers.md) for how to set up and use the **boost conversations** capability.

## AI in Power Virtual Agents

There are two core scenarios where you can use GPT AI in Power Virtual Agents.

### Generate a bot's responses on-the-fly

Power Virtual Agents uses an underlying natural language understanding model for understanding a bot user's question and determining the right topic. Typically, a [bot maker creates multiple topics](../authoring-create-edit-topics.md) within a bot to account for what a user might ask. But, sometimes, a bot user might ask a question for which there is no built topic. 

When this happens, by default the bot prompts the user to rephrase their query. If, after two prompts, the bot still can't determine the user's intent, the bot escalates to a live agent through the [system **Escalate** topic](../authoring-system-topics.md).

You can specify a [system fallback topic](../authoring-system-fallback-topic.md) to customize the response and actions the bot takes - but this isn't always helpful for the bot user.

The **Boost conversations** option in Power Virtual Agents preview helps to solve that issue by connecting the natural language processing capabilities of GPT with [the AI already in Power Virtual Agents](../advanced-ai-features.md) (including transformer-based natural language understanding) to:

- Understand a user's intent by parsing what they type, and determining what they're asking
- Find, collate, and parse relevant information from a URL you specify
- Create a plain language response and deliver that to the bot user

In other words, if the bot doesn't already have an answer for what the user is asking, it can get the information and create one "on-the-fly".

See [Use AI to generate a bot's responses](gpt-answers.md) for how to set up and use the feature, along with tips for getting the best from the AI.

### Create and edit topics by talking to AI

As part of creating a bot, a bot maker usually creates multiple, [individual topics](../authoring-create-edit-topics.md), with each topic corresponding to a particular issue or action. 

This can require a large amount of time, and often requires specialized knowledge in the field of conversational user experiences, along with deep technical or domain knowledge. This isn't always possible in every organization - especially those that rely on fusion teams where multiple disciplines work directly in the Power Virtual Agents authoring canvas.

The **Describe it** option in the Power Virtual Agents preview canvas lets bot makers simply describe what they want to achieve, and then produces a topic path that achieves that goal. It does this by combining the natural language understanding models already in Power Virtual Agents with GPT-powered AI to:

- Understand what the bot maker wants to achieve by parsing their request
- Apply knowledge of how nodes within a topic work together, and how a topic should be constructed for the best effect
- Generate a series of connected nodes that together form a full topic
- Use plain language in any node that contains user-facing text that corresponds with the bot maker's request

Put simply, effort that previously might have taken several hours can instead take minutes to complete.

See [Use AI to create and edit topics](gpt-authoring.md) for how to set up and use the feature, along with tips the best from the AI.


[!INCLUDE[footer-include](includes/footer-banner.md)]
