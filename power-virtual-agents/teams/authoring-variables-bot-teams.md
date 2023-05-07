---
title: "Use chatbot variables to carry content across topics in Microsoft Teams"
description: "Bot variables can be used in the Power Virtual Agents app in Microsoft Teams to store and retrieve information across multiple topics within the same bot."
keywords: "PVA, Teams"
ms.date: 9/22/2020

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: authoring, ce06122020
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Reuse variables across topics in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](../authoring-variables-bot.md)
> - [Power Virtual Agents app in Microsoft Teams](authoring-variables-bot-teams.md)

[Variables](authoring-variables-teams.md) let you save responses from your customers. For example, you can save a customer's name in a variable called `UserName`. The bot can then address the customer by name as the conversation continues.

However, you can also make variables into **bot variables**, so that they apply across the entire bot.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents-teams.md).

## Set bot variables

After you set a bot variable, it will be available to all topics.

When you select the `{x}` button in a node when you're editing a topic, you'll see the list of variables you can use, sorted in alphabetical order. Bot variables are at the top because they start with `bot.`.

:::image type="content" source="../media/authoring-variables-bot/bot-variable-message-teams.png" alt-text="Screenshot showing selection of the x variable icon to display a list of variables." border="false":::

**Reuse a variable across topics by setting it as a bot variable:**

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, under **Usage**, select **Bot (any topic can access)**.

1. The variable name will be given a prefix string `bot.`, to differentiate it from the topic-level variables. For example, the variable `UserName` is now shown as `bot.UserName`.

    :::image type="content" source="../media/authoring-variables-bot/bot-variable-set-teams.png" alt-text="Screenshot showing the Variable Properties pane, with the Usage section highlighted." border="false":::

> [!NOTE]
> A bot variable's name must be unique across all topics. In the case of a conflict, you'll need to rename the variable before saving your change.

## Manage bot variables

After you've created a bot variable, you can see where it's first defined and what other topics are using it.

**Go to the source of a bot variable's definition:**

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, select **Go to source**.

    :::image type="content" source="../media/authoring-variables-bot/bot-variable-source-teams.png" alt-text="Screenshot showing the Variable Properties pane, with the Go to Source button highlighted." border="false":::

This will take you to the node in the topic where the bot variable was created.

**Find all topics using a bot variable:**

1. Select any bot variable in the authoring canvas.

1. On the **Variable properties** pane, in the **Used by** section, select any of the topics where the variable is used to go straight to that topic and node.

    :::image type="content" source="../media/authoring-variables-bot/bot-variable-used-by-teams.png" alt-text="Screenshot showing the list of topics used by a variable in the Variable Properties pane." border="false":::

## Delete bot variables

When removing a bot variable used in other topics, the references to that variable in the topics will be marked as `Unknown`.

You'll receive a warning about deleting the bot variable before you can confirm the operation.

:::image type="content" source="../media/authoring-variables-bot/bot-variable-delete-teams.png" alt-text="The bot variable delete message indicates that references to that variable will be labeled as unknown." border="false":::
  
Nodes that contain references to the deleted bot variable will tell you they contain an unknown variable.

:::image type="content" source="../media/authoring-variables-bot/bot-variable-unknown-node-teams.png" alt-text="Screenshot of a node with references to an unknown variable, which are marked as red within the message node's text, and indicated with a warning that says Bot message contains unknown variable." border="false":::

Topics with nodes that contain references to deleted bot variables might stop working. Ensure that you remove or correct all the topics that were using the deleted variable before publishing.

## Advanced use of bot variables

For more details on complex and advanced scenarios using bot variables, including authentication, external sources, and initialization flows, [see the Power Virtual Agents web app version of this topic](../authoring-variables-bot.md).

## Related links

- [Use variables](authoring-variables-teams.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
