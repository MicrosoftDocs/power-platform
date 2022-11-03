---
title: "Getting started with Bot Framework Composer"
description: "Import your Power Virtual Agents bot into a Composer project to extend your bot's capabilities."
keywords: "composer"
ms.date: 11/03/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Getting started with Bot Framework Composer

To use Bot Framework Composer to extend your Power Virtual Agents bot, you'll need to first import your bot into a Composer project.

## Prerequisites

- [Extend your bot with Bot Framework Composer](advanced-bot-framework-composer.md)

## Open your bot in Composer for the first time

> [!IMPORTANT]
> You should always open Composer from within Power Virtual Agents. This will ensure that Composer has all the necessary plug-ins needed for integration with Power Virtual Agents.

1. Go to the **Topics** tab for the bot you want to edit and select the down-arrow symbol next to **+ New topic**.

1. Select **Open in Bot Framework Composer** from the dropdown menu.

    :::image type="content" source="media/advanced-bot-framework-composer/Composer_OpeninBotFrameworkComposerButton_dropdown.png" alt-text="Open Composer from Topics page.":::

1. Select **download Composer**.

    :::image type="content" source="media/advanced-bot-framework-composer/composer-not-present.png" alt-text="Screenshot of the Power Virtual Agents Composer window indicating that Composer is not installed.":::

1. In the **Download Bot Framework Composer** window, select **Download Composer**.

    :::image type="content" source="media/advanced-bot-framework-composer/download-composer.png" alt-text="Screenshot of the Power Virtual Agents Composer window indicating that Composer is not installed.":::

1. When the download completes, run it to install Composer.

1. In Power Virtual Agents, go to the **Topics** page and select the down-arrow symbol next to **+ New topic**.

1. Select **Open in Bot Framework Composer** in the dropdown menu to open your bot in Composer.

    > [!NOTE]
    > In some cases, a firewall might be blocking some features in Composer and you might need to explicitly allow access. Check with your admin for details.

1. The first time you open a Power Virtual Agents bot in Composer, it will be imported into a new Composer project. The name you specified in Power Virtual Agents will automatically be used as the name for the project, but you can also enter a custom name.

    :::image type="content" source="media/advanced-bot-framework-composer/ComposerUI_CreateProject.png" alt-text="Create Bot Framework Composer.":::

1. Select **Create** to finish importing your bot into Composer.

    :::image type="content" source="media/advanced-bot-framework-composer/ComposerUI_Open_initialView.png" alt-text="Bot Framework Composer Project Initial View.":::

If Power Virtual Agents is unable to launch Composer automatically, you can launch it manually:

1. Select **Copy Link** to copy the link to your clipboard.

    :::image type="content" source="media/advanced-bot-framework-composer/copy-link.png" alt-text="Screnshot of copy link button.":::

1. Open a new tab and paste the link in your web browser's address bar.

## Testing Bot Framework content with Power Virtual Agents

You can't use the Bot Framework Emulator to test Composer content created for Power Virtual Agents bots. Instead you'll need to publish your Composer content to your Power Virtual Agents bot, then use the [Test bot pane](authoring-test-bot.md).

[!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

1. Go to the **Publish** tab in Composer.

    :::image type="content" source="media/advanced-bot-framework-composer/publish-tab.png" alt-text="Screenshot of the publish tab in Composer.":::

1. Turn on the box next to your bot, then select **Publish selected bots**.

    :::image type="content" source="media/advanced-bot-framework-composer/publish-bot.png" alt-text="Screenshot of the bot selected for publish.":::

1. Optionally enter a message for **Comments**, then select **Okay**.

    :::image type="content" source="media/advanced-bot-framework-composer/publish-window.png" alt-text="Screenshot of the publish window":::

1. Once publishing completes, go to Power Virtual Agents. You may need to refresh the page to see the new topics you've added in Composer.

1. Open the **Test bot** pane and start a conversation by typing in a trigger phrase.

## View the publish log

If you're having trouble publishing your Composer content to Power Virtual Agents, you can troubleshoot by reviewing the publish log. The publish log provides a detailed description of any warnings or errors encountered during validation and suggestions on how to fix them.

> [!NOTE]
> If you're having trouble with your Power Virtual Agents bot, use the [topic checker](authoring-topic-management.md#topic-errors) instead.

1. Go to the **Publish** tab in Composer.

1. Select the right arrow (**>**) next to your bot. You may need to increase the size of the Composer window to make the arrow visible.

    :::image type="content" source="media/advanced-bot-framework-composer/open-publish-history.png" alt-text="Composer Publish - See Log.":::

1. Under **Publish history**, select **View log**.

   :::image type="content" source="media/advanced-bot-framework-composer/view-log.png" alt-text="Composer Publish - See Log.":::

1. In the **Publish log** window, review logs for any errors or warnings.

    :::image type="content" source="media/advanced-bot-framework-composer/Tl_PublishError.png" alt-text="Composer Publish - warnings and errors.":::

If you encounter issues developing in Composer, you can:

- Go to [Bot Framework Composer issues on GitHub](https://github.com/microsoft/BotFramework-Composer/issues).

- See the list of known issues in Composer or [log a new Composer issue](https://github.com/microsoft/BotFramework-Composer/issues/new/choose).

## Next steps

To help you get started using Composer, we've created four examples that detail different scenarios:

- [Example 1 - Show an Adaptive Card in Power Virtual Agents](advanced-bot-framework-composer-example1.md)
- [Example 2 - Display a multi-select options list in Power Virtual Agents](advanced-bot-framework-composer-example2.md)
- [Example 3 - Use Bing Search as a fallback in Power Virtual Agents](advanced-bot-framework-composer-example3.md)
- [Example 4 - Display a form with a Submit button in Power Virtual Agents](advanced-bot-framework-composer-example4.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
