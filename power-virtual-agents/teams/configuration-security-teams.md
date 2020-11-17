---
title: "Configure access and authentication in Microsoft Teams"
description: "Determine who can access and interact with your bot in the Power Virtual Agents app in Microsoft Teams."
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.collection: virtual-agent
ms.cusom: "security, teams"
---

# Assign access and change security options

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../configuration-security.md)
> - [Power Virtual Agents app in Microsoft Teams](configuration-security-teams.md)



You can change who can access your bot, and what they can do, with the **Security** options available in Power Virtual Agents.

>[!IMPORTANT]
>Changes to the Access configuration will only take effect after you publish your bot. Make sure to plan ahead before making Access changes to your bot.

## Configure the Access setting

You can determine whether users need to sign in to access your bot, and whether certain users are allowed to access the bot.

1. Select **Manage** on the side navigation pane and then go to the **Security** tab. 

    :::image type="content" source="media/security-tab-teams.png" alt-text="The Security tab has options for sharing, access control, authentication, and web channel security":::

2. Select **Access**.

    :::image type="content" source="media/security-access-teams.png" alt-text="The Access pane has options to grant access and require sign in":::

The **Access** pane gives you control of two aspects for user access.

### Require users to sign in

This setting controls if users need to sign in before talking to your bot. Bots that manage private or sensitive information should use this option. 

>[!NOTE]
>By default, the [**Authentication** setting](#configure-the-authentication-setting) is set to **Only for Teams**, which requires team users to be signed in to use the bot. Therefore, you won't be able to configure this setting unless you change the **Authentication** setting.
>Read more about different access options in [Assign access and change security options in the Power Virtual Agents web app](../configuration-security.md#access-settings-based-on-authentication-configuration)

If you want your bot to be publicly accessible (such as on a web channel), you can turn this option off. 

Bots with this configuration turned **Off** won't ask users to sign in until they encounter a topic which requires them to do so.

When the **Require users to sign in** option is turned **On**, a new system topic called **Require users to sign in** is created. This topic is only relevant for the "Manual" authentication setting, as users are always authenticated on Teams.

This topic is automatically triggered for any user who talks to the bot without being authenticated. This topic is read-only and cannot be customized. If the user fails to sign in, this topic redirects the user to the **Escalate** system topic. You can see the topic by clicking **Go to the authoring canvas**.


### Access

This option controls who can access your bot. You can select one of two groups:

- **Everyone on my team**. This lets every member on the team that the bot belongs to access and chat with the bot. Users outside of the team will see an error when trying to chat with the bot. If you want to add users to access your bot in this configuration, you can add them to the team directly in Microsoft Teams.
- **Everyone in my organization (*Organization name*)**. This lets everyone in the organization access and chat with your bot. Users outside of the organization will see an error when chatting with the bot.

## Configure the Authentication setting

The **Authentication** setting impacts how you can manage access to the bot. 

For more information on configuration the **Authentication** setting and other access options available, see the [Power Virtual Agents web app](../configuration-security.md#access-settings-based-on-authentication-configuration) version of this topic.
