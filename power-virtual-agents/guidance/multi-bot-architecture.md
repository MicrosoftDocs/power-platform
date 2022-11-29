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

Conversational AI management in a multi-bot environment is becoming more and more critical in the organizations implementing AI based chatbots. We see that there are more customers with multiple departments/business functions with each department or task specific bots. These bots can be internal or external facing.  In this article, we want to address some best practices for Conversational AI management in a multi-bot environment for Power Virtual Agents. 

## Problems with multi-bot management

One of the key problems we see in customers who have adopted the Microsoft Conversational AI stack is that they have multiple bots with thousands of QnA pairs. These are currently created as individual FAQ bots using Bot Framework SDK and QnA Maker e.g., Department specific bots like HR Bot, Legal Bot, etc.​ These bots are not aware of each other and are becoming increasingly difficult to maintain.​ 

It is increasingly important to learn how to integrate or combine the different bots/domains with a single front door (Universal/Root bot), i.e., an “Enterprise Virtual Assistant” that will cater to all questions asked by the user. This blog attempts to present the architecture patterns that are available in Power Virtual Agents for the above scenario and talks about the pros and cons of each approach.   

## PVA bot topics categorized for various departments

This approach is recommended for multi-department scenarios where IT wants to manage the bot orchestration.  The recommendation is to collaboratively build topics in a single bot; and/or merge topics from multiple bots into a single bot.  

In this recommended approach, you will **set up a single PVA bot for all topics across different departments**. The topics will be categorized as per the various departments. Full blown NLU aggregation happens at the PVA bot level for triggering the right topics, as it uses the in-built PVA NLU for Topic matching. Since all department specific bot contents are topics inside same PVA bot, if needed the segregation of topics of different departments can be achieved through solution framework. This will help to achieve access control at the bot level and avoid members of other departments inadvertently accessing topics during authoring. 

The PVA bot will look for a topic match initially and then fall back. Enabling the Fall-back system topic in PVA is recommended for all PVA bots if you have existing bots using QnA Maker. QnA Maker bots in this case will act as fall back for long tail queries. The Fall back has a BF skill / orchestration flow that disambiguates between different instances of dept specific QnA Maker instances and returns the right results if you have multiple QnA maker bots. While using this approach, separate bot per channel is recommended if using multiple channels. 

An example of this configuration may look like below: 

* 1 Single PVA Bot  
    * 4 Topics for each department (IT, HR, Procurement and Finance)  
    * Topics matching to these 4 topics  
        * IT Route to IT Topic  
        * HR Route to HR Topic
        * Procurement Route to Procurement Topic
        * Finance Route to Finance Topic  
    * One Fallback topic (for the PVA Bot)   
    

![Single PVA Bot with Multiple Topics flow](https://github.com/MicrosoftDocs/power-platform-pr/blob/0080c1e0367f1a1544cb1fd3144ae896d02df7e1/power-virtual-agents/guidance/media/introduction/overview-no-code.png "single-pvabot-with-multiple-topics.png")

**Pros:**  
   * Easy to manage and each department is responsbile for managing their PVA topics and fallback QnA Maker FAQ bots  
   * Seamless transition between the topics

 **Cons:**  
   * No topic isolations at the department level inside the PVA bot. This can be achieved by branching/environment strategy and changes to Source Control. 

<!-- TODO -->
