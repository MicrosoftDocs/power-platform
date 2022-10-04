---
title: "Configure single sign-on for chat canvas"
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
2.	Go to **App registrations**, either by selecting the icon or searching in the top search bar.

 :::image type="content" source="media/sso/start-app-reg.png" alt-text="Screenshot showing new registration form." border="false":::
 
 3.	Select **New registration** and enter a name for the registration.

 :::image type="content" source="media/sso/new-app-reg.png" alt-text="Screenshot showing new registration form." border="false":::

It can be helpful to use the name of your bot. For example, if your bot is called "Contoso sales help", you might name the app registration "ContosoSalesReg" or something similar.

4.	Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

 :::image type="content" source="media/sso/register-an-app.png" alt-text="Screenshot accounts in organizational directory." border="false":::

5.	Leave the **Redirect URI** section blank for now. You'll enter that information in the next steps.
6.	Select **Register**.

### Add the redirect URL

1.	Once the registration is complete, the **Overview** page opens. Go to **Authentication** and then select **Add a platform**.

 :::image type="content" source="media/sso/add-platform.png" alt-text="Screenshot showing authentication." border="false":::

2.	Under **Platform configurations** select **Add a platform**, then select **Web**.

 :::image type="content" source="media/sso/configure-platform.png" alt-text="Screenshot showing add a platform." border="false":::
 
3.	Under **Redirect URIs**, enter `https://token.botframework.com/.auth/web/redirect`.

4.	Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

:::image type="content" source="media/sso/redirect-uri.png" alt-text="Screenshot showing implicit grant and hybrid flow." border="false":::

5.	Select **Configure** to confirm your changes.

### Generate a client secret
1.	Go to **Certificates & Secrets**.
2.	Under the **Client secrets** section, select **New client secret**.
3.	(Optional) Enter a description. One will be provided if you leave it blank.
4.	Select the expiry period. Select the shortest period that's relevant for the life of your bot.
5.	Select **Add** to create the secret.
6.	Store the secret's **Value** in a secure temporary place. You'll need it when you configure your bot's authentication later on.

> [!Important]
>  If you navigate away from the page, the secret's Value is obfuscated, and you'll need to generate a new client secret.

### API Permissions
1.	Go to **API Permissions**. Select **Grant admin consent for <your tenant name>** and then select **Yes**.
Important To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must grant tenant-wide consent to your app registrations.
 
 :::image type="content" source="media/sso/api-permission.png" alt-text="Screenshot API permission." border="false":::

2.	Next, select **Add a permission**, then **Microsoft Graph**.
 
  :::image type="content" source="media/sso/request-api-permission.png" alt-text="Screenshot showing request API permission." border="false":::

3.	Next, select **Delegated permissions**.

  :::image type="content" source="media/sso/delegated-permission.png" alt-text="Screenshot showing delegated permission." border="false":::
 
4.	Select **openid** and **profile**.
 
  :::image type="content" source="media/sso/select-permission.png" alt-text="Screenshot showing delegated permission selection." border="false"::: 
 
5. Select **Add permissions** to save your settings.
 
### Define a custom scope for your bot
Define a custom scope by exposing an API for the canvas app registration within the authentication app registration. Scopes allow you to determine user and admin roles and access rights.
 
1.	Go to Expose an API and select Add a scope.

 :::image type="content" source="media/sso/expose-api.png" alt-text="Screenshot showing API scopes" border="false"::: 
 
2.	Select Save and continue.
3.	Enter a Scope name.
4.	Under Who can consent?, select Admins and users.
5.	Enter Admin consent display name and Admin consent description. 

 :::image type="content" source="media/sso/add-scope.png" alt-text="Screenshot adding of API scopes" border="false"::: 
 
6.	Select **Add** scope.
 
### Configure authentication in Power Virtual Agents to enable SSO
The Token Exchange URL in the Power Virtual Agents authentication configuration page is used to exchange the OBO token for the requested access token through the bot framework. ower Virtual Agents calls into Azure AD to perform the actual exchange.
 
1.	Sign in to Power Virtual Agents.
 
2.	Confirm you've selected the bot for which you want to enable authentication by selecting the bot icon on the top menu and choosing the correct bot.
 
3.	Select **Manage** on the side pane, then **Security**.

:::image type="content" source="media/sso/pva-security-auth.png" alt-text="Screenshot PVA security and authentication page" border="false"::: 
 
4.	Next, select **Authentication**.
 
:::image type="content" source="media/sso/pva-auth.png" alt-text="Screenshot PVA authentication settings page" border="false"::: 
 
5.	Select **Manual (for any channel including Teams)**.
 
6.	Make sure **Require users to sign in** is checked.
 
7.	Select **Azure Active Directory v2**.
 
8.	In the **Token exchange URL** field, enter the full scope URI from the **Expose an API** blade in the Azure portal for the bot’s authentication app registration. The URI will be in the format of `api://1234-4567/scopename` as shown below.

 :::image type="content" source="media/sso/copy-scope.png" alt-text="Screenshot PVA authentication settings page" border="false"::: 

 9.	Update **Client ID** for your PVA bot with the **Application (client) ID** for the canvas app registration. You get the ID from the Overview page for the canvas app registration in the Azure portal as shown below.

 
 
 
