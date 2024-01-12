---
title: "Create and delete Microsoft Copilot Studio copilots"
description: "You can easily create new copilots using the copilot-builder wizard in Microsoft Copilot Studio."
keywords: "PVA"
ms.date: 12/28/2023
ms.topic: article
author: KendalBond007
ms.author: iawilt
manager: leeclontz
ms.custom: onboarding, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
searchScope: "Power Virtual Agents"
---

# Create and delete Microsoft Copilot Studio copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Copilot Studio lets you create a copilot, using built-in content building blocks containing topics, trigger phrases, and preauthored copilot conversations.

>[!NOTE]
> Bots created in the web app and in Microsoft Teams come with authentication pre-configured to use **Only for Teams and Power Apps** authentication.

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).

## Prerequisites

[Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

To create your first copilot, see [Quickstart: Create and deploy a Microsoft Copilot Studio copilot](fundamentals-get-started.md).

# [Web app](#tab/web)

If you create a copilot with the Copilot Studio app in Microsoft Teams, you won't see the copilot in the [web app of Copilot Studio](https://web.powerva.microsoft.com).

New copilots created in the web app and in Teams are configured with **Only for Teams and Power Apps** authentication.

### Create a copilot

1. Go to the [Microsoft Copilot Studio home page](https://web.powerva.microsoft.com/).

1. Select **+ New copilot** from the **Copilots** page, or select **Home** then choose **+ Create a copilot**.

1. For **Copilot name**, enter a name for your copilot.

1. For **What language do you want your copilot to speak?**, select the language you want your copilot to speak. For more information, see [Supported languages](authoring-language-support.md).

1. Select **Create**.

### Delete a copilot

You can delete copilots to remove them from your environment.

1. Go to the [Microsoft Copilot Studio home page](https://web.powerva.microsoft.com/).

1. In the navigation menu, select **Copilots**.
1. Select the copilot you want to delete, then select **Delete** at the top. Alternatively, select the `...` of the copilot you want to delete then select **Delete** from the dropdown menu.

    :::image type="content" source="media/authoring-first-bot/select-delete-copilot.png" alt-text="Screenshot that shows where to delete your copilot." lightbox="media/authoring-first-bot/select-delete-copilot.png":::

1. Confirm the deletion of the copilot by typing the copilot's name. Once you confirm, all copilot content will be deleted after a few minutes.

If your license is expired, you can delete your copilot(s) by selecting **Permanently delete your copilots**.

### Known issues with creating a copilot

When you're creating your copilot, you might encounter these issues.

#### Insufficient permissions for the selected environment

You might this error: "You don't have permissions to any environments, Get access from an administrator." To resolve the error, [create a new environment](environments-first-run-experience.md). Use that environment to create your copilot again.

For more information about troubleshooting, see [Error codes: Microsoft Copilot Studio](error-codes.md).

# [Teams](#tab/teams)

You can create chatbots in the Microsoft Copilot Studio app in Teams and then share them with other people in your team, company, or organization. Bots created in Teams are all **classic** bots, using older versions of Copilot Studio.

The first step is to add the Copilot Studio app. Then you can create bots.

> [!NOTE]
> If you create a bot with the Copilot Studio app in Teams, you won't see the bot in the web app of Copilot Studio at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com).

### Add the Microsoft Copilot Studio app in Microsoft Teams

1. Select **Apps** at the bottom of the side pane in Microsoft Teams

    :::image type="content" source="media/authoring-first-bot-teams/first-bot-teams-apps.png" alt-text="Screenshot of the apps icon in the Teams side navigating bar.":::

1. In the search box, type _power virtual agents_ and then select the tile that appears. Select **Add for me** in the description window that pops up to add the app to the side pane.

    :::image type="content" source="media/authoring-first-bot-teams/first-bot-add-app.png" alt-text="Screenshot of the app search box.":::

1. To make it easier to get back to, select and hold (or right-click) the Microsoft Copilot Studio icon and select **Pin**.

    :::image type="content" source="media/authoring-first-bot-teams/first-bot-pin.png" alt-text="Screenshot of the popup menu with options to learn about the app, pin it, or uninstall it.":::

### Create a bot

When you create a bot, it must belong to a team. Everyone in that team can see and use the bot. You can share your bots with people in other teams after creation. If you want other people to edit the bot, [add them to your team](admin-share-bots.md).

You can [create a new team](/MicrosoftTeams/get-started-with-teams-create-your-first-teams-and-channels#create-a-team), if necessary, before you add a bot to it.

> [!IMPORTANT]
> You can't create a bot in a hidden membership team. Hidden membership is where members can't see the details of other members. If you try adding a bot to a hidden team, you see an error message.
>
> For more information about hidden membership, see [Group visibility options](/graph/api/resources/group#group-visibility-options).

The first time you create a bot in a team, it takes 1 to 10 minutes to build the necessary systems in the backend. Every bot you create after your first bot takes only 1 or 2 minutes to create.

1. Select the **Power Virtual Agents** icon In Teams to open the Microsoft Copilot Studio app.

1. You can create a new bot in one of two ways:
   - Select **Start now**, then choose the team you want to use.
   - From the **Copilots** tab, select a team to use, then choose **New copilot**.

   > [!NOTE]
   > If you were recently added to a team that already has a bot, you might see a message about it, since Teams is still adding you to the team. If so, create your bot in 15 minutes. Seeing a new team appear in the **Copilots** tab might also take 15 minutes.

1. Give your copilot a name and choose a language.

   :::image type="content" source="media/authoring-first-bot/create-new-bot-screen.png" alt-text="Screenshot that shows the Create a copilot window." lightbox="media/authoring-first-bot/create-new-bot-screen.png":::

1. Select **Create** to begin the initial bot-building process for your team, which can take a few minutes.

   You can close the loading window, the bot creation process continues in the background.

### Delete a bot

You can delete bots to remove them from your team.

1. Open your copilot.

1. Under **Settings**, select **Details**.

1. Select **Delete**.

   :::image type="content" source="media/authoring-first-bot-teams/delete-bot.png" alt-text="Screenshot of the deleted bot button.":::

1. Confirm the deletion of the bot by entering the bot's name.

   All bot content is immediately deleted.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
