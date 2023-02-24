---
title: Quickstart guide for AI authoring
description: Quickstart guide for AI authoring
keywords: "PVA"
ms.date: 2/23/2023
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

# Quickstart guide for AI authoring (preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

Microsoft has made bot building even simpler with the Power Virtual Agents (preview) version. Whether you're new to conversational AI or a seasoned developer, Microsoft's new GPT AI intelligence platform is with you and your team every step of the way. 

With Power Virtual Agents (preview), now you can build natural language understanding (NLU) capabilities into your chatbots using our improved bot authoring canvas, GPT Builder.

## Prerequisites 

- You must be using the [preview version of Power Virtual Agents](preview/overview.md), and the bot type must be  Preview. 

- Preview chatbots have (preview)  added to their name. When you create a new bot, select Try the unified canvas (preview). 
 
> [!IMPORTANT] 
> During the Chat GPT preview period, if you create a bot that has Boost conversations enabled, you'll need to contact Microsoft Support for pre-authorization before you can publish it. 

Previously, Power Virtual Agent bots would parse what a user typed into the bot message prompt and respond with the most appropriate trigger phrase or node. For example, if a user typed "Open hours", then the bot would parse that phrase to locate a **Store hours** topic, starting a conversation that then would ask the user which store location is the customer interested in, and then displaying the hours that the requested store located is open.  

What makes the improved preview version of Power Virtual Agents so powerful is the new AI feature, **GPT Answers**. Now when you create a bot that is linked to your organization’s website, Power Virtual Agents (preview) can now harness the power of the natural language understanding (NLU) by providing custom responses to any user question without depending upon the bot builder to create topics for the bot to parse and respond to. 

Now, a user can type anything into the bot, and **GPT Answers** uses its built-in intelligence to interpret the user’s intent. Over time you train the language model so that the bot can extract meaning from any phrase the user types and respond more and more intelligently to answer the user’s questions, as the bot is trained. 

Ready to get started? The first step is to create your bot.  

## Create your GPT AI bot 

Simply choose a few initial topics or let the new **AI topic builder** do the heavy lifting by converting your existing content. You can then one or more conversation starters and unlock the power of AI bots, enabling natural language responses from information located on your organization’s own website.  

1. From the **Power Virtual Agents (preview)** main screen, in the left navigation menu, select **Home**, and then select **+ Create a bot**. 

  :::image type="content" source="media/ai-authoring/gpt-quickstart1.png" alt-text="Screenshot of the Power Virtual Agents home page.":::

2. Select **Try the unified canvas (preview)** to create a preview bot. 
   - An opt-in confirmation appears the first time you create or view a preview bot. 

  :::image type="content" source="media/ai-authoring/gpt-quickstart2.png" alt-text="Screenshot of the Create a chatbot page.":::

3. Name your bot, and then select Create. 

  :::image type="content" source="media/ai-authoring/gpt-quickstart3.png" alt-text="Screenshot of the Boost your conversation preview option.":::

There you have it! You’ve created a new bot.  

With **GPT Answers**, when you create an AI intelligent bot, you can associate it with your organization’s own information, such as located on your website domain. Once you’ve done this, any message that a user asks a bot that isn’t matched to a manually defined topic, Power Virtual Agents (preview) triggers the new AI feature. To learn more, see How to use **GPT Answers** to create and edit topics. 

## Choose a message starter topic 

 Topics begin with *trigger phrases* and/or *conversation topic nodes*. Trigger phrases are phrases, keywords, and questions that a user is likely to type that relate to a specific issue. Conversation nodes define how a bot should respond to a trigger phrase and what it should do. 

 Next, choose your first topic. You can start with a blank canvas, or you can have the AI topic builder do the work for you. In this example, we’ll choose a blank canvas.  

1. In the left navigation menu, select **Topics**, **+ New topic**, and then **From blank**. 
 
   :::image type="content" source="media/ai-authoring/gpt-quickstart4.png" alt-text="Screenshot of the Create a new topic from blank option.":::

2.  To add a new Message node, select the *+ sign* on the Trigger phases node, and then click the *add node (+)* button.

   :::image type="content" source="media/ai-authoring/gpt-quickstart5.png" alt-text="Screenshot of the Add node button.":::
   
3. Select **Send a message**.

   :::image type="content" source="media/ai-authoring/gpt-quickstart6.png" alt-text="Screenshot of the Send a message option.":::

4. Type a message. In this example, type How can I help you today? in the **Type your message** prompt. 

   :::image type="content" source="media/ai-authoring/gpt-quickstart7.png" alt-text="Screenshot of the Message node.":::

5. Repeat the above steps to add as many message variations as you like.  
 
6. When you’re finished, Click **Save** to save your bot. 

  When you add message variations, the bot randomly picks one of them to use each time the node is triggered. 

In addition to the traditional method for creating and editing topics, Power Virtual Agents with GPT AI now lets you choose the **Describe it to build with GPT (preview)** feature. You can choose to utilize this powerful new option that includes pre-built AI models and elicits responses based on natural language understanding (NLU).  

By describing what you want and having AI build it for you, this significantly decreases the time it takes to create and update bots.  For more information, see How to use [Use AI to create and edit topics (preview)](). 

Next, you can test your bot! 

## Test your bot with GPT Answers power 

 Once you create a bot, you can immediately test the bot and try out different phrases for **GPT Answers** to parse. Then, any question a user asks the bot triggers **GPT Answers**, even phrases a user types in the bot that don’t match a defined topic to elicit manual or trigger-defined responses. For example, you can ask the bot about your organization’s return policy, and **GTP Answers** performs a Microsoft Bing search over the customer’s website to parse and return relevant content, using powerful GPT AI technology to summarize the results using natural language understanding (NLU).  

> [!NOTE]
> **GPT Answers** AI-generated responses have been Microsoft pre-trained, that is modeled and compared against ideal responses using semantic similarity. 

The **Test bot** pane shows how a bot conversation plays out at every step. You can also use test your bot to fine-tune a topic directly within the **Power Virtual Agents (preview)** portal. 
 
1. From the top right navigation bar, select **Test bot**. 

   :::image type="content" source="media/ai-authoring/gpt-quickstart8.png" alt-text="Screenshot of Test bot option.":::

2. At the **Type your message** prompt, ask the bot about the return policy of the organization whose website you linked to in the [Boost your conversation]() step. For example, you could type “What is your return policy?”. 
 
  This first phrase you type starts the conversation. The Test bot pane displays the bot's responses in the test canvas. 

3. Next, ask the bot other questions.  
 
  The bot searches the website using Microsoft Bing to find relevant information and then returns a response. The response typically provides a link to where it found that information.  
 
4. (Optional) Try asking the bot a non-sensical question, such as “Why is the sky blue”? The bot then falls back to a standard defined topic that relates to not understanding the question. The bot then asks you to rephrase the question. 

   :::image type="content" source="media/ai-authoring/gpt-quickstart9.png" alt-text="Screenshot of Test bot pane.":::

> [!NOTE]
> After you test your bot, you can select the reset icon at the top of the Test bot pane to clear previous conversations. Resetting makes it easier to follow the flow of the current topic without getting confused by previous conversations.

   :::image type="content" source="media/ai-authoring/gpt-quickstart10.png" alt-text="Screenshot of Test bot pane refresh button.":::

You can return to the authoring canvas at any time to revise the conversation path. The Test bot pane automatically refreshes when you select **Save** to save topic changes. 

> [!NOTE]
> This example shows you how **GPT Answers** strictly adheres to locating information that is available on the website. Or you can configure the bot to not respond to questions a user asks that are not related to information provided on the website you selected. 

## Learn more: Add features to further develop your bot 

After you've completed your bot’s basic building blocks, it's easy to take the conversation up a notch, by giving your bot a voice of its own. You can add images and video clips, as well as adaptive cards, entities, and variable expressions. You can also create more complex variable expressions using power effects or integrate with backend APIs using [Power Automate](). 


[!INCLUDE[footer-include](includes/footer-banner.md)]