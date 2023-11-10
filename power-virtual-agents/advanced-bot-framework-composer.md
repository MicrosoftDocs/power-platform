---
title: "Overview of Bot Framework Composer"
description: "Use Bot Framework Composer to add Adaptive Cards, multi-select options, and more to your Microsoft Copilot Studio chatbot."
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

# Overview of Bot Framework Composer

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]

Enhance your bot by developing custom topics with [Bot Framework Composer](/composer/) and then adding them to your Microsoft Copilot Studio bot.

Composer is integrated into Microsoft Copilot Studio to allow developers and business users to build bots together. Composer lets you extend your bot with Bot Framework functionality, including:

- Adaptive dialogs
- Language Generation (LG)
- Regular expressions (RegEx)
- Adaptive Cards

Using Composer with Microsoft Copilot Studio lets you access conversational memory and context, including the variables defined in Microsoft Copilot Studio. This lets you create topics to handle interruptions, cancellations, and context switching. You can also add Adaptive Cards to display interactive elements like images and videos, forms, and more in the bot.

There are various prebuilt functions and expressions in Composer for you to use, and the ability to define multiple variations of a phrase for the bot to randomly select at runtime.

Custom topics added with Composer are deployed, hosted, and executed together with the rest of Microsoft Copilot Studio bot content, and don't require any more Azure hosting.

[!INCLUDE [Composer License](includes/composer-license.md)]

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Introduction to Bot Framework Composer](/composer/introduction)

## Understand key Composer terms

Composer uses a different set of terms to describe similar concepts used in Microsoft Copilot Studio. Below is a list of key terms to understand:

- **dialog:** Dialogs are the basic building block in Composer and serve as containers for triggers. Each dialog represents a portion of the bot's functionality that contains instructions for what the bot will do and how it will react to user input. To learn more about dialogs, see [Dialogs as conversational building blocks in Composer](/composer/concept-dialog).

- **main dialog:** A bot's main dialog is the first dialog that appears in the bot explorer and is created when you import your Power Virtual Agent bot into Composer. The main dialog should never be deleted, as it corresponds to your Microsoft Copilot Studio bot.

- **trigger:** Triggers are the main component of a dialog and let you catch and respond to events. Each trigger has a condition and a collection of actions to execute when the condition is met. You can think of triggers as the equivalent of _topics_ in Microsoft Copilot Studio. To learn more about triggers, see [Triggers](/composer/concept-events-and-triggers).

- **action:** Actions are the main components of a trigger that enable you to send a response, create and assign values to properties, manipulate the conversational flow, manage dialogs, and many other activities. You can think of actions as the equivalent of _nodes_ in Microsoft Copilot Studio.

## Composer features not supported with Microsoft Copilot Studio

The following Composer features aren't supported with Microsoft Copilot Studio:

| Unsupported feature                             | Additional information                                                                              |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| LUIS Recognizer                                 | Default Recognizer in Composer is set to Microsoft Copilot Studio Natural Language Understanding (NLU). |
| Bot Framework Orchestrator                      | Bot Framework Orchestrator isn't supported in Composer for Microsoft Copilot Studio.                   |
| Custom recognizer                               | Custom recognizer isn't supported in Composer for Microsoft Copilot Studio.                            |
| Bot skills                                      | Can't invoke Bot skills in Composer content meant for Microsoft Copilot Studio.                        |
| QnA Maker                                       | This feature isn't available in Composer for Microsoft Copilot Studio.                                 |
| OAuth Login and User Sign Out                   | These types of actions aren't supported in Composer for Microsoft Copilot Studio.                      |
| Dialog Inputs and Outputs                       | Dialog Inputs and Outputs aren't supported in Composer for Microsoft Copilot Studio.                   |
| Entity detection in trigger phrases in Composer | Can't use `# getUserName my name is {username=userName}` in Composer.                              |
| Testing in Bot Framework Emulator               | All Composer content should be published and then tested in Microsoft Copilot Studio.                   |

## Guidelines for creating bot content for Microsoft Copilot Studio in Composer

There are a few key guidelines to follow when using Composer to create your bot content for Microsoft Copilot Studio:

- The topics from your Microsoft Copilot Studio bot will be displayed in Composer as dialogs. You can't edit these dialogs in Composer; selecting them will open the relevant topics in Microsoft Copilot Studio for editing.

    :::image type="content" source="media/advanced-bot-framework-composer/pva-topics-in-composer.png" alt-text="Screenshot of the list of topics in Composer that were imported from a Microsoft Copilot Studio bot.":::

- Microsoft Copilot Studio global variables are accessed in Composer by using the `virtualagent` scope. This scope won't appear in Composer's property reference menu, but you can access it by entering an expression directly.

- Publishing content in Composer makes the changes available for testing, but does not automatically publish your Microsoft Copilot Studio bot. Use the [Publish](publication-fundamentals-publish-channels.md) feature in Microsoft Copilot Studio to publish your bot changes to channels.

- Use a **Begin a Microsoft Copilot Studio Topic** action to call Microsoft Copilot Studio topics in Composer.

    :::image type="content" source="media/advanced-bot-framework-composer/Gd_call_PVA_Topic.png" alt-text="Screenshot of Composer's add action menu.":::

- You can add new Composer triggers of any kind to your main (also known as "root") dialog.

- You can send messages and ask questions from these Composer triggers.

- You can't use the Regular expression recognizer in the main dialog. Using the Regular expression recognizer in the main dialog will prevent you from publishing your Composer content to Microsoft Copilot Studio. However, you can use the Regular expression recognizer in any other Composer dialog.

- You can add any Composer events and triggers to newly created dialogs.

- On the **Bot Responses** page, the **Common** section should be empty. Using any assets there will result in validation errors and prevent you from publishing your Composer content to Microsoft Copilot Studio.

    :::image type="content" source="media/advanced-bot-framework-composer/common-empty.png" alt-text="Screenshot of the common bot responses section empty.":::

- Each Composer dialog has its own bot response (.lg) and language understanding (.lu) resources. For example, a bot that speaks English (US) and has a dialog named `dialog1` will have one `dialog1.en-us.lg` file and one `dialog1.en-us.lu` file.

- The main dialog in Composer should never be deleted, as it corresponds to your Microsoft Copilot Studio bot. The main dialog can have zero or more triggers.

- You can capture telemetry in Composer dialogs and triggers and use [Application Insights](/azure/azure-monitor/app/app-insights-overview) to analyze it with [Kusto queries for adaptive dialogs](/azure/bot-service/bot-builder-telemetry-analytics-queries?view=azure-bot-service-4.0&preserve-view=true#adaptive-dialogs-started-and-completed). For more information, see [Capture telemetry with Application Insights](advanced-bot-framework-composer-capture-telemetry.md).

For a deep-dive on Composer dialogs, events, triggers, and how to create advanced bot content with Bot Framework, refer to the following resources:

- [Bot Framework Composer dialogs](/composer/concept-dialog)
- [Bot Framework Composer events and triggers](/composer/how-to-define-triggers)
- [Language generation](/composer/concept-language-generation)
- [Conversation flow and memory](/composer/concept-memory)

## References

To learn more about developing in Composer, see these resources:

- [Bot Framework Composer documentation](/composer/)
- [Tour of Composer](/composer/introduction)
- [Tutorial: Create a new bot](/composer/tutorial/tutorial-create-bot)
- [Tutorial: Add cards and buttons to your bot](/composer/tutorial/tutorial-cards)
- [Tutorial: Add language generation to your bot](/composer/tutorial/tutorial-language-generation)
- [Bot Framework Composer on GitHub](https://github.com/Microsoft/BotFramework-Composer)

## Related topics

- [Open your bot in Composer for the first time](advanced-bot-framework-composer-fundamentals.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
