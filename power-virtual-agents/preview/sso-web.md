---
title: "Configure single sign-on"
description: "Enable your bot to authenticate an already-signed-in user (preview)"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA, preview"
ms.date: 10/10/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: pawant
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory in Power Virtual Agents (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Power Virtual Agents supports single sign-on (SSO), which means chatbots can sign the user in if they're in to the page where the bot is deployed.  
For example, the bot is hosted on the corporate intranet or in an app that the user is already signed in to. 

> [!IMPORTANT]
>
> SSO is currently not supported when a bot has been either:
>
> - Published to a [SharePoint website](publication-connect-bot-to-web-channels.md#add-bot-to-your-website).
> - Published to a [Power Apps portal](publication-add-bot-to-power-apps-portal.md).
> - Integrated with [Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Supported channels

The following table details the [channels](publication-fundamentals-publish-channels.md) that currently support SSO. You can suggest support for additional channels [at the Power Virtual Agents ideas forum](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Ideas/idb-p/pva_ideas).

| Channel                          | Supported |
| -------------------------------- | :-------: |
| [Custom Website]                 |     ✔     |
| [Microsoft Teams]<sup>1</sup>    |     ✔    |

<sup>1</sup> If you also have the Teams channel enabled, you need to follow the configuration instructions on the [Configure SSO for Teams channel](configure-sso-teams.md) documentation. Failing to configure the Teams SSO settings as instructed on that page will cause your users to always fail authentication when using the Teams channel.

## Create an app registration in Azure AD for your custom canvas

To enable SSO, you'll need two separate app registrations:

- Tne for your bot to enable user authentication with Azure AD.
- One for your custom canvas (aka website the bot is hosted on) to enable SSO.

> [!IMPORTANT]
> You can't reuse the same app registration for both your bot's user authentication and your custom canvas.

### Create an app registration for the bot
Use Azure Active Directory to create an app registration for your PVA bot
1.	Sign in to the Azure portal, using an admin account on the same tenant as your bot.
2.	Go to App registrations, either by selecting the icon or searching in the top search bar.

 :::image type="content" source="media/sso/new-app-reg.png" alt-text="Screenshot showing new registration form." border="false":::
 
