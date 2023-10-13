---
title: Multilingual bot support (Preview)
description: Configuring and managing a multilingual bot in Power Virtual Agents
keywords: "Multilingual, Languages, Localization, Translation"
ms.date: 10/19/2023

ms.topic: article
author: clmori
ms.author: clmori
ms.reviewr: clmori
ms.custom: multilingual, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Multilingual chat bots (Preview)

Multilingual bots are chatbots that can communicate with customers in different languages while keeping all the content in a single bot. In many cases, they can automatically detect the desired language and respond in the same language providing a more personalized and engaging experience for customers. 

For the list of supported languages, see our [Supported Languages page](authoring-language-support.md).

> [!IMPORTANT]
> This is a preview feature. Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback

> [!NOTE]
> Multilingual bots are not suported for the following scenarios:
> * Power Virtual Agents classic bots
> * Voice bots with Dynamics Omnichannel


## Configuring a multilingual bot
When a bot is initially created, it's created with a Primary language (See [Supported Languages page](authoring-language-support.md) for more details on how to select the bot's primary language). To enable a multilingual bot, follow these steps to configure secondary languages in the bot:

1. Go to "Languages (Preview)" on the left navigation bar   
  :::image type="content" source="media/multilingual-bot/configuration-1.png" alt-text="Setting up a multilingual bot.":::
1. Select "Add Languages"
1. Choose the languages you want to add to the bot
  :::image type="content" source="media/multilingual-bot/configuration-2.png" alt-text="Selecting multilingual bot languages.":::
1. Select "Add Languages" and confirm that the list of languages are correct
  :::image type="content" source="media/multilingual-bot/configuration-3.png" alt-text="Screen showing all languages added to the bot.":::

> [!NOTE]
> - You can add as many secondary languages as desired to the bot, as long as they are in the list of supported languages.

## Managing localization in a multilingual bot

> [!NOTE]
> All bot topic and content editing must be done in the bot's primary language. To edit the bot's secondary language to localize the strings, you must use the steps below.
> Once the bot strings are localized and uploaded to the bot following the steps below, you'll be able to see the localized content in the authoring canvas by switching the language in the test bot as shown in the next section.

To add the localization strings to your multilingual bot, follow these steps:

1. From the same "Language (Preview)" menu, select "Update localizations" for the language you want to update
1. In the "Update localizations" pane, select JSON or ResX format to download the current localization file for that language
  :::image type="content" source="media/multilingual-bot/configuration-4.png" alt-text="Screen showing pane to download and upload localization files.":::
> [!NOTE]
> The downloaded file will contain the latest localization content for the bot. If you need to download previous versions of the localization file, go to PowerApps to download previous versions.
1. Open the downloaded file and replace the primary language strings with the appropriate translated text.
1. Go back to the pane, and select "Browse", and upload the translated file
1. Close the pane

## Authoring considerations for multilingual bots

When authoring, you can configure the bot to change the current spoken language in the middle of a conversation. That logic can reside in any topic in the bot.

To change the bot's current language, you can set the ```User.Language``` variable value to one of your bot secondary languages. This selection changes the language spoken by your bot immediately.
  :::image type="content" source="media/multilingual-bot/Authoring-1.png" alt-text="Screen showing a Set variable node defining the value of the User.Language variable.":::

## Testing a multilingual bot
To test a multilingual bot:

1. Open the test bot
1. Open the drop-down on the top, and select one of the secondary languages.
  :::image type="content" source="media/multilingual-bot/Test-1.png" alt-text="Screen showing the secondary language selection on test bot.":::
1. The test bot will reload using the selected secondary language. 
1. The authoring canvas shows the secondary language.
1. Enter a message in the secondary language to test the bot

Alternatively, you can set your browser language to a secondary language supported by your bot, and open the [Demo bot](publication-connect-bot-to-web-channels.md?tabs=preview#customize-the-demo-website). The demo website opens in the secondary language, and the bot chats using the secondary language strings.


## Related topics
- [Supported Languages](authoring-language-support.md)
