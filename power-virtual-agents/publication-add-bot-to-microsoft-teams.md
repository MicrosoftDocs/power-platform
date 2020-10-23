---
title: "Add a chatbot to Microsoft Teams"
description: "Connect your bot to a Microsoft Teams channel so people in your organization can interact with it."
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

# Add bot to Microsoft Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](publication-add-bot-to-microsoft-teams.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/publication-add-bot-to-microsoft-teams-teams.md)



Now that you've published your bot, you can make your bot show up in Microsoft Teams so you, your teammates, and the broader organization can interact with it. You will need to [publish the bot at least once](publication-fundamentals-publish-channels.md) and enable the Microsoft Teams channel before users can interact with the bot in Microsoft Teams.

You can:

- Install your bot in Microsoft Teams and share a direct installation link with others.
- Share the bot with your organization by submitting it for admin approval to be featured in the Microsoft Teams app store **Built by your org** section

> [!NOTE]
> By adding the bot to Microsoft Teams, some of your data, such as bot content and end-user chat content, will be shared with Microsoft Teams (meaning that your data will flow outside of your [organization's compliance and geographic or regional boundaries](data-location.md)). <br/>
> For more information, see the [Microsoft Teams app privacy policy](/MicrosoftTeams/app-permissions).

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- Your organization's [Microsoft Teams app permission policies](/microsoftteams/manage-power-platform-apps) will need to allow Power Platform apps to be added to Microsoft Teams before you can directly install the bot in Microsoft Teams. Bots that are approved for admin submission in the **Built by your organization** section is managed separately by the admin in the Microsoft Teams admin center [Manage apps page](/microsoftteams/submit-approve-custom-apps#validate).
- Before installing the bot for yourself or sharing the bot with others, you should [publish the bot at least once](publication-fundamentals-publish-channels.md).




## Connect your bot to the Microsoft Teams channel

After publishing your bot at least once, you can connect your bot to the Microsoft Teams channel to allow users to chat with the bot in Microsoft Teams.


>[!NOTE]
>We recommend you [turn on security settings](advanced-end-user-authentication.md) for bots built for Microsoft Teams or internal employee use so you can ensure the bot will not be accessible by individuals outside of your organization.



**Connect to Microsoft Teams:**

1.  Go to **Manage**, then **Channels** on the side navigation pane.

1.  Select **Microsoft Teams**.

1.  Select **Turn on Teams**.

    :::image type="content" source="media/publish-teams-enable.png" alt-text="In the Microsoft Teams flyout that appears, select Turn on Teams to enable sharing":::

    >[!NOTE]
    >If you do not see this option, then the Microsoft Teams channel may already be enabled.

## Install a bot as an app in Microsoft Teams

After you published a bot, you and people in your organization can install to chat with it in Microsoft Teams. Whenever you make updates to your bot and publish it, those updates will be reflected in everyone's copy of the bot.

You can add the bot to your own version of Microsoft Teams directly from the Power Virtual Agents app, or you can get a link to share with other users so they can add it to chat with it in Microsoft Teams.


>[!IMPORTANT]
>New content in a freshly published bot won't appear in conversations that are currently ongoing. After 30 minutes of idle time, the bot will be updated.  
>You can type *Start over* in an existing conversation to start a new conversation right away and see the latest updates to the bot.  
>Make sure to **Publish** your bot if you make changes - otherwise everyone that is using the bot won't see your updates.  
>It typically takes 15 minutes for published changes to be seen by everyone.

**Add the bot for yourself:**

1.  Go to **Manage**, then **Channels** on the side navigation pane.

1.  Select **Microsoft Teams**.

1. Select **Open bot** to have the installation prompt launch in Microsoft Teams. Select **Add for me** to have it added as an app in Teams. This only installs the bot for you.


**Share a link so others can add the bot:**



1.  Go to **Manage**, then **Channels** on the side navigation pane.

1.  Select **Microsoft Teams**.

    1. Select **Edit details** to change the bot's icon, color, and descriptions. These will be shown in the search results in the Microsoft Teams app store. [Review the recommendations on Microsoft Teams icon formats](/microsoftteams/platform/resources/schema/manifest-schema#icons).

        :::image type="content" source="media/publish-share-to-store.png" alt-text="You can change the details, copy link, or open the bot and see the changes to your icon and details.":::

        >[!IMPORTANT]
        >Updates to the bot's detail will not apply to users who have already installed the bot via shared link. They will need to reinstall to the bot to receive the updates.

    2. Select **More** to add additional information:  
        - Developer name
        - Website
        - Privacy Statement
        - Terms of use

       You should provide this information to keep your user informed about the bot. See the [Privacy statement and terms of use](teams/publication-terms-of-use-teams.md) topic for more details and examples.

       :::image type="content" source="media/publish-share-to-store-edit-details.png" alt-text="Change the icon and color of your icon background, as well as add a short and long description and developer information.":::

       >[!NOTE]
       >Changing bot detail won't apply to bots that were approved by an admin until it is re-submitted and approved by the admin.  
       >You will have the opportunity to review the bot details prior to submitting the bot to your admin.  
       >Once approved, the bot detail is retroactive and applies to new and existing users who have installed the bot.


    3. Select **Save** to return to the screen where you can make your bot available in Teams. You'll see your updates to the color, icon, and description are shown.

1. Select **Copy link** and send it to other people who want to use the bot.

>[!IMPORTANT]
>Only users who can access the bot can use the installation link to install the bot. You can configure who access it in the [security settings](configuration-security.md) for the bot.




## Share the bot with your organization


You can share the bot with your organization by submitting your bot for admin approval to be featured in the **Built for *your-organization-name*** > **Built by your org** section.


:::image type="content" source="media/publish-teams-your-org.png" alt-text="The Built by your org section as at the top of the Built for COMPANY NAME section in the Teams app store":::


Admins can also [preinstall and pin the bot](/microsoftteams/teams-app-setup-policies) for users in the organization so they can access it directly from their left app bar in Microsoft Teams.  


Before submitting the bot to your organization, make sure:

- Your bot is ready for release and in compliance with company standards, rules and policies.
- You coordinate with your teammates: once the bot have been submitted it can't be re-submitted by a different user until the previous submission is approved or rejected by an admin.


>[!NOTE]
>Once a bot is approved by an admin, the bot availability in the **Built by your org** section will be completely managed by your admin. Only an admin can remove the bot from the **Built by your org** section.


### Submit for the Built by your org section

1.  Go to **Manage**, then **Channels** on the side navigation pane.

1.  Select **Microsoft Teams**.

1. Select **Submit for admin approval**.

1. Review the requirements for submission, and select **Submit for admin approval**.

1. You will be asked if you want to make any last [updates to your bot information](#install-a-bot-as-an-app-in-microsoft-teams). Once you've confirmed everything is correct, select **Submit for admin approval**

    >[!NOTE]
    >Make sure you review the content and it's ready for an admin to review. You will need to submit new requests to the admin to update the icon and descriptions for bots that were previously approved.  
    >Once approved, all new and existing users of the bot in Teams will receive the update.  
    >This only applies to the bot details. You can continue to make content updates to your bot by publishing the latest content without needing to re-submit to admin.

1. A final confirmation prompt will appear. Select **Yes** to continue. The bot will be sent to your admin [for them to approve it](/microsoftteams/submit-approve-custom-apps#validate), and you will see a note indicating the status of your submission.


    >[!NOTE]
    >After submitting the bot for admin approval, you should not change the bot's access setting to be less than everyone in your organization.  
    >This will result in users in the organization unable to chat with the bot after installing it from the Microsoft Teams app store **Built by your org** section.

1. You will need to wait for your [admin's approval](/microsoftteams/submit-approve-custom-apps). You can check the latest status by selecting **Refresh**, or opening the **Share the bot** window from the **Publish** page.

1. After your admin approves the bot, the status will be updated to **Approved**. You can directly open the bot and share the approved version's link with other users.

>[!NOTE]
>If your app doesn't appear in the **Built by your org** section even though it's marked as **Approved**, your Teams app might be caching information. 
>Try signing out and back in again (if you're using the desktop app) or refreshing your browser (if you're using the web app of Teams).

### Download the bot's Teams app manifest (advanced)

You can download the bot's Teams app manifest to make detail changes to the manifest directly and share with your admin or users in the tenant. You can also directly upload the app manifest into Microsoft Teams if your organization's policy allows you to [upload custom applications](/microsoftteams/platform/concepts/deploy-and-publish/apps-upload).


1.  Go to **Manage**, then **Channels** on the side navigation pane.

1.  Select **Microsoft Teams**.

1. Select **Submit for admin approval**.
 
1. Select **Download manifest**.

1. You will be asked if you want to make any last [updates to your bot information](#install-a-bot-as-an-app-in-microsoft-teams). Once you've confirmed everything is correct, select **Download manifest**.

1. The manifest will be generated as a .zip file, and will be saved according to your browser's save settings.




## Disconnect your bot from Teams

You can take your bot offline so users can no longer chat with the bot in Teams. This means the bot won't respond to anyone who tries to chat with it, and will disrupt anyone who is using the bot. You should thoroughly consider the need to disconnect your bot before you do so.

For bots that are shared with the organization, the bots will continue to be shown in the Microsoft Teams app store **Built by your org** section. You will need to contact your admin to remove the bot.


1.  Go to **Manage**, then **Channels** on the side navigation pane.

1.  Select **Microsoft Teams**.

1. Select **Disconnect bot from Teams**.

1. Review the information about disconnecting your bot, and select **Disconnect** to continue.

You can always reconnect your bot after disconnecting by selecting **Turn on Teams** in the **Share the bot** window on the **Publish** page.


## Known limitations
- Currently only **Personal** scope is supported for Microsoft Teams so users can only have private conversation with the bot
- By setting bot avatar icon via **Manage -> Detail** will not show up for bots that are approved by admin. Bots approved by admin will use the app icon as the bot avatar.
- Teams has [rate limiting](/microsoftteams/platform/concepts/bots/rate-limit) on bots. Depending on your business needs, you might want to keep your bot content concise for bots that are added to Microsoft Teams.
- Currently, if your bot supports [end-user authentication](advanced-end-user-authentication.md), the user will not be able to explicitly sign out. This will fail the Microsoft Teams AppSource certification if you are publishing your bot in the Seller Dashboard. This does not apply to personal or tenant usage of the bot. Learn more at [Publish your Microsoft Teams app](/microsoftteams/platform/publishing/apps-publish) and [AppSource Validation Policy](/office/dev/store/validation-policies).
- Disconnecting your bot from Teams might take a few minutes before the bot becomes unreachable by users on Microsoft Teams.
