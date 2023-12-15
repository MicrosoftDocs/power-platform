---
title: Configure and create multilingual copilots
description: Add multilingual support to your Microsoft Copilot Studio copilots so your copilot users and customers can ask questions and get answers in their language.
keywords: "Multilingual, Languages, Localization, Translation"
ms.date: 12/15/2023

ms.topic: article
author: clmori
ms.author: iawilt
ms.reviewer: clmori
ms.custom: multilingual, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure and create multilingual copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Multilingual copilots are copilots that can communicate with customers in different languages while keeping all the content in a single copilot. In many cases, they can automatically detect the desired language based on the copilot user's web browser setting and respond in the same language, providing a more personalized and engaging experience for customers. 

For the list of supported languages, see our [Supported Languages article](authoring-language-support.md).

> [!NOTE]
> Multilingual copilots are not suported for the following scenarios:
> * Microsoft Copilot Studio classic bots
> * Voice bots with Dynamics Omnichannel

## Configuring a multilingual copilot
When a copilot is initially created, it's created with a primary language. (See the [Supported Languages article](authoring-language-support.md) for more details on how to select the copilot's primary language). 

To enable a multilingual copilot:

1. With a copilot open, expand **Languages** on the side navigation pane, and select **Add languages**.   

    :::image type="content" source="media/multilingual-bot/configuration-1.png" alt-text="Setting up a multilingual copilot.":::

1. Choose the languages you want to add to the copilot.

    :::image type="content" source="media/multilingual-bot/configuration-2.png" alt-text="Selecting multilingual copilot languages.":::

1. Select **Add Languages** and confirm that the list of languages is correct.

    :::image type="content" source="media/multilingual-bot/configuration-3.png" alt-text="Screen showing all languages added to the copilot.":::

> [!NOTE]
> You can add as many secondary languages as desired to the copilot, as long as they are in the list of supported languages.

## Managing localization in a multilingual copilot

> [!NOTE]
> All copilot topic and content editing must be done in the copilot's primary language. To edit the copilot's secondary language to localize the strings, you must use the steps in this section.    
> Once the copilot strings are localized and uploaded to the copilot as described here, you can see the localized content in the authoring canvas by [switching the language in the test copilot](#testing-a-multilingual-copilot).

To add the localization strings to your multilingual copilot:

1. With a copilot open, expand **Languages (Preview)** on the side navigation pane, and select **Update localizations** for the language you want to update.
   
1. On the **Update localizations** page, select JSON or ResX format to download the current localization file for that language.
   
    :::image type="content" source="media/multilingual-bot/configuration-4.png" alt-text="Screen showing pane to download and upload localization files.":::

    > [!NOTE]
    > The downloaded file will contain the latest localization content for the copilot.
    > If you need to download previous versions of the localization file, [open the copilot's solution in Power Apps to download previous versions](authoring-export-import-bots.md?tabs=webApp#add-components-to-a-chatbot-in-a-custom-solution).

1. Open the downloaded file and replace the primary language strings with the appropriate translated text.
   
1. Return to the **Update localizations** page, select **Browse**, and upload the translated file.
  
1. Close the **Update localizations** page.

## Authoring considerations for multilingual copilots

When authoring, you can configure the copilot to change the current spoken language in the middle of a conversation. That logic can reside in any topic in the copilot.

To change the copilot's current language, you can set the ```User.Language``` variable value to one of your copilot's secondary languages. This selection changes the language spoken by your copilot immediately.

:::image type="content" source="media/multilingual-bot/Authoring-1.png" alt-text="Screen showing a Set variable node defining the value of the User.Language variable.":::

## Testing a multilingual copilot

To test a multilingual copilot:

1. Open the test copilot.

1. Open the menu at the top of the test copilot, and select one of the secondary languages.

    :::image type="content" source="media/multilingual-bot/Test-1.png" alt-text="Screen showing the secondary language selection on test copilot.":::

1. The test copilot will reload itself, this time using the selected secondary language. The authoring canvas shows the secondary language.

1. Enter a message in the secondary language to test the copilot.

You can also set your browser language to the secondary language supported by your copilot, and open the [Demo copilot website](publication-connect-bot-to-web-channels.md?tabs=preview#customize-the-demo-website). The demo website opens in the secondary language, and the copilot chats using the secondary language strings.

## Multilingual copilot behavior for languages that are not configured

If a copilot user has their browser configured for a language that is not configured in the copilot through the steps above, the copilot will always fallback to its primary language (the language the copilot was created in originally). The copilot's primary language cannot be changed after copilot creation.

## Multilingual copilot behavior for missing translations

If the copilot author makes a change to the copilot in the primary language and doesn't [upload the translations](#managing-localization-in-a-multilingual-copilot), the copilot will show the untranslated changes in the copilot's primary language. This leads to a confusing dual-language experience. Always make sure the translations are up-to-date after making changes to the copilot in the primary language.

## Related topics
- [Supported Languages](authoring-language-support.md)
