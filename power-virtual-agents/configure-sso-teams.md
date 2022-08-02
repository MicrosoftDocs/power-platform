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

The Power Virtual Agents app in Microsoft Teams supports single sign-on (SSO), which means bots can automatically sign-in users with their Teams credentials.

SSO in the Power Virtual Agents app in Teams is only supported when using Azure Active Directory v2 (Azure AD v2). Other service providers, such as Azure AD v1, do not support SSO in the Power Virtual Agents app in Microsoft Teams.

> [!IMPORTANT]
> SSO is not supported when your bot is integrated with [Dynamics 365 Customer Service](configuration-hand-off-omnichannel).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents).
- [Configure manual user authentication using the Azure AD v2 service provider](configuration-end-user-authentication).
- Make sure your bot and Azure AD application are under the same tenant.

## Locate your Teams channel app ID

1. In Power Virtual Agents, open the bot that you want to configure SSO for.

1. Expand **Manage** on the side pane, and then select **Channels**. Select the **Microsoft Teams** tile.

1. In the pane that appears to the side, select **Edit detail**, expand **More** and then copy the **App ID** by selecting **Copy**.

:::image type="content" source="media/configure-sso-teams/image1.png" alt-text="Edit bot detail showing App ID.":::

> [!NOTE]
> If you haven't already enabled the Teams channel, you'll see a notice that you need to enable Teams. Select **Turn on Teams** and then re-try step 1 to get the app ID.
>
> :::image type="content" source="media/configure-sso-teams/image2.png" alt-text="Teams channel pane showing that the channel is turned off.":::

## Add your Teams channel app ID to your Azure AD app registration

1. Go to the [Azure portal](https://portal.azure.com/) and find the Azure AD application you created for user authentication.

1. Select **Expose an API** on the side pane and in the **Application ID URI** box, enter `api://botid-{teamsbotid}`. Replace `{teamsbotid}` with the [app ID you found earlier](#locate-your-teams-channel-app-id).

1. Select Save.

:::image type="content" source="media/configure-sso-teams/image3.png" alt-text="Setting the correct App ID in Azure portal.":::

## Grant admin consent

1. In the app registration screen for your Azure AD application, go to **API Permissions**.

1. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.

> [!IMPORTANT]
> To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide](/azure/active-directory/manage-apps/grant-admin-consent) consent to your application registrations.

## Define a custom scope for your bot

1. In the app registration screen for your Azure AD application, go to **Expose an API** on the side pane.

1. Select **Add a scope**.

:::image type="content" source="media/configure-sso-teams/image4.png" alt-text="Screenshot displaying adding scope to Expose an API section.":::

1. Enter a name for the scope, along with the display information that should be shown to users when they come to the SSO screen.

1. Select **Add a scope**.

1. Enter a **Scope name**, **Admin consent display name**, **Admin consent description**.

:::image type="content" source="media/configure-sso-teams/image5.png" alt-text="Screenshot displaying adding scope details name, consent display name, and consent description.":::

## Add Teams client app IDs

Next you'll add the following Teams client app IDs to your Azure AD application:

- Teams mobile/desktop application: `1fec8e78-bce4-4aaf-ab1b-5451cc387264`
- Teams on the web: `5e3ce6c0-2b1f-4285-8d4b-75ee78787346`

The Teams _client_ app IDs are different from [your Teams channel app ID](#locate-your-teams-channel-app-id).

1. In the **Expose an API** section in the app registration screen for your Azure AD application, select **Add a client application**.

1. In the **Client ID** field, enter `1fec8e78-bce4-4aaf-ab1b-5451cc387264`. Select the checkbox for [the scope that you created earlier](#define-a-custom-scope-for-your-bot).

1. Select **Add application**.

:::image type="content" source="media/configure-sso-teams/image6.png" alt-text="Screenshot showing Add Client Application.":::

1. Select **Add a client application** to add a second application.

1. In the **Client ID** field, enter `5e3ce6c0-2b1f-4285-8d4b-75ee78787346`. Select the scope checkbox the scope that you created earlier.

1. Select **Add application**.

The **Expose an API** page should have these values:

:::image type="content" source="media/configure-sso-teams/image7.png" alt-text="Screenshot showing correctly filled values for Expose an API screen.":::

## Update Azure AD authentication settings in your bot

To update the Azure AD authentication settings in Power Virtual Agents you'll need to add the token exchange URL to allow Teams and Power Virtual Agents to share information.

    <!-- FIXME: is this "Application ID URI" or "Token exchange URL"? -->
1. Go to the **Expose an API** blade and copy value in the **Application ID URI** box. The URI will be in the format of `api://1234-4567/scope.name`.

    <!-- FIXME: add image -->

1. In Power Virtual Agents, select **Manage** on the side pane, and then go to the **Authentication** tab.

1. For **Token exchange URL (required for SSO)**, paste the application ID URI you copied earlier.

:::image type="content" source="media/configure-sso-teams/image8.png" alt-text="Screenshot displaying correct Token Exchange URL configuration.":::

## Add SSO configuration information to your bot's Teams channel

1. Expand **Manage** on the side pane, and then select **Channels**. Select the **Microsoft Teams** tile.

1. Select **Edit details**.

1. Select **More** to see the Teams channel SSO configuration details. Scroll all the way to the bottom of the pane. Add the following information:

    - **AAD application's client ID**: Add the **Application ID** from the **Overview** page of the Azure AD app registration.

    - **Resource URI**: This URI is the **Application ID URI** from the **Expose an API** page in the Azure AD app registration.

:::image type="content" source="media/configure-sso-teams/image9.png" alt-text="Screenshot displaying correct Teams channel SSO configuration.":::

1. Select **Save**, and then **Close**.

    <!-- FIXME: test is publishing SSO support works if bot is already published -->
1. [Publish your bot to Microsoft Teams](publication-add-bot-to-microsoft-teams).

[!INCLUDE[footer-include](includes/footer-banner.md)]
