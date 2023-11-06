---
title: "Data Management in SC"
description: "Data management in SC"
ms.reviewer: peterswimm
ms.date: 10/03/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: power-virtual-agents
ms.service: virtual-agent
---



# Data management in Service Copilot

The data management page is where you will control access to knowledge sources that your Service Copilot will use to generate answers for your experience.

Generative answers in Service Copilot allow your bot to find and present information from multiple sources (which may be internal or external) without requiring creation of topics. Generative answers can be used as primary information sources in your chatbot, or as fallback when authored topics are unable to address a user's query. As a result you can quickly create and deploy a functional bot, without having to manually author multiple topics that may not address your customer's questions.

In the past, when a bot couldn't determine a user's intent, it asked the user to rephrase their question. If, after two prompts, the bot still couldn't determine the user's intent, the bot escalated to a live agent by using the system Escalate topic. 

Now, before involving a live agent, the bot uses natural language processing (NLP) to:
- Parse what a user types to determine what they're asking
- Find, collate, and parse relevant information from a specified source (for example, your company's website) or from multiple sources, including Sharepoint and OneDrive for Business.
- Summarize search results into plain language that is delivered to the bot user

Your workflow might be like this:

1. You create a bot and enable this capability. You test it thoroughly.

1. After testing it, you publish your bot so you can instantly provide answers, help, and guidance to your customers or bot users.

1. You create individual topics for the most important or most often-asked questions from your customers (which you might have developed based on analytics from previous bots or existing support issues).

This workflow could take a while and some specialized knowledge - but with Service Copilot you're up and running from day one.

## Getting started with Data Sources in Service Copilot

This document is focused on _getting you started_ using data sources to augment your bot's ability to help customers.


## Prerequisites

> [!CAUTION] 
>  
> Your bot must be created in the US region. 
>  
> Other regions, and languages other than English, aren't currently supported.

- An account for Service Copilot.

    > [!NOTE]
    >
    > If you don't have a Service Copilot account, or you haven't created chatbots with Service Copilot before, see the [Quickstart guide for building bots Service Copilot)]().


- [Review AI response generation training, model, and usage notes](#ai-response-generation-training-model-and-usage-notes) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note).

- Your bot must be created in the US region. Other regions, and languages other than English, aren't supported at this time.

- This capability may be subject to usage limits or capacity throttling.


