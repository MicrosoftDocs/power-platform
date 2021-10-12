---
title: "Configure single sign-on for the Power Virtual Agents app in Teams"
description: "Enable your bot to authenticate an already-signed-in Teams user"
keywords: "Single Sign-on, Teams SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 12/7/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: clmori
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory for Power Virtual Agents chatbots in Microsoft Teams 

The Power Virtual Agents app in Microsoft Teams supports single sign-on (SSO), which means chatbots can sign the user in silently, without having the user sign in again. 

When using Teams the user is already signed-in, so Power Virtual Agents chatbots can use this information for scenarios that require user-specific information like a user's name or other details. 

>[!IMPORTANT] 
>SSO in the Power Virtual Agents app in Teams is only supported for Azure Active Directory v2 apps (Azure AD v2 apps). Other app types, such as Azure AD v1, do not support SSO in the Power Virtual Agents app in Microsoft Teams.  
>You can suggest support for additional account types at the [at the Power Virtual Agents ideas forum](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Ideas/idb-p/pva_ideas).

>[!IMPORTANT] 
>If you have SSO configured for the web publication channel, the steps documented here need to be followed for authentication to work in Teams bots.  
>If your web publication channel has SSO configured but it is not following the instructions in this documentation, authentication in the Teams channel will fail without an error message.  
>If authentication is not working for your bot on your Teams channel, double check your configuration against this document.

## Prerequisites

- [Register a new app with Azure AD](configuration-end-user-authentication.md#use-azure-active-directory-as-your-identity-provider)
- [Add an authentication topic to your bot](advanced-end-user-authentication.md)
- Make sure your bot and Azure AD app are under the same tenant


## Configure single sign-on

The steps required to configure SSO for the Power Virtual Agents app in Microsoft Teams include:

1. [Create your Azure AD app.](#create-your-azure-ad-app)
2. [Update your Azure AD app registration.](#update-your-azure-ad-app-registration)
3. [Update the Azure AD authentication created in the Power Virtual Agents web app.](#update-the-azure-ad-authentication-created-in-the-power-virtual-agents-web-app)

This topic describes how to do these three steps. After you've finished these steps, you should: 

1. [Publish your changes in the Power Virtual Agents web app](publication-add-bot-to-microsoft-teams.md).
1. Test that SSO is working as expected in all the channels your bot is available.

## Create your Azure AD app

Follow the instructions for [Single sign-on (SSO) support for tabs](/microsoftteams/platform/tabs/how-to/authentication/auth-aad-sso) to create your Azure AD app.

## Update your Azure AD app registration

You will need to update your Azure AD app registration by doing the following tasks:

1. Add your Teams app ID to your Azure AD app registration to link the two together.
2. Grant admin consent for your app registration so users don't have to consent every time.
3. Define a custom scope for your bot to enable admin consent.
4. Add authorized client apps to allow your app registration to interface with the Teams web and desktop apps.



### Add your Teams app ID to your Azure AD app registration

You will need to get your Teams app ID:

1. Log in to the Power Virtual Agents web app at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com) and open the bot that you want to configure SSO for.
 
1. Expand **Manage** on the side navigation pane, and then select **Channels**. Select the **Microsoft Teams** tile.
 
2. In the panel that appears to the side, select **Edit detail**, expand on **More** and then copy the app ID by selecting **Copy**. 

    :::image type="content" source="media/teams-sso-app-id.PNG" alt-text="Edit bot detail showing App ID.":::

>[!NOTE]
>If you haven't already enabled the Teams channel, you will see instead see a notice that you need to enable Teams. Select **Turn on Teams** and then re-try Step 1 to get the app ID.  
>:::image type="content" source="media/TeamsSSO/image2.png" alt-text="Teams channel pane showing that the channel is turned off.":::


Now you can add the app ID URI to your Azure AD app registration:

1. Go to the [Azure AD portal](https://portal.azure.com) and find the Azure AD app that you registered and configured as part of the [prerequisites](#prerequisites). 
 
2. Select **Expose an API** on the side navigation panel and set the **Application ID URI** to be in format of ```api://botid-{teamsbotid}```, where you replace ```{teamsbotid}``` with the  app ID you copied.
 
3. Select **Save**.

    :::image type="content" source="media/TeamsSSO/image3.png" alt-text="Setting the correct App ID in Azure portal.":::


### Grant admin consent 

To grant admin consent:

1. In the app registration screen for your Azure AD app, go to **API Permissions** on the side navigation panel.

2. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.

    :::image type="content" source="media/TeamsSSO/image4.png" alt-text="Screenshot showing granting admin consent to tenant.":::

>[!IMPORTANT] 
> To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide consent](/azure/active-directory/manage-apps/grant-admin-consent) to your app registrations.


### Define a custom scope for your bot

To define a custom scope for your bot:

1. In the app registration screen for your Azure AD app, go to **Expose an API** on the side navigation panel.

2. Select **Add a scope**.

    :::image type="content" source="media/TeamsSSO/image5.png" alt-text="Screenshot displaying adding scope to Expose an API section.":::

3. Enter a name for the scope, along with the display information that should be shown to users when they come to the SSO screen. 

4. Select **Add a scope**.

5. Enter a **Scope name**, **Admin consent display name**, **Admin consent description**.

    :::image type="content" source="media/TeamsSSO/image6.png" alt-text="Screenshot displaying adding scope details name, consent display name, and consent description.":::

### Add authorized client app IDs

>[!NOTE]
>Remember to replace the example IDs and values below with your own Azure AD configured values.

Now you'll need to add the Teams client app IDs, which are:
 
- ```1fec8e78-bce4-4aaf-ab1b-5451cc387264``` (Teams mobile/desktop application)

- ```5e3ce6c0-2b1f-4285-8d4b-75ee78787346``` (Teams on the web)
 
1. In the **Expose an API** section in the app registration screen for your Azure AD app, select **Add a client application**.

2. Enter the first client app ID, ```1fec8e78-bce4-4aaf-ab1b-5451cc387264```, into the **Client ID** field. Select the checkbox for the listed scope that you created.
 
3. Select **Add application**.

    :::image type="content" source="media/TeamsSSO/image7.png" alt-text="Screenshot showing Add Client Application.":::

4. Repeat from Step 1, this time using ```5e3ce6c0-2b1f-4285-8d4b-75ee78787346``` as the second client app ID and make sure to select the scope checkbox.
 
The **Expose an API** page should have these values: 

:::image type="content" source="media/TeamsSSO/image8.png" alt-text="Screenshot showing correctly filled values for Expose an API screen.":::

## Update the Azure AD authentication created in the Power Virtual Agents web app

You'll now need to update the Azure AD authentication settings in the Power Virtual Agents web app that you configured as part of the [prerequisites](#prerequisites).

You'll need to add the token exchange URL to allow Teams and Power Virtual Agents to share information, and you'll need to do the final configuration of the SSO information.

To add the token exchange url:
 
1. Go to the Azure AD authentication you configured when following the steps to [create the new Azure AD authentication in the Power Virtual Agents web app](configuration-end-user-authentication.md#configure-authentication-with-manual-azure-ad).
 
1. Add the Token Exchange URL as described in the [Configure SSO with Azure AD](configure-sso.md#configure-authentication-in-power-virtual-agents-to-enable-single-sign-on) topic, under the **Configure authentication in Power Virtual Agents to Enable SSO** heading.

    :::image type="content" source="media/TeamsSSO/image9.png" alt-text="Screenshot displaying correct Token Exchange URL configuration.":::

To add Teams SSO configuration information in the Power Virtual Agents bot:
 
1. Log in to the Power Virtual Agents web app at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com) and open the bot that you want to configure SSO for.
 
1. Expand **Manage** on the side navigation pane, and then select **Channels**. Select the **Microsoft Teams** tile.
 
1. Select **Edit details**. 
 
1. Select **More** to see the Teams SSO configuration details. Scroll all the way to the bottom of the panel. Add the following information:
 
    - **AAD application's client ID**: Add the **Application ID** from the **Overview** page of the Azure AD app registration. This ID is the same client ID that was added in the **Client ID** field when creating the Azure AD authentication in the Power Virtual Agents web app.
 
    - **Resource URI**: This URI is the **Application ID** URI from the **Expose an API** page in the Azure AD app registration.
 
1. Save and close.

    :::image type="content" source="media/TeamsSSO/image10.png" alt-text="Screenshot displaying correct Teams channel SSO configuration.":::

 
These steps update the manifest file for the bot. Now you can download the manifest file (as a .zip file) and upload to Teams for test or distribution, or submit for your admin approval. For more information, see the [Add bot to Microsoft Teams in Teams](publication-add-bot-to-microsoft-teams.md) topic.

1. Select **Availability options**.

1. Select **Download .zip** to get the new manifest.

    :::image type="content" source="media/add-bot-to-teams-download-zip.png" alt-text="Screenshot displaying Download .zip button highlighted.":::

>[!IMPORTANT] 
> If your users have used the manifest to install the bot, they will need to get a new manifest after this configuration is complete and install the bot again for the Teams SSO to work. The Teams manifest does not refresh automatically. Alternatively, if you submit for Admin approval, the manifest is updated automatically.

>[!NOTE] 
> Make sure to test your bot authentication functionality in all channels to ensure they are working as intended.



[!INCLUDE[footer-include](includes/footer-banner.md)]
