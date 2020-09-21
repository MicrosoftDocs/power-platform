---
title: "Create conversational chatbots in Teams"
description: "Create a new bot in the Power Virtual Agents app in Microsoft Teams."
keywords: "PVA, create"
ms.date: 8/3/2020
ms.service: dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: onboarding, ceX, teams
ms.collection: virtual-agent
---

# Create and delete Power Virtual Agents bots in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../authoring-first-bot.md)
> - [Power Virtual Agents app in Microsoft Teams)](authoring-first-bot-teams.md)

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer-teams.md)]

You can create chatbots in the Power Virtual Agents app in Teams and then share them with other people in your team, company, or organization.

The very first step is to add the Power Virtual Agents app. Then you can create bots.

>[!NOTE]
>You can only see bots in the version of Power Virtual Agents where you created them.  
>This means if you create a bot with the Power Virtual Agents app in Microsoft Teams, you will not see the bot in the web app of Power Virtual Agents at https://powerva.microsoft.com.


## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]


## Add the Power Virtual Agents app in Microsoft Teams

1. Select **Apps** at the bottom of the navigation pane in Microsoft Teams

    :::image type="content" source="media/first-bot-teams-apps.png" alt-text=" ":::

2. In the search box, type *power virtual agents* and then select the tile that appears. Select **Add for me** in the description window that pops up. This adds the app to the navigation panel.

    :::image type="content" source="media/first-bot-add-app.png" alt-text=" ":::

3. To make it easier to get back to, right click on the Power Virtual Agents icon and select **Pin**.

    :::image type="content" source="media/first-bot-pin.png" alt-text=" ":::


## Create a bot


When you create a bot, it has to go into a team - everyone in that team will be able to see and use the bot (but you can share it with people in other teams later on). If you want other people to have access to edit the bot, you need to [add them to your team](admin-share-bots-teams.md#share-bots).

All bots have to belong to a team. You can [create a new team](/MicrosoftTeams/get-started-with-teams-create-your-first-teams-and-channels#create-a-team) if necessary, before you add a bot to it.

The first time you create a bot in a team, it will take 1 to 10 minutes to build the necessary systems in the backend, but every bot after that will take much less time (around 1 or 2 minutes).

If you delete a bot



1. Select the **Power Virtual Agents** icon to open the app.
2. You can create a new bot two ways:
   - Select **Start now** and then choose the team you want to use.
   - Go to the **Chatbots** tab, select the team you want to use, and then **New chatbot**.

    If this is the first time a bot is being created in your team, you'll see a notice explaining that it will take some time (this could take from 1 to 10 minutes):
   
   :::image type="content" source="media/first-bot-delay.png" alt-text=" ":::

   >[!NOTE]
   >If you were just recently added to a team that already has a bot, you may still see this message as Microsoft Teams is still adding you to the team. You should wait 15 minutes and then create your bot.


1. Select **Create** to begin the initial bot-building process for your team, which can take a few minutes.

   You can close the loading window, the bot creation process will continue in the background.

1. After the building process is finished, you can create a bot in your team. In the list of teams, select your team and then **New chatbot** to make your bot.

   :::image type="content" source="media/first-bot-name.png" alt-text=" ":::




## Delete a bot

You can delete bots to remove them from your team. 

1. Click the settings cog icon at the bottom of the Power Virtual Agents side navigation pane.

    :::image type="content" source="media/settings-cog.png" alt-text="The settings icon is at the bottom of the side navigation pane and looks like a cog or gear":::

2. On the **General** tab, select **Delete bot**.

You'll be asked to confirm the deletion of the bot by entering the bot's name, after which all bot content is immediately deleted.



