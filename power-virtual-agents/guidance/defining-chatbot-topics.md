---
title: "Defining chatbot topics"
description: "Defining new chatbot topics in Power Virtual Agents"
author: HenryJammes

ms.date: 02/22/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Defining chatbot topics

Defining the best topics for your bot requires understanding the questions users will ask or tasks they will try accomplish, and the kind of information and automation you’ll need to provide. For example, a retail chatbot might start by asking the user which of four things they want to do: find a store, place an order, check the status of an order, or return a purchased product. Their answer could lead them into one of four topics, each with its own topic dialog. 

Obvious places to start are:
> [!div class="checklist"]
> * Any existing **Frequently Asked Questions** (FAQ) or **Knowledge Base** (KB).
> * **Common subjects raised by your employees or customers** in internal or customer service scenarios. If you’re building a customer service bot, talk with existing service representatives to learn what the most common questions are and the order in which they’re typically asked.

<!--- Commenting as this feature is no longer available in the unified authoring canvas.
> [!TIP] 
> **Start quickly with the Suggest Topics feature**
> 
> For existing FAQs, Power Virtual Agents includes a [suggest topics](/power-virtual-agents/advanced-create-topics-from-web) feature. You supply URLs, then let Power Virtual Agents crawl these content for FAQ information. The feature will automatically import suggestions that you can promote to preformatted topics, including trigger phrases. You’re also free to edit or delete these suggestions before they’re promoted to topics. 
--->

## Different types of topics

People will use your bot with a specific topic to address or resolve. You can loosely categorize topics into 3 types:  
1. **Informational**: E.g. "*What is…?*", "*When will…?*", "*Why…?*"
2. **Task completion**: "*I want to…*", "*How do I…?*"
3. **Troubleshooting**: *"Something isn’t working…*", "*I got an error message…*"

You may also need some topics that are just there to take ambiguous user questions ("I need help" or "shopping") and ask for clarification, so you can then route the user to the correct topic.

## Topic design process

:::row:::
   :::column span="":::
      **Identify the topic**
        - Choose topics end-users will ask about.
        - Start with high-impact topics.
        - Think about topics from an end-user's point of view. Never forget that they might know much less about an area then you do.
   :::column-end:::
   :::column span="":::
      **List all scenarios**
        - List all possible scenarios.
        - Categorize scenarios: informational needs, task completion, and troubleshooting.
        - Hierarchize topics: what are the initial questions a user asks?
   :::column-end:::
   :::column span="":::
      **Design a high-level conversation tree**
        - Draw the conversation tree.
        - Define the hierarchy of questions asked inside each topic.
        - Define the fewest number of questions to understand the situation and provide the right  solution.
   :::column-end:::
   :::column span="":::
      **Validate and iterate on the design**
        - Read the dialog out loud before publishing.
        - Get analytics and read session transcripts for further optimization.
        - Bot topic authoring is an iterative process, and it involves authors observe bot/end-user interactions with each authoring iteration.
   :::column-end:::   
:::row-end:::

> [!IMPORTANT]
> - Don’t just replicate what your website or application can already do – most customers are familiar with websites apps and will accomplish these tasks themselves without needing to interact with a bot. 
> - Look to create topics for things which generate a high volume of chats or calls. 
> - Build automations for those to start with, and then work on the longer tail of other topics over a period of time. 
> - When designing a topic, you should try to be as thorough as possible in your design and all the potential scenarios that your users might ask or fall into.

## Expect to create both single-turn and multi-turn interactions

For simple interactions, you’ll create single-turn conversations with just one question and one answer. But more substantive topics require a multi-turn conversation with multiple back-and-forth interactions between the user and your bot. 

For instance, if a user asks a retail bot whether there are any stores nearby, the chatbot might respond with a question such as *"What city do you live in*" or "*What is your postal code?*" to narrow down its possible responses. The user’s response to this will determine the bot’s next response in the conversation.

## Leverage native generative AI capabilities (preview)

When designing a chatbot, you may not be able to anticipate all the types of questions your end-users ask. To help mitigate this, Power Virtual Agents incorporates a powerful AI-powered capability that uses the latest advancements in Natural Language Understanding models. 

When you enable the [Boost conversations (preview)](/power-virtual-agents/nlu-boost-conversations) feature and link your chatbot to a publicly available,  Bing-indexed, website, your bot can provide automatically generated, conversationally friendly, plain language responses without depending upon the bot builder to create topics for every eventuality.

## Offload large volumes of single-turn question and answer pairs

Power Virtual Agents limits a chatbot to 1,000 topics. 
If you have very large FAQs or Knowledge Base, you can avoid creating one topic for each question and answer pair by offloading them outside of Power Virtual Agents topics, while offering a single user experience in Power Virtual Agents by [leveraging the Fallback topic](/power-virtual-agents/guidance/fallback-topic).

> [!TIP]
> [Question answering in Azure Cognitive Service for Language](/azure/cognitive-services/language-service/question-answering/overview) provides cloud-based Natural Language Processing (NLP) that allows you to create a natural conversational layer over your data. It is used to find the most appropriate answer for any input from your custom knowledge base of information.
> [Learn how to integrate question answering in Power Virtual Agents](/power-virtual-agents/integrate-with-question-answering).

> [!div class="nextstepaction"]
> [Topic authoring best practices](topic-authoring-best-practices.md)