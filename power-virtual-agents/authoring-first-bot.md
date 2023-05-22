---
title: "Create conversational chatbots"
description: "You can easily create new bots using the bot-builder wizard in Power Virtual Agents."
keywords: "PVA"
ms.date: 03/24/2023
ms.topic: article
author: KendalBond007
ms.author: iawilt
manager: leeclontz
ms.custom: onboarding, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and delete Power Virtual Agents bots

To help get you started and tailor the bot to your specific needs, Power Virtual Agents lets you create a bot using built-in content building blocks containing topics, trigger phrases, and pre-authored bot conversations.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/web)

You can only see bots in the version of Power Virtual Agents where you created them.  

This means if you create a bot with the Power Virtual Agents app in Microsoft Teams, you will not see the bot in the web app of Power Virtual Agents at https://web.powerva.microsoft.com.

> [!WARNING]
> New bots are configured with "No authentication" and without [web channel security](configure-web-security.md), and can be accessed by anyone with a link to it. Ensure you have the right [authentication](configuration-end-user-authentication.md), [access](configuration-end-user-authentication.md), and [security](configure-web-security.md) configurations set for your particular usage.

### Create a bot

> [!NOTE]
> If this is your first time creating a bot in Power Virtual Agents, please see [Create your first bot](fundamentals-get-started.md)

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/).

1. In the navigation menu select **Create**. You can also select **Home** then select **Create a bot**.

1. Choose the type of bot you want to create:

    - Use **Build for production** to create production bots that are intended to be deployed to your customers.

    - Use **Try the unified canvas (preview)** to test out the new authoring features in preview. These preview bots are supported in English only and aren't recommended for deploying for customer use.

    > [!IMPORTANT]
    > If you choose to create a preview bot, please refer to the [preview documentation](overview-preview.md).

1. For **Name your bot**, enter a name for your bot.

1. For **What language will your bot speak**, select the language you want your bot to speak.

1. Select **Create**.

### Delete a bot

You can delete bots to remove them from your environment.

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/).

1. In the navigation menu, select **Chatbots**. Select the bot you want to delete, then select **Delete**.

    :::image type="content" source="media/authoring-first-bot/delete-bot.png" alt-text="General settings." border="false":::

1. You'll be asked to confirm the deletion of the bot by typing the bot's name. Once you confirm, all bot content will be deleted after a few minutes.

If your license has expired, you can delete your bot(s) by selecting **Permanently delete your bots**.

### Known issues with creating a bot

When you are creating your bot, you might encounter the following issues.

### Insufficient permissions for the selected environment

In this case, you see this error: "You do not have permissions to any environments. Please get access from an administrator."

You will need to [create a new environment](environments-first-run-experience.md). Use that environment to create your bot.

# [Teams](#tab/teams)

You can create chatbots in the Power Virtual Agents app in Teams and then share them with other people in your team, company, or organization.

The very first step is to add the Power Virtual Agents app. Then you can create bots.

> [!NOTE]
> You can only see bots in the version of Power Virtual Agents where you created them.  
>
> This means if you create a bot with the Power Virtual Agents app in Microsoft Teams, you will not see the bot in the web app of Power Virtual Agents at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com).


### Add the Power Virtual Agents app in Microsoft Teams

1. Select **Apps** at the bottom of the side pane in Microsoft Teams

    :::image type="content" source="media/authoring-first-bot-teams/first-bot-teams-apps.png" alt-text="Screenshot of the apps icon in the Teams side navigating bar.":::

1. In the search box, type _power virtual agents_ and then select the tile that appears. Select **Add for me** in the description window that pops up. This adds the app to the side pane.

    :::image type="content" source="media/authoring-first-bot-teams/first-bot-add-app.png" alt-text="Screenshot of the app search box.":::

1. To make it easier to get back to, select and hold (or right-click) the Power Virtual Agents icon and select **Pin**.

    :::image type="content" source="media/authoring-first-bot-teams/first-bot-pin.png" alt-text="Screenshot of the popup menu with options to learn about the app, pin it, or uninstall it.":::

### Create a bot

When you create a bot, it has to go into a team - everyone in that team will be able to see and use the bot (but you can share it with people in other teams later on). If you want other people to have access to edit the bot, you need to [add them to your team](admin-share-bots.md).

All bots have to belong to a team. You can [create a new team](/MicrosoftTeams/get-started-with-teams-create-your-first-teams-and-channels#create-a-team) if necessary, before you add a bot to it.

> [!IMPORTANT]
> You can't create a bot in a hidden membership team (a team where members can't see the details of other members). If you try to do so, you'll see an error message, and you'll need to create your bot in another team that doesn't have the [hiddenmembership](/graph/api/resources/group?view=graph-rest-1.0&preserve-view=true#group-visibility-options) setting.

The first time you create a bot in a team, it will take 1 to 10 minutes to build the necessary systems in the backend, but every bot after that will take much less time (around 1 or 2 minutes).

1. Select the **Power Virtual Agents** icon to open the app.
1. You can create a new bot two ways:
   - Select **Start now** and then choose the team you want to use.
   - Go to the **Chatbots** tab, select the team you want to use, and then **New chatbot**.

    If this is the first time a bot is being created in your team, you'll see a notice explaining that it will take some time (this could take from 1 to 10 minutes):

   :::image type="content" source="media/authoring-first-bot-teams/first-bot-delay.png" alt-text="Screenshot of a message that says 'You're the first person to create a bot in this team. We'll need to do some setting up, so loading time will be a little longer than usual'.":::

   > [!NOTE]
   > If you were just recently added to a team that already has a bot, you may still see this message as Microsoft Teams is still adding you to the team. You should wait 15 minutes and then create your bot. You should also wait for 15 minutes before finding the team in the **Chatbots** tab.

1. Select **Create** to begin the initial bot-building process for your team, which can take a few minutes.

   You can close the loading window, the bot creation process will continue in the background.

1. After the building process is finished, you can create a bot in your team. In the list of teams, select your team and then **New chatbot** to make your bot.

   :::image type="content" source="media/authoring-first-bot-teams/first-bot-name.png" alt-text="Screenshot of the create a new bot window.":::

### Delete a bot

You can delete bots to remove them from your team. In the navigation menu, under **Settings**, select **Details**. Then select **Delete**.

:::image type="content" source="media/authoring-first-bot-teams/delete-bot.png" alt-text="Screenshot of the delete bot button.":::

You'll be asked to confirm the deletion of the bot by entering the bot's name, after which all bot content is immediately deleted.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
