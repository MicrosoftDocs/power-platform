---
title: "Configure single sign-on for Teams channel"
description: "Enable your bot to authenticate an already-signed-in Teams user"
keywords: "Single Sign-on, Teams SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 12/7/2020
ms.service: power-virtual-agents
ms.topic: article
author: ggupta
ms.author: ggupta
manager: shellyha
ms.reviewer: clmori
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory in Teams bots in Power Virtual Agents


Power Virtual Agents in Teams supports single sign-on (SSO), which means chatbots can sign the user in silently, without having the user sign in again. The user would already be signed in when using Teams, and this provides a seamless experience in a Power Virtual Agents bot in Teams for scenarios that require user specific information like user name. 

>[!IMPORTANT] 
>Teams SSO is only supported for Azure Active Directory v2 application (Azure AD v2 application). Other application types such as Azure AD v1 does not support SSO in Power Virtual Agents.
>You can suggest support for additional account types at the [at the Power Virtual Agents ideas forum](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Ideas/idb-p/pva_ideas).

>[!IMPORTANT] 
>If you have SSO configured for the web publication channel, the steps documented here need to be followed for authentication to work in Teams bots. If your web publication channel has SSO configured but it is not following the instructions in this documentation, authentication in the Teams channel will fail without an error message. If authentication is not working for your bot on your Teams channel, please double check the configuration against this document.

## Prerequisites

- [Register a new app with AAD](configuration-end-user-authentication#use-azure-active-directory-as-your-identity-provider)
- [Add an authentication topic to your bot](advanced-end-user-authentication.md)

 Once you have an AAD app registered, we need to make some changes to this existing AAD app and some configuration changes within the PVA AAD authentication to get SSO setup correctly for Teams bots.

## Configure single sign-on

The steps required to configure single sign on for SSO are:
- Create your AAD application
- Updates to the Azure AAD app registration detailed below.
- Updates to the AAD authentication created in PVA detailed below.
- Publish your changes in PVA.
- Test that single sign on is working as expected in all the channels your bot is available.

## Create your AAD application

Follow the instructions on Teams documentation [Single sign-on (SSO) support for tabs](https://docs.microsoft.com/en-us/microsoftteams/platform/tabs/how-to/authentication/auth-aad-sso) to create your AAD application.

## Updates to the Azure AAD app registration

The first step is to get the Teams app ID. To get this, log into the PVA portal at [https://powerva.microsoft.com](https://powerva.microsoft.com) and open the bot that you want to configure Teams SSO for.
 
1. Go to **Manage** -> **Channels** -> **Microsoft Teams**.
 
2. In the panel on the right, select 'Submit for admin approval' and then copy the app ID by clicking on Copy. This will copy the app ID that you will next use in the Azure app registration you created for the AAD authentication.

    :::image type="content" source="media/TeamsSSO/image1.png" alt-text="Submit for admin approval screen showing App ID":::

3. Note, if you haven't already enabled the Teams channel, you will see this. Select **Turn on Teams** and then re-try step 1 above to get the app ID.

    :::image type="content" source="media/TeamsSSO/image2.png" alt-text="Teams channel pane showing that the channel is turned off":::


### Add the App ID URI in the Azure app registration

Next, we will add the App ID URI in the Azure app registration

1. Go to the Azure AD application configuration portal and find the AAD application that you configured in PVA bot for authentication. 
 
2. Go to **Expose an API** on the left side and set the Application ID URI to be in format of ```api://botid-{teamsbotid}```, where you replace ```{teamsbotid}``` with the ID from above.
 
3. Click **Save**.

    :::image type="content" source="media/TeamsSSO/image3.png" alt-text="Setting the correct App ID in Azure Portal":::


### Grant admin consent 

To grant admin consent

1. Go to **API Permissions**

2. Select **Grant admin consent for <your tenant name>** and then **Yes**.

    :::image type="content" source="media/TeamsSSO/image4.png" alt-text="Screenshot showing granting admin consent to tenant":::

>[!IMPORTANT] 
> To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide consent](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent) to your app registrations.


### Define a custom scope for your bot

To define a custom scope for your bot

1. Go back to the **Expose an API** screen

2. Go to **Add a scope**

    :::image type="content" source="media/TeamsSSO/image5.png" alt-text="Screenshot displaying adding scope to Expose an API section":::

3. Enter a name for the scope, along with the display information that should be shown to users when they come to the single sign-on screen. 

4. Select Add a scope.

5. Enter a scope name, Admin consent display name, Admin consent description.

    :::image type="content" source="media/TeamsSSO/image6.png" alt-text="Screenshot displaying adding scope details name, consent display name, and consent description":::

### Add authorized client applications

Next, add two client applications IDs. There is a separate client ID for the Teams mobile/desktop application vs. Teams on the web.
 
```1fec8e78-bce4-4aaf-ab1b-5451cc387264``` (Teams mobile/desktop application)

```5e3ce6c0-2b1f-4285-8d4b-75ee78787346``` (Teams on the web)
 
1. Select **Add a client application**.

2. Enter the first Application (client) ID, ```1fec8e78-bce4-4aaf-ab1b-5451cc387264``` into the **Client ID** field. Select the checkbox for the listed scope that you created.
 
3. Select Add application.

    :::image type="content" source="media/TeamsSSO/image7.png" alt-text="Screenshot showing Add Client Application":::

4. Repeat the same and add ```5e3ce6c0-2b1f-4285-8d4b-75ee78787346``` as the second application (client ID) and make sure to select the scope checkbox.
 
5. Once these steps are done, the 'Expose an API' page should have these values: 

    :::image type="content" source="media/TeamsSSO/image8.png" alt-text="Screenshot showing correctly filled values for Expose an API screen":::

## Updates to the AAD authentication created in PVA

### Add the Token Exchange URL
 
Now, go back to the AAD authentication defined in PVA earlier, when following the steps to [create the new AAD authentication in PVA](https://docs.microsoft.com/en-us/power-virtual-agents/configuration-end-user-authentication#configure-authentication-with-manual-azure-ad)
 
1. Add the Token Exchange URL.  The token exchange URL is the scope URL defined in step 3 above. 
 
2. Go to **Manage** -> **Security** -> **Authentication**. 

3. Copy the scope from step 3 above and paste it into the Token Exchange URL field.

4. Save

    :::image type="content" source="media/TeamsSSO/image9.png" alt-text="Screenshot displaying correct Token Exchange URL configuration":::

### Add Teams SSO configuration information in the PVA bot
 
1. Go back to PVA to the correct bot in the correct environment for which you are setting up SSO.
 
1. Go to **Manage** -> **Channels** -> **Microsoft Teams**
 
1. Select **Edit details**. 
 
1. Select **More** to expand to see the Teams SSO configuration details. Scroll all the way to the bottom of the panel.
 
Here, add the following:
 
1. AAD application's client ID: Add the Application ID from the Overview page of the AAD app registration. This is the same client ID that was add ed in the **Client ID** field when creating the AAD authentication in PVA.
 
1. Resource URI: This is the Application ID URI from the **Expose an API** page in the AAD app registration.
 
1. Save and Close

    :::image type="content" source="media/TeamsSSO/image10.png" alt-text="Screenshot displaying correct Teams channel SSO configuration":::

With this, you have successfully configured SSO for your Teams bot.
 
These steps update the manifest file. Now you can actually download the manifest file (zip file) and then upload to Teams for test or distribution, or submit for your admin approval.

1. Select **Download manifest** to get the new manifest.

    :::image type="content" source="media/TeamsSSO/image11.png" alt-text="Screenshot displaying Download manifest button highlighted":::

>[!NOTE] 
> Make sure to test your bot authentication functionality in all channels to ensure they are working as intended.

>[!IMPORTANT] 
> If your users have used the manifest to install the bot, they will need to get a new manifest after this configuration is complete and install the bot again for the Teams SSO to work. The Teams manifest does not refresh automatically. Alternatively, if you submit for Admin approval, the manifest is updated automatically.



