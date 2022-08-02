---
title: "Configure single sign-on for the Power Virtual Agents app in Teams"
description: "Enable your bot to authenticate an already-signed-in Teams user"
keywords: "Single Sign-on, Teams SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 06/23/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: clmori
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory for Power Virtual Agents chatbots in Microsoft Teams

The Power Virtual Agents app in Microsoft Teams supports single sign-on (SSO), which means chatbots can sign the user in silently, without having the user sign in again. After the user is signed-in, Power Virtual Agents chatbots can use this information for scenarios that require user-specific information like a user\'s name or other details.

**Important**

SSO in the Power Virtual Agents app in Teams is only supported for Azure Active Directory v2 apps (Azure AD v2 apps). Other app types, such as Azure AD v1, do not support SSO in the Power Virtual Agents app in Microsoft Teams.

SSO is not supported when your bot is integrated with [Dynamics 365 Customer Service](https://docs.microsoft.com/en-us/power-virtual-agents/configuration-hand-off-omnichannel).

**Prerequisites**

-   [Learn more about what you can do with Power Virtual Agents.](•%09https:/docs.microsoft.com/en-us/power-virtual-agents/fundamentals-what-is-power-virtual-agents)

-   Make sure your bot and Azure AD app are under the same tenant

**Create your Azure AD app**

Follow the steps in [Configure user authentication](https://docs.microsoft.com/en-us/power-virtual-agents/configuration-end-user-authentication#use-azure-active-directory-as-your-identity-provider) topic to create Azure AD application.

**Add your Teams app ID to your Azure AD app registration**

You will need to get your Teams app ID:

1.  Log in to the Power Virtual Agents web app at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com/) and open the bot that you want to configure SSO for.

2.  Expand **Manage** on the side pane, and then select **Channels**. Select the **Microsoft Teams** tile.

3.  In the pane that appears to the side, select **Edit detail**, expand **More** and then copy the app ID by selecting **Copy**.

![Edit bot detail showing App ID.](output/media/media/image1.png){width="6.1097222222222225in" height="9.0in"}

**Note**

If you haven\'t already enabled the Teams channel, you will see instead see a notice that you need to enable Teams. Select Turn on Teams and then re-try Step 1 to get the app ID.

![Teams channel pane showing that the channel is turned off.](output/media/media/image2.png){width="6.5in" height="3.2784722222222222in"}

Now you can add the app ID URI to your Azure AD app registration:

1.  Go to the [Azure AD portal](https://portal.azure.com/) and find the Azure AD app that you created earlier.

2.  Select **Expose an API** on the side pane and set the **Application ID URI** to be in format of api://botid-{teamsbotid}, where you replace {teamsbotid} with the app ID you copied.

3.  Select Save.

> ![Setting the correct App ID in Azure portal.](output/media/media/image3.png){width="6.5in" height="3.204861111111111in"}
>
> **Grant admin consent**
>
> To grant admin consent:

1.  In the app registration screen for your Azure AD app, go to **API Permissions**.

2.  Select **Grant admin consent for \<your tenant name\>** and then **Yes**.

**Important**

To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent) consent to your app registrations.

**Define a custom scope for your bot**

1.  In the app registration screen for your Azure AD app, go to **Expose an API** on the side pane.

2.  Select **Add a scope**.

![Screenshot displaying adding scope to Expose an API section.](output/media/media/image4.png){width="6.5in" height="2.7819444444444446in"}

1.  Enter a name for the scope, along with the display information that should be shown to users when they come to the SSO screen.

2.  Select **Add a scope**.

3.  Enter a **Scope name**, **Admin consent display name**, **Admin consent description**.

![Screenshot displaying adding scope details name, consent display name, and consent description.](output/media/media/image5.png){width="5.686805555555556in" height="9.0in"}

**Add authorized client app IDs**

**Note**

Remember to replace the example IDs and values below with your own Azure AD configured values.

Now you\'ll need to add the Teams client app IDs, which are:

-   Teams mobile/desktop application: 1fec8e78-bce4-4aaf-ab1b-5451cc387264

-   Teams on the web: 5e3ce6c0-2b1f-4285-8d4b-75ee78787346

1.  In the **Expose an API** section in the app registration screen for your Azure AD app, select **Add a client application**.

2.  Enter the first client app ID, 1fec8e78-bce4-4aaf-ab1b-5451cc387264, into the **Client ID** field. Select the checkbox for the listed scope that you created.

3.  Select **Add application**.

> ![Screenshot showing Add Client Application.](output/media/media/image6.png){width="6.5in" height="3.2736111111111112in"}

4.  Repeat from Step 1, this time using 5e3ce6c0-2b1f-4285-8d4b-75ee78787346 as the second client app ID and make sure to select the scope checkbox.

The **Expose an API** page should have these values:

![Screenshot showing correctly filled values for Expose an API screen.](output/media/media/image7.png){width="6.5in" height="2.9854166666666666in"}

**Update the Azure AD authentication created in the Power Virtual Agents web app**

You\'ll now need to update the Azure AD authentication settings in the Power Virtual Agents web app that you configured as part of the [prerequisites](https://docs.microsoft.com/en-us/power-virtual-agents/configure-sso-teams#prerequisites).

You\'ll need to add the token exchange URL to allow Teams and Power Virtual Agents to share information, and you\'ll need to do the final configuration of the SSO information.

To add the token exchange url:

1.  Go to the Azure AD authentication you configured when following the steps to [create the new Azure AD authentication in the Power Virtual Agents web app](https://docs.microsoft.com/en-us/power-virtual-agents/configuration-end-user-authentication#configure-manual-authentication).

2.  Add the Token Exchange URL as described in the [Configure SSO with Azure AD](https://docs.microsoft.com/en-us/power-virtual-agents/configure-sso#configure-authentication-in-power-virtual-agents-to-enable-sso) topic, under the **Configure authentication in Power Virtual Agents to Enable SSO** heading.

![Screenshot displaying correct Token Exchange URL configuration.](output/media/media/image8.png){width="6.5in" height="3.279166666666667in"}

To add Teams SSO configuration information in the Power Virtual Agents bot:

1.  Log in to the Power Virtual Agents web app at [https://web.powerva.microsoft.com](https://web.powerva.microsoft.com/) and open the bot that you want to configure SSO for.

2.  Expand **Manage** on the side pane, and then select **Channels**. Select the **Microsoft Teams** tile.

3.  Select **Edit details**.

4.  Select **More** to see the Teams SSO configuration details. Scroll all the way to the bottom of the pane. Add the following information:

    -   **AAD application\'s client ID**: Add the **Application ID** from the **Overview** page of the Azure AD app registration. This ID is the same client ID that was added in the **Client ID** field when creating the Azure AD authentication in the Power Virtual Agents web app.

    -   **Resource URI**: This URI is the **Application ID** URI from the **Expose an API** page in the Azure AD app registration.

```{=html}
<!-- -->
```
1.  Save and close.

![Screenshot displaying correct Teams channel SSO configuration.](output/media/media/image9.png){width="6.5in" height="3.2715277777777776in"}

These steps update the manifest file for the bot. Now you can download the manifest file (as a .zip file) and upload to Teams for test or distribution, or submit for your admin approval. For more information, see the [Add bot to Microsoft Teams in Teams](https://docs.microsoft.com/en-us/power-virtual-agents/publication-add-bot-to-microsoft-teams) topic.

1.  Select **Availability options**.

2.  Select **Download .zip** to get the new manifest.

![Screenshot displaying Download .zip button highlighted.](output/media/media/image10.png){width="5.6875in" height="1.1527777777777777in"}

**Important**

If your users have used the manifest to install the bot, they will need to get a new manifest after this configuration is complete and install the bot again for the Teams SSO to work. The Teams manifest does not refresh automatically. Alternatively, if you submit for Admin approval, the manifest is updated automatically.

** Note**

Make sure to test your bot authentication functionality in all channels to ensure they are working as intended.


[!INCLUDE[footer-include](includes/footer-banner.md)]
