---
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

Enhance your bot by developing custom dialogs with [Bot Framework Composer](/composer/) and then adding them to your Power Virtual Agents bot.

Composer is integrated into Power Virtual Agents to allow developers and business users to build bots together. Composer lets you extend your bot with Bot Framework functionality, including:

- Adaptive dialogs
- Language Generation (LG)
- Regular expressions (RegEx)
- Adaptive Cards

Composer with Power Virtual Agents lets you access conversational memory and context, including the variables defined in Power Virtual Agents.

For example, you could create event-driven dynamic dialogs to handle interruptions, cancellations, and context switching. You could also add Adaptive Cards to display interactive elements like images and videos, forms, and more in the bot.

There are a variety of prebuilt functions and expressions in Composer for you to use, as well as the ability to define multiple variations of a phrase for the bot to randomly select at runtime.

Custom dialogs added with Bot Framework Composer are deployed, hosted, and executed together with the rest of Power Virtual Agents bot content, and don't require any additional Azure hosting.

> [!IMPORTANT]
> Bot Framework Composer integration isn't available to users who only have the [Teams Power Virtual Agents license](requirements-licensing-subscriptions.md). You must have a [trial](sign-up-individual.md) or full Power Virtual Agents license.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- [Introduction to Bot Framework Composer](/composer/introduction)

## Access Bot Framework Composer from within Power Virtual Agents

1. Go to the **Topics** tab for the bot you want to edit and select the down-arrow symbol next to **+ New topic**.

1. Select **Open in Bot Framework Composer** from the dropdown menu.

    :::image type="content" source="media/advanced-bot-framework-composer/Composer_OpeninBotFrameworkComposerButton_dropdown.png" alt-text="Open Composer from Topics page.":::

If you already have Composer installed, Power Virtual Agents will try to open your bot in Composer.

> [!IMPORTANT]
> You should always open Bot Framework Composer from within Power Virtual Agents if you plan to create content for Power Virtual Agents bots. This will ensure that Composer has all the necessary plug-ins needed for integration with Power Virtual Agents.

If you don't have Composer installed, you can download it from the **download Composer** link. This link takes you to a **Download confirmation** window where you can also learn more about Composer.

:::image type="content" source="media/advanced-bot-framework-composer/composer-not-present.png" alt-text="Screenshot of the Power Virtual Agents Composer window indicating that Composer is not installed.":::

During installation, make sure to clear the **Run Bot Framework Composer** checkbox, because you'll need to open Composer from within Power Virtual Agents to use it with your bot.

:::image type="content" source="media/advanced-bot-framework-composer/Composer_InstallWizardFinish.png" alt-text="Bot Framework Composer Install Complete.":::

Go back to the Power Virtual Agents **Topics** page and select the down-arrow symbol next to **+ New topic**. Select **Open in Bot Framework Composer** in the dropdown menu and then **Open Composer** to open your bot in Composer.

> [!NOTE]
> In some cases, a firewall might be blocking some features in Composer and you might need to explicitly allow access. Check with your admin for details.

If you're opening Composer from this Power Virtual Agents bot for the first time, you need to specify the **Name** (alphanumeric, no spaces or special characters) for your **Composer project**. You can skip this step if you already have a bot project for this bot by selecting **Cancel** in this step.

:::image type="content" source="media/advanced-bot-framework-composer/ComposerUI_CreateProject.png" alt-text="Create Bot Framework Composer.":::

Your Power Virtual Agents bot is now open in Composer and you are ready to start developing.

:::image type="content" source="media/advanced-bot-framework-composer/ComposerUI_Open_initialView.png" alt-text="Bot Framework Composer Project Initial View.":::

> [!NOTE]
> In some cases, Power Virtual Agents might be unable to launch Composer automatically. However, you can launch it manually from your browser by selecting **Copy Link** to copy and paste the link to Composer in your web browser.

## Guidelines for creating bot content for Power Virtual Agents in Composer

When opened from a Power Virtual Agents bot, Composer launches a **Composer project** and loads in your bot content.

The **main (root) dialog** in your **Composer project** is named after the project name you provided and corresponds to your Power Virtual Agents bot content. In this example, your **main (root) dialog** is **Contoso-Meal-Delivery-Service**:

:::image type="content" source="media/advanced-bot-framework-composer/Gd_mainDialog_initial.png" alt-text="Bot Framework Composer main (root) dialog":::

There are a few key guidelines to follow when using Composer to create your bot content for Power Virtual Agents:

- The Power Virtual Agents topics from your bot will be displayed in Composer. You can't edit these Power Virtual Agents topics in Composer; selecting them will open these topics in Power Virtual Agents for editing.

  :::image type="content" source="media/advanced-bot-framework-composer/Gd_PVA_Topics.png" alt-text="Bot Framework Composer - Power Virtual Agents topics.":::

- Use **Begin a Power Virtual Agents Topic** to call Power Virtual Agents topics in Composer.

  :::image type="content" source="media/advanced-bot-framework-composer/Gd_call_PVA_Topic.png" alt-text="Bot Framework Composer - call Power Virtual Agents topics.":::

- You can add new **Bot Framework triggers** of any kind to your **main (root) dialog**.
- You can use **Send a response** and **Ask a question** in the new **triggers** added to **main (root) dialog**.

- You can't use the Regular expression recognizer in the **main (root) dialog**. Using the Regular expression recognizer in the **main (root) dialog** will prevent you from publishing your Composer content to Power Virtual Agents. However, you can use the Regular expression recognizer in any other Composer dialogs.

- You can create new **Bot Framework dialogs** and add **events** and **triggers** of any kind to them. **Send a response** and **Ask a question** can be used in **triggers** that belong to the new **dialogs**.

- On the **Bot Responses** tab, the **All** section should be empty (that is, the **common.lg** file should be empty). Having any assets there will result in validation errors and prevent you from publishing your Composer content to Power Virtual Agents.

- All **Language Generation** (.lg) and **Language Understanding** (.lu) files should have the corresponding **dialogs**. For example, if you have only one **dialog** with name **dialog1**, then you can have **dialog1.en-us.lg** and **dialog1.en-us.lu**, but you cannot have **extra.en-us.lg**.

- The **main (root) dialog** in Composer should never be deleted, as it corresponds to your Power Virtual Agents bot. The **main (root) dialog** can have zero or more **triggers**.

- You can capture telemetry in Composer dialogs and triggers and use [Application Insights](/azure/azure-monitor/app/app-insights-overview) to analyze it with [Kusto queries for Adaptive dialogs](/azure/bot-service/bot-builder-telemetry-analytics-queries?view=azure-bot-service-4.0&preserve-view=true#adaptive-dialogs-started-and-completed). Refer to the [Capture telemetry with Application Insights](#capture-telemetry-with-application-insights) section for more information.

For a deep-dive on Bot Framework Composer **dialogs**, **events**, **triggers**, and how to create advanced bot content with Bot Framework, refer to the following resources:

- [Bot Framework Composer dialogs](/composer/concept-dialog)
- [Bot Framework Composer events and triggers](/composer/how-to-define-triggers)
- [Language Generation](/composer/concept-language-generation)
- [Conversation flow and memory](/composer/concept-memory)

[!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

## Composer features not supported with Power Virtual Agents

The following Bot Framework Composer features are not supported with Power Virtual Agents:

<!-- best viewed/edited without wordwrap -->
| Unsupported feature                             | Additional information                                                                              |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| LUIS Recognizer                                 | Default Recognizer in Composer is set to Power Virtual Agents Natural Language Understanding (NLU). |
| Bot Framework Orchestrator                      | Bot Framework Orchestrator is not supported in Composer for Power Virtual Agents.                   |
| Custom recognizer                               | Custom recognizer is not supported in Composer for Power Virtual Agents.                            |
| Bot skills                                      | Cannot invoke Bot skills in Composer content meant for Power Virtual Agents.                        |
| QnA Maker                                       | This feature is not available in Composer for Power Virtual Agents.                                 |
| OAuth Login and User Sign Out                   | These types of actions are not supported in Composer for Power Virtual Agents.                      |
| Dialog Inputs and Outputs                       | Dialog Inputs and Outputs are not supported in Composer for Power Virtual Agents.                   |
| Entity detection in trigger phrases in Composer | Cannot use `# getUserName my name is {username=userName}` in Composer.                              |
| Testing in Bot Framework Emulator               | All Composer content should be published and then tested in Power Virtual Agents.                   |

## Use and update Power Virtual Agents variables in Bot Framework Composer

You can use and update the values in Power Virtual Agents global variables in Bot Framework Composer by referencing the following scope:

- `virtualagent`

For example, create a variable called **user_city** in your Power Virtual Agents bot. Make it a global variable by setting its **Usage** to **Bot (any topic can access)**.

:::image type="content" source="media/advanced-bot-framework-composer/E1_Dialog2.png" alt-text="Power Virtual Agents - variable.":::

This setting makes the Power Virtual Agents variable **user_city** available in Bot Framework Composer within the **virtualagent** scope. Use the following notation to refer to it in Composer:

```JSON
${virtualagent.user_city} 
```

## Examples for extending Power Virtual Agents chatbots with Composer

To help you get started using Composer, we've created four examples that detail different scenarios:

- [Example 1 - Show an Adaptive Card in Power Virtual Agents](advanced-bot-framework-composer-example1.md)
- [Example 2 - Display a multi-select options list in Power Virtual Agents](advanced-bot-framework-composer-example2.md)
- [Example 3 - Use Bing Search as a fallback in Power Virtual Agents](advanced-bot-framework-composer-example3.md)
- [Example 4 - Display a form with a Submit button in Power Virtual Agents](advanced-bot-framework-composer-example4.md)

## Capture telemetry with Application Insights

You can use Bot Framework Composer with Power Virtual Agents to send event data to a telemetry service in [Application Insights](/azure/azure-monitor/app/app-insights-overview). Telemetry offers insights into your bot by showing which features are used the most, detects unwanted behavior, and provides data on availability, performance, and usage.

> [!IMPORTANT]
> Application Insights is a feature of [Azure Monitor](/azure/azure-monitor/overview), an extensible Application Performance Management (APM) tool that allows you to monitor your live applications. It requires a subscription to [Microsoft Azure](https://azure.microsoft.com/).

To connect to your Application Insights service in Composer, you need to add your instrumentation key to the project.

1. Go to the **Configure** tab in Composer and switch to **Advanced Settings View (json)**.

    :::image type="content" source="media/advanced-bot-framework-composer/Configure_AdvancedView.png" alt-text="Composer Configure tab - Advanced Settings View.":::

1. Find the **applicationInsights** section, then add your Application Insights instrumentation key to the **instrumentationKey** setting.

    :::image type="content" source="media/advanced-bot-framework-composer/Configure_AppInsights_Key.png" alt-text="Composer Configure tab - Application Insights Instrumentation key.":::

To learn more on how to set up and use Application Insights and create queries for Composer's Adaptive dialogs, see these resources:

- A subscription to [Microsoft Azure](https://azure.microsoft.com/).
- Get started with [Application Insights](/azure/azure-monitor/app/app-insights-overview#get-started).
- The basic concepts of [Log queries](/azure/azure-monitor/log-query/get-started-queries) in Azure Monitor.
- [Example Kusto queries](/azure/bot-service/bot-builder-telemetry-analytics-queries?view=azure-bot-service-4.0&preserve-view=true#adaptive-dialogs-started-and-completed) for Adaptive dialogs in Composer.

## Testing Bot Framework content with Power Virtual Agents

[!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

Test the content you've created in Bot Framework Composer by publishing it to Power Virtual Agents and using the **Test bot** pane in Power Virtual Agents.

1. Publish your Bot Framework content to Power Virtual Agents from the **Publish** tab in Composer.

    :::image type="content" source="media/advanced-bot-framework-composer/Test_Publish_Success.png" alt-text="Composer Publish tab.":::

1. After you successfully publish your Bot Framework content, go to the Power Virtual Agents **Test bot** pane to test your bot. Start a conversation by typing in a trigger phrase in the Power Virtual Agents **Test bot** pane:

    :::image type="content" source="media/advanced-bot-framework-composer/Test_image.png" alt-text="Power Virtual Agents test bot.":::

> [!NOTE]
> The Bot Framework Emulator cannot be used to test Composer content created for Power Virtual Agents bots.

## Troubleshooting

If you're having trouble publishing your Bot Framework Composer content to Power Virtual Agents, use the **See Log** feature in the **Publish** tab in Composer. The log will provide a detailed description of the errors encountered during validation. Select your bot and then select the caret icon to see the publish history.

:::image type="content" source="media/advanced-bot-framework-composer/TL_PublishHistory.png" alt-text="Composer Publish - See Log.":::

Selecting the log will bring up the list of warnings and errors that were encountered during the publish history in Composer, along with suggestions on how to fix the errors:

:::image type="content" source="media/advanced-bot-framework-composer/Tl_PublishError.png" alt-text="Composer Publish - warnings and errors.":::

If you encounter issues developing in Bot Framework Composer, you can:

- Go to [Bot Framework Composer issues on GitHub](https://github.com/microsoft/BotFramework-Composer/issues).

- See the list of known issues in Composer or [log a new Composer issue](https://github.com/microsoft/BotFramework-Composer/issues/new/choose).

To troubleshoot your bot in Power Virtual Agents, use the [topic checker](authoring-topic-management.md#topic-errors).

## Learn more

To learn more about developing in Bot Framework Composer, see these resources:

- [Bot Framework Composer documentation](/composer/)
- [Tour of Composer](/composer/introduction)
- [Tutorial: Create a new bot](/composer/tutorial/tutorial-create-bot)
- [Tutorial: Add cards and buttons to your bot](/composer/tutorial/tutorial-cards)
- [Tutorial: Add language generation to your bot](/composer/tutorial/tutorial-language-generation)
- [Bot Framework Composer on GitHub](https://github.com/Microsoft/BotFramework-Composer)

[!INCLUDE[footer-include](includes/footer-banner.md)]
