---
title: Quickstart guide for building bots with GPT (preview)
description: Build bots quickly and provide the most relevant information to your customers with natural language understanding advancements in Power Virtual Agents preview.
keywords: "PVA, GPT, NLU"
ms.date: 3/16/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Quickstart guide for building bots with GPT (preview)

[!INCLUDE [AI tech disclosure with Bing Search](includes/disclosure-ai-preview-bing-addendum.md)]


Microsoft has made bot building even simpler with AI-powered capabilities in Power Virtual Agents (preview). Whether you're new to conversational AI or a seasoned developer, our intelligence platform is with you and your team every step of the way. 

This quickstart guide introduces you to the minimal steps necessary to get started quickly in creating and boosting a chatbot with expanded natural language understanding (NLU) capabilities. Using the intelligent authoring of AI-powered bots, you can now create a new topic or edit an existing one by describing what you want to happen or have your bot generate conversational responses even if there isn't a matching topic.

## Prerequisites 

> [!CAUTION] 
>  
> Your bot must be created in the US region. 
>  
> Other regions, and languages other than English, aren't supported during the preview.


- You'll need an account for Power Virtual Agents. 

    > [!NOTE]
    > If you don't have a Power Virtual Agents account, you can go to the [Power Virtual Agents introduction website](https://aka.ms/TryPVA), select **Start free**, and then sign in with your work email address. Also see the [Quickstart guide for creating a Power Virtual Agents bot](fundamentals-get-started.md).
    >  
    > Personal Microsoft accounts aren't supported. 
    >  
    > Supported browsers include Microsoft Edge, Chrome, and Firefox.

- You must be using the [preview version of Power Virtual Agents](preview/overview.md), and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.  

    :::image type="content" source="media/nlu-gpt/nlu-boost-preview-bots.png" alt-text="Screenshot of the list of chatbots showing bots with preview added to their names.":::

- [Review AI response generation training, model, and usage notes](nlu-boost-conversations.md#ai-response-generation-training-model-and-usage-notes) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note).

- Your bot must be created in the US region. Other regions, and languages other than English, aren't supported during the preview.

- This capability may be subject to usage limits or capacity throttling.
 
> [!IMPORTANT] 
> During the preview period, if you create a bot that has **Boost conversations** enabled, you'll need your admin to [enable bot publishing for the capability](nlu-boost-conversations.md#publishing). 

## How bot conversations work

Power Virtual Agent bots use a [customized NLU model and AI capabilities](advanced-ai-features.md) to understand what a user types and to respond with the most appropriate bot topic. A bot topic is a sequence of nodes that logically flow from one step to the other. See [Create and edit topics (preview)](preview/authoring-create-edit-topics.md) for details on how bot topics work.

For example, you might create a bot for your customers to ask common questions about your business, thus reducing your support overhead by deflecting support calls. In the bot, you could create a topic that includes details about your store opening hours and call it **Store hours**. 

When a customer asks a question such as "When do you open?" or "What are your opening hours?", the bot uses NLU to understand the _intent_ behind the question (in this case, that the customer wants to know about hours of operation), and matches that intent to the most appropriate bot topic (which would be the **Store hours** topic). 

The bot then follows the _conversation flow_ that you've defined in the **Store hours** topic, which might be a series of questions that use if/else arguments, or logic gates, to ask the customer which store location they're interested in. The final output of the topic might be to then display the hours and contact information for that location.  

However, you may not be able to anticipate all the types of questions your customers ask. To help mitigate this, Power Virtual Agents (preview) incorporates a powerful new AI-powered capability that uses the latest advancements in NLU models. When you have **Boost conversations** enabled in your bot, and linked to a publicly available, Bing-indexed website, your bot can provide automatically generated, conversationally friendly, plain language responses without depending upon the bot builder to create topics for every eventuality. 

Also, with Power Virtual Agents new Copilot feature, your chatbot uses AI, powered by the Azure OpenAI GPT model (which is also used in Bing), to create bot topics based upon a simple description of what you want to achieve. You can also modify and update any topic in your bot in the same manner, by describing the changes you want to make.

Ready to get started? The first step is to create your bot.

## Create a boosted bot 

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/). 

1. In the side navigation menu, select **Create**. You can also select **Create a bot** on the **Home** page or **New chatbot** from the **Chatbots** page.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-home.png" alt-text="Screenshot of the Power Virtual Agents home page.":::

2. Select **Try the unified canvas (preview)** to create a preview bot. 
   - An opt-in confirmation message appears the first time you create or view a preview bot that describes some of their benefits.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-create-bot.png" alt-text="Screenshot of the Create a chatbot page.":::

3. Enter a name for your bot, and add the website you'd like your bot to fall back to if it can't find an appropriate bot topic, and select **Create**.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-boost-bot-create.png" alt-text="Screenshot of the Boost your conversation preview option.":::

There you have it! You’ve created a new bot.  

 > [!NOTE]
 > This initial bot creation only prompts you for one fallback website. You can add other data sources, including internal resources such as Sharepoint or OneDrive, and external facing websites. For more information about including additional data sources, refer to [Use Copilot to edit a topic](nlu-authoring.md#use-copilot-to-edit-a-topic).

For any user-sent message that can't be matched to an existing topic, your bot looks for an answer on the website you've specified, and turns the answer into a simple message that it sends to the user. 

See the [Boost conversations (preview)](nlu-boost-conversations.md) topic for more details on the capability, including instructions for enabling boosted conversations in preview bots you've already created.

## Create a new topic using Copilot (preview)

1. With your bot open, select **Topics**. On the **Topics** page, select **+ New topic** and then **Create with Copilot (preview)**.

    :::image type="content" source="media/nlu-gpt/describe-it-new-topic.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

    > [!NOTE]
    >  
    > If you don't see the **Copilot** option, you may need to enable **Intelligent authoring support**:
    >1. Select the **Settings** icon on the top menu and then **General settings**.
    >:::image type="content" source="media/nlu-gpt/describe-it-enable.png" alt-text="Screenshot of the Power Virtual Agents menu with the Settings icon open.":::  
    >  
    >2. Set the switch under **Intelligent authoring support (preview)** to **On**.

2. In the **Create it with Copilot (preview)** window that appears, enter a name for your topic in the **Name your topic** field. 

3. In the **Create a topic to...** field, describe the topic you want to create in simple, plain English. You can include questions you want the bot to ask, messages it should show, and details of the specific behavior you want the bot to take.

    :::image type="content" source="media/nlu-gpt/describe-it-create-topic.png" alt-text="Screenshot of the Describe it to build it pop-up window.":::
   
    You can select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions. 
      
4. Select **Create**.

Once your topic is created, your bot is ready for testing. It's that simple!

You can explore ways to extend and enhance your boosted bot and topic in [Create (and edit) with Copilot](nlu-authoring.md).