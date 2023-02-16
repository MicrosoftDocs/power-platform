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

By leveraging recent advancements in GPT-based language models, Power Virtual Agents makes building and publishing bots faster and easier, and helps reduce esclations to live agents. 

Here's what you can do with the AI capabilities in Power Virtual Agents:

- **Create an instantly useful chatbot.** The chatbot will be able to answer questions about any information from your website, including topics you haven't built conversations for, with no additional configuration. 
- **Author a topic by describing in natural language what you want the chatbot to do.** Power Virtual Agents uses AI to generate the content of the conversation for you. Use the suggested topic as is, or as a starting point for further iteration.

The AI for these capabilities is powered by the Azure OpenAI GPT-3 (text-davinci-003) model. [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note). 

///to try it out, you need...

## GTP AI in Power Virtual Agents

There are two core scenarios where you can use GPT AI in Power Virtual Agents.

### Generate a bot's responses

Power Virtual Agents uses an underlying natural language understanding model for understanding a bot user's question and determining the right topic. Typically, a [bot maker creates multiple topics](../authoring-create-edit-topics.md) within a bot to account for what a user might ask. But, sometimes, a bot user might ask a question for which there is no built topic. 

When this happens, by default the bot prompts the user to rephrase their query. If, after two prompts, the bot still can't determine the user's intent, the bot escalates to a live agent through the [system **Escalate** topic](../authoring-system-fallback.md).

You can specify a [system fallback topic](../authoring-system-fallback-topic.md) to customize the response and actions the bot takes - but this isn't always helpful for the bot user.

The **Boost conversations** option in Power Virtual Agents preview helps to solve that issue by connecting the natural language processing capabilities of GPT with [the AI already in Power Virtual Agents](../advanced-ai-features.md) (including transformer-based natural language understanding) to:

- Understand a user's intent by parsing what they type, and determining what they're asking
- Find, collate, and parse relevant information from a URL you specify
- Create a plain language response and deliver that to the bot user

In other words, if the bot doesn't already have an answer for what the user is asking, it can get the information and create one "on-the-fly".

See [How to use GPT AI to generate a bot's responses](gpt-answers.md) for how to set up and use the feature, along with tips for getting the best from the AI.

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
