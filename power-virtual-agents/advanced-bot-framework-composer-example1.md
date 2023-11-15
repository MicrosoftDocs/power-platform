---
title: "Use Bot Framework Composer adaptive cards in chatbots"
description: "Use Bot Framework Composer to add Adaptive Cards to your Microsoft Copilot Studio chatbot."
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

# Example 1 - Show an Adaptive Card in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]

Enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Microsoft Copilot Studio bot.

In this example, you'll learn how to show an Adaptive Card in Microsoft Copilot Studio by using Composer.

[!INCLUDE [Composer License](includes/composer-license.md)]

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Introduction to Bot Framework Composer](/composer/introduction).
- [Composer fundamentals](advanced-bot-framework-composer-fundamentals.md).

## Create a new topic

1. In Microsoft Copilot Studio, create a new bot named `Contoso Meal Delivery Service`.

1. Go to the **Topics** page and create a new topic called `Meal delivery options`.

1. Copy and paste the following trigger phrases:

    ```plaintext
    what meals can I order
    what meal options do you have
    what dishes do you deliver
    entrees available for delivery
    ```

1. On the **Authoring canvas**, select the default **Message** node. Select the three vertical dots, then select **Delete**.

1. Under the **Trigger phrases** node, select **Add node** (**+**) and then select **Ask a question**. Then in the **Question** node:

    1. For **Ask a question**, enter `What city are you in?`.

    1. For **Identify**, select **City**.

1. In **Save response as**, select the automatically created variable. Then in the variable properties pane:

    1. For **Name**, enter `user_city`.

    1. For **Usage**, select **Bot (any topic can access)**.

1. Select **Save**.

:::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Dialog2.png" alt-text="Microsoft Copilot Studio variable.":::

## Create an adaptive card

Next, you'll display meal choice images that are available in the user's city using Composer.

1. Open your bot in Composer. For instructions on how to do so, see [Getting started with Bot Framework Composer](advanced-bot-framework-composer-fundamentals.md#open-your-bot-in-composer).

1. Go to the **Create** page. In your bot, select **More options** (**...**) then select **+ Add a dialog**.

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_creatNewDialog.png" alt-text="Composer Create tab.":::

1. For **Name**, enter `Meals` then select **OK**.

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_newDialog.png" alt-text="Composer Create tab new dialog.":::

1. Go to the **Bot Responses** page. In the bot explorer, select **Meals**, then select **Show code**.

    :::image type="content" source="media\advanced-bot-framework-composer-example1\E1_Meals_showCode.png" alt-text="Composer show code button.":::

1. In the code view, copy and paste the following bot response. Then replace the three example image URLs with your own.

    ```lg
    # Chicken()
    -Chicken

    # Steak()
    -Steak

    # Tofu()
    -Tofu

    # SteakImageURL()
    -https://www.example.com/steak.jpg

    # ChickenImageURL()
    -https://www.example.com/chicken.jpg

    # TofuImageURL()
    -https://www.example.com/tofu.jpg

    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_BotResponse_data.png" alt-text="Composer Bot Responses tab with strings.":::

1. Copy and paste the following code into the same code view to add an Adaptive Card that displays three images.

    ````lg
    # adaptivecardjson_meals(location)
    - ```
    {
        "type": "AdaptiveCard",
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "version": "1.1",
        "body": [
                {
                "type": "TextBlock",
                "text": "Meal delivery options for ${location}:",
                "size": "Medium",
                "weight": "Bolder"
            },
            {
                "type": "ColumnSet",
                "columns": [
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "Image",
                                "url": "${SteakImageURL()}",
                                "size": "Stretch",
                                "spacing": "Medium",
                                "horizontalAlignment": "Center"
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "Image",
                                "url": "${ChickenImageURL()}",
                                "horizontalAlignment": "Center"
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "Image",
                                "url": "${TofuImageURL()}",
                                "horizontalAlignment": "Center"
                            }
                        ]
                    }
                ]
            },
            {
                "type": "ColumnSet",
                "columns": [
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "${Steak()}",
                                "wrap": true,
                                "horizontalAlignment": "Center"                            
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "${Chicken()}",
                                "wrap": true,
                                "horizontalAlignment": "Center"
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "${Tofu()}",
                                "wrap": true,
                                "horizontalAlignment": "Center"
                            }
                        ]
                    }
                ]
            }
        ]
    }
    ```
    ````

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_BotReponse_JSON.png" alt-text="Composer Bot Responses tab - Adaptive Card JSON.":::

1. Copy and paste the following code into same code view to add an activity that will display the Adaptive Card.

    ```lg
    # AdaptiveCardMeals(location)
    [Activity
        Attachments = ${json(adaptivecardjson_meals(location))}
    ]
    ```

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_BotResponse_Activity.png" alt-text="Composer Bot Responses tab - Activity.":::

## Display your Adaptive Card

1. Go to the **Create** page. In the bot explorer, select the **Meals** dialog then select the **BeginDialog** trigger.

1. On the authoring canvas, select **Add** (**+**) then select **Send a response**.

1. Select the new **Send a response** node to open the properties pane. Under **Bot responses**, select **Show code** to switch to the code editor.

    :::image type="content" source="media/advanced-bot-framework-composer-example1/response_code_editor.png" alt-text="Screenshot of show code button":::

    > [!WARNING]
    > Adding the expression in the next step to the _response_ editor instead of the _code_ editor will result in the bot responding with raw JSON instead of an Adaptive Card.

1. Copy and paste the following expression into the code editor.

    ```lg
    - ${AdaptiveCardMeals(virtualagent.user_city)}
    ```

    Microsoft Copilot Studio global variables are accessed in Composer by using the `virtualagent` scope. This scope won't appear in Composer's property reference menu, but you can access it by entering an expression directly.

    In this example, `${virtualagent.user_city}` refers to the `user_city` global variable that was created in the Microsoft Copilot Studio bot.

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_AddResponse.png" alt-text="Composer Begin Dialog - add Send a response action.":::

## Publish your content

1. [Publish your Composer content](advanced-bot-framework-composer-fundamentals.md#test-composer-content-within-microsoft-copilot-studio) to make it available in your Microsoft Copilot Studio bot.

    [!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

1. Go to the Microsoft Copilot Studio **Topics** page to see your new **Meals** topic.

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_Meals_in_PVA_Topics.png" alt-text="Microsoft Copilot Studio Topics page - new Bot Framework dialog.":::

1. Open the **Meal delivery options** topic.

1. Under the **Question** node, select **Add node** (**+**). Select **Redirect to another topic** then choose **Meals**.

    :::image type="content" source="media/advanced-bot-framework-composer-example1/E1_MealsDelivery_RedirectToMeals.png" alt-text="Microsoft Copilot Studio - redirect to Bot Framework dialog.":::

1. Select **Save** to save the changes to your topic.

## Test your bot

To test your changes in Microsoft Copilot Studio, open the **Test bot pane** and make sure **Track between topics** is turned on. Enter the message `What meals do you deliver?` to start your conversation.

Your bot will trigger the **Meal delivery options** topic, which asks the user for their current city. Then the bot will redirect to the Composer dialog **Meals** to display an Adaptive Card.

:::image type="content" source="media/advanced-bot-framework-composer-example1/Example1_cropped.png" alt-text="Microsoft Copilot Studio Example 1 test.":::

## Next Steps

[Example 2 - Display a multi-select options list in Microsoft Copilot Studio](advanced-bot-framework-composer-example2.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
