---
title: "Add a chatbot to Microsoft Teams in Teams"
description: "Connect your bot to a Microsoft Teams channel so people in your organization can interact with it."
keywords: "Publish, channel, Microsoft Teams, Teams"
ms.date: 8/3/2020
ms.service: dynamics-365-ai
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
> - [Power Virtual Agents web app (https://powerva.microsoft.com)](../publication-add-bot-to-microsoft-teams.md)
> - [Power Virtual Agents app in Microsoft Teams](publication-add-bot-to-microsoft-teams-teams.md)

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer-teams.md)]

After you've built a bot, you'll want people to use it.

Now that you have published your bot, you can make your bot show up in Microsoft Teams so you, your teammates and the broader organization can interact with it. You need to [publish the bot at least once](publication-fundamentals-publish-channels-teams.md) before users can interact with the bot in Microsoft Teams. All bots created in the Power Virtual Agents app in Microsoft Teams are already connected to the Microsoft Teams channel.

You can:
- Install your bot in Microsoft Teams and share a direct installation link with others
- Share the bot with your team by adding it to Microsoft Teams app store **Built by your colleagues** section
- Share the bot with the organization by submitting the bot for admin approval to be featured in the Microsoft Teams app store **Published by your org** section
- Download the pre-generated Teams app manifest to distribute it within your Microsoft Teams tenant



## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]
- Your organization’s [Microsoft Teams app permission policies](/microsoftteams/teams-app-permission-policies) will need to allow Power Platform apps to be added to teams before you or other users can find and add your bot to Microsoft Teams.
- Before installing the bot for yourself or sharing the bot with others, you should [publish the bot at least once](publication-fundamentals-publish-channels-teams.md).


## Install a bot as an app in Microsoft Teams



When you publish a bot, you make it available for people in your organization to install it into their team. Whenever you make updates to your bot and publish it, those updates will be reflected in everyone's copy of the bot.

You can then add the bot to your own version of Microsoft Teams directly from the Power Virtual Agents app, or you can get a link to share with other team members so they can add it to their Microsoft Teams apps.

>[!IMPORTANT]
>New content in a freshly published bot won't appear in conversations that are currently ongoing. After 30 minutes of idle time, the bot will be updated.  
>You can type *Start over* in an existing conversation to start a new conversation right away and see the latest updates to the bot.

You should add your bot to your own version of Teams before sharing it with others.

>[!IMPORTANT]
>Make sure to **Publish** your bot if you make changes - otherwise everyone that is using the bot won't see your updates.  
>It typically takes 15 minutes for published changes to be seen by everyone.

**Add the bot for yourself:**

1. Go to the **Chatbot** tab.

    :::image type="content" source="media/publish-chatbot-tab-on-homepage.png" alt-text="Alt text here.":::

1. Open the bot you want to publish.

1. On the side navigation pane, select **Publish**. 

    :::image type="content" source="media/publish-option.png" alt-text="Alt text here.":::

1. Select **Open bot** to have it go to the Teams app store, where it will automatically find and open the bot you just created. Select **Add for me** to have it added as an app in Teams. This only shows the bot for you.


**Share a link so others can add the bot:**



1. Go to the **Chatbot** tab.

    :::image type="content" source="media/publish-chatbot-tab-on-homepage.png" alt-text="Alt text here.":::

2. Open the bot you want to publish.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot** 

    This pops up a new window where you can customize how the bot will be shown to people searching for it on the Teams app store. 

    :::image type="content" source="media/publish-teams-share-flyout.png" alt-text=" ":::


    >[!IMPORTANT]
    >Only users who can access the bot can use the installation link to install the bot. You can configure who access it in the [security settings](configuration-security-teams.md) for the bot.

    1. Select **Edit details** to change the bot's icon, color, and descriptions. These will be shown in the search results in the Microsoft Teams app store.

        :::image type="content" source="media/publish-share-to-store.png" alt-text=" ":::

        >[!IMPORTANT]
        >Updates to the bot's icon and color may take up to 24 hours to show on bots that are already published and shared.

    2. Select **More** to add additional information:  
        - Developer name
        - Website
        - Privacy Statement
        - Terms of use

       You should provide this information to keep your user informed about the bot. See the [Privacy statement and terms of use](publication-terms-of-use-teams.md) topic for more details and examples.

    3. Select **Save** to return to the screen where you can make your bot available in Teams. You'll see your updates to the color, icon, and description are shown.

5. Select **Copy link** and send it to other people who want to use the bot.



## Share the bot with your Team

Once you've published your bot, you can share it with other Microsoft Teams users so they can find it in the Microsoft Teams app store. You can share it with just your team, or with your entire organization (with admin approval).


### Add the bot to the Built by your colleagues section

You can share your bot with your team by adding it to the Microsoft Teams app store, **Built for *your-organization-name*** > **Built by your colleagues** section. Only your teammates will find the bot there.

:::image type="content" source="media/publish-teams-your-colleagues.png" alt-text=" ":::

1. Go to the **Chatbot** tab.

2. Open the bot you want to publish.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot**.

5. Select **Add to Teams**. This will automatically add the bot to the **Built by your colleagues** section, and will show a green label **Added to Teams**.

:::image type="content" source="media/publish-teams-share-flyout-added.png" alt-text=" ":::

### Remove the bot from the Built by your colleagues section


You can remove the bot from showing in the **Built by your colleagues** section. This does not impact users who have already installed the bot.


1. Go to the **Chatbot** tab.

2. Open the bot you want to publish.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot**.

5. Select **Remove**. This option only appears if you've already added the bot to the **Built by your colleagues** section.

:::image type="content" source="media/publish-teams-share-flyout-remove.png" alt-text=" ":::

## Share the bot with your organization


You can share the bot with your organization by submitting your bot for admin approval to be featured in the **Built for *your-organization-name*** > **Built by your org** section.


:::image type="content" source="media/publish-teams-your-org.png" alt-text=" ":::


Admins can also [preinstall and pin the bot](/microsoftteams/teams-app-setup-policies) for users in the organization so they can access it directly from their left app bar in Microsoft Teams.  


Before submitting the bot to your organization, make sure:

- Your bot is ready for release and in compliance with company standards, rules and policies.
- You coordinate with your teammates: once the bot have been submitted it can't be re-submitted by a different user until the previous submission is approved or rejected by an admin.
- You have removed the bot, if applicable, from the **Built by your colleagues** section. Submitting your bot for admin approval could result in your bot showing up in two places. See the instructions on [removing your bot](#remove-the-bot-from-the-built-by-your-colleagues-section) for details. 

>[!NOTE]
>Once a bot is approved by an admin, the bot availability in the **Built by your org** section will be completely managed by your admin. Only an admin can remove the bot from the **Built by your org** section.


### Submit for the Built by your org section

1. Go to the **Chatbot** tab.

2. Open the bot you want to publish.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot**.

5. Confirm the bot is not shared with your team. Select **Remove** if it says **Added to Teams**.

6. Select **Submit for admin approval**.

7. Review the requirements for submission, and select **Submit for admin approval**.

8. You will be asked if you want to make any last [updates to your bot information](#install-a-bot-as-an-app-in-microsoft-teams). Once you've confirmed everything is correct, select **Submit for admin approval**

    >[!NOTE]
    >Make sure you review the content and it's ready for an admin to review. You will need to submit new requests to the admin to update the icon and descriptions for bots that were previously approved.  
    >Once approved, all new and existing users of the bot in Teams will receive the update.  
    >This only applies to the bot details. You can continue to make content updates to your bot by publishing the latest content without needing to re-submit to admin.

9. A final confirmation prompt will appear. Select **Yes** to continue. The bot will be sent to your admin [for them to approve it](/microsoftteams/submit-approve-custom-apps#validate), and you will see a note indicating the status of your submission.

    :::image type="content" source="media/publish-share-submit-status.png" alt-text=" ":::

    >[!NOTE]
    >After submitting the bot for admin approval, you should not change the bot’s access setting to be less than everyone in your organization.  
    >This will result in users in the organization unable to chat with the bot after installing it from the Microsoft Teams app store **Built by your org** section.

10. You will need to wait for your admin’s approval.  You can check the latest status by selecting **Refresh**, or opening the **Share the bot** window from the **Publish** page.

11. After your admin approves the bot, the status will be updated to **Approved**. You can directly open the bot and share the approved version’s link with other users.



#### Download the bot’s Teams app manifest (advanced)

You can download the bot’s Teams app manifest to make detail changes to the manifest directly and share with your admin or users in the tenant. 


1. Go to the **Chatbot** tab.

2. Open the bot you want to publish.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot**.

5. Confirm the bot is not shared with your team. Select **Remove** if it says **Added to Teams**.

6. Select **Submit for admin approval**.
 
7. Select **Download manifest**.

8. You will be asked if you want to make any last [updates to your bot information](#install-a-bot-as-an-app-in-microsoft-teams). Once you've confirmed everything is correct, select **Download manifest**.

9. The manifest will be generated as a .zip file, and will be saved according to your browser's save settings.


## Uninstall the bot from the side navigation bar

You can remove the bot from your list of apps if you no longer want to use it. This doesn't delete the bot from the Power Virtual Agents app, it just means you can't access the bot as a separate app.

1. Right-click the bot's app icon.

2. Select **Uninstall** and then select **Delete**.

   ![Uninstall the bot](media/channel-teams-delete-channel-teams.png)

## Disconnect your bot from Teams

You can take your bot offline so users can no longer chat with the bot in Teams. This means the bot won't respond to anyone who tries to chat with it, and will disrupt anyone who is using the bot. You should thoroughly consider the need to disconnect your bot before you do so.

For bots that are shared with a teammate, they will no longer find the bot in the Microsoft Teams app store **Built by your colleague** section or be able to install it from the shared link. Bots that are added by users in Microsoft Teams will continue to exist until the user [uninstalls the bot](#uninstall-the-bot-from-the-side-navigation-bar).


For bots that are shared with the organization, the bots will continue to be shown in the Microsoft Teams app store **Built by your org** section.  You will need to contact your admin to remove the bot.


1. Go to the **Chatbot** tab.

1. Open the bot you want to publish.

1. On the side navigation pane, select **Publish**.

1. Select **Share the bot**.

1. Select **Disconnect bot from Teams**.

1. Review the information about disconnecting your bot, and select **Disconnect** to continue.

You can always reconnect your bot after disconnecting by selecting **Turn on Teams** in the **Share the bot** window on the **Publish** page.







   





