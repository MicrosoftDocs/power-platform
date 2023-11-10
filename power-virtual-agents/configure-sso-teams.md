---
title: "Configure single sign-on for the Microsoft Copilot Studio app in Teams"
description: "Enable your bot to authenticate an already-signed-in Teams user"
keywords: "Single Sign-on, Teams SSO, User Authentication, Authentication, Microsoft Entra ID, MSA, Identity Provider, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: kamrani
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure single sign-on with Microsoft Entra ID for Microsoft Copilot Studio bots in Microsoft Teams

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The Microsoft Copilot Studio app in Microsoft Teams supports single sign-on (SSO), which means bots can automatically sign-in users with their Microsoft Teams credentials.

SSO in the Microsoft Copilot Studio app in Teams is only supported when using Microsoft Entra ID. Other service providers, such as Azure AD v1, don't support SSO in the Microsoft Copilot Studio app in Microsoft Teams.

> [!IMPORTANT]
> SSO is not supported when your bot is integrated with [Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md).

> [!NOTE]
> If you are using Teams SSO authentication with the manual authentication option, and also using the bot on custom websites at the same time, you must deploy the Teams app using the app manifest.
> 
> For more information, see [Download the bot's Teams app manifest](publication-add-bot-to-microsoft-teams.md#download-the-bots-teams-app-manifest-advanced).
> 
> Other configurations such as authentications options beside Manual, or through Teams deployment using Microsoft Copilot Studio one-click will not work.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Learn how to use user authentication in a topic](advanced-end-user-authentication.md).
- [Add your bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md).

## Configure an app registration

Before configuring SSO for Teams, you'll first need to configure user authentication with Microsoft Entra ID. During this process, you'll create an app registration which you'll use to setup SSO.

1. Create an app registration. See the instructions in [Configure user authentication with Microsoft Entra ID](configuration-authentication-azure-ad.md).
1. Add the redirect URL.
1. Generate a client secret.
1. Configure manual authentication.

Follow the instructions in [Configure user authentication with Microsoft Entra ID](configuration-authentication-azure-ad.md) then return to this article.

## Locate your Microsoft Teams channel app ID

1. In Microsoft Copilot Studio, open the bot that you want to configure SSO for.

1. In the navigation menu under **Settings**, select **Channels**. Select the **Microsoft Teams** tile.

1. Select **Edit details**, expand **More**, and then copy the **App ID** by selecting **Copy**.

:::image type="content" source="media/configure-sso-teams/copy-teams-channel-app-id.png" alt-text="Screenshot of the Teams channel details pane, with the App ID copy button highlighted.":::

> [!NOTE]
> If you haven't already turned on the Microsoft Teams channel, you'll be notified that it's currently turned off. Select **Turn on Teams** and then re-try step 1 to get the app ID.
>
> :::image type="content" source="media/configure-sso-teams/turn-on-teams-channel.png" alt-text="Screenshot of the Teams channel pane showing that the channel is turned off.":::

## Add your Microsoft Teams channel app ID to your app registration

1. Go to the [Azure portal](https://portal.azure.com/). Open the app registration blade for the app registration you created when you configured user authentication for your bot.

1. Select **Expose an API** on the side pane. For **Application ID URI**, select **Set**.

    :::image type="content" source="media/configure-sso-teams/set-app-id-uri.png" alt-text="Screenshot of the location of the Set button for the Application ID URI.":::

1. Enter `api://botid-{teamsbotid}` and replace `{teamsbotid}` with your [Teams channel app ID](#locate-your-microsoft-teams-channel-app-id) that you found earlier.

    :::image type="content" source="media/configure-sso-teams/enter-app-id-uri.png" alt-text="Screenshot of a correctly formatted URI entered into the Application ID URI box.":::

1. Select **Save**.

## Grant admin consent

Applications are authorized to call APIs when they are granted permissions by users/admins as part of the consent process. To learn more about consent, see [Permissions and consent in the Microsoft identity platform](/azure/active-directory/develop/v2-permissions-and-consent)

The admin consent option may be greyed out if it's not enabled by your tenant administrator. However, if it's available, you'll need to grant consent:

1. In the Azure portal on your app registration blade, go to **API Permissions**.

1. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.

    :::image type="content" source="media/configure-sso-teams/grant-admin-consent.png" alt-text="Screenshot of the Grant admin consent button highlighted.":::

> [!TIP]
> To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator can [grant tenant-wide](/azure/active-directory/manage-apps/grant-admin-consent) consent to your application registrations.

## Add API permissions

1. In the Azure portal on your app registration blade, go to **API Permissions**.

1. Select **Add a permission** and choose **Microsoft Graph**.

1. Select **Delegated permissions**. A list of permissions will appear below. Expand **OpenId permissions** and turn on **openid** and **profile**.

1. Select **Add permissions**.

:::image type="content" source="media/configure-sso-teams/add-permissions.png" alt-text="Screenshot of the openid and profile permissions turned on.":::

## Define a custom scope for your bot

1. In the Azure portal on your app registration blade, go to **Expose an API**.

1. Select **Add a scope**.

    :::image type="content" source="media/configure-sso-teams/add-a-scope.png" alt-text="Screenshot of the Add a scope button highlighted.":::

1. Set the following properties:

   | Property                   | Value                                      |
   | -------------------------- | ------------------------------------------ |
   | Scope name                 | Enter `Test.Read`                          |
   | Who can consent?           | Select **Admins and users**                |
   | Admin consent display name | Enter `Test.Read`                          |
   | Admin consent description  | Enter `Allows the app to log in the user.` |
   | State                      | Select **Enabled**                         |

   > [!NOTE]
   > The scope name `Test.Read` is a placeholder value and should be replaced with a name that makes sense in your environment.

1. Select **Add scope**.

## Add Microsoft Teams client IDs

> [!IMPORTANT]
> In the following steps, the values provided for Microsoft Teams client IDs should be used literally because they are the same across all tenants.

1. In the Azure portal on your app registration blade, go to **Expose an API** and select **Add a client application**.

    :::image type="content" source="media/configure-sso-teams/add-client-application.png" alt-text="Screenshot of the Add a client application button highlighted.":::

1. In the **Client ID** field, enter the client ID for Microsoft Teams mobile/desktop, which is  `1fec8e78-bce4-4aaf-ab1b-5451cc387264`. Select the checkbox for [the scope that you created earlier](#define-a-custom-scope-for-your-bot).

    :::image type="content" source="media/configure-sso-teams/enter-client-id.png" alt-text="Screenshot of the client ID entered into the Add a client application pane.":::

1. Select **Add application**.

1. Repeat the steps above, but for **Client ID**, enter the client ID for Microsoft Teams on the web, which is `5e3ce6c0-2b1f-4285-8d4b-75ee78787346`.

1. Confirm the **Expose an API** page lists the Microsoft Teams client app IDs.

    :::image type="content" source="media/configure-sso-teams/client-ids-added.png" alt-text="Screenshot of the Expose an API page that correctly lists the Microsoft Teams client IDs.":::

## Add token exchange URL

To update the Microsoft Entra ID authentication settings in Microsoft Copilot Studio, you'll need to add the token exchange URL to allow Microsoft Teams and Microsoft Copilot Studio to share information.

1. In the Azure portal on your app registration blade, go to **Expose an API**.

1. Under **Scopes**, select **Copy to clipboard**.

    :::image type="content" source="media/configure-sso-teams/copy-scope.png" alt-text="Screenshot of the Copy to clipboard button..":::

1. In Microsoft Copilot Studio, in the navigation menu under **Settings**, select **Security**, and then select the **Authentication** tile.

1. For **Token exchange URL (required for SSO)**, paste the scope you copied earlier.

    :::image type="content" source="media/configure-sso-teams/token-exchange-url.png" alt-text="Screenshot of the Application ID URI entered as the Token exchange URL in Microsoft Copilot Studio.":::

1. Select **Save**.

## Add SSO to your bot's Microsoft Teams channel

1. In Microsoft Copilot Studio, in the navigation menu under **Settings**, select **Channels**.

1. Select the **Microsoft Teams** tile. Select **Edit details** and expand **More**.

1. For **AAD application's client ID**, enter the **Application (client) ID** from your app registration.

   :::image type="content" source="media/configure-sso-teams/add-sso-application-id.png" alt-text="Screenshot of the Application (client) ID entered as the AAD application's client ID in Microsoft Copilot Studio.":::

    To obtain this value, open the Azure portal. Then on your app registration blade, go to **Overview**. Copy the value in the **Application (client) ID** box.

   :::image type="content" source="media/configure-sso-teams/azure-application-id.png" alt-text="Screenshot of where to find the Application (client) ID in Azure portal.":::

1. For **Resource URI**, enter the **Application ID URI** from your app registration.

   :::image type="content" source="media/configure-sso-teams/add-sso-resource-uri.png" alt-text="Screenshot of the Application ID URI entered as the Resource URI in Microsoft Copilot Studio.":::

    To obtain this value, open the Azure portal. Then on your app registration blade, go to **Expose an API**. Copy the value in the **Application ID URI** box.

    :::image type="content" source="media/configure-sso-teams/application-id-uri.png" alt-text="Screenshot of where to find the Application ID URI in Azure portal.":::

1. Select **Save**, and then **Close**.

1. In the navigation menu, select **Publish**.

1. Select **Publish** to make the latest bot content available to your customers.

1. In the navigation menu, under **Settings**, select **Channels**.

1. Select **Microsoft Teams**, then select **Open bot**.

1. Start a new conversation with your bot in Microsoft Teams to test if it automatically signs you in.

[!INCLUDE[footer-include](includes/footer-banner.md)]
