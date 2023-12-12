---
title: Quickstart guide for building copilots with GPT
description: Build copilots quickly and provide the most relevant information to your customers with natural language understanding advancements in Microsoft Copilot Studio.
keywords: "PVA, GPT, NLU"
ms.date: 11/15/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope: "Power Virtual Agents"
---

# Quickstart guide for building copilots with generative AI

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft has made copilot building even simpler with AI-powered capabilities in Microsoft Copilot Studio. Whether you're new to conversational AI or a seasoned developer, our intelligence platform is with you and your team every step of the way.

This quickstart helps you get started quickly to create and boost a copilot with expanded natural language understanding (NLU) capabilities. With intelligent authoring of AI-powered copilots, create a new topic or edit an existing one. You can describe what you want the copilot to do. Or, your copilot can generate conversational responses, if there's no matching topic.

## Prerequisites

- An account for Copilot Studio. If you don't have an account, see the [Microsoft Copilot Studio introduction website](https://aka.ms/TryPVA) and select **Try free**.

  > [!NOTE]
  > Personal Microsoft accounts aren't supported. Use a work account instead.

- Supported browsers include Microsoft Edge, Chrome, and Firefox.

- Use the [current version of Copilot Studio](fundamentals-what-is-copilot-studio.md).
- When creating your copilot, avoid the **(classic)** type, as shown, added to the copilot name. The classic type is for an older version.

  :::image type="content" source="media/nlu-gpt/nlu-boost-bots.png" alt-text="Screenshot of the list of copilots that shows an example of one regular copilot and one classic copilot.":::

- Your copilot must be created in the US region. View the list of [Supported languages](authoring-language-support.md).

- Generative AI may be subject to [usage limits](https://learn.microsoft.com/microsoft-copilot-studio/requirements-quotas#limits) or capacity throttling.

> [!IMPORTANT]
> To enable **Boost conversations**, your admin can turn on **Boost conversational coverage with generative answers**.
> :::image type="content" source="media/nlu-gpt/enable-generative-answers.png" alt-text="Screenshot that shows location of the boosting of generative answers option" lightbox="media/nlu-gpt/enable-generative-answers.png":::
> For more information, see [Generative Answers](nlu-boost-conversations.md).

## How copilot conversations work

Copilot Studio uses a [customized NLU model and AI capabilities](advanced-ai-features.md#ai-models-in-microsoft-copilot-studio---background) to understand what a user types, then responds with the best copilot topic. A copilot topic is a portion of a conversational thread between a user and the copilot. Topics are linked together to form nodes. For more information, see [Create and edit topics](authoring-create-edit-topics.md).

For example, you might create a copilot for your customers to ask common questions about your business. Your support overhead is reduced by deflecting support calls. In the copilot, you can create a topic about your store's opening hours and name the topic **Store hours**.

When a customer asks a question such as "When do you open?" or "What are your opening hours?", the copilot uses NLU to understand the _intent_ behind the question. The copilot matches that intent to the best topic, the **Store hours** topic.

The copilot follows the _conversation flow_, which are connected nodes, that you define in the **Store hours** topic. These questions use `if/else` arguments, or logic gates, to determine which store the customer wants. The final output of the topic show the hours and contact information for that store's location.  

However, you can't anticipate all the types of questions your customers ask. To help mitigate this, Copilot Studio incorporates a powerful new AI-powered capability that uses the latest advancements in NLU models. With **Boost conversations** enabled and your copilot linked to a public or Bing-indexed website, your copilot automatically generates responses. These responses are conversational, plain language, and don't depend on the copilot builder to create topics for every eventuality.

Your copilot uses AI powered by the Azure OpenAI GPT model, which is also used in Bing, to create copilot topics from a simple description of your needs. Similarly, you can modify and update any topic in your copilot by describing the changes you want to make.

Ready to get started? The first step is to create your copilot.

## Create a boosted copilot

For any user-sent message that can't be matched to an existing topic, your copilot can look for an answer on a fallback wesbite. The copilot turns the answer into a simple message that it sends to the user.

1. Go to the [Microsoft Copilot Studio home page](https://web.powerva.microsoft.com/).

1. You can select **Create a copilot** from the **Home** page or **+ New copilot** from the **Copilots** page.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-home.png" alt-text="Screenshot of the Microsoft Copilot Studio home page.":::

1. Enter a name for your copilot and add a fallback URL. This fallback website is where the copilot can search for answers if it can't find the right topic for a user question.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-boost-copilot-create.png" alt-text="Screenshot of the Boost your conversation option." lightbox="media/nlu-gpt/nlu-quickstart-boost-copilot-create.png" :::

   > [!NOTE]
   > The copilot creation only prompts you for one fallback website. You can add other data sources, including internal resources like Sharepoint or OneDrive, and public websites. For more information about including more data sources, see [Use Copilot Studio to edit a topic](nlu-authoring.md#use-copilot-to-edit-a-topic).

1. Select **Create**.

See the [Generative answers](nlu-boost-conversations.md) topic for more information on the capability. You can also find instructions for enabling boosted conversations in copilots you've already created.

## Create a new topic in Copilot Studio

1. With your copilot open on the **Topics** page, select **+ Add** > **Topic** > **Create from description**. You might need to hide your test copilot, in the lower left corner of the page, for a better view.

   :::image type="content" source="media/nlu-gpt/describe-it-new-topic.png" alt-text="Screenshot of the Copilot Studio navigation pane with Topics and the New topics button highlighted.":::

   > [!NOTE]
   > If you don't see the **Create from description** option, you may need to enable **Intelligent authoring support**:
   > 1. Select the **Settings** icon on the top menu and then **General settings**.
   >:::image type="content" source="media/nlu-gpt/describe-it-enable.png" alt-text="Screenshot of the Copilot Studio menu with the Settings icon open.":::  
   >  
   > 1. Turn the switch **On** under **Build and iterate on your topics by describing what you want**.

1. In the **Create it with Copilot** window that appears, enter a name in **Name your topic**.

1. In the **Create a topic to...** field, describe your topic in simple, plain English. You see examples in the **Create it with Copilot** window.

   :::image type="content" source="media/nlu-gpt/describe-it-create-topic.png" alt-text="Screenshot of the Create it with Copilot pop-up window." lightbox="media/nlu-gpt/describe-it-create-topic.png":::

   Select any of the examples to automatically insert them into the **Create a topic to...** field. Select **View more examples** to generate new suggestions.

1. Select **Create**.

Once your topic is created, your copilot is ready for testing.

You can explore ways to extend and enhance your boosted bot and topic in [Create (and edit) with Copilot](nlu-authoring.md).

## Test your bot's boosted conversational reach

Once you create a bot, you can immediately test the bot and try out different phrases for your bot to reply to. 
The **Test bot** pane shows how a bot conversation plays out at every step and you can fine-tune a topic directly within the **Copilot Studio** portal:
 
1. With a topic open for editing, select **Test bot** above the authoring canvas. You can also select **Test your bot** from the side navigation menu.
   
    :::image type="content" source="media/nlu-gpt/nlu-quickstart-test-bot.png" alt-text="Screenshot of Test bot option.":::

1. At the **Type your message** prompt, ask the bot about the return policy of the organization whose website you linked to. For example, you could type *What is your return policy?*. 
 
   The bot retrieves information from the website and returns a response. The response provides a link to where it found that information and allows you to provide feedback.
 
1. (Optional) Try asking the bot about something you know is not on the website you specified, such as *Why is the sky blue*. Because the bot can't find a relevant bot topic or a relevant answer on the specified website, it replies with a [system fallback topic](authoring-system-fallback-topic.md) that indicates it can't understand the question, and asks you to rephrase the question. 

    :::image type="content" source="media/nlu-gpt/nlu-quickstart-system-fallback.png" alt-text="Screenshot of Test bot pane with the message that the bot doesn't understand.":::
 
> [!NOTE]
> After you test your bot, you can select the reset icon at the top of the **Test bot** pane to clear previous conversations. Resetting makes it easier to follow the flow of the current topic without getting confused by previous conversations.
>  
> :::image type="content" source="media/nlu-gpt/nlu-quickstart-test-reset.png" alt-text="Screenshot of Test bot pane reset button that looks like a an arrow in a circle shap.":::
You can return to the authoring canvas at any time to revise the conversation path. The **Test bot** pane automatically refreshes when you select **Save**. 


## Add features to further develop your bot 
It's easy to take your bot's conversations up a notch by giving your bot a voice of its own. You can add images and video clips, as well as adaptive cards, entities, and variable expressions. 
See the [Key concepts - Enhanced authoring](advanced-fundamentals.md) for more details, or continue your bot-building journey by checking out the rest of the [Microsoft Copilot Studio documentation](index.yml).

