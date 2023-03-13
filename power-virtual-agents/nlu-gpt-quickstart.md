---
title: Quickstart guide for boosting bot conversations (preview)
description: Build bots quickly and provide the most relevant information to your customers with natural language understanding advancements in Power Virtual Agents preview.
keywords: "PVA, GPT, NLU"
ms.date: 3/6/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: 
manager: shellyha
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Boost conversations quickstart guide (preview)

[!INCLUDE [AI tech disclosure with Bing Search](includes/disclosure-ai-preview-bing-addendum.md)]


Microsoft has made bot building even simpler with AI-powered capabilities in Power Virtual Agents (preview). Whether you're new to conversational AI or a seasoned developer, our intelligence platform is with you and your team every step of the way. 

This quickstart guide introduces you to the core steps in creating and boosting a chatbot with expanded natural language understanding (NLU) capabilities.

## Prerequisites 

- You'll need an account for Power Virtual Agents. 

    > [!NOTE]
    > If you don't have a Power Virtual Agents account, you can go to the [Power Virtual Agents introduction website](https://aka.ms/TryPVA), select **Start free**, and then sign in with your work email address. Also see the [Quickstart guide for creating a Power Virtual Agents bot](fundamentals-get-started.md).
    >  
    > Personal Microsoft accounts aren't supported. 
    >  
    > Supported browsers include Microsoft Edge, Chrome, and Firefox.

- You must be using the [preview version of Power Virtual Agents](preview/overview.md), and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.  

    :::image type="content" source="media/nlu-gpt/nlu-boost-preview-bots.png" alt-text="Screenshot of the list of chatbots showing bots with preview added to their names.":::

- Review these topics: [AI response generation training, model, and usage notes](nlu-boost-conversations.md#ai-response-generation-training-model-and-usage-notes) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note).
 
> [!IMPORTANT] 
> During the preview period, if you create a bot that has **Boost conversations** enabled, you'll need to [contact Microsoft Support before you can publish your bot](nlu-boost-conversations.md#publishing). 

## How bot conversations work

Power Virtual Agent bots use a [customized NLU model and AI capabilities](advanced-ai-features.md) to understand what a user types and responds with the most appropriate bot topic. A bot topic is a sequence of nodes that logically flow from one step to the other. See [Create and edit topics (preview)](preview/authoring-create-edit-topics.md) for details on how bot topics work.

For example, you might create a bot for your customers to ask common questions about your business, thus reducing your support overhead by deflecting support calls. In the bot, you could create a topic that includes details about your store opening hours and call it **Store hours**. 

When a customer asks a question such as "When do you open?" or "What are your opening hours?", the bot uses NLU to understand the _intent_ behind the question (in this case, that the customer wants to know about hours of operation), and matches that intent to the most appropriate bot topic (which would be the **Store hours** topic). 

The bot then follows the _conversation flow_ that you've defined in the **Store hours** topic, which might be a series of questions that use if/else arguments, or logic gates, to ask the customer which store location they're interested in. The final output of the topic might be to then display the hours and contact information for that location.  

However, you may not be able to anticipate all the types of questions your customers ask. To help mitigate this, Power Virtual Agents (preview) incorporates a powerful new AI-powered capability that uses the latest advancements in NLU models. When you have **Boost conversations** enabled in your bot, and linked to a publicly available, Bing-indexed website, your bot can provide automatically generated, conversationally friendly, plain language responses without depending upon the bot builder to create topics for every eventuality. 

Ready to get started? The first step is to create your bot.  

## Create a boosted bot 

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/). 

1. In the side navigation menu, select **Create**. You can also select **Create a bot** on the **Home** page or **New chatbot** from the **Chatbots** page.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-home.png" alt-text="Screenshot of the Power Virtual Agents home page.":::

2. Select **Try the unified canvas (preview)** to create a preview bot. 
   - An opt-in confirmation message appears the first time you create or view a preview bot that describes some of their benefits.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-create-bot.png" alt-text="Screenshot of the Create a chatbot page.":::

3. Enter a name for your bot, and add the website you'd like your bot to fall back to if it can't find an appropriate bot topic, then select **Create**. 

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-boost-create.png" alt-text="Screenshot of the Boost your conversation preview option.":::

There you have it! You’ve created a new bot.  

For any user-sent message that can't be matched to an existing topic, your bot looks for an answer on the website you've specified, and turns the answer into a simple message that it sends to the user. 

See the [Boost conversations (preview)](nlu-boost-conversations.md) topic for more details on the capability, including instructions for enabling boosted conversations in preview bots you've already created.

Before you begin testing your bot, you might like to add an initial welcome-style bot topic. This will help you understand how bot topics work and start you on your journey to creating fully functional bots.

## Add a welcome topic

Bot topics usually begin with *trigger phrases*. Trigger phrases are phrases, keywords, and questions that a user is likely to type that relate to a specific issue. This is what the bot uses to match a user's intent with the appropriate topic. See [Create and edit topics (preview)](preview/authoring-create-edit-topics.md) for more details on how trigger phrases work.

After the trigger phrase, you add *conversation nodes* to define how the bot should respond to a trigger phrase and what it should do. 

1. On the side navigation menu, select **Topics**, **+ New topic**, and then **From blank**. 
 
    :::image type="content" source="media/nlu-gpt/nlu-quickstart-create-topic.png" alt-text="Screenshot of the Create a new topic from blank option.":::

2.  To add a new **Message** node, select the **+ sign** on the trigger phrases node, and then select **Add node**.

    :::image type="content" source="media/nlu-gpt/nlu-quickstart-add-node.png" alt-text="Screenshot of the Add node button.":::
   
3. Select **Send a message**.

    :::image type="content" source="media/nlu-gpt/nlu-quickstart-message-send.png" alt-text="Screenshot of the Send a message option.":::

4. Type a message. In this example, type *How can I help you today?* in the node's text field. 

    :::image type="content" source="media/nlu-gpt/nlu-quickstart-message-node.png" alt-text="Screenshot of the Message node.":::

5. Repeat the above steps to add as many message variations as you like.  
 
6. When you’re finished, select **Save**.  
   When you add message variations, the bot randomly picks one of them to use each time the node is triggered. 

Next, it's time to test your bot! 

## Test your bot's boosted conversational reach 

Once you create a bot, you can immediately test the bot and try out different phrases for your bot to reply to. 

The **Test bot** pane shows how a bot conversation plays out at every step and you can fine-tune a topic directly within the **Power Virtual Agents (preview)** portal:
 
1. With a topic open for editing, select **Test bot** above the authoring canvas. You can also select **Test your bot** from the side navigation menu. 

    :::image type="content" source="media/nlu-gpt/nlu-quickstart-test-bot.png" alt-text="Screenshot of Test bot option.":::

2. At the **Type your message** prompt, ask the bot about the return policy of the organization whose website you linked to. For example, you could type *What is your return policy?*. 
 
   The bot retrieves information from the website and returns a response. The response provides a link to where it found that information and allows you to provide feedback.
 
4. (Optional) Try asking the bot about something you know is not on the website you specified, such as *Why is the sky blue?* Because the bot can't find a relevant bot topic or a relevant answer on the specified website, it replies with a [system fallback topic](authoring-system-fallback-topic.md) that indicates it can't understand the question, and asks you to rephrase the question. 

    :::image type="content" source="media/nlu-gpt/nlu-quickstart-system-fallback.png" alt-text="Screenshot of Test bot pane with the message that the bot doesn't understand.":::
 
> [!NOTE]
> After you test your bot, you can select the reset icon at the top of the **Test bot** pane to clear previous conversations. Resetting makes it easier to follow the flow of the current topic without getting confused by previous conversations.
>  
> :::image type="content" source="media/nlu-gpt/nlu-quickstart-test-reset.png" alt-text="Screenshot of Test bot pane reset button that looks like a an arrow in a circle shap.":::

You can return to the authoring canvas at any time to revise the conversation path. The **Test bot** pane automatically refreshes when you select **Save**. 

## Add features to further develop your bot 

It's easy to take your bot's conversations up a notch by giving your bot a voice of its own. You can add images and video clips, as well as adaptive cards, entities, and variable expressions. 

See the [Key concepts - Enhanced authoring](advanced-fundamentals.md) for more details, or continue your bot-building journey by checking out the rest of the [Power Virtual Agents documentation](index.yml).

[!INCLUDE[footer-include](includes/footer-banner.md)]
