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

Microsoft made copilot build even simpler with AI-powered capabilities in Microsoft Copilot Studio. Whether you're new to conversational AI or a seasoned developer, our intelligence platform is with you and your team every step of the way.

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

- Generative AI might be subject to [usage limits](requirements-quotas.md#limits) or capacity throttling.

> [!IMPORTANT]
> To enable **Boost conversations**, your admin can turn on **Boost conversational coverage with generative answers**.
> :::image type="content" source="media/nlu-gpt/enable-generative-answers.png" alt-text="Screenshot that shows location of the boosting of generative answers option" lightbox="media/nlu-gpt/enable-generative-answers.png":::
> For more information, see [Generative Answers](nlu-boost-conversations.md).

## How copilot conversations work

Copilot Studio uses a [customized NLU model and AI capabilities](advanced-ai-features.md#ai-models-in-microsoft-copilot-studio---background) to understand what a user types, then responds with the best copilot topic. A copilot topic is a portion of a conversational thread between a user and the copilot. Topics are linked together to form nodes. For more information, see [Create and edit topics](authoring-create-edit-topics.md).

For example, you might create a copilot for your customers to ask common questions about your business. Your support overhead is reduced by deflecting support calls. In the copilot, you can create a topic about your store's opening hours and name the topic **Store hours**.

When a customer asks a question such as "When do you open?" or "What are your opening hours?", the copilot uses NLU to understand the _intent_ behind the question. The copilot matches that intent to the best topic, the **Store hours** topic.

The copilot follows the _conversation flow_, which is a group of connected nodes, that you define in the **Store hours** topic. These questions use `if/else` arguments, or logic gates, to determine which store the customer wants. The final output of the topic shows the hours and contact information for that store's location.  

However, you can't anticipate all the types of questions your customers ask. To help mitigate this, Copilot Studio incorporates a powerful new AI-powered capability that uses the latest advancements in NLU models. With **Boost conversations** enabled and your copilot linked to a public or Bing-indexed website, your copilot automatically generates responses. These responses are conversational, plain language, and don't depend on the copilot builder to create topics for every eventuality.

Your copilot uses AI powered by the Azure OpenAI GPT model, which is also used in Bing, to create copilot topics from a simple description of your needs. Similarly, you can modify and update any topic in your copilot by describing the changes you want to make.

Ready to get started? The first step is to create your copilot.

## Create a boosted copilot

For any user-sent message that can't be matched to an existing topic, your copilot can look for an answer on a fallback website. The copilot turns the answer into a simple message that it sends to the user.

1. Go to the [Microsoft Copilot Studio home page](https://web.powerva.microsoft.com/).

1. You can select **Create a copilot** from the **Home** page or **+ New copilot** from the **Copilots** page.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-home.png" alt-text="Screenshot of the Microsoft Copilot Studio home page.":::

1. Enter a name for your copilot and add a fallback URL. This fallback website is where the copilot can search for answers if it can't find the right topic for a user question.

   > [!TIP]
   > Any URL with text works, for example `https://www.microsoft.com/en-us/store/`.
   >
   > To add a fallback URL later, after you create a copilot, go to **Generative AI** in the navigation menu. Add your URL to the **Websites** field. Select **Save** at the top.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-boost-copilot-create.png" alt-text="Screenshot of the Boost your conversation option." lightbox="media/nlu-gpt/nlu-quickstart-boost-copilot-create.png" :::

   > [!NOTE]
   > The copilot creation only prompts you for one fallback website. You can add other data sources, including internal resources like Sharepoint or OneDrive, and public websites. For more information about including more data sources, see [Use Copilot Studio to edit a topic](nlu-authoring.md#use-copilot-to-edit-a-topic).

1. Select **Create**.

For more information, see the [Generative answers](nlu-boost-conversations.md). You can also find instructions for enabling boosted conversations in copilots you already created.

## Create a new topic in Copilot Studio

1. With your copilot open on the **Topics** page, select **+ Add** > **Topic** > **Create from description**. You might need to select **Hide copilot** in the navigation menu for a better view.

   :::image type="content" source="media/nlu-gpt/describe-it-new-topic.png" alt-text="Screenshot of the Copilot Studio navigation pane with Topics and the New topics button highlighted." lightbox="media/nlu-gpt/describe-it-new-topic.png":::

   > [!NOTE]
   > If you don't see the **Create from description** option, you may need to enable **Intelligent authoring support**:
   > 1. Select the **Settings** icon in the top menu, then **General settings**.
   >:::image type="content" source="media/nlu-gpt/nlu-quickstart-describe-it-enable.png" alt-text="Screenshot of the Copilot Studio menu with the Settings icon open.":::  
   >  
   > 1. Turn the switch **On** under **Build and iterate on your topics by describing what you want**.

1. In the **Create it with Copilot** window that appears, enter a name in **Name your topic**.

1. In the **Create a topic to...** field, describe your topic in simple, plain English. See the examples in the **Or try one of these examples to get started** section to understand the structure of a description. Select **View more examples** to generate new examples.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-describe-it-create-topic.png" alt-text="Screenshot of the Create it with Copilot pop-up window." lightbox="media/nlu-gpt/nlu-quickstart-describe-it-create-topic.png":::

   > [!NOTE]
   > Normally, to test the basic chat functionality, you can select an example to use it. But this quickstart helps you use a fallback website. The examples don't have a fallback website.

1. Select **Create**.

Once your topic is created, your copilot is ready for testing.

You can explore ways to extend and enhance your boosted copilot and topic in [Create and edit with Copilot](nlu-authoring.md).

## Test your copilot's boosted conversational reach

When testing, you can see how a copilot conversation progresses with each question and answer, then fine-tune a topic directly:

1. Select one of your topics, then choose **Test copilot** above the authoring canvas. Alternatively, select **Test your copilot** from the side navigation menu.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-test-copilot.png" alt-text="Screenshot of location of both options to test your copilot." lightbox="media/nlu-gpt/nlu-quickstart-test-copilot.png":::

1. In the **Type your message** prompt, ask the copilot about the return policy of the organization whose website you linked to. For example, you can type _What is your return policy?_ or _How do I get to your store?_.

   The copilot retrieves information from the website and returns a response. The response provides a link to where it found that information and allows you to provide feedback.

1. (Optional) Try asking the copilot about something not on your fallback website, such as _Why is the sky blue_. Since the copilot can't find a relevant copilot topic or answer, it replies with a [system fallback topic](authoring-system-fallback-topic.md) and asks you to rephrase the question.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-system-fallback.png" alt-text="Screenshot of the Test copilot pane with the message that the copilot doesn't understand what the user asked and could the user rephrase the question.":::

> [!NOTE]
> After you test your copilot, you can select the reset icon at the top of the **Test copilot** pane to clear previous conversations. Resetting makes it easier to follow the flow of the current topic without getting confused by previous conversations.
>  
> :::image type="content" source="media/nlu-gpt/nlu-quickstart-test-reset.png" alt-text="Screenshot of Test copilot pane reset button that looks like a circular arrow.":::

You can return to the authoring canvas at any time to revise the conversation path. The **Test copilot** pane automatically refreshes when you select **Save** after editing your topics.

To troubleshoot error codes in the chat, see [Error codes: Microsoft Copilot Studio](error-codes.md).

## Add features to further develop your copilot

You can enhance your copilot to make it unqiue and enjoyable. Try adding images and video clips, adaptive cards, entities, and variable expressions.

For more information, see [Key concepts - Enhanced authoring](advanced-fundamentals.md)  or continue your copilot-building journey by exploring the rest of the [Microsoft Copilot Studio documentation](index.yml).
