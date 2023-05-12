---
title: "Begin the bot topic design process"
description: "You use bot topics in Power Virtual Agents to provide answers and information for your customers or bot users. Considering the types of questions and tasks that your bot users have will aid in the development of your chatbot design plan."
author: HenryJammes
ms.date: 02/22/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.reviewer: iawilt
ms.collection: virtual-agent
---

# Defining chatbot topics

==Do we need ms.service in the metadata as well?==

Defining the best topics for your bot requires an understanding of the questions users might ask or the tasks they'll try to accomplish, and the kind of information and automation you need to provide. 

For example, a retail chatbot might start by asking the user to choose from four things they want to do: find a store, place an order, check the status of an order, or return a purchased product. Their answer could lead them into one of four topics, each with its own topic dialog.

An initial set of sources for this information include:

- Any existing frequently asked questions (FAQs) or knowledge bases (KB).
- Common subjects raised by your employees or customers in internal or customer service scenarios. If you’re building a customer service bot, talk with existing service representatives to learn what the most common questions are and the order in which they’re typically asked.

## Different types of topics

Typically, bot users have a specific question or problem they want to address or an issue they want resolved (their "task"). The types of tasks usually undertaken by bot users (and, therefore, the types of bot topics you'll need to create) fit into three categories:

1. **Informational**: for example "_What is…?_", "_When will…?_", "_Why…?_"
2. **Task completion**: "_I want to…_", "_How do I…?_"
3. **Troubleshooting**: _"Something isn’t working…_", "_I got an error message…_"

You may also need to create bot topics to handle ambiguous user questions, such as "_I need help_" or "_shopping_". These topics would ask the bot user for clarification so they can be routed to the correct topic.

## Topic design process

:::row:::
   :::column span="":::
      **Identify the topic**
        - Choose topics bot users ask about.
        - Start with high-impact topics.
        - Think about topics from an end-user's point of view. Keep in mind that they might be less familiar or knowledgeable about an area than you are.
   :::column-end:::
   :::column span="":::
      **List all scenarios**
        - List all possible scenarios.
        - Categorize scenarios: **informational**, **task completion**, and **troubleshooting**.
        - Hierarchize topics: what are the initial questions a user asks?
   :::column-end:::
   :::column span="":::
      **Design a high-level conversation tree**
        - Draw the conversation tree.
        - Define the hierarchy of questions asked inside each topic.
        - Define the fewest number of questions to understand the situation and provide the right solution.
   :::column-end:::
   :::column span="":::
      **Validate and iterate on the design**
        - Read the dialog out loud before publishing to help identify if there are problems with the tone or words.
        - [Get analytics and read session transcripts](custom-analytics-strategy.md) for further optimization.
        - Continuously iterate on and refine your bot topics by observing your bot users' interactions with the bot after each authoring iteration.
   :::column-end:::
:::row-end:::

> [!IMPORTANT]
>
> - Don’t just replicate what your website or app can already do – your customers will likely be familiar with your website or app and can accomplish common tasks themselves without needing to interact with a bot.
> - Focus on creating topics for issues or scenarios which generate a high volume of chats or calls first. Work on the longer tail of other, less-critical issues over a period of time.
> - Be as thorough as possible in your design and consider all of the potential scenarios that your users might ask or need help with.

## Plan for both single-turn and multi-turn interactions

For simple interactions, you create single-turn conversations with just one question and one answer. But more substantive topics require a multi-turn conversation with multiple back-and-forth interactions between the user and your bot.

For instance, if a user asks a retail bot whether there are any stores nearby, the chatbot might respond with a question such as _"What city do you live in?_" or "_What is your postal code?_" to narrow down its possible responses. The user’s response will determine the bot’s next response in the conversation.

## Use native generative AI capabilities (preview)

When designing a chatbot, you may not be able to anticipate all the types of questions your bot users ask. To help mitigate this, Power Virtual Agents incorporates a powerful AI-powered capability that uses the latest advancements in natural language understanding (NLU) models.

When you enable the [Boost conversations (preview)](/power-virtual-agents/nlu-boost-conversations) option for your bot and link your chatbot to a publicly available,  Bing-indexed website, your bot can provide automatically generated, conversationally friendly, plain language responses without the need for you to create topics for every eventuality or "edge-case".

## Offload large volumes of single-turn question and answer pairs

Power Virtual Agents limits a chatbot to 1,000 topics.

If you have large numbers of FAQs or KBs, you can avoid creating one topic for each question and answer pair by offloading them outside of Power Virtual Agents topics, while offering a single user experience in Power Virtual Agents by [using the Fallback topic](./fallback-topic.md).

> [!TIP]
> [Question answering in Azure Cognitive Service for Language](/azure/cognitive-services/language-service/question-answering/overview) provides cloud-based NLP that allows you to create a natural conversational layer over your data. It is used to find the most appropriate answer for any input from your custom KB of information.
> [Learn how to integrate question answering in Power Virtual Agents](/power-virtual-agents/integrate-with-question-answering).

> [!div class="nextstepaction"]
> [Topic authoring best practices](topic-authoring-best-practices.md)
