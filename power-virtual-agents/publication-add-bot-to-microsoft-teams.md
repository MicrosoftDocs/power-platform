---
title: "Add a chatbot to Microsoft Teams"
description: "Connect your bot to a Microsoft Teams channel so people in your organization can interact with it."
keywords: "Publish, channel, Microsoft Teams, Teams"
ms.date: 05/23/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "publication, authoring, ceX, teams"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Add a chatbot to Microsoft Teams

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Now that you have published your bot, you can make your bot available to users in Microsoft Teams so you, your teammates, and the broader organization can interact with it. You need to [publish the bot at least once](publication-fundamentals-publish-channels.md) before users can interact with the bot in Microsoft Teams.

You can:

- Customize your bot's appearance in Microsoft Teams
- Install the bot for yourself in Microsoft Teams
- Share the bot's installation link with other users
- Show the bot in Microsoft Teams app store.
  - Show the bot to [shared users](admin-share-bots.md) by adding it to the Microsoft Teams app store **Built by your colleagues** section.
  - Share the bot with the organization by submitting the bot for admin approval to be featured in the Microsoft Teams app store **Built by your org** section.
- Add the bot to a team channel.
- Download the pre-generated Teams app manifest to distribute it within your Microsoft Teams tenant.

When you add the bot to Microsoft Teams, some of your data, such as bot content and end-user chat content, will be shared with Microsoft Teams. Your data may flow outside of your [organization's compliance and geographic or regional boundaries](data-location.md). For more information, see the [Microsoft Teams app privacy policy](/MicrosoftTeams/app-permissions).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Share with users](admin-share-bots.md) so they can install and chat with the bot in Microsoft Teams.
- Your organization needs to allow Microsoft Power Platform apps to be added to Microsoft Teams before you or other users can directly install the bot in Teams or find it in the **Built by your colleagues** section in the Teams app store. Work with your admin to [Manage Microsoft Power Platform apps in the Microsoft Teams admin center](/microsoftteams/manage-power-platform-apps) if it has been disabled for your organization.
- Bots that are approved for the **Built by your organization** section (after submission to an admin) are managed separately by admins in the Microsoft Teams admin center's [Manage apps page](/microsoftteams/submit-approve-custom-apps#validate).
- Before installing the bot for yourself or sharing the bot with others, you should [publish the bot at least once](publication-fundamentals-publish-channels.md).

## Connect your bot to the Microsoft Teams channel

After publishing your bot at least once, you can connect your bot to the Microsoft Teams channel to allow users to chat with the bot in Microsoft Teams.

> [!NOTE]
> We recommend you [turn on security settings](configuration-end-user-authentication.md) for bots built for Microsoft Teams or internal employee use so you can ensure the bot will not be accessible by individuals outside of your organization.

**Connect to Microsoft Teams:**

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Turn on Teams**.

    :::image type="content" source="media/publication-add-bot-to-msft-teams/publish-teams-enable.png" alt-text="In the Microsoft Teams flyout that appears, select Turn on Teams to enable sharing":::

    > [!NOTE]
    > If you do not see this option, then the Microsoft Teams channel may already be enabled.

## Customize the bot's appearance in Microsoft Teams

Providing the right description and appearance for the bot before making it available to other users is important as it educates them on what the bot's purpose is and its branding, when applicable.

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Edit details** to change the bot's icon, color, and descriptions. These will be shown in the Microsoft Teams app store and the app's About tab after the user installs the bot. [Review the recommendations on Microsoft Teams icon formats](/microsoftteams/platform/resources/schema/manifest-schema#icons).

    :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-edit-details.PNG" alt-text="You can make changes to the icon, background color, and descriptions":::

    > [!IMPORTANT]
    > Updates to the bot's detail will not apply to users who have already installed the bot from a shared link or the [**Built by your colleagues** section](#show-to-shared-users). They will need to reinstall the bot to receive the updates.  
    >
    > Updates to the bot's detail will not apply to bots that have been approved by an admin. You will need to resubmit the bot for approval to have the latest detail updated for users.

1. Select **More** to add additional information:  
    - Developer name
    - Website
    - Privacy Statement
    - Terms of use

       You should provide this information to keep your user informed about the bot. See the [Privacy statement and terms of use](publication-terms-of-use-teams.md) topic for more details and examples.

1. Select **Save** to return to the screen where you can make your bot available in Teams. You'll see your updates to the color, icon, and description are shown.

> [!NOTE]
> Icon customization in this section only applies to the bot avatar for bots that are [approved by admin](#show-to-the-organization) and does not apply for users who install the bot with a direct [installation link](#share-a-link-so-others-can-install-the-bot) or from the Microsoft Teams app store [Built by your colleague section](#show-to-shared-users). You can customize the bot avatar at [Customize the look and feel of the bot](customize-default-canvas.md).
>
> :::image type="content" source="media/publication-add-bot-to-msft-teams/bot-avatar-teams.PNG" alt-text="Bot avatar icon in Teams chat.":::

## Install a bot as an app in Microsoft Teams

After you have published a bot, you can add the bot to your own version of Microsoft Teams directly from the Microsoft Copilot Studio app.

> [!IMPORTANT]
> New content in a freshly published bot won't appear in conversations that are currently ongoing. After 30 minutes of idle time, the bot will be updated.  
>
> You can type `Start over` in an existing conversation to start a new conversation right away and see the latest updates to the bot.

You should add your bot to your own version of Teams before sharing it with others.

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Open bot** to have the installation prompt launch in Microsoft Teams. Select **Add** to have it added as an app in Teams. This only installs the bot for you.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-open-bot-teams-panel.PNG" alt-text="Install bot for yourself in Teams pane":::

## Share a link so others can install the bot

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Availability options** and select **Copy link**

   > [!IMPORTANT]
   > Only users who can access the bot can use the installation link to install the bot. You can [share the bot to give users access to chat](admin-share-bots.md) with the bot.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-copy-link-teams.PNG" alt-text="Copy link from Teams availability options.":::

1. Share the copied link with users so they can install the bot in Microsoft Teams.

## Show the bot in Microsoft Teams app store

Once you've published your bot, you can show it in the Microsoft Teams app store so users can find and install it.

### Show to shared users

You can share your bot by adding it to the Microsoft Teams app store, **Built for your org** > **Built by your colleagues** section. Only [shared users](admin-share-bots.md) will find the bot there.

> [!IMPORTANT]
> Only shared users can find and install the bot in the Microsoft Teams app store **Built by your colleagues** section. The bot will not show for everyone in the organization even if it is configured to allow everyone to use the bot. To [show the bot to the organization](#show-to-the-organization), submit the bot for an admin's approval to show it in the Microsoft Teams app store **Built by your org** section.
>
> The bot can only be shown in the Microsoft Teams app store **Built by your colleagues** section when the total number of shared users does not exceed the tenant's [Teams app store discovery policy](/power-platform/admin/list-tenantsettings). To show the bot beyond your organization's policy limit, partner with your admin to [show the bot to the organization](#show-to-the-organization).

:::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-bbyc-teams.PNG" alt-text="The Built by your colleagues section as at the bottom of the Built for your org section in the Teams app store.":::

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Availability options**.

1. Select **Show to my teammates and shared users** and review who has access to the bot.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-show-bbyc.PNG" alt-text="Show bot in Teams app store Built by your colleague section.":::

1. Confirm the **Visible in Build by your colleagues** checkbox is selected and select **Share**.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-visible-in-bbyc.PNG" alt-text="Select visible in Built by your colleagues checkbox in sharing UI.":::

1. This will automatically add the bot to the **Built by your colleagues** section, and will show a green label **Added to Teams** in the availability options page.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-added-to-teams-teams.PNG" alt-text="The flyout shows the bot has been added to Teams.":::

> [!NOTE]
> If your app doesn't appear in the **Built by your colleagues** section, your Teams app might be caching information.
>
> Try signing out and back in again (if you're using the desktop app) or refreshing your browser (if you're using the web app of Teams).

#### Remove the bot from the Built by your colleagues section

You can remove the bot from showing in the **Built by your colleagues** section. This does not impact users who have already installed the bot.

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Availability options**.

1. Select **Show to my teammates and shared users** and remove the **Visible in Built by your colleagues** checkbox selection.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-remove-bbyc.PNG" alt-text="Uncheck visible in Built by your colleagues checkbox in sharing UI.":::

1. Select **Share**. Now the bot will no longer show in the Microsoft Teams app store **Built by your colleagues** section.

### Show to the organization

You can share the bot with your organization by submitting your bot for admin approval to be featured in the **Built for your org** > **Built by your colleagues** section. This is a great way to broadly distribute your bot by partnering with your admin to roll out the bot to everyone in the organization or a subset of users.

:::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-bbyo-teams.PNG" alt-text="The Built by your org section is at the top of the Built for Org section in the Teams app store.":::

Admins can also [preinstall and pin the bot](/microsoftteams/teams-app-setup-policies) for users in the organization so they can access it directly from their app bar in Microsoft Teams.  

Before submitting the bot to your organization, make sure:

- Your bot is ready for release and in compliance with company standards, rules and policies.
- You coordinate with other bot managers: once the bot has been submitted it can't be re-submitted by a different user until the previous submission is approved or rejected by an admin.
- You have removed the bot, if applicable, from the **Built by your colleagues** section. Submitting your bot for admin approval could result in your bot showing up in two places. See the instructions on [removing your bot](#remove-the-bot-from-the-built-by-your-colleagues-section) for details.

> [!NOTE]
> Once a bot is approved by an admin, the bot availability in the **Built by your org** section will be completely managed by your admin. Only an admin can remove the bot from the **Built by your org** section.

#### Submit for the Built by your org section

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Availability options**.

1. Confirm the bot is not shown to teammates or shared users. [Remove it](#remove-the-bot-from-the-built-by-your-colleagues-section) if it says **Added to Teams**.

1. Select **Show to everyone in my org**.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-show-bbyo.PNG" alt-text="Show bot to organization in Teams pane availability options.":::

1. Review the requirements for submission, and select **Submit for admin approval**.

    > [!NOTE]
    > Make sure you review the content and it's ready for an admin to review. You will need to submit new requests to the admin to [update the icon and descriptions](#customize-the-bots-appearance-in-microsoft-teams) for bots that were previously approved.  
    >
    > Once approved, all new and existing users of the bot in Teams will receive the update.  
    >
    > This only applies to the bot details. You can continue to make content updates to your bot by publishing the latest content without needing to re-submit to admin.

1. A final confirmation prompt will appear. Select **Yes** to continue. The bot will be sent to your admin [for them to approve it](/microsoftteams/submit-approve-custom-apps#validate), and you will see a note indicating the status of your submission.

    :::image type="content" source="media/publication-add-bot-to-msft-teams/publish-share-submit-status.png" alt-text="The status has an orange note with information about the status of the submission, including the name of the bot, the version number, and the current status Waiting for approval":::

    > [!NOTE]
    > After submitting the bot for admin approval, you should not change the bot's access setting to be less than everyone in your organization.  
    >
    > This will result in users in the organization unable to chat with the bot after installing it from the Microsoft Teams app store **Built by your org** section.  
    >
    > Work with your admin on the [Microsoft Teams app policy](/microsoftteams/teams-app-setup-policies) on who can find and install the bot.

1. You will need to wait for your [admin's approval](/microsoftteams/submit-approve-custom-apps). You can check the latest status by selecting **Refresh**, or opening the **Make the bot available to others** window from the **Publish** page.

1. After your admin approves the bot, the status will be updated to **Approved**. You can directly open the bot and share the approved version's link with other users.

1. Optionally, partner with your admin to pre-pin or install the app for users in the [Microsoft Teams app policy](/microsoftteams/teams-app-setup-policies) so they can find the bot directly in their Microsoft Teams left app rail.

> [!NOTE]
> If your app doesn't appear in the **Built by your org** section even though it's marked as **Approved**, your Teams app might be caching information.
>
> Try signing out and back in again (if you're using the desktop app) or refreshing your browser (if you're using the Teams web app).

## Add a bot to a team

In Microsoft Teams, you can [add bots to teams](/microsoftteams/platform/bots/how-to/conversations/channel-and-group-conversations?tabs=dotnet). When you add the bots, team members can @mention the bot in any team channels and all teammates will see the response from the bot. This feature is useful for scenarios where:

- Your bot supports collaboration, like sharing the latest sales report insight with the rest of the Sales team.
- You want to allow every team member to engage with the bot in a team channel or via private chat without needing to manually install the bot themselves.

### Allow users to add bot to a team

This option allows users to add the bot to any team that they're part of when adding the bot in Microsoft Teams.

After enabling this option, any user who [installs the bot from the Teams app store](publication-add-bot-to-microsoft-teams.md#install-a-bot-as-an-app-in-microsoft-teams) or via the [installation link](publication-add-bot-to-microsoft-teams.md#share-a-link-so-others-can-install-the-bot) will see the option to add the bot to a team in Microsoft Teams. Team members can also [remove the bot from a team](/powerapps/teams/remove-your-apps).

> [!IMPORTANT]
> The bot will be configured to allow everyone in the organization to chat with it. This ensures all team members have permission to chat with the bot in team channels. It's highly recommended to not change the security setting of the bot after enabling this capability to prevent users seeing permission errors when interacting with the bot in team channels.

To allow users to add a bot to a team:

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Edit details**.

1. Select **Allow your users to add this bot to a team**.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/teams-allow-end-users-to-add-to-team.png" alt-text="Checkbox is checked to allow user to add bot to teams that they are part of":::

1. Select **Save**.

Microsoft Teams caches information, so it could take a while before users see the option to add the bot to a team. Users can refresh the browser or sign in and out of the Microsoft Teams desktop client to reflect changes immediately.

If you've previously [submitted the bot for admin approval](#submit-for-the-built-by-your-org-section), you'll need to resubmit after enabling this option. The admin needs to approve these changes before users can add the bot to their teams from the Microsoft Teams app store in the "Built by your org" section.

### Disallow users from adding bot to a team

Disabling this option will prevent users from adding a bot to a new team, but won't remove it from teams that it's already added to. Those bots will need to be manually [removed from the team](/powerapps/teams/remove-your-apps).

To disallow users from adding a bot to a team:

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Edit details**.

1. Clear the **Allow your users to add this bot to a team** checkbox.

    :::image type="content" source="media/publication-add-bot-to-msft-teams/teams-disallow-end-users-to-add-to-team.png" alt-text="Checkbox is unchecked to disallow user to add bot to teams that they are part of":::

1. Select **Save**.

### Configure private greeting behavior

Private greetings from a bot are useful for when you want team members to have one-on-one conversations with the bot without needing to manually install the bot themselves.

> [!NOTE]
> Private greeting configuration isn't supported for bots using the [upgraded unified authoring canvas](unified-authoring-conversion.md).

When enabled, your bot will automatically start a conversation with team members. To customize the bot's greeting message, [modify the Greeting system topic](configure-bot-greeting.md#modify-the-system-greeting-topic-recommended).

Consider how relevant the bot is to team members. Make sure the bot's greeting helps them understand what to do with it, describes its limitations and, most importantly, gets them comfortable interacting with it.

To configure when a bot sends a private greeting:

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Settings**.

    :::image type="content" source="media/publication-add-bot-to-msft-teams/teams-private-greeting-settings.png" alt-text="Settings entry point to configure bot's private greeting behavior":::

1. Configure the private greeting options.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/teams-private-greeting-settings-detail.png" alt-text="Private greeting to user setting options":::

1. Select **Save**.

### Download the bot's Teams app manifest (advanced)

You can download the bot's Teams app manifest to make detail changes to the manifest directly and share with your admin or users in the tenant. You can also directly upload the app manifest into Microsoft Teams if your organization's policy allows you to [upload custom applications](/microsoftteams/platform/concepts/deploy-and-publish/apps-upload).

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Availability options**.

1. Select **Download .zip**.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-download-zip.png" alt-text="Download Teams app manifest zip file from Teams pane availability options.":::

1. The manifest will be generated as a .zip file, and will be saved according to your browser's save settings.

## Disconnect your bot from Teams

You can take your bot offline so users can no longer chat with the bot in Teams. This means the bot won't respond to anyone who tries to chat with it, and will disrupt anyone who is using the bot. You should thoroughly consider the need to disconnect your bot before you do so.

Bots no longer show in the Microsoft Teams app store **Built by your colleague** section and can't be installed from the shared link. Bots that are added by users in Microsoft Teams will continue to exist until the user uninstalls the bot.

For bots that are approved by an admin, the bots will continue to be shown in the Microsoft Teams app store **Built by your org** section. You will need to contact your admin to remove the bot

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Microsoft Teams**.

1. Select **Disconnect from Teams**.

   :::image type="content" source="media/publication-add-bot-to-msft-teams/add-bot-to-teams-disconnect-teams.PNG" alt-text="Disconnect Teams channel in Teams channel pane.":::

1. Review the information about disconnecting your bot, and select **Disconnect** to continue.

You can always reconnect your bot after disconnecting by selecting **Turn on Teams** in the **Make the bot available to others** window on the **Publish** page.

## Known limitations

- [Private greeting configuration](#configure-private-greeting-behavior) isn't supported for bots using the [upgraded unified authoring canvas](unified-authoring-conversion.md).
- Currently, only the **Personal** and **Team** scopes are supported for Microsoft Teams. **Group chat** is not supported.
- [Setting the bot avatar icon](customize-default-canvas.md) on the details page won't show up for bots that are approved by an admin. Bots approved by an admin will use the app icon as the bot avatar.
- Teams has [rate limiting](/microsoftteams/platform/concepts/bots/rate-limit) on bots. Depending on your business needs, you might want to keep your bot content concise for bots that are added to Microsoft Teams.
- Currently, if your bot supports [end-user authentication](advanced-end-user-authentication.md), the user will not be able to explicitly sign out. This will fail the Microsoft Teams AppSource certification if you are publishing your bot in the Seller Dashboard. This does not apply to personal or tenant usage of the bot. Learn more at [Publish your Microsoft Teams app](/microsoftteams/platform/publishing/apps-publish) and [AppSource Validation Policy](/office/dev/store/validation-policies).
- Disconnecting your bot from Teams might take a few minutes before the bot becomes unreachable by users on Microsoft Teams.

[!INCLUDE[footer-include](includes/footer-banner.md)]
