---
title: "Getting started with Bot Framework Composer"
description: "Import your Microsoft Copilot Studio bot into a Composer project to extend your bot's capabilities."
keywords: "composer"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Getting started with Bot Framework Composer

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]

To use Bot Framework Composer to extend your Microsoft Copilot Studio bot, you'll need to first import your bot into a Composer project.

## Prerequisites

- [Extend your bot with Bot Framework Composer](advanced-bot-framework-composer.md)

## Open your bot in Composer

> [!IMPORTANT]
> You should always open Composer from within Microsoft Copilot Studio. This will ensure that Composer has all the necessary plug-ins needed for integration with Microsoft Copilot Studio.

1. Go to the **Topics** page for the bot you want to edit and select the down-arrow symbol next to **+ New topic**.

1. Select **Open in Bot Framework Composer** in the dropdown menu to open your bot in Composer.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/Composer_OpeninBotFrameworkComposerButton_dropdown.png" alt-text="Screenshot of the button used to open a bot in Composer.":::

1. If you don't have Composer installed already:

    1. Select **download Composer**.

        :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/composer-not-present.png" alt-text="Screenshot of the download Composer link highlighted.":::

    1. In the **Download Bot Framework Composer** window, select **Download Composer**.

        :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/download-composer.png" alt-text="Screenshot of the Microsoft Copilot Studio Composer window indicating that Composer is not installed.":::

    1. When the download completes, run it to install Composer.

    1. Once you've installed Composer, go back to Microsoft Copilot Studio. Go to the **Topics** page and select the down-arrow symbol next to **+ New topic**.

        > [!NOTE]
        > In some cases, a firewall might be blocking some features in Composer and you might need to explicitly allow access. Check with your admin for details.

1. If Microsoft Copilot Studio is unable to launch Composer automatically, you can launch it manually:

    1. Select **Copy Link** to copy the link to your clipboard.

        :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/copy-link.png" alt-text="Screenshot of copy link button.":::

    1. Open a new tab and paste the link in your web browser's address bar.

1. The first time you open a Microsoft Copilot Studio bot in Composer, it will be imported into a new Composer project. The name you specified in Microsoft Copilot Studio will automatically be used as the name for the project, but you can also enter a custom name.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/ComposerUI_CreateProject.png" alt-text="Screenshot of the import screen in Composer.":::

1. Select **Create** to finish importing your bot into Composer.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/ComposerUI_Open_initialView.png" alt-text="Screenshot of the import screen in Composer with the create button highlighted.":::

## Test Composer content within Microsoft Copilot Studio

You can't use the Bot Framework Emulator to test Composer content created for Microsoft Copilot Studio bots. Instead you'll need to publish your Composer content to your Microsoft Copilot Studio bot, then use the [Test bot pane](authoring-test-bot.md).

[!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

1. Go to the **Publish** page.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/publish-tab.png" alt-text="Screenshot of the publish tab in Composer.":::

1. Select your bot in the **Bot** list, then select **Publish selected bots**.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/publish-bot.png" alt-text="Screenshot of the bot selected for publish.":::

1. Optionally enter a message for **Comments**, then select **Okay**.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/publish-window.png" alt-text="Screenshot of the publish window.":::

1. Once publishing completes, go to Microsoft Copilot Studio. You may need to refresh the page to see the new topics you've added in Composer.

1. Open the **Test bot** pane and start a conversation by typing in a trigger phrase.

## View the publish log

If you're having trouble publishing your Composer content to Microsoft Copilot Studio, you can troubleshoot by reviewing the publish log. The publish log provides a detailed description of any warnings or errors encountered during validation and suggestions on how to fix them.

> [!NOTE]
> If you're having trouble with your Microsoft Copilot Studio bot, use the [topic checker](authoring-topic-management.md#topic-errors) instead.

1. In Composer, go to the **Publish** page.

1. Select the right arrow (**>**) next to your bot. You may need to increase the size of the Composer window to make the arrow visible.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/open-publish-history.png" alt-text="Screenshot of the right arrow button.":::

1. Under **Publish history**, select **View log**.

   :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/view-log.png" alt-text="Screenshot of the View log button under Publish history.":::

1. In the **Publish log** window, review logs for any errors or warnings.

    :::image type="content" source="media/advanced-bot-framework-composer-fundamentals/Tl_PublishError.png" alt-text="Screenshot of the public log.":::

If you encounter issues developing in Composer, you can:

- Go to [Bot Framework Composer issues on GitHub](https://github.com/microsoft/BotFramework-Composer/issues).

- See the list of known issues in Composer or [log a new Composer issue](https://github.com/microsoft/BotFramework-Composer/issues/new/choose).

## Next steps

To help you get started using Composer, we've created four examples that detail different scenarios:

- [Example 1 - Show an Adaptive Card in Microsoft Copilot Studio](advanced-bot-framework-composer-example1.md)
- [Example 2 - Display a multi-select options list in Microsoft Copilot Studio](advanced-bot-framework-composer-example2.md)
- [Example 3 - Use Bing Search as a fallback in Microsoft Copilot Studio](advanced-bot-framework-composer-example3.md)
- [Example 4 - Display a form with a Submit button in Microsoft Copilot Studio](advanced-bot-framework-composer-example4.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
