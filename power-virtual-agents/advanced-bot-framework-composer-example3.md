---
title: "Use Bot Framework Composer to use Bing search in chatbots"
description: "Use Bot Framework Composer to fall back to Bing search in your Power Virtual Agents chatbot."
keywords: "composer, adaptive card"
ms.date: 5/24/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Example 3 – Use Bing Search as a fallback in Power Virtual Agents 

You can enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Power Virtual Agents bot. 

In this example, you'll learn how to set Bing search as a fallback answer in Power Virtual Agents by using Composer.

Before you begin, ensure you read [Extend your bot with Bot Framework Composer](advanced-bot-framework-composer.md) to understand how Composer integrates with Power Virtual Agents.



>[!IMPORTANT]
>Bot Framework Composer integration is not available to users who only have the [Teams Power Virtual Agents license](requirements-licensing-subscriptions.md). You must have a [trial](sign-up-individual.md) or full Power Virtual Agents license.


## Prerequisites

- See how to [Extend your bot with Bot Framework Composer](advanced-bot-framework-composer.md)
- Follow the instructions described in: 
  - [Example 1 - Show an Adaptive Card in Power Virtual Agents](advanced-bot-framework-composer-example1.md)
  - [Example 2 – Display a multi-select options list in Power Virtual Agents](advanced-bot-framework-composer-example2.md)
- [Introduction to Bot Framework Composer](/composer/introduction)
- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]





## Use Bing Search as a fallback

Open the Power Virtual Agents bot used in the previous examples.

Go to the **Topics** page and select **Open in Bot Framework Composer** under the **+ New topic** dropdown menu to open Composer. 

Select **+ Add new trigger** to add another Bot Framework trigger to **Contoso Meal Delivery Service** dialog. Choose the type **Unknown intent** for your new trigger.

![Composer - add Unknown Intent trigger](media/Composer_Example3/E3_BingSearch_UnknownIntent.png)


After the **Unknown intent** trigger is added, go to the **Bot Responses** tab for this **Contoso Meal Delivery Service** dialog. Switch to **Show code** view, and insert the following Adaptive Card JSON:

````JSON

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

![Composer Bot Responses - add JSON](media/Composer_Example3/E3_BingSearch_BotResponses_AdaptiveCard.png)


Add this **Activity** to the same **Bot Responses** window in Composer:

```JSON
 # AdaptiveCardBingSearch(user_utterance)
[Activity
    Attachments = ${json(adaptivecardjson_BingSearch(user_utterance))}
]

```
![Composer Bot Responses - add Activity](media/Composer_Example3/E3_BingSearch_BotResponses_Activity.png)


Go to the **Create** tab in Composer and select the **Unknown intent** trigger. Add the **Send a response** action and select **Show code**. Add the following expression to the **Language Generation** panel:

```JSON
-${AdaptiveCardBingSearch(turn.activity.text)}
```

![Composer BeginDialog - Send a response](media/Composer_Example3/E3_BingSearch_addBotReponse_BingSearch.png)

You are now ready to add you Composer content to your Power Virtual Agents bot. Go to the **Publish** tab in Composer and publish it to your Power Virtual Agents bot.

Once your new Composer content is successfully published, you can now see that **OnUnknownIntent** was added to the **Topics** page in Power Virtual Agents.

>[!NOTE]
>You might need to refresh your **Topics** page to see the new bot content that has been added from Composer.

![Power Virtual Agents Topics page for example 3](media/Composer_Example3/E3_BingSearch_inTopicsList.png)

Make sure **Track between topics** is turned on, and test your new bot content by entering the following text in the **Test bot** pane in Power Virtual Agents to start a bot conversation:

- **Is tofu vegan?**

![Power Virtual Agents testfor example 3](media/Composer_Example3/Example3_cropped.png)




[!INCLUDE[footer-include](includes/footer-banner.md)]
