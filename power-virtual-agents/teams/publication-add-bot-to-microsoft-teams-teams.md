---
title: "Publish your chatbot with the Power Virtual Agents app in Microsoft Teams"
description: "Publish and share your bot with teammates in your teams and across your organization."
keywords: "Publish, channel, Microsoft Teams, Teams"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, authoring, ceX, teams"
ms.collection: virtual-agent
---

# Add bot to Microsoft Teams in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../publication-add-bot-to-microsoft-teams.md)
> - [Power Virtual Agents app in Microsoft Teams](publication-add-bot-to-microsoft-teams-teams.md)



After you've built a bot, you'll want people to use it.

Now that you have published your bot, you can make your bot show up in Microsoft Teams so you, your teammates and the broader organization can interact with it. You need to [publish the bot at least once](publication-fundamentals-publish-channels-teams.md) before users can interact with the bot in Microsoft Teams. 

You can:
- Install your bot in Microsoft Teams and share a direct installation link with others
- Share the bot with your team by adding it to Microsoft Teams app store **Built by your colleagues** section
- Share the bot with the organization by submitting the bot for admin approval to be featured in the Microsoft Teams app store **Published by your org** section
- Download the pre-generated Teams app manifest to distribute it within your Microsoft Teams tenant



## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]
- Your organization's [Microsoft Teams app permission policies](/microsoftteams/manage-power-platform-apps) will need to allow Power Platform apps to be added to Microsoft Teams before you or other users can directly install the bot in Microsoft Teams or find it in the Microsoft Teams app store **Built by your colleagues** section.  
    Bots that are approved for the **Built by your organization** section (after submission to an admin) are managed separately by admins in the Microsoft Teams admin center's [Manage apps page](/microsoftteams/submit-approve-custom-apps#validate).
- Before installing the bot for yourself or sharing the bot with others, you should [publish the bot at least once](publication-fundamentals-publish-channels-teams.md).


## Install a bot as an app in Microsoft Teams



After you have published a bot, you and people in your organization can install to chat with it in Microsoft Teams. Whenever you make updates to your bot and publish it, those updates will be reflected in everyone's copy of the bot.

You can add the bot to your own version of Microsoft Teams directly from the Power Virtual Agents app, or you can get a link to share with other team members so they can add it to chat with it in Microsoft Teams.

>[!IMPORTANT]
>New content in a freshly published bot won't appear in conversations that are currently ongoing. After 30 minutes of idle time, the bot will be updated.  
>You can type *Start over* in an existing conversation to start a new conversation right away and see the latest updates to the bot.

You should add your bot to your own version of Teams before sharing it with others.

>[!IMPORTANT]
>Make sure to **Publish** your bot if you make changes - otherwise everyone that is using the bot won't see your updates.  
>It typically takes a few minutes for published changes to be seen by everyone.

**Add the bot for yourself:**

1. Go to the **Chatbot** tab.

    :::image type="content" source="media/publish-chatbot-tab-on-homepage.png" alt-text="The chatbot tab is in the top navigation pane.":::

1. Open the bot you want to add.

1. On the side navigation pane, select **Publish**. 

    :::image type="content" source="media/publish-option.png" alt-text="The publish button is in the Publish tab.":::

1. Select **Open the bot** to have the installation prompt launch in Microsoft Teams. Select **Add for me** to have it added as an app in Teams. This only installs the bot for you.


**Share a link so others can add the bot:**



1. Go to the **Chatbot** tab.

    :::image type="content" source="media/publish-chatbot-tab-on-homepage.png" alt-text="The chatbot tab is in the top navigation pane.":::

2. Open the bot you want to share.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot** 

    This pops up a new window where you can customize how the bot will be shown to people searching for it on the Teams app store. 

    :::image type="content" source="media/publish-teams-share-flyout.png" alt-text="Selecting Share the bot opens a new flyout window.":::


    >[!IMPORTANT]
    >Only users who can access the bot can use the installation link to install the bot. You can configure who access it in the [security settings](configuration-security-teams.md) for the bot.

    1. Select **Edit details** to change the bot's icon, color, and descriptions. These will be shown in the search results in the Microsoft Teams app store. [Review the recommendations on Microsoft Teams icon formats](https://review.docs.microsoft.com/microsoftteams/platform/resources/schema/manifest-schema#icons).

        :::image type="content" source="media/publish-share-to-store.png" alt-text="You can make changes to the icon, background color, and descriptions":::

        >[!IMPORTANT]
        >Updates to the bot's icon and color will not apply to users who have already installed the bot via shared link or [built by your colleague section](#add-the-bot-to-the-built-by-your-colleagues-section). They will need to reinstall to the bot to receive the updates.

    2. Select **More** to add additional information:  
        - Developer name
        - Website
        - Privacy Statement
        - Terms of use

       You should provide this information to keep your user informed about the bot. See the [Privacy statement and terms of use](publication-terms-of-use-teams.md) topic for more details and examples.

    3. Select **Save** to return to the screen where you can make your bot available in Teams. You'll see your updates to the color, icon, and description are shown.

5. Select **Copy link** and send it to other people who want to use the bot.



## Share the bot with your Team

Once you've published your bot, you can share it with other Microsoft Teams users so they can find it in the Microsoft Teams app store. You can share it with your team directly.


### Add the bot to the Built by your colleagues section

You can share your bot with your team by adding it to the Microsoft Teams app store, **Built for *your-organization-name*** > **Built by your colleagues** section. Only your teammates will find the bot there.

:::image type="content" source="media/publish-teams-your-colleagues.png" alt-text="The Built by your colleagues section as at the bottom of the Built for COMPANY NAME section in the Teams app store":::

1. Go to the **Chatbot** tab.

2. Open the bot you want to share.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot**.

5. Select **Add to Teams**. This will automatically add the bot to the **Built by your colleagues** section, and will show a green label **Added to Teams**.

:::image type="content" source="media/publish-teams-share-flyout-added.png" alt-text="The flyout shows the bot has been added to Teams with a checkmark and green box":::


>[!NOTE]
>If your app doesn't appear in the **Built by your colleagues** section, your Teams app might be caching information. 
>Try signing out and back in again (if you're using the desktop app) or refreshing your browser (if you're using the web app of Teams).

### Remove the bot from the Built by your colleagues section


You can remove the bot from showing in the **Built by your colleagues** section. This does not impact users who have already installed the bot.


1. Go to the **Chatbot** tab.

2. Open the bot you want to remove.

3. On the side navigation pane, select **Publish**.

4. Select **Share the bot**.

5. Select **Remove**. This option only appears if you've already added the bot to the **Built by your colleagues** section.

:::image type="content" source="media/publish-teams-share-flyout-remove.png" alt-text="Next to the green box indicating the bot has been Added to Teams you can select Remove":::

## Share the bot with your organization


You can share the bot with your organization by submitting your bot for admin approval to be featured in the **Built for *your-organization-name*** > **Built by your org** section.


:::image type="content" source="media/publish-teams-your-org.png" alt-text="The Built by your org section as at the top of the Built for COMPANY NAME section in the Teams app store":::


Admins can also [preinstall and pin the bot](/microsoftteams/teams-app-setup-policies) for users in the organization so they can access it directly from their left app bar in Microsoft Teams.  


Before submitting the bot to your organization, make sure:

- Your bot is ready for release and in compliance with company standards, rules and policies.
- You coordinate with your teammates: once the bot has been submitted it can't be re-submitted by a different user until the previous submission is approved or rejected by an admin.
- You have removed the bot, if applicable, from the **Built by your colleagues** section. Submitting your bot for admin approval could result in your bot showing up in two places. See the instructions on [removing your bot](#remove-the-bot-from-the-built-by-your-colleagues-section) for details. 

>[!NOTE]
>Once a bot is approved by an admin, the bot availability in the **Built by your org** section will be completely managed by your admin. Only an admin can remove the bot from the **Built by your org** section.


### Submit for the Built by your org section

1. Go to the **Chatbot** tab.

2. Open the bot you want to submit.

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

    :::image type="content" source="media/publish-share-submit-status.png" alt-text="The status has an orange note with information about the status of the submission, including the name of the bot, the version number, and the current status Waiting for approval":::

    >[!NOTE]
    >After submitting the bot for admin approval, you should not change the bot's access setting to be less than everyone in your organization.  
    >This will result in users in the organization unable to chat with the bot after installing it from the Microsoft Teams app store **Built by your org** section.

10. You will need to wait for your [admin's approval](/microsoftteams/submit-approve-custom-apps).  You can check the latest status by selecting **Refresh**, or opening the **Share the bot** window from the **Publish** page.

11. After your admin approves the bot, the status will be updated to **Approved**. You can directly open the bot and share the approved version's link with other users.

>[!NOTE]
>If your app doesn't appear in the **Built by your org** section even though it's marked as **Approved**, your Teams app might be caching information. 
>Try signing out and back in again (if you're using the desktop app) or refreshing your browser (if you're using the Teams web app).

### Download the bot's Teams app manifest (advanced)

You can download the bot's Teams app manifest to make detail changes to the manifest directly and share with your admin or users in the tenant. You can also directly upload the app manifest into Microsoft Teams if your organization's policy allows you to [upload custom applications](/microsoftteams/platform/concepts/deploy-and-publish/apps-upload).


1. Go to the **Chatbot** tab.

2. Open the bot you want to download.

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


For bots that are shared with the organization, the bots will continue to be shown in the Microsoft Teams app store **Built by your org** section. You will need to contact your admin to remove the bot


1. Go to the **Chatbot** tab.

1. Open the bot you want to disconnect.

1. On the side navigation pane, select **Publish**.

1. Select **Share the bot**.

1. Select **Disconnect bot from Teams**.

1. Review the information about disconnecting your bot, and select **Disconnect** to continue.

You can always reconnect your bot after disconnecting by selecting **Turn on Teams** in the **Share the bot** window on the **Publish** page.



## Known limitations
- Currently only the **Personal** scope is supported for Microsoft Teams, so users can only have a private conversation with the bot.
- Setting the bot avatar icon with **Manage** > **Detail** will not show up for bots that are approved by an admin. Bots approved by an admin will use the app icon as the bot avatar.
- Teams has [rate limiting](/microsoftteams/platform/concepts/bots/rate-limit) on bots. Depending on your business needs, you might want to keep your bot content concise for bots that are added to Microsoft Teams.
- Disconnecting your bot might take a few minutes before the bot becomes unreachable by users on Microsoft Teams.



   





