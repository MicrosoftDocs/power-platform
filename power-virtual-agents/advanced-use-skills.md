---
title: "Use Microsoft Bot Framework skills"
description: "Extend your bot and author complex bot dialogs using pro-code tools to build Microsoft Bot Framework skills that enable the bot to book an appointment, send a confirmation email, manage tasks, and more."
keywords: "authoring, extensibility, integration, extend bot, bot framework, skills, custom capabilities, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "Azure, advanced-authoring, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Use Microsoft Bot Framework skills in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio enables you to extend your bot using Microsoft Bot Framework skills. If you have already built and deployed bots in your organization (using Bot Framework pro-code tools) for specific scenarios, you can convert bots to a skill and embed the skill within a Microsoft Copilot Studio bot.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Review restrictions and validation for skills used in Microsoft Copilot Studio](/azure/bot-service/skill-pva)
- [A standalone Microsoft Copilot Studio subscription](requirements-licensing-subscriptions.md#standalone-microsoft-copilot-studio-subscription). If you have a [Teams plan](requirements-licensing-subscriptions.md#microsoft-copilot-studio-for-microsoft-teams-plan), you can't use Bot Framework skills.

## Add a skill to bot conversations

First, [create a Microsoft Copilot Studio bot](authoring-first-bot.md) and [create and deploy the skill using pro-code tools](https://go.microsoft.com/fwlink/?linkid=2110533) into your organization.

Next, [register a skill in Microsoft Copilot Studio](configuration-add-skills.md).

**Add a skill into a conversation:**

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to call a skill action from.

1. Select **Add node** (**+**) underneath an existing node to add a new node.

    :::image type="content" source="media/advanced-use-skills/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. In the node selection window, select **Call an action**, and then select the skill you want to add.

1. If your skill has inputs, assign variables to those inputs. Also, if your skill emits outputs to variables, you can use those variables in any nodes that follow.

    > [!NOTE]
    > Skills can accept simple data types (integer, boolean, string) and complex data types (as JSON strings).
    >
    > If you need to extract variables from complex data types, you must [use Power Automate](advanced-flow.md) to further parse and break down complex JSON strings into key value pairs for use in your bot.

1. Select **Save** to persist your changes to the topic.

1. You should [test your bot](authoring-test-bot.md) to make sure it's using the skill properly.

[!INCLUDE[footer-include](includes/footer-banner.md)]
