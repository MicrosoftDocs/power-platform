---
title: Configure user authentication
description: Configure authentication with your identity provider to enable users to sign in when having a bot conversation.
keywords: "Authentication, IdP, PVA, AAD"
ms.date: 04/01/2022
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

Authentication allows users to sign in, giving your bot access to a restricted resource or information. Users can sign in with an Azure Active Directory (Azure AD) account, or with any [OAuth2 identity provider](/azure/active-directory/develop/v2-oauth2-auth-code-flow) such as Google or Facebook.

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
> Only the Teams channel is available with this option. All other channels are disabled, and you'll receive a warning if you try to add any.

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

**Require users to sign in** determines whether a user needs to sign in before talking with the bot. It's available only with **Only for Teams** and **Manual** authentication. We highly recommended that you turn on this setting when your bot needs to access sensitive or restricted information.

:::image type="content" source="media/configuration-end-user-authentication/auth-require-user-to-sign-in.png" alt-text="Screenshot of the Authentication pane showing the Require user to sign in option.":::

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

## Register a new app with your identity provider

Before you can configure manual authentication in Power Virtual Agents, you need to register a new app with your identity provider and get a Client ID and client secret. This section describes how to do that with the [Azure portal](https://portal.azure.com) for Azure AD. If you have a different identity provider, you should consult its setup instructions.

Make sure to configure the redirect URL to `https://token.botframework.com/.auth/web/redirect`, and that the assigned API permissions and scopes for the app are the same permissions you need the bot to access.

> [!IMPORTANT]
> Your app registration redirect URL must be `https://token.botframework.com/.auth/web/redirect`.  
> Ensure that the app has the correct API permissions and its related scopes.

### Use Azure Active Directory as your identity provider

#### Create an app registration

1. Sign in to the [Azure portal](https://portal.azure.com), using an admin account on the same tenant as your bot.

1. Go to [App registrations](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade), either by selecting the icon or searching in the top search bar.

1. Create a new **Application Registration**.

1. Select **New registration** and enter a name for the registration.  
    It can be helpful to use the name of your bot. For example, if your bot is called "Contoso sales help", you might name the app registration "ContosoSalesReg" or something similar.

1. Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

1. Leave the **Redirect URI** section blank for now. You'll enter that information in the next steps.

1. Select **Register**.

#### Add the redirect URL

1. Once the registration is complete, the **Overview** page opens. Go to **Authentication** and then select **Add a platform**.

1. Under **Platform configurations** select **Add a platform**, then select **Web**.

1. Under **Redirect URIs**, enter `https://token.botframework.com/.auth/web/redirect`.

1. Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

1. Select **Configure** to confirm your changes.

#### Generate a client secret

1. Go to **Certificates & Secrets**.

1. Under the **Client secrets** section, select **New client secret**.

1. (Optional) Enter a description. One will be provided if you leave it blank.

1. Select the expiry period. Select the shortest period that's relevant for the life of your bot.

1. Select **Add** to create the secret.

1. Store the secret's **Value** in a temporary place. You'll need it when you configure your bot's authentication.

> [!IMPORTANT]
> If you navigate away from the page, the secret's **Value** is obfuscated and you'll need to generate a new client secret.

## Configure manual authentication

1. Sign in to Power Virtual Agents. If you're using Azure AD as your identity provider, make sure to sign in on the same tenant where you created the app registration.

1. Open your bot.

1. Select **Manage** on the side pane, and then go to the **Security** tab and select the **Authentication** card.

    :::image type="content" source="media/configuration-end-user-authentication/auth-manage-sm.png" alt-text="Screenshot of selecting the Authentication card.":::

1. Select **Manual (for any channel including Teams)**.

    :::image type="content" source="media/configuration-end-user-authentication/auth-select-manual.png" alt-text="Screenshot of selecting the manual authentication option.":::

1. [Enter the required information](#manual-authentication-fields).  
    The information you need to enter depends on your setup and provider. If you have questions about what to enter, contact your administrator or identity provider.

1. Select **Save** to finish the configuration.

### Manual authentication fields

The following are all the fields you may see when you're configuring manual authentication. Which fields you'll see depends on your choice for [service provider](#service-provider).

#### Authorization URL template

The URL template for authorization, as defined by your identity provider; for example, `https://login.microsoftonline.com/common/oauth2/v2.0/authorize`

To find this information when you're using Azure AD as your identity provider: Go to the app registration's **Overview** page and select **Endpoints**. The URL template for authorization is shown as **OAuth 2.0 token endpoint (v2)**.

#### Authorization URL query string template

The query template for authorization, as provided by your identity provider. Keys in the query string template will vary depending on the identity provider.

When you're using Azure AD, enter `?client_id={ClientId}&response_type=code&redirect_uri={RedirectUrl}&scope={Scopes}&state={State}`.

#### Client ID

Your client ID, obtained from the identity provider.

To find this information when you're using Azure AD as your identity provider: Go to the app registration's **Overview** page. The Client ID is shown as **Application (client) ID**.

#### Client secret

Your client secret, obtained when you created the identity provider app registration. If you navigate away from the **Certificates & secrets** page before you record the client secret, its **Value** is obfuscated and you'll need to create a new one.

To find this information when you're using Azure AD as your identity provider: Generate a new client secret.

#### Refresh body template

The template for the refresh body.

When you're using Azure AD as your identity provider, enter `refresh_token={RefreshToken}&redirect_uri={RedirectUrl}&grant_type=refresh_token&client_id={ClientId}&client_secret={ClientSecret}`.

#### Refresh URL query string template

The refresh URL query string separator for the token URL, usually a question mark (`?`).

#### Refresh URL template

The URL template for refresh; for example, `https://login.microsoftonline.com/common/oauth2/v2.0/token`. For Azure apps, replace the base URL with your Azure app URL.

To find this information when you're using Azure AD as your identity provider: Go to the app registration's **Overview** page and select **Endpoints**. The refresh URL template is shown as **OAuth 2.0 token endpoint (v2)**.

#### Scope list delimiter

The separator character for the scope list. When you're using Azure AD as your identity provider, enter a comma (`,`).

Empty spaces aren't supported in this field. You can use them in the **Scopes** field if the identity provider requires it. In that case, enter a comma (`,`) in **Scope list delimiter**, and enter spaces in the **Scopes** field.

#### Scopes

The list of [scopes](/azure/active-directory/develop/developer-glossary#scopes) that you want users to have after they've signed in.

Use spaces to separate multiple scopes, only set necessary scopes, and follow the [least privilege access control principle](/windows-server/identity/ad-ds/plan/security-best-practices/implementing-least-privilege-administrative-models).

To find this information when you're using Azure AD as your identity provider: Go to the **API permissions** page under **API / Permissions**.

For custom scopes that are defined by an exposed API, you'll need to use the full URI, including the exposed Application ID URI. On the **Expose an API** page, add the **Application ID URI** and ending slash (`/`) at the beginning of the scope name. For example, if your custom scope name is `app.scope.sso`, and the **Application ID URI** is `api://1234-4567`, then you would enter `api://1234-4567/app.scope.sso` as the scope.

#### Service provider

The service provider you want to use for authentication.

If you're using Azure AD as your identity provider, we recommend using "Azure Active Directory" or "Azure Active Directory V2" for easier configuration.

For more information, see [OAuth generic providers](/azure/bot-service/bot-builder-concept-identity-providers?view=azure-bot-service-4.0&tabs=adv1%2Cga2&preserve-view=true).  

#### Tenant ID

Your Azure AD tenant ID. Refer to [Use an existing Azure AD tenant](/azure/active-directory/develop/quickstart-create-new-tenant#use-an-existing-azure-ad-tenant) to learn how to find your tenant ID.

#### Token body template

The template for the token body.

When you're using Azure AD as your identity provider, enter `code={Code}&grant_type=authorization_code&redirect_uri={RedirectUrl}&client_id={ClientId}&client_secret={ClientSecret}`.

#### Token exchange URL (required for SSO)

This is an optional field used when you're [configuring single sign-on](configure-sso.md).

#### Token URL template

The URL template for tokens, as provided by your identity provider; for example, `https://login.microsoftonline.com/common/oauth2/v2.0/token`. For Azure apps, replace the base URL with your Azure app URL.

To find this information when using Azure AD as your identity provider: Go to the app registration's **Overview** page and select **Endpoints**. The token URL template is shown as **OAuth 2.0 token endpoint (v2)**.

#### Token URL query string template

The query string separator for the token URL, usually a question mark (`?`).

When you're using Azure AD as your identity provider, enter a question mark (`?`).

## Test your configuration

After the setup steps are complete, save your configuration and test it by [creating a new topic using authentication](advanced-end-user-authentication.md).

## Remove the authentication configuration

1. Edit your bot and select **Manage** on the side pane, and then go to the **Security** tab and select the **Authentication** card.
1. Select **No authentication**.
1. Publish the bot.

If authentication variables are being used in a topic, they'll become **Unknown** variables. Go to the Topics page to see which topics have errors and fix them before publishing.

[!INCLUDE[footer-include](includes/footer-banner.md)]
