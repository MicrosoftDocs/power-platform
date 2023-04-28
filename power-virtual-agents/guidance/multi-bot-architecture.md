---
title: "Power Virtual Agents Multi-bot architecture patterns"
description: "Multi-bot architecture for PVA"
author: hari-yarapotina

ms.date: 11/29/2022
ms.topic: conceptual
ms.custom: guidance
ms.author: hyarapotina
ms.collection: virtual-agent
---

# Multi-bot Architecture for Power Virtual Agents

Conversational AI management in a multi-bot environment is becoming more critical in the organizations implementing AI based chatbots. We see that there are more customers with multiple departments/business functions with each department or task specific bots. These bots can be internal or external facing.  In this article, we want to address some best practices for Conversational AI management in a multi-bot environment for Power Virtual Agents.

## Problems with multi-bot management

One of the key problems we see in customers who have adopted the Microsoft Conversational AI stack is that they have multiple bots with thousands of QnA pairs. The bots are currently created as individual FAQ bots using Bot Framework SDK and QnA Maker, for example, department specific bots like HR Bot, Legal Bot, etc.​ These bots aren't aware of each other and are becoming increasingly difficult to maintain.​

It's increasingly important to learn how to integrate or combine the different bots/domains with a single front door (Universal/Root bot), such as an “Enterprise Virtual Assistant” that caters to all questions asked by the user. This blog attempts to present the architecture patterns that are available in Power Virtual Agents for the above scenario and talks about the pros and cons of each approach.

## Power Virtual Agents bot topics categorized for various departments

This approach is recommended for multi-department scenarios where IT wants to manage the bot orchestration.  The recommendation is to collaboratively build topics in a single bot; and/or merge topics from multiple bots into a single bot.  

In this recommended approach, you'll **set up a single Power Virtual Agents bot for all topics across different departments**. The topics are categorized as per the various departments. Full blown NLU aggregation happens at the Power Virtual Agents bot level for triggering the right topics, as it uses the in-built Power Virtual Agents NLU for Topic matching. Since all department specific bot contents are topics inside same Power Virtual Agents bot, if needed the segregation of topics of different departments can be achieved through solution framework. This approach helps to achieve access control at the bot level and avoid members of other departments inadvertently accessing topics during authoring.

The Power Virtual Agents bot will look for a topic match initially and then fall back. Enabling the Fall-back system topic in Power Virtual Agents is recommended for all Power Virtual Agents bots if you have existing bots using QnA Maker. QnA Maker bots in this case act as fallback for long tail queries. The fallback has a Bot Framework skill / orchestration flow that disambiguates between different instances of department-specific QnA Maker instances. It then returns the right results if you have multiple QnA maker bots. When you use this approach, separate bot per channel is recommended if using multiple channels.

An example of this configuration may look like:

- 1 Single Power Virtual Agents Bot  
  - Four Topics for each department (IT, HR, Procurement and Finance)  
  - Topics matching to these four topics  
    - IT Route to IT Topic  
    - HR Route to HR Topic
    - Procurement Route to Procurement Topic
    - Finance Route to Finance Topic  
  - One Fallback topic (for the Power Virtual Agents Bot)

![Single Power Virtual Agents Bot with Multiple Topics flow](https://github.com/MicrosoftDocs/power-platform-pr/blob/0080c1e0367f1a1544cb1fd3144ae896d02df7e1/power-virtual-agents/guidance/media/introduction/overview-no-code.png "single-pvabot-with-multiple-topics.png")

**Pros:**  

- Easy to manage and each department is responsible for managing their Power Virtual Agents topics and fallback QnA Maker FAQ bots  
- Seamless transition between the topics

 **Cons:**  

- No topic isolation at the department level inside the Power Virtual Agents bot can be achieved by branching/environment strategy and changes to Source Control.

<!-- TODO -->
