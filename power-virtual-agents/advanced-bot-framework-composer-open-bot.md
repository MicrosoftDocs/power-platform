---
# FIXME: update metadata
title: "Use Bot Framework Composer with chatbots"
description: "Use Bot Framework Composer to add Adaptive Cards, multi-select options, and more to your Power Virtual Agents chatbot."
keywords: "composer, adaptive card"
ms.date: 06/28/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Extend your bot with Bot Framework Composer

<!-- FIXME: write intro -->

## Prerequisites

<!-- FIXME: prereqs -->

## Open your bot in Composer for the first time

> [!IMPORTANT]
> You should always open Bot Framework Composer from within Power Virtual Agents. This will ensure that Composer has all the necessary plug-ins needed for integration with Power Virtual Agents.

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

<!-- FIXME: cleanup -->

[!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

Test the content you've created in Bot Framework Composer by publishing it to Power Virtual Agents and using the **Test bot** pane in Power Virtual Agents.

1. Publish your Bot Framework content to Power Virtual Agents from the **Publish** tab in Composer.

    :::image type="content" source="media/advanced-bot-framework-composer/Test_Publish_Success.png" alt-text="Composer Publish tab.":::

1. After you successfully publish your Bot Framework content, go to the Power Virtual Agents **Test bot** pane to test your bot. Start a conversation by typing in a trigger phrase in the Power Virtual Agents **Test bot** pane:

    :::image type="content" source="media/advanced-bot-framework-composer/Test_image.png" alt-text="Power Virtual Agents test bot.":::

> [!NOTE]
> The Bot Framework Emulator cannot be used to test Composer content created for Power Virtual Agents bots.

## Troubleshooting

<!-- FIXME: cleanup -->

If you're having trouble publishing your Bot Framework Composer content to Power Virtual Agents, use the **See Log** feature in the **Publish** tab in Composer. The log will provide a detailed description of the errors encountered during validation. Select your bot and then select the caret icon to see the publish history.

:::image type="content" source="media/advanced-bot-framework-composer/TL_PublishHistory.png" alt-text="Composer Publish - See Log.":::

Selecting the log will bring up the list of warnings and errors that were encountered during the publish history in Composer, along with suggestions on how to fix the errors:

:::image type="content" source="media/advanced-bot-framework-composer/Tl_PublishError.png" alt-text="Composer Publish - warnings and errors.":::

If you encounter issues developing in Bot Framework Composer, you can:

- Go to [Bot Framework Composer issues on GitHub](https://github.com/microsoft/BotFramework-Composer/issues).

- See the list of known issues in Composer or [log a new Composer issue](https://github.com/microsoft/BotFramework-Composer/issues/new/choose).

To troubleshoot your bot in Power Virtual Agents, use the [topic checker](authoring-topic-management.md#topic-errors).

## Next steps

To help you get started using Composer, we've created four examples that detail different scenarios:

- [Example 1 - Show an Adaptive Card in Power Virtual Agents](advanced-bot-framework-composer-example1.md)
- [Example 2 - Display a multi-select options list in Power Virtual Agents](advanced-bot-framework-composer-example2.md)
- [Example 3 - Use Bing Search as a fallback in Power Virtual Agents](advanced-bot-framework-composer-example3.md)
- [Example 4 - Display a form with a Submit button in Power Virtual Agents](advanced-bot-framework-composer-example4.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
