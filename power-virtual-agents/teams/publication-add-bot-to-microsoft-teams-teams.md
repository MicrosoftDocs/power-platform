---
title: "Add a chatbot to Microsoft Teams in Teams"
description: "Connect your bot to a Microsoft Teams channel so people in your organization can interact with it."
keywords: "Publish, channel, Microsoft Teams, Teams"
ms.date: 8/3/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, authoring, ceX"
ms.collection: virtual-agent
---

# Add bot to Microsoft Teams in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Web service (https://powerva.microsoft.com)](../publication-add-bot-to-microsoft-teams.md)
> - [Teams (online or app)](publication-add-bot-to-microsoft-teams-teams.md)

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer-teams.md)]

After you've built a bot, you'll want people to use it.

The first step is to publish the bot, this makes it available to everyone in your orgnization as an app that they can find in the Teams app store.

You can customize the way the bot looks on the Teams app store, and you can look at how other people have built their bots.


## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]



## Publish a bot

When you publish a bot, you make it available for people in your organization to install it into their Teams. Whenever you make updates to your bot and publish it, those updates will be reflected in everyone's copy of the bot.

>[!IMPORTANT]
>Make sure to **Publish** your bot if you make changes - otherwise everyone that is using the bot won't see your updates.  
>It typically takes 15 minutes for published changes to be seen by everone.


:::image type="content" source="media/" alt-text=" ":::
publish-share-to-store:::image type="content" source="media/" alt-text=" ":::


:::image type="content" source="media/publish-share-to-store.png" alt-text=" ":::



1. Go to the **Chatbot** tab.

    :::image type="content" source="media/publish-chatbot-tab-on-homepage.png" alt-text="Alt text here.":::

3. Open the bot you want to publish.
3. On the bot's homepage, select **Publish bot**. Select **Publish** and then **Publish** again.

    :::image type="content" source="media/publish-option.png" alt-text="Alt text here.":::


4. Select **Open the bot** to have it go to the Teams app store, where it will automatically find and open the bot you just created. Click **Add for me** to have it added as an app in Teams. Note that this only shows the bot for you.


5. Select **Make the bot available to others** if you want to share it with other people.

    This pops up a new window where you can customize how the bot will be shown to people searching for it on the Teams app store. 
    You can also get a link to share directly with other people who want to use this bot: just select **Copy link**.

6. Select **Edit details** to change the bot's icon, color, and descriptions. These will be shown in the search results in the Teams app store.

    :::image type="content" source="media/publish-share-to-store.png" alt-text=" ":::

7. Select **More** to add additional information:  
    - Developer name  
    - Website
    - Privacy Statement
    - Terms of use

   See the [Privacy statement and terms of use](publication-terms-of-use-teams.md) topic for more details and examples.

8. Select Save to return to screen where you can make your bot available in Teams. You'll see your updates to the color, icon, and description are shown.
9. Select **Make available in Teams** and then choose who can find and use your bot. By default this is everyone on your team. You can also go to the security settings to make additional changes.

This allows other people in your Team to use your bot - but they can't edit or change the topics or answers. They can add the bot as an app by searching for it in the Teams app store, and they can see the list of topics and analytics for the bot, but they won't be able to edit anything.

>[!WARNING]
> or can they? can they only choose between team and org?





## Remove your bot from Microsoft Teams

You can remove the bot from your list of apps if you no longer want to use it. This doesn't delete the bot from the Power Virtual Agents app, it just means you can't access the bot as a separate app.

1. Right-click the bot's app icon.

2. Select **Uninstall** and then select **Delete**.

   ![Delete Microsoft Teams channel](media/channel-teams-delete-channel-teams.png)


>[!WARNING]
>Does this still apply - the updating after 30 minutes etc?
   
## Updating bot content for existing conversations on Teams

To prevent disruptions during a chat between a user and the bot, existing conversations will not be updated to the latest bot content immediately after a new publish. Instead, the content will be updated after the conversation has been idle for 30 minutes. 

New conversations between user and the bot will have the latest published bot content.


