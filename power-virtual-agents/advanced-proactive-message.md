---
title: "Notify bot users in Teams with proactive messages"
description: "Use Power Automate flows to send proactive messages to bot users in Teams, with updates to their conversations, requests for information, and more."
keywords: "PVA"
ms.date: 07/11/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: micchow
ms.custom: "teams, flow, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Send proactive messages Microsoft Teams

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

After you've [published your bot](publication-fundamentals-publish-channels.md) and [made the bot available to end users in Microsoft Teams](publication-add-bot-to-microsoft-teams.md), you can notify users ("recipients") in Microsoft Teams with proactive messages. Proactive messages use Power Automate flows to deliver their content, and are useful in many scenarios, including:

- Letting a recipient know that their earlier request has been completed. For example, the user's time-off request has been approved.
- Providing reminders or news updates. For example, the bot could send a reminder message to complete online training.

> [!IMPORTANT]
> Bots created or converted with the [unified authoring canvas](unified-authoring-conversion.md#what-is-new-or-has-been-updated-in-the-latest-microsoft-copilot-studio) can't send proactive messages in Teams. Your bot can only send proactive messages if:
> 
> - You create your bot in the Teams app.
> - You create a **Classic** bot.
> - You created your bot before May 23, 2023.
>
> A bot can't deliver messages if the recipient:
>
> - Doesn't have the bot installed in Microsoft Teams.
> - Has uninstalled the bot.
> - Has blocked the bot.
> - Doesn't have permission to chat with the bot - in which case you'll need to [share the bot with users](admin-share-bots.md).

## Prerequisites

- Your bot must be marked **Classic**, or it must be a bot you created in the Teams app.
- [Learn how to use and create flows](advanced-flow.md).
- [Publish your bot](publication-fundamentals-publish-channels.md).
- [Add your bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md).
- [Getting started with Power Automate](/power-automate/getting-started).
- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Known limitations

- You can't send proactive messages in Teams if you've created your bot [with the unified authoring canvas](unified-authoring-conversion.md#what-is-new-or-has-been-updated-in-the-latest-microsoft-copilot-studio).
- If the bot is disconnected and reconnected to Microsoft Teams, users won't receive proactive messages until after they re-install the bot.
- All proactive messages from Microsoft Copilot Studio are subject to [limits on Power Automate](/power-automate/limits-and-config#throughput-limits) and [throttling limits of the Microsoft Teams connector](/connectors/teams/#limits).
- Proactive messages won't be logged in conversation transcripts or [Analytics sessions](analytics-overview.md).
- Proactive messages must be in the same environment as the Power Automate flow.
- Proactive messages can only be posted to a personal chat with the bot.

## Send a proactive message

1. In Power Automate, open the flow that you want to send a proactive message. Add the Microsoft Teams connector action **Post message in a chat or channel**.

1. For **Post as**, choose **Microsoft Copilot Studio (Preview)**.

1. For **Post in**, choose **Chat with bot**.

1. For **Bot**, select the bot that you want the message to be sent from.

1. For **Recipient**, enter the recipient's name or email address. You can also use dynamic content if the recipient info comes from an earlier step in the flow.

1. For **Message**, enter the message you want to send.

    :::image type="content" source="media/advanced-proactive-message/proactive-message-node.png" alt-text="Post message action in Power Automate.":::

When the flow is run, the recipient will receive the proactive message from the bot in Microsoft Teams.

## Send a proactive Adaptive Card

> [!IMPORTANT]
> This section details how to send proactive Adaptive Cards with Power Automate flows. Proactive Adaptive Cards enables users to receive information from an _inactive_ conversation with a bot. To learn how to send Adaptive Cards in an _active_ conversation, see [Add Adaptive Cards with Composer](advanced-bot-framework-composer-example1.md).

In addition to sending proactive messages, you can also send proactive Adaptive Cards.

:::image type="content" source="media/advanced-proactive-message/proactive-card.png" alt-text="Screenshot of an adaptive card.":::

Adaptive Cards are an open card exchange format enabling developers to exchange UI content in a common and consistent way. You can author Adaptive Cards by hand in JSON, or if you prefer a drag-and-drop interface, you can use the [Adaptive Cards Designer](https://adaptivecards.io/designer/).

> [!NOTE]
> Power Automate does not support Adaptive Cards that use the [templating feature](/adaptive-cards/templating/).

In this example, you'll send an order summary card for the user to review.

1. In Power Automate, add the Microsoft Teams connector action **Post adaptive card in a chat or channel** at the step where you want to send card in your flow.

1. For **Post as**, choose **Microsoft Copilot Studio (Preview)**.

1. For **Post in**, choose **Chat with bot**.

1. For **Bot**, select the bot that you want the message to be sent from.

1. For **Recipient**, enter the recipient's name or email address. You can also use dynamic content if the recipient info comes from an earlier step in the flow.

1. For **Adaptive Card**, enter the following template JSON:

    ```json
    {
        "type": "AdaptiveCard",
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "version": "1.5",
        "body": [
            {
                "type": "TextBlock",
                "text": "Order summary",
                "wrap": true,
                "style": "heading"
            },
            {
                "type": "FactSet",
                "facts": [
                    {
                        "title": "Name",
                        "value": "John Doe"
                    },
                    {
                        "title": "Phone number",
                        "value": "(000) 000-0000"
                    }
                ]
            },
            {
                "type": "Container",
                "items": [
                    {
                        "type": "FactSet",
                        "facts": [
                            {
                                "title": "1x",
                                "value": "Steak"
                            },
                            {
                                "title": "2x",
                                "value": "Side Rice"
                            },
                            {
                                "title": "1x",
                                "value": "Soft Drink"
                            }
                        ],
                        "spacing": "Small"
                    }
                ],
                "spacing": "Small"
            }
        ]
    }
    ```

    :::image type="content" source="media/advanced-proactive-message/adaptive-card-node.png" alt-text="Post adaptive card action in Power Automate.":::

When the flow is run, the recipient will receive the Adaptive Card from the bot in Microsoft Teams.

### Wait for user response

> [!IMPORTANT]
> This section details how to send proactive Adaptive Cards with Power Automate flows. Proactive Adaptive Cards enables users to receive information from an _inactive_ conversation with a bot. To learn how to send Adaptive Cards in an _active_ conversation, see [Add Adaptive Cards with Composer](advanced-bot-framework-composer-example1.md).

Adaptive Cards support collecting user input. In these scenarios, you'll want to wait for the user's response before the flow continues.

:::image type="content" source="media/advanced-proactive-message/proactive-card-wait-for-response.png" alt-text="Screenshot of an adaptive card that contains actions for the user.":::

> [!NOTE]
> Power Automate does not support Adaptive Cards that use the [templating feature](/adaptive-cards/templating/).

In this example, you'll send an order confirmation card that allows the user to make changes before the order is submitted.

1. In Power Automate, add the Microsoft Teams connector action **Post adaptive card and wait for a response** at the step where you want to send card in your flow.

1. For **Post as**, choose **Microsoft Copilot Studio (Preview)**.

1. For **Post in**, choose **Chat with bot**.

1. For **Message**, enter the following template JSON:

    The properties in the `actions` section is what determines the options that are presented to the user.

    ```json
    {
        "type": "AdaptiveCard",
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "version": "1.0",
        "body": [
            {
                "type": "TextBlock",
                "text": "Order confirmation",
                "wrap": true,
                "style": "heading"
            },
            {
                "type": "FactSet",
                "facts": [
                    {
                        "title": "Name",
                        "value": "John Doe"
                    },
                    {
                        "title": "Phone number",
                        "value": "(000) 000-0000"
                    }
                ]
            },
            {
                "type": "Container",
                "items": [
                    {
                        "type": "FactSet",
                        "facts": [
                            {
                                "title": "1x",
                                "value": "Steak"
                            },
                            {
                                "title": "2x",
                                "value": "Side Rice"
                            },
                            {
                                "title": "1x",
                                "value": "Soft Drink"
                            }
                        ],
                        "spacing": "Small"
                    }
                ],
                "spacing": "Small"
            }
        ],
        "actions": [
            {
                "type": "Action.Submit",
                "title": "Submit Order"
            },
            {
                "type": "Action.Submit",
                "title": "Edit Order"
            }
        ]
    }
    ```

1. For **Update message**, enter the update message that the recipient will see after providing their response.

1. For **Recipient**, enter the recipient's name or email address. You can also use dynamic content if the recipient info comes from an earlier step in the flow.

1. For **Bot**, select the bot that you want the card to be sent from.

    :::image type="content" source="media/advanced-proactive-message/adaptive-card-wait-node.png" alt-text="Post adaptive card and wait for response action in Power Automate.":::

When the flow is run, the recipient will receive the adaptive card from the bot in Microsoft Teams that they can then provide a response to.

To use the response from the recipient, select **submitActionId** from the dynamic content flyout menu. The value of this variable will be the `title` of the action the user chose.

## Send proactive messages to multiple recipients

Depending on the scenario, you may want to send the same proactive message to multiple recipients.

This section contains examples for sending messages to multiple recipients.

> [!IMPORTANT]
> The prerequisites detailed in this topic apply to each recipient.  
>
> For example, you can send the same message to 10 recipients in one action. If three of the 10 recipients do not have the bot installed, then those three recipients won't receive the message.

### Send to teammates

In this example, the bot will send a reminder to the members of a team to complete their online training.

1. Add the **Microsoft Teams** connector and select the **Get a team** action in your Power Automate flow.

1. For **Team**, choose the team with the members that you want to send the message to.

1. Add the **Office 365 Groups** connector and select the **List group members** action.

1. For **Group Id**, select **Custom value**.

1. Select **Team ID** from the dynamic content of the **Get a team** action.

1. Add the **Microsoft Teams** connector and select the **Post message in a chat or channel** action.

1. For **Post as**, choose **Microsoft Copilot Studio (Preview)**.

1. For **Post in**, choose **Chat with bot**.

1. For **Bot**, select the bot that you want send the message.

1. For **Recipient**, select the dynamic content **User Principle Name** from the **List group members** action.

    :::image type="content" source="media/advanced-proactive-message/send-to-teammates.png" alt-text="Send to teammates example.":::

1. For **Message**, enter the message you want to send.

When the flow runs, each user in the team will receive the proactive message in a private chat with the bot.

### Send to a security group

In this example, the bot will send a reminder to a security group to complete their online training.

1. Add the **Microsoft Entra ID** connector and select the **Get group members** action in your Power Automate flow.

1. For **Group Id**, enter the security group's GUID.

1. Add the **Microsoft Teams** connector and select the **Post message in a chat or channel** action.

1. For **Post as**, choose **Microsoft Copilot Studio (Preview)**.

1. For **Post in**, choose **Chat with bot**.

1. For **Bot**, select the bot that you want send the message.

1. For **Recipient**, select the dynamic content **Group Members User Principle Name** from the **Get group members** action.

1. For **Message**, enter the message you want to send.

    :::image type="content" source="media/advanced-proactive-message/send-to-security-group.png" alt-text="Send to a security group option.":::

When the flow runs, each user in the security group will receive the proactive message in a private chat with the bot.

### Send proactive message to multiple recipients in parallel

Normally when sending a proactive message to multiple recipients, your bot will send one message after another. However in some situations it may be more ideal to send the message to multiple recipients at the same time.

> [!WARNING]
>   
> All proactive messages from Microsoft Copilot Studio are subject to [limits on Power Automate](/power-automate/limits-and-config#throughput-limits) and [throttling limits of the Microsoft Teams connector](/connectors/teams/#limits).
>
> If you are sending messages to a large group of recipients, you'll see errors if you hit the throttling limit. You can reduce the degree of parallelism, or reduce the number of recipients in the group.

1. In the **Apply to each** action, select the three horizontal dots (**. . .**) and then **Settings**.

    :::image type="content" source="media/advanced-proactive-message/node-settings.png" alt-text="Settings under the more options menu.":::

1. Turn on **Concurrency control** and set the degree of parallelism.

    :::image type="content" source="media/advanced-proactive-message/concurrency-control.png" alt-text="Slider control for setting the level or concurrency.":::

## Configure advanced options for proactive messages

Microsoft Copilot Studio allows you to control detail behavior on your bot under **Show advanced options** in the Microsoft Teams connector.

:::image type="content" source="media/advanced-proactive-message/advanced-options.png" alt-text="Expanded options pane in the connector.":::

### Label sent message as a notification

**Label as notification** controls whether the message will have the text "Notification via" in front of the bot's name. Labeling the bot's response allows the recipient to identify the bot's response to their inquiry.

:::image type="content" source="media/advanced-proactive-message/message-label.png" alt-text="The setting shows Notification via bot name.":::

### When the recipient is currently in an active chat with the bot

Sometimes the bot might be sending a proactive message when the recipient is in an active conversation with the bot.

You might want to postpone sending the proactive message until they have finished their conversation to not disrupt the conversation flow.

The **If chat is active** box allows you to control the behavior:

- **Send:** the bot will send the proactive message as normal.

- **Don't send and succeed:** the bot won't send the proactive message when the recipient is in an active conversation. Status code **300** will be returned.

- **Don't send and fail:** the bot won't send the proactive message when the recipient is in an active conversation. The flow run will be marked as a failure.

### When the recipient hasn't installed the bot

The bot can only deliver messages to recipients who have installed the bot in Microsoft Teams. Recipients may not want to install the bot or have uninstalled the bot.

For lower importance messages, you can set the flow run to be marked as succeeded even when the recipient doesn't have the bot installed.

The **If bot not installed** box allows you to control the behavior:

- **Fail:** the flow run will be marked as a failure when the recipient hasn't installed the bot in Microsoft Teams.

- **Succeed with status code:** the flow run will be marked as succeeded even though the recipient can't receive the message because they haven't installed the bot. Status code **100** will be returned.

### Status code definition

You can use the returned status code to define different follow-up behaviors in your flow. For example, you could specify that the flow should try again over a period of time or log a record about the failure.

| Status code | Succeeded (boolean) | Description                                                                                    |
| ----------- | ------------------- | ---------------------------------------------------------------------------------------------- |
| 200         | True                | Message is successfully delivered.                                                             |
| 100         | False               | Message couldn't be delivered because the recipient doesn't have the bot installed.            |
| 300         | False               | Message couldn't be delivered because the recipient is in an active conversation with the bot. |

[!INCLUDE[footer-include](includes/footer-banner.md)]
