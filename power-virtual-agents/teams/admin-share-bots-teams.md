---
title: "Share chatbots with other users in Microsoft Teams"
description: "Work on Power Virtual Agents chatbots with other people in your team, and see who else has recently modified topics."
keywords: "Administration, share, multi-author, PVA, teams"
ms.date: 10/22/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: micchow
ms.custom: "multi-author, admin, ceX, teams"
ms.collection: virtual-agent
---

# Share your bot with other users in Microsoft Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../admin-share-bots.md)
> - [Power Virtual Agents app in Microsoft Teams](admin-share-bots-teams.md)

Share your bot with other users so they can chat with the bot or collaborate together to author it. 

## Share bots for users to chat with
A user can always chat with a bot if it was created in the same team. You can share bots with users outside of the team with the **Share** options available in Power Virtual Agents.

### Prerequisites
- To manage who can chat with the bot in your organization, the bot's [end user authentication setting](configuration-end-user-authentication-teams.md) must be configured to **Only for Teams** or **Manual**, with **Azure Active Directory** or **Azure Active Directory V2** as the provider and **Require user sign-in** enabled.  

### Share bot with security groups
You can share your bot with security groups so their members can chat with the bot.

1. Select **Share** at the top of the bot's home page.

  :::image type="content" source="../media/sharing-security-groups/sharing-bot-homepage-teams.PNG" alt-text="Sharing UI entry point in bot homepage.":::

2. Specify the security group name that you would like to share the bot with.

  >[!NOTE]
  >You can only share a bot with security groups. You cannot share with individual users directly.  
  >You can manage individual user access by adding or removing users from the security group.

  :::image type="content" source="../media/sharing-security-groups/sharing-bot-specify-security-group-teams.PNG" alt-text="Specify security group in Sharing UI.":::

3. Review the security group's permissions.

  :::image type="content" source="../media/sharing-security-groups/sharing-review-sg-permission-teams.PNG" alt-text="Review security group permission in Sharing UI.":::

4. If you want to let users know you've shared the bot with them, select the **Send an email invitation to new users** check box.

  >[!NOTE]
  >Only security groups with email enabled will receive an email invitation. You can directly **Copy link** and share it with users to install the bot in Microsoft Teams.

5. Select **Share** to share the bot with the security group.

### Share bot with everyone in the organization
You can share your bot to allow everyone in the same organization as the bot to chat with it.

1. Select **Share** at the top of the bot's home page.

2. Select **Everyone in _your organization's name_**.

3. Select **User - can use the bot** option.

  :::image type="content" source="../media/sharing-security-groups/sharing-share-everyone-in-org-teams.PNG" alt-text="Set user permission for everyone in the organization in Sharing UI.":::

  >[!NOTE]
  >Power Virtual Agents will not send an email invitation to everyone in the organization. You can directly **Copy link** and share it with users to install the bot in Microsoft Teams.

4. Select **Share** to share the bot with everyone in the organization.

### Stop sharing the bot
You can stop sharing the bot with a security group or everyone in your organization.

**Stop sharing with a security group**
1. Select **Share** at the top of the bot's home page.

2. Select **X** next to the security groups that you want to stop sharing the bot with.

  :::image type="content" source="../media/sharing-security-groups/sharing-unshare-sg-teams.PNG" alt-text="Unshare security group in Sharing UI.":::

3. Select **Share** to stop sharing the bot with the security groups.

**Stop sharing with everyone in the organization**

1. Select **Share** on the bot's homepage.

2. Select **Everyone in _your organization's name_**.

3. Select **None** option.

  :::image type="content" source="../media/sharing-security-groups/sharing-unshare-everyone-in-org-teams.PNG" alt-text="Unshare everyone in the organization in Sharing UI.":::

3. Select **Share** to stop sharing the bot with everyone in the organization.

## Share bots to collaborate with others

You can collaborate with others when building chatbots in Microsoft Teams. This means other members of your team can make edits and changes, and you can see who else is editing a topic.

Your permissions are determined by your [Microsoft Teams roles](/microsoftteams/assign-roles-permissions) in the team where your bot is created: 

- Team Owners can create, view, edit, and configure all bots in the team where they are Team Owners. 
- Team Members can create, edit, and configure bots they have created. They can view other member's bots in the team.

>[!NOTE]
>If you are an owner of an Azure Active Directory group associated with a team, but you are not also a member of that group, you might not see the team in the Power Apps and Power Virtual Agents apps in Microsoft Teams.  
>You can add yourself as a member to the team and it will resolve the issue after a few minutes.

To share your bot with other users for collaboration, you need to [add them to your team](https://support.microsoft.com/office/add-members-to-a-team-in-teams-aff2249d-b456-4bc3-81e7-52327b6b38e9).

>[!NOTE]
>It could take up to 15 minutes before the new team member sees the team in the Power Virtual Agents app.

You can see a list of the teams you belong to, and each bot within that team by going to the **Chatbots** tab on the top navigation bar. Teams are listed on the left, selecting a team shows the chatbots in that team. Where ever you are in the app, you can always get back to the list of chatbots by selecting **Chatbots** at the top.

>[!TIP]
>**My chatbots** shows all the bots you created and is an easy way for you to find your bot across multiple teams. You can find bots created by other team members by selecting the team.

:::image type="content" source="media/admin-share-bots-list.png" alt-text="The teams and chatbots are listed in the Chatbots tab.":::

You can open bots for editing by selecting the bot's name.

If you select the check mark next to the bot's name, you can go straight to the Topics or Analytics page for that bot. You can also select **Edit** to go to the bot's homepage.

:::image type="content" source="media/admin-share-bots-edit.png" alt-text="The Topics and Analytics buttons appear when a bot is selected.":::

If you select the menu icon next the bot's name you can then select **Edit** to go to the bot's homepage, or go to the Topics or Analytics pages.

:::image type="content" source="media/admin-share-bots-hamburger.png" alt-text="The bot's menu lets you edit details, topics, and see analytics":::

If you rename, restore, or delete a team, it could take up to 2 hours for the changes to be reflected in the Power Virtual Agents app.

## Data permissions
To make sure users who chat with your bot can run the [Power Automate](advanced-flow-teams.md) flows correctly, you should test your bot to make sure their permissions with the integrated systems are configured correctly.

## Collaborate on bots

In the **Topics** list, you can see who's working on a topic under the **Currently editing** column. You can hover or click on the person's icon to quickly chat with them in Teams or send them an email. 

This can help prevent conflicts if multiple people are working on the same topic.

![Screenshot showing the Power Virtual Agents list of topics with the Currently editing column highlighted.](media/sharing-multi-authors-teams.png)

>[!NOTE]
>The list of authors in the **Currently editing** column is only refreshed when the page is loaded.

A topic's **Details** page also shows all the people currently editing a topic, as well as the last time someone saved.

![Screenshot of a topic's details page on the properties pane with the Modified by section on the right highlighted.](media/sharing-multi-details-teams.png)

A list of who's editing the page also appears as user icons on the top of the authoring canvas when you've opened a topic for editing.

![Screenshot of a topic being edited with user profile pictures appearing on the top menu bar.](media/sharing-multi-editing-teams.png)

After 30 minutes of inactivity you will not be identified as editing the topic.

Occasionally, multiple people might make changes to a topic and attempt to save their changes at the same time.

Power Virtual Agents will detect this and prevent you from overwriting your coworker by prompting you with an option - you can reload the content with the latest changes (discarding your work), or you can save a copy of the topic (keeping your changes in a new, duplicate copy of the topic). 

![Screenshot showing a prompt that says Updated content available and gives you options to discard your changes or save a copy.](media/sharing-multi-conflict-teams.png)

If you save your changes to a new topic, you can then review your coworker's changes and merge the two topics, deleting the copy of the topic once you've finished.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
