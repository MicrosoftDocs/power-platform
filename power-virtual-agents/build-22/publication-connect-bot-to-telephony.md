---
ROBOTS: NOINDEX,NOFOLLOW
title: Connect your bot to Telephony
description: Connect your bot to the Telephony channel to interact with users over the phone.
ms.date: 05/31/2022
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.reviewer: mivakoc
ms.custom: "publication, ceX"
ms.collection: virtual-agent
---

# Connect your bot to Telephony

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

Customers often prefer to pick up the phone when they interact with an organization. With the Telephony channel, you can connect your bot to your [Azure Communication Services](/azure/communication-services/) phone number to enable customers to interact with it over the phone.

## Prerequisites

- [Publish your bot](publication-fundamentals-publish-channels.md)

## Connect your bot to Telephony

1. With your bot open for editing, in the left side panel under **Settings**, select **Channels**.

1. Select the **Telephony (Preview)** tile.

    :::image type="content" source="media/publication-connect-bot-to-telephony/telephony-tile.png" alt-text="Screenshot of selecting the Telephony channel in Power Virtual Agents.":::

1. Select **Connect existing phone number**.

1. Select an **Azure Subscription** and **Azure Communication Services resource**, and then select **Select**.

    :::image type="content" source="media/publication-connect-bot-to-telephony/choose-resources.png" alt-text="Screenshot of selected Azure resources.":::

1. Under **Phone number type**, select **PTSN**.

    > [!IMPORTANT]
    > The **Direct routing** option is not supported in the technology preview.

1. Under **PTSN phone numbers**, select the first number in the list, and then select **Connect**.

    > [!IMPORTANT]
    > Phone numbers have been been provisioned for the technology preview. Normally, you'll need to do this yourself in [Azure Communication Services](/azure/communication-services/).

    :::image type="content" source="media/publication-connect-bot-to-telephony/connect-number.png" alt-text="Screenshot of selected phone number.":::

1. [Publish your bot](publication-fundamentals-publish-channels.md#publish-the-latest-bot-content) and test it by calling the number you selected.

To customize how your bot speaks, learn [how to use Speech Synthesis Markup Language](advanced-custom-speech-ssml.md) and [change your bot's voice font](advanced-speech-settings.md).

## Disconnect your bot from Telephony

Only one bot can be connected to a phone number. If you want to connect a different bot to the same phone number, you'll need to disconnect the old one first.

1. In the left side panel under **Settings**, select **Channels**.

1. Select the **Telephony (Preview)** tile.

1. Select **Disconnect**.

    :::image type="content" source="media/publication-connect-bot-to-telephony/disconnect-bot.png" alt-text="Screenshot of the Telephony channel, with the Disconnect button highlighted.":::
