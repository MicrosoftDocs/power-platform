---
title: "Configure single sign-on for the Power Virtual Agents app in Teams"
description: "Enable your bot to authenticate an already-signed-in Teams user"
keywords: "Single Sign-on, Teams SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 08/02/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: kamrani
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory for Power Virtual Agents bots in Microsoft Teams

The Power Virtual Agents app in Microsoft Teams supports single sign-on (SSO), which means bots can automatically sign-in users with their Microsoft Teams credentials.

SSO in the Power Virtual Agents app in Teams is only supported when using Azure Active Directory v2 (Azure AD v2). Other service providers, such as Azure AD v1, don't support SSO in the Power Virtual Agents app in Microsoft Teams.

> [!IMPORTANT]
> SSO is not supported when your bot is integrated with [Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- [Learn how to use user authentication in a topic](advanced-end-user-authentication.md).
- [Configure manual user authentication using the Azure AD v2 service provider](configuration-end-user-authentication.md).
- Make sure your bot and Azure AD application are under the same tenant.

## Locate your Microsoft Teams channel app ID

1. In Power Virtual Agents, open the bot that you want to configure SSO for.

1. Expand **Manage** on the side pane, and then select **Channels**. Select the **Microsoft Teams** tile.

1. Select **Edit details**, expand **More**, and then copy the **App ID** by selecting **Copy**.

:::image type="content" source="media/configure-sso-teams/copy-teams-channel-app-id.png" alt-text="Screenshot of the Teams channel details pane, with the App ID copy button highlighted.":::

> [!NOTE]
> If you haven't already turned on the Microsoft Teams channel, you'll be notified that it's currently turned off. Select **Turn on Teams** and then re-try step 1 to get the app ID.
>
> :::image type="content" source="media/configure-sso-teams/turn-on-teams-channel.png" alt-text="Screenshot of the Teams channel pane showing that the channel is turned off.":::

## Add your Microsoft Teams channel app ID to your app registration

1. Go to the [Azure portal](https://portal.azure.com/). Open the app registration blade for the app registration you created when you configured user authentication for your bot.

1. Select **Expose an API** on the side pane. For **Application ID URI**, select **Set**.

    :::image type="content" source="media/configure-sso-teams/set-app-id-uri.png" alt-text="Screenshot of the location of the Set button for the Application ID URI.":::

1. Enter `api://botid-{teamsbotid}` and replace `{teamsbotid}` with your [Teams channel app ID](#locate-your-microsoft-teams-channel-app-id) that you found earlier.

    :::image type="content" source="media/configure-sso-teams/enter-app-id-uri.png" alt-text="Screenshot of a correctly formatted URI entered into the Application ID URI box.":::

1. Select **Save**.

## Grant admin consent

<!-- FIXME: I'm unable to do this, due to the app not having a verified publisher. Is there a doc we can link to? -->

1. In the Azure portal on your app registration blade, go to **API Permissions**.

1. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.

:::image type="content" source="media/configure-sso-teams/grant-admin-consent.png" alt-text="Screenshot of the Grant admin consent button highlighted.":::

> [!IMPORTANT]
> To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide](/azure/active-directory/manage-apps/grant-admin-consent) consent to your application registrations.

## Define a custom scope for your bot

1. In the Azure portal on your app registration blade, go to **Expose an API**.

1. Select **Add a scope**.

    :::image type="content" source="media/configure-sso-teams/add-a-scope.png" alt-text="Screenshot of the Add a scope button highlighted.":::

1. Enter the following values:

   <!-- FIXME: the value "Test.Read" is what was in the old screen shot. Is there a better suggested value we can use to encourage naming scope according to best practices? -->
   | Property                   | Value                                |
   | -------------------------- | ------------------------------------ |
   | Scope name                 | `Test.Read`                          |
   | Admin consent display name | `Test.Read`                          |
   | Admin consent description  | `Allows the app to log in the user.` |

1. Select **Add scope**.

## Add Microsoft Teams client IDs

> [!IMPORTANT]
> In the following steps, the values provided for Microsoft Teams client IDs should be used literally because they are the same across all tenants.

1. In the Azure portal on your app registration blade, go to **Expose an API** and select **Add a client application**.

    :::image type="content" source="media/configure-sso-teams/add-client-application.png" alt-text="Screenshot of the Add a client application button highlighted.":::

1. In the **Client ID** field, enter the client ID for Microsoft Teams mobile/desktop, which is  `1fec8e78-bce4-4aaf-ab1b-5451cc387264`. Select the checkbox for [the scope that you created earlier](#define-a-custom-scope-for-your-bot).

    :::image type="content" source="media/configure-sso-teams/enter-client-id.png" alt-text="Screenshot of the client ID entered into the Add a client application pane.":::

1. Select **Add application**.

1. Repeat the steps above, but for **Client ID**, enter the client ID for Microsoft Teams on the web, which is `5e3ce6c0-2b1f-4285-8d4b-75ee78787346`.

1. Confirm the **Expose an API** page lists the Microsoft Teams client app IDs.

    :::image type="content" source="media/configure-sso-teams/client-ids-added.png" alt-text="Screenshot of the Expose an API page that correctly lists the Microsoft Teams client IDs.":::

## Add token exchange URL

To update the Azure AD authentication settings in Power Virtual Agents, you'll need to add the token exchange URL to allow Microsoft Teams and Power Virtual Agents to share information.

1. In the Azure portal on your app registration blade, go to **Expose an API** and copy value in the **Application ID URI** box.

    :::image type="content" source="media/configure-sso-teams/application-id-uri.png" alt-text="Screenshot of the Application ID URI in Azure portal.":::

1. In Power Virtual Agents, select **Manage** on the side pane, select **Security**, and then select the **Authentication** tile.

1. For **Token exchange URL (required for SSO)**, paste the application ID URI you copied earlier.

    :::image type="content" source="media/configure-sso-teams/token-exchange-url.png" alt-text="Screenshot of the Application ID URI entered as the Token exchange URL in Power Virtual Agents.":::

## Add SSO to your bot's Microsoft Teams channel

1. In Power Virtual Agents, expand **Manage** on the side pane, and then select **Channels**.

1. Select the **Microsoft Teams** tile. Select **Edit details** and expand **More**.

1. For **AAD application's client ID**, enter the **Application (client) ID** from your app registration.

   To obtain this value, open the Azure portal. Then on your app registration blade, go to **Overview**. Copy the value in the **Application (client) ID** box.

   :::image type="content" source="media/configure-sso-teams/azure-application-id.png" alt-text="Screenshot of where to find the Application (client) ID in Azure portal.":::

   :::image type="content" source="media/configure-sso-teams/add-sso-application-id.png" alt-text="Screenshot of the Application (client) ID entered as the AAD application's client ID in Power Virtual Agents.":::

1. For **Resource URI**, enter the **Application ID URI** from your app registration.

   To obtain this value, open the Azure portal. Then on your app registration blade, go to **Expose an API**. Copy the value in the **Application ID URI** box.

    :::image type="content" source="media/configure-sso-teams/application-id-uri.png" alt-text="Screenshot of where to find the Application ID URI in Azure portal.":::

    :::image type="content" source="media/configure-sso-teams/add-sso-resource-uri.png" alt-text="Screenshot of the Application ID URI entered as the Resource URI in Power Virtual Agents.":::

1. Select **Save**, and then **Close**.

1. [Publish your bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md).

1. Test your bot in Microsoft Teams to ensure it automatically signs the user in.

[!INCLUDE[footer-include](includes/footer-banner.md)]
