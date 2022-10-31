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

## Guidelines for creating bot content for Power Virtual Agents in Composer

<!-- FIXME: cleanup -->

When opened from a Power Virtual Agents bot, Composer launches a **Composer project** and loads in your bot content.

The **main (root) dialog** in your **Composer project** is named after the project name you provided and corresponds to your Power Virtual Agents bot content. In this example, the **main (root) dialog** is **Contoso-Meal-Delivery-Service**:

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

- You can capture telemetry in Composer dialogs and triggers and use [Application Insights](/azure/azure-monitor/app/app-insights-overview) to analyze it with [Kusto queries for Adaptive dialogs](/azure/bot-service/bot-builder-telemetry-analytics-queries?view=azure-bot-service-4.0&preserve-view=true#adaptive-dialogs-started-and-completed). Refer to the [Capture telemetry with Application Insights](advanced-bot-framework-composer-capture-telemetry.md) section for more information.

For a deep-dive on Bot Framework Composer **dialogs**, **events**, **triggers**, and how to create advanced bot content with Bot Framework, refer to the following resources:

- [Bot Framework Composer dialogs](/composer/concept-dialog)
- [Bot Framework Composer events and triggers](/composer/how-to-define-triggers)
- [Language Generation](/composer/concept-language-generation)
- [Conversation flow and memory](/composer/concept-memory)

[!INCLUDE [Publish Composer](includes/composer-publish-note.md)]

## Next steps

To help you get started using Composer, we've created four examples that detail different scenarios:

- [Example 1 - Show an Adaptive Card in Power Virtual Agents](advanced-bot-framework-composer-example1.md)
- [Example 2 - Display a multi-select options list in Power Virtual Agents](advanced-bot-framework-composer-example2.md)
- [Example 3 - Use Bing Search as a fallback in Power Virtual Agents](advanced-bot-framework-composer-example3.md)
- [Example 4 - Display a form with a Submit button in Power Virtual Agents](advanced-bot-framework-composer-example4.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
