---
title: Overview of AI in Power Virtual Agents
description: Create instantly useful chatbots and publish them quickly with AI capabilities in Power Virtual Agents.
keywords: "Power Virtual Agents, bot, chatbot, ChatGPT, GPT, Open AI"
ms.date: 2/14/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: 
manager: shellyha
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---
# Overview 

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

By leveraging recent advancements in AI language models, Power Virtual Agents (preview) transforms how you build chatbots, increasing a chatbot's ability to respond to user input while at the same time significantly reducing manual authoring and configuration.

Here's what you can do with the two new AI capabilities in Power Virtual Agents (preview):

- **Create an instantly useful chatbot.** With no manual authoring, an "empty" chatbot will be able to respond to users with information from your website, including in conversations you haven't already created a topic for. 
- **Author a topic by describing in natural language how you want a chatbot to respond to user input.** Power Virtual Agents (preview) uses AI to generate the content and business logic of the conversation for you. Use the suggested topic as is, or as a starting point for further iteration.

The AI for these capabilities is powered by the Azure OpenAI GPT-3 (text-davinci-003) model. [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note). 

## How AI works in Power Virtual Agents (preview)

Power Virtual Agents (preview) uses a natural language understanding (NLU) model to interpret a bot user's question and then respond correctly. Typically, a [bot maker authors multiple topics](../authoring-create-edit-topics.md) within a bot to account for the most common questions a user might ask. However, it's impossible to anticipate every question, so occasionally the bot receives input with no pre-built topic. That's where AI steps in. 

In the past, when a bot couldn't determine a user's intent, it asked the user to rephrase their question. If, after two prompts, the bot still couldn't determine the user's intent, the bot escalated to a live agent by using the [system **Escalate** topic](../authoring-system-fallback.md).

Now, before involving a live agent, the bot uses natural language processing to:
- Parse what a user types to determine what they're asking
- From a specified URL (for example, your website), find, collate, and parse relevant information
- Create a plain language response and then deliver that to the bot user

See [How to use GPT AI to generate a bot's responses](gpt-answers.md) for how to set up and use the **boost conversations** capability.

### Create and edit topics by talking to AI

As part of creating a bot, a bot maker usually creates multiple, [individual topics](../authoring-create-edit-topics.md), with each topic corresponding to a particular issue or action. 

This can require a large amount of time, and often requires specialized knowledge in the field of conversational user experiences along with deep technical or domain knowledge. This isn't always possible in every organization - especially those that rely on fusion teams where multiple disciplines work directly in the Power Virtual Agents authoring canvas.

The **Describe it** option in the Power Virtual Agents preview canvas lets bot makers simply describe what they want to achieve, and then produces a topic path that achieves that goal. It does this by combining the natural language understanding models already in Power Virtual Agents with GPT-powered AI to:

- Understand what the bot maker wants to achieve by parsing their request
- Apply knowledge of how nodes within a topic work together, and how a topic should be constructed for the best effect
- Generate a series of connected nodes that together form a full topic
- Use plain language in any node that contains user-facing text that corresponds with the bot maker's request

Put simply, effort that previously might have taken several hours can instead take minutes to complete.

See [How to use GPT AI to create and edit topics](gpt-authoring.md) for how to set up and use the feature, along with tips the best from the AI.




[!INCLUDE[footer-include](includes/footer-banner.md)]
