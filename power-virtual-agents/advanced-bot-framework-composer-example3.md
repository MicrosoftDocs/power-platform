---
title: "Use Bot Framework Composer to use Bing search in chatbots"
description: "Use Bot Framework Composer to fall back to Bing search in your Microsoft Copilot Studio chatbot."
keywords: "composer, adaptive card"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: makolomi
ms.custom: "cex"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Example 3 - Use Bing Search as a fallback in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]

Enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Microsoft Copilot Studio bot.

In this example, you'll learn how to set Bing search as a fallback answer in Microsoft Copilot Studio by using Composer.

[!INCLUDE [Composer License](includes/composer-license.md)]

## Prerequisites

- [Example 1 - Show an Adaptive Card in Microsoft Copilot Studio](advanced-bot-framework-composer-example1.md).
- [Example 2 - Display a multi-select options list in Microsoft Copilot Studio](advanced-bot-framework-composer-example2.md).

## Create a fallback trigger

1. In Microsoft Copilot Studio, open the bot from Example 2. If you haven't completed Example 2 yet, see [Display a multi-select options list in Microsoft Copilot Studio](advanced-bot-framework-composer-example2.md).

1. Open your bot in Composer. For instructions on how to do so, see [Getting started with Bot Framework Composer](advanced-bot-framework-composer-fundamentals.md#open-your-bot-in-composer).

1. In the bot explorer, go to the main dialog. Select **More options** (**...**) then select **Add new trigger**.

1. In the **Create a trigger** window, for **What is the type of this trigger?**, select **Unknown intent**. Select **Submit**.

    :::image type="content" source="media/advanced-bot-framework-composer-example3/E3_BingSearch_UnknownIntent.png" alt-text="Screenshot of the Create a trigger window.":::

1. Go to the **Bot Responses** page, select **Contoso Meal Delivery Service**, then select **Show code**.

1. Copy and paste the following into the code view:

    ````lg
    # adaptivecardjson_BingSearch(user_utterance)
    - ```
    {    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.2",
        "fallbackText": "This card requires Media to be viewed. Ask your platform to update to Adaptive Cards v1.1 for this and more!",
        "actions": [
            {
                "type": "Action.OpenUrl",
                "title": "Search with Bing",
                "url": "https://www.bing.com/search?q=${user_utterance}",
                "style": "positive"
            }
        ],
        "body": [
            {
                "type": "Image",
                "url": "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RWe65Z?ver=2d4e&q=90&m=6&h=201&w=358&b=%23FFFFFFFF&l=f&o=t&aim=true"
            },
            {
                "type": "TextBlock",
                "text": "${user_utterance}",
                "wrap": true,
                "separator": true,
                "horizontalAlignment": "Center",
                "size": "Medium"
                
            }
        ]
    }
    ```
    ````

    :::image type="content" source="media/advanced-bot-framework-composer-example3/E3_BingSearch_BotResponses_AdaptiveCard.png" alt-text="Screenshot of the Adaptive Card JSON added to bot responses.":::

1. Copy and paste the following code into the same code view:

    ```lg
    # AdaptiveCardBingSearch(user_utterance)
    [Activity
        Attachments = ${json(adaptivecardjson_BingSearch(user_utterance))}
    ]

    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example3/E3_BingSearch_BotResponses_Activity.png" alt-text="Screenshot of the activity added to the bot responses.":::

1. Go to the **Create** page. In the main dialog, select the **Unknown intent** trigger.

1. On the authoring canvas, select **Add** (**+**) then **Send a response**.

1. In the properties pane, under **Bot responses**, and select **Show code**.

    > [!WARNING]
    > Adding the expression in the next step to the _response_ editor instead of the _code_ editor will result in the bot responding with raw JSON instead of an Adaptive Card.

1. Copy and paste the following expression:

    ```lg
    - ${AdaptiveCardBingSearch(turn.activity.text)}
    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example3/E3_BingSearch_addBotReponse_BingSearch.png" alt-text="Screenshot of the response for the send a response action.":::

## Test your bot

1. [Publish your Composer content](advanced-bot-framework-composer-fundamentals.md#test-composer-content-within-microsoft-copilot-studio) to make it available in your Microsoft Copilot Studio bot.

    [!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

1. Go to the Microsoft Copilot Studio **Topics** page to see your new **OnUnknownIntent** topic.

    :::image type="content" source="media/advanced-bot-framework-composer-example3/E3_BingSearch_inTopicsList.png" alt-text="Screenshot of the new topic visible in Microsoft Copilot Studio.":::

1. Open the **Test bot pane** and make sure **Track between topics** is turned on. Enter the message `Is tofu vegan?` to start your conversation.

    :::image type="content" source="media/advanced-bot-framework-composer-example3/Example3_cropped.png" alt-text="Screenshot of the Microsoft Copilot Studio test bot pane.":::

## Next Steps

[Example 4 - Display a form with a Submit button in Microsoft Copilot Studio](advanced-bot-framework-composer-example4.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
