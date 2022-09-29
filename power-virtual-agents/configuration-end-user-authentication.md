---
title: Configure user authentication
description: Configure authentication with your identity provider to enable users to sign in when having a bot conversation.
keywords: "Authentication, IdP, PVA, AAD"
ms.date: 08/18/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewr: micchow
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure user authentication in Power Virtual Agents

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](configuration-end-user-authentication.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/configuration-end-user-authentication-teams.md)

Authentication allows users to sign in, giving your bot access to a restricted resource or information. Users can sign in with [Azure Active Directory (Azure AD)](configuration-authentication-azure-ad.md), or with any [OAuth2 identity provider](/azure/active-directory/develop/v2-oauth2-auth-code-flow) such as Google or Facebook.

You can [add user authentication to your bot](advanced-end-user-authentication.md) when you edit a topic.

Power Virtual Agents supports the following authentication providers:

- Azure Active Directory v1
- Azure Active Directory v2
- Any identity provider that complies with the [OAuth2 standard](/azure/active-directory/develop/v2-oauth2-auth-code-flow).

> [!IMPORTANT]
> Changes to the authentication configuration will only take effect after you publish your bot. Make sure to plan ahead before you make authentication changes to your bot.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4n4G2]
>

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Choose an authentication option

Power Virtual Agents supports several authentication options. Choose the one that meets your needs.

To change your bot's authentication settings, go to **Manage** on the side pane, and then go to the **Security** tab and select the **Authentication** card.

:::image type="content" source="media/configuration-end-user-authentication/security-authentication.png" alt-text="Screenshot of the Security page under the Manage menu, highlighting the Authentication card.":::

The following authentication options are available:

- No authentication
- Only for Teams
- Manual (for any channel including Teams)

:::image type="content" source="media/configuration-end-user-authentication/security-authentication-pane.png" alt-text="Screenshot of the Authentication pane showing the three authentication options.":::

### No Authentication

No authentication is the standard configuration for bots that aren't created from Teams. Users can't sign in, and your bot can access only public information and resources.

### Only for Teams

> [!IMPORTANT]
> When the **Only for Teams** option is selected, all channels except the Teams channel will be disabled.
>
> Additionally, the **Only for Teams** option is not available if your bot is integrated with [Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md).

Teams authentication, optimized for the Teams channel, is the standard configuration for bots that are created from Teams. It automatically sets up Azure AD authentication for Teams without the need for any manual configuration. Since Teams authentication itself identifies the user, users aren't prompted to sign in while they're in Teams, unless your bot needs expanded scope.

Only the Teams channel is available if you select this option. If you need other channels but still want authentication for your bot, choose **Manual** authentication.

If you select the **Only for Teams** option, the following variables are available in the authoring canvas:

- `UserID`
- `UserDisplayName`

For more information about these variables and how to use them, see [Add user authentication to a Power Virtual Agents bot](advanced-end-user-authentication.md#authentication-variables).

`AuthToken` and `IsLoggedIn` variables aren't available with this option. If you need an authentication token, use the **Manual** option.

If you change from **Manual** to **Only for Teams** authentication, and your topics contain the variables `AuthToken` or `IsLoggedIn`, they're displayed as **Unknown** variables after the change. Make sure to correct any topics with errors before you publish your bot.

### Manual (for any channel including Teams)

You can configure any Azure AD, Azure AD V2, or OAuth2-compatible identity provider with this option. The following variables are available in the authoring canvas after you configure manual authentication:

- `UserID`
- `UserDisplayName`
- `AuthToken`
- `IsLoggedIn`

For more information about these variables and how to use them, see [Add user authentication to a Power Virtual Agents bot](advanced-end-user-authentication.md#authentication-variables).

Once the configuration is saved, make sure to publish your bot so the changes take effect.

> [!NOTE]
> Authentication changes only take effect after the bot is published.

## Required user sign in and bot sharing

**Require users to sign in** determines whether a user needs to sign in before talking with the bot. We highly recommended that you turn on this setting when your bot needs to access sensitive or restricted information.

:::image type="content" source="media/configuration-end-user-authentication/auth-require-user-to-sign-in.png" alt-text="Screenshot of the Authentication pane showing the Require user to sign in option.":::

This option is not available when the **No authentication** option is chosen.

If you turn off this option, your bot won't ask users to sign in until it encounters a topic that requires them to.

When you turn on this option, it creates a system topic called **Require users to sign in**. This topic is only relevant for the **Manual** authentication setting. Users are always authenticated on Teams.

The **Require users to sign in** topic is automatically triggered for any user who talks to the bot without being authenticated. If the user fails to sign in, the topic redirects to the **Escalate** system topic.

The topic is read-only and can't be customized. To see it, select **Go to the authoring canvas**.

### Control who can chat with the bot in the organization

Your bot's authentication and **Require user to sign in** setting in combination determines whether you can [share the bot](admin-share-bots.md) to control who in your organization can chat with it. The authentication setting doesn't affect sharing a bot for collaboration.

- **No authentication**: Any user who has a link to the bot (or can find it; for example, on your website) can chat with it. You can't control which users in your organization can chat with the bot.

- **Only for Teams**: The bot works only on [the Teams channel](publication-add-bot-to-microsoft-teams.md). Since the user will always be signed in, the **Require users to sign in** setting is turned on and can't be turned off. You can use bot sharing to control who in your organization can chat with the bot.

- **Manual (for any channel including Teams)**:
  
  - If the service provider is either **Azure Active Directory** or **Azure Active Directory V2**, you can turn on **Require users to sign in** to control who in your organization can chat with the bot using bot sharing.
  
  - If the service provider is **Generic OAuth2**, you can turn **Require users to sign in** on or off. When it's turned on, a user who signs in can chat with the bot. You can't control which specific users in your organization may chat with the bot using bot sharing.

When a bot's authentication setting can't control who can chat with it, if you select **Share** on the bot's homepage a message informs you that anyone can chat with your bot.

:::image type="content" source="media/configuration-end-user-authentication/auth-allow-everyone-chat-with-bot.PNG" alt-text="Screenshot of a message stating everyone in the organization can chat with the bot because of its authentication setting.":::

## Manual authentication fields

The following are all the fields you may see when you're configuring manual authentication. Which fields you'll see depends on your choice for service provider.

<!-- table best viewed and edited without wordwrap -->
| Field name                              | Description                                                                                                                                                                                                                                    |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Authorization URL template              | The URL template for authorization, as defined by your identity provider. For example, `https://login.microsoftonline.com/common/oauth2/v2.0/authorize`                                                                                        |
| Authorization URL query string template | The query template for authorization, as provided by your identity provider. Keys in the query string template will vary depending on the identity provider.                                                                                   |
| Client ID                               | Your client ID, obtained from the identity provider.                                                                                                                                                                                           |
| Client secret                           | Your client secret, obtained when you created the identity provider app registration.                                                                                                                                                          |
| Refresh body template                   | The template for the refresh body.                                                                                                                                                                                                             |
| Refresh URL query string template       | The refresh URL query string separator for the token URL, usually a question mark (`?`).                                                                                                                                                       |
| Refresh URL template                    | The URL template for refresh; for example, `https://login.microsoftonline.com/common/oauth2/v2.0/token`.                                                                                                                                       |
| Scope list delimiter                    | The separator character for the scope list. Empty spaces aren't supported in this field.<sup>1</sup>                                                                                                                                           |
| Scopes                                  | The list of [scopes][1] that you want users to have after they've signed in. Use the **Scope list delimiter** to separate multiple scopes.<sup>1</sup> Only set necessary scopes and follow the [least privilege access control principle][5]. |
| Service provider                        | The service provider you want to use for authentication. For more information, see [OAuth generic providers][4].                                                                                                                               |
| Tenant ID                               | Your Azure AD tenant ID. Refer to [Use an existing Azure AD tenant][2] to learn how to find your tenant ID.                                                                                                                                    |
| Token body template                     | The template for the token body.                                                                                                                                                                                                               |
| Token exchange URL (required for SSO)   | This is an optional field used when you're [configuring single sign-on][3].                                                                                                                                                                    |
| Token URL template                      | The URL template for tokens, as provided by your identity provider; for example, `https://login.microsoftonline.com/common/oauth2/v2.0/token`.                                                                                                 |
| Token URL query string template         | The query string separator for the token URL, usually a question mark (`?`).                                                                                                                                                                   |

[1]: /azure/active-directory/develop/developer-glossary#scopes
[2]: /azure/active-directory/develop/quickstart-create-new-tenant#use-an-existing-azure-ad-tenant
[3]: configure-sso.md
[4]: /azure/bot-service/bot-builder-concept-identity-providers?view=azure-bot-service-4.0&tabs=adv1%2Cga2&preserve-view=true
[5]: /windows-server/identity/ad-ds/plan/security-best-practices/implementing-least-privilege-administrative-models

<sup>1</sup> You can use spaces in the **Scopes** field if the identity provider requires it. In that case, enter a comma (`,`) in **Scope list delimiter**, and enter spaces in the **Scopes** field.

## Remove the authentication configuration

1. Edit your bot and select **Manage** on the side pane, and then go to the **Security** tab and select the **Authentication** card.
1. Select **No authentication**.
1. Publish the bot.

If authentication variables are being used in a topic, they'll become **Unknown** variables. Go to the Topics page to see which topics have errors and fix them before publishing.

[!INCLUDE[footer-include](includes/footer-banner.md)]
