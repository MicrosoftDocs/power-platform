---
title: "Configure access and authentication"
description: "Determine who can access your bot in the Power Virtual Agents web app."
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.collection: virtual-agent
ms.cusom: "security"
---

# Assign access and change security options in the Power Virtual Agents web app


Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](configuration-security.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/configuration-security-teams.md)

You can change who can access your bot, and what they can do, with the **Security** options available in Power Virtual Agents.

>[!IMPORTANT]
>Changes to the Access configuration will only take effect after you publish your bot. Make sure to plan ahead before making Access changes to your bot.

## Configure the Access setting

You can determine whether users need to sign in to access your bot, and whether certain users are allowed to access the bot.

1. Select **Manage** on the side navigation pane and then go to the **Security** tab. 

    :::image type="content" source="media/security-tab.png" alt-text="The Security tab has options for sharing, access control, authentication, and web channel security":::

2. Select **Access**.

    :::image type="content" source="media/security-access.png" alt-text="The Access pane has options to grant access and require sign in":::

The **Access** pane gives you control of two aspects for user access.

### Require users to sign in

This setting controls if users need to sign in before talking to your bot. Bots that manage private or sensitive information should use this option. 

If you want your bot to be publicly accessible (such as on a web channel), you can turn this option off. 

Bots with this configuration turned **Off** won't ask users to sign in until they encounter a topic which requires them to do so.

When the **Require users to sign in** option is turned **On**, a new system topic called **Require users to sign in** is created. This topic is only relevant for the "Manual" authentication setting, as users are always authenticated on Teams.

This topic is automatically triggered for any user who talks to the bot without being authenticated. This topic is read-only and cannot be customized. If the user fails to sign in, this topic redirects the user to the **Escalate** system topic. You can see the topic by clicking **Go to the authoring canvas**.


### Access

This option controls who can access your bot. You can select one of two groups:

- **All bot managers**. This lets only bot managers to chat with the bot. You can [share your bot](admin-share-bots.md) so other bot managers can access it.
- **Everyone in my organization (*Organization name*)**. This lets everyone in the organization access and chat with your bot. Users outside of the organization will see an error when chatting with the bot.

## Access settings based on authentication configuration

The **Authentication** setting impacts how you can manage access to the bot. 

1. Select **Manage** on the side navigation pane and then go to the **Security** tab. 

    :::image type="content" source="media/security-tab.png" alt-text="The Security tab has options for sharing, access control, authentication, and web channel security":::

2. Select **Authentication**.

    :::image type="content" source="media/security-authentication-pane.png" alt-text="The Authentication pane has options to determine access settings":::


There are three options for authentication:

- **No authentication**. Any user who has a link to the bot (or can find it, for example, on your website) can chat with it. Therefore, the **Access** setting options will be disabled.

    :::image type="content" source="media/security-access-no-auth.png" alt-text="The Access setting can't be changed.":::

- **Only for Teams**. The bot will only work on [the Teams channel](publication-add-bot-to-microsoft-teams.md). This means the user will always be signed in, and therefore the **Require users to sign in** option in the **Access** setting will be enabled and can't be changed.


- **Manual (for any channel including Teams)**. 
  - If your authentication setting is configured to **Manual**, and the service provider is either **Azure Active Directory** or **Azure Active Directory V2**, you can toggle the **Require users to sign in** option and change the [access settings](#access) for the bot.
  - If your authentication provider is set as **Generic OAuth 2**, you can toggle the **Require users to sign in** option, but you cannot control which users can access the bot. That option is only available when using Azure AD authentication. 

## Guest and external access users

Guest users can be considered part of the organization depending on their user configuration.

External access users, however, are always external to the organization. Make sure to check both the user account settings and the bot access configuration to ensure the right people have access to your bot.