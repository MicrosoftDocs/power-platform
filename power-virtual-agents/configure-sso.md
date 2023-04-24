---
title: "Configure single sign-on"
description: "Enable your bot to authenticate an already-signed-in user"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 07/20/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: pawant
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory in Power Virtual Agents

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Power Virtual Agents supports single sign-on (SSO), which means chatbots can sign the user in if they're in to the page where the bot is deployed.  

For example, the bot is hosted on the corporate intranet or in an app that the user is already signed in to.

There are four main steps to configuring SSO for Power Virtual Agents:

1. Create an app registration in Azure AD for your custom canvas.

1. Define a custom scope for your bot.

1. Configure authentication in Power Virtual Agents to enable SSO.

1. Configure your custom canvas HTML code to enable SSO.

> [!IMPORTANT]
>
> SSO is currently not supported when a bot has been either:
>
> - Published to a [SharePoint website](publication-connect-bot-to-web-channels.md#add-bot-to-your-website).
> - Published to a [Power Apps portal](publication-add-bot-to-power-pages.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- [Enable end-user authentication with Azure Active Directory](configuration-authentication-azure-ad.md).
  - SSO is only supported for Azure Active Directory (Azure AD) V2. Other account types such as Microsoft Account or other OAuth accounts are not supported.
- [Add an authentication topic to your bot](advanced-end-user-authentication.md).
- [Use a custom canvas](customize-default-canvas.md).

## Supported channels

The following table details the [channels](publication-fundamentals-publish-channels.md) that currently support SSO. You can suggest support for additional channels [at the Power Virtual Agents ideas forum](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Ideas/idb-p/pva_ideas).

| Channel                                           | Supported     |
|---------------------------------------------------|:-------------:|
| [Azure Bot Service channels][6]                   | Not supported |
| [Custom Website][3]                               | Supported     |
| [Demo Website][2]                                 | Not supported |
| [Facebook][5]                                     | Not supported |
| [Microsoft Teams][1]<sup>1</sup>                  | Supported     |
| [Mobile App][4]                                   | Not supported |
| [Omnichannel for Customer Service][7]<sup>2</sup> | Supported     |

[1]: publication-add-bot-to-microsoft-teams.md
[2]: publication-connect-bot-to-web-channels.md#demo-website
[3]: publication-connect-bot-to-web-channels.md#custom-website
[4]: publication-connect-bot-to-custom-application.md
[5]: publication-add-bot-to-facebook.md
[6]: publication-connect-bot-to-azure-bot-service-channels.md
[7]: configuration-hand-off-omnichannel.md

<sup>1</sup> If you also have the Teams channel enabled, you need to follow the configuration instructions on the [Configure SSO for Teams channel](configure-sso-teams.md) documentation. Failing to configure the Teams SSO settings as instructed on that page will cause your users to always fail authentication when using the Teams channel.

<sup>2</sup> Only the live chat channel is supported. For more information, see [Configure hand-off to Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md).

## Technical overview

The following illustration shows how a user is signed in without seeing a login prompt (SSO) in Power Virtual Agents:

:::image type="content" source="media/configure-sso/sso-illustration.png" alt-text="Illustration of SSO authentication flow.":::

1. The bot user enters a phrase that [triggers a sign-in topic](advanced-end-user-authentication.md). The sign-in topic is designed to sign the user in and use the user's [authenticated token (`AuthToken` variable)](advanced-end-user-authentication.md#authtoken-variable).

1. Power Virtual Agents sends a login prompt to allow the user to sign in with their configured identity provider.

1. The bot's [custom canvas](customize-default-canvas.md) intercepts the sign-in prompt and requests an on-behalf-of (OBO) token from Azure AD. The canvas sends the token to the bot.

1. On receipt of the OBO token, the bot exchanges the OBO token for an "access token" and fills in the `AuthToken` variable using the access token's value. The `IsLoggedIn` variable is also set at this time.

## Create an app registration in Azure AD for your custom canvas

To enable SSO, you'll need two separate app registrations:

- [One for your bot to enable user authentication with Azure AD](configuration-authentication-azure-ad.md).
- One for your custom canvas to enable SSO.

> [!IMPORTANT]
> You can't reuse the same app registration for both your bot's user authentication and your custom canvas.

### Create an app registration for the bot's canvas

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to [App registrations](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade), either by selecting the icon or searching in the top search bar.

    :::image type="content" source="media/configure-sso/sso-app-registrations.png" alt-text="Screenshot highlighting app registrations tile on the Azure portal." border="false":::

1. Select **New registration**.

    :::image type="content" source="media/configure-sso/sso-new-registration.png" alt-text="Screenshot of the app registration blade with the New registration button highlighted." border="false":::

1. Enter a name for the registration. It can be helpful to use the name of the bot whose canvas you're registering and include "canvas" to help separate it from the app registration for authentication.  

    For example, if your bot is called "Contoso sales help", you might name the app registration as "ContosoSalesCanvas" or something similar.

1. Select the account type under **Supported account types**. We recommend you select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (for example Skype, Xbox)**.

1. Leave the **Redirect URI** section blank for now, as you'll enter that information in the next steps. Select **Register**.

    :::image type="content" source="media/configure-sso/sso-new-registration-details.png" alt-text="Screenshot showing the registration form." border="false":::

1. After the registration is completed, it will open to the **Overview** page. Go to **Manifest**. Confirm that `accessTokenAcceptedVersion` is set to `2`. If it isn't, change it to `2` and then select **Save**.

### Add the redirect URL

1. With the registration open, go to **Authentication** and then select **Add a platform**.

    :::image type="content" source="media/configure-sso/sso-authentication.png" alt-text="Screenshot showing Add a platform under Authentication." border="false":::

1. On the **configure platforms** blade, select **Web**.

    :::image type="content" source="media/configure-sso/sso-platform-web.png" alt-text="Screenshot showing the web tile highlighted." border="false":::

1. Under **Redirect URIs**,  add the full URL to the page where your chat canvas is hosted. Under the **Implicit grant** section, select the **Id Tokens** and **Access Tokens** checkboxes.

1. Select **Configure** to confirm your changes.

    :::image type="content" source="media/configure-sso/sso-add-redirect-url.png" alt-text="Screenshot showing the redirect URLs form." border="false":::

1. Go to **API Permissions**. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.
  
    > [!IMPORTANT]
    > To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide consent](/azure/active-directory/manage-apps/grant-admin-consent) to your app registrations.

    :::image type="content" source="media/configure-sso/sso-grant-consent.png" alt-text="Screenshot highlight the Grant admin consent for tenant-name button." border="false":::

## Define a custom scope for your bot

Define a custom scope by exposing an API for the canvas app registration within the authentication app registration. [Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights.

This step creates a trust relationship between the authentication app registration for authentication and the app registration for your custom canvas.

1. Open the app registration that you created [when you configured authentication](configuration-authentication-azure-ad.md).

1. Go to **API Permissions** and ensure that the correct permissions are added for your bot. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.
  
    > [!IMPORTANT]
    > To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide consent](/azure/active-directory/manage-apps/grant-admin-consent) to your app registrations.

1. Go to **Expose an API** and select **Add a scope**.

    :::image type="content" source="media/configure-sso/sso-expose-an-api-scopes.png" alt-text="Screenshot showing Expose an api and then add a scope." border="false":::

1. Enter a name for the scope, along with the display information that should be shown to users when they come to the SSO screen. Select **Add scope**.

    :::image type="content" source="media/configure-sso/sso-add-scope-bladed.png" alt-text="Screenshot showing the Add scope blade." border="false":::

1. Select **Add a client application**.

1. Enter the **Application (client) ID** from the **Overview** page for the canvas app registration into the **Client ID** field. Select the checkbox for the listed scope that you created.

1. Select **Add application**.

## Configure authentication in Power Virtual Agents to enable SSO

The **Token Exchange URL** in the Power Virtual Agents authentication configuration page is used to exchange the OBO token for the requested access token through the bot framework.

Power Virtual Agents calls into Azure AD to perform the actual exchange.

1. Sign in to Power Virtual Agents.

1. Confirm you've selected the bot for which you want to enable authentication by selecting the bot icon on the top menu and choosing the correct bot.

1. In the navigation menu, under **Settings**, select **Security**. Then select the **Authentication** card.

    :::image type="content" source="media/configure-sso/auth-manage-sm.png" alt-text="Go to Manage and then Authentication." border="false":::

1. Enter the full scope URI from the **Expose an API** blade for the bot's authentication app registration in the **Token exchange URL** field. The URI will be in the format of `api://1234-4567/scope.name`.

    :::image type="content" source="media/configure-sso/sso-api.png" alt-text="Screenshot highlighting the scope's API." border="false":::  

    :::image type="content" source="media/configure-sso/sso-pva-token-url.png" alt-text="Screenshot showing the authentication tab with location for the API." border="false":::

1. Select **Save** and then publish the bot content.

## Configure your custom canvas HTML code to enable SSO

Update the custom canvas page where the bot is located to intercept the login card request and exchange the OBO token.

1. Configure the Microsoft Authentication Library (MSAL) by adding the following code into a \<script\> tag in your \<head\> section.

1. Update `clientId` with the **Application (client) ID** for the canvas app registration. Replace `<Directory ID>` with the **Directory (tenant) ID**. You get these IDs from the **Overview** page for the canvas app registration.

    :::image type="content" source="media/configure-sso/sso-app-client-id.png" alt-text="App registration overview highlighting the Application and Directory IDs." border="false":::

    ```HTML
    <head>
     <script>
       var clientApplication;
         (function () {
           var msalConfig = {
               auth: {
                 clientId: '<Client ID [CanvasClientId]>',
                 authority: 'https://login.microsoftonline.com/<Directory ID>'
               },
               cache: {
                 cacheLocation: 'localStorage',
                 storeAuthStateInCookie: false
               }
           };
           if (!clientApplication) {
             clientApplication = new Msal.UserAgentApplication(msalConfig);
           }
         } ());
     </script>
    </head>
    ```

1. Insert the following \<script\> in the \<body\> section. This script calls a method to retrieve the `resourceUrl` and exchange your current token for a token requested by the OAuth prompt.

    ```HTML
    <script>
    function getOAuthCardResourceUri(activity) {
      if (activity &&
           activity.attachments &&
           activity.attachments[0] &&
           activity.attachments[0].contentType === 'application/vnd.microsoft.card.oauth' &&
           activity.attachments[0].content.tokenExchangeResource) {
             // asking for token exchange with AAD
             return activity.attachments[0].content.tokenExchangeResource.uri;
       }
    }
   
    function exchangeTokenAsync(resourceUri) {
      let user = clientApplication.getAccount();
       if (user) {
         let requestObj = {
           scopes: [resourceUri]
         };
         return clientApplication.acquireTokenSilent(requestObj)
           .then(function (tokenResponse) {
             return tokenResponse.accessToken;
             })
             .catch(function (error) {
               console.log(error);
             });
             }
             else {
             return Promise.resolve(null);
       }
    }
    </script>
    ```

1. Insert the following \<script\> in the \<body\> section. Within the `main` method, this code adds a conditional to your `store`, with your bot's unique identifier. It also generates a unique ID as your `userId` variable.

1. Update `<BOT ID>` with your bot's ID. You can see your bot's ID by going to the **Channels tab** for the bot you're using, and selecting **Mobile app** on the Power Virtual Agents portal.

    :::image type="content" source="media/configure-sso/sso-pva-botid.png" alt-text="Bot ID shown on the Mobile app channel configuration page." border="false":::

    ```HTML
    <script>
        (async function main() {

            // Add your BOT ID below 
            var BOT_ID = "<BOT ID>";
            var theURL = "https://powerva.microsoft.com/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;

            const {
                token
            } = await fetchJSON(theURL);
            const directLine = window.WebChat.createDirectLine({
                token
            });
            var userID = clientApplication.account?.accountIdentifier != null ?
                ("Your-customized-prefix-max-20-characters" + clientApplication.account.accountIdentifier).substr(0, 64) :
                (Math.random().toString() + Date.now().toString()).substr(0, 64); // Make sure this will not exceed 64 characters 
            const store = WebChat.createStore({}, ({
                dispatch
            }) => next => action => {
                const {
                    type
                } = action;
                if (action.type === 'DIRECT_LINE/CONNECT_FULFILLED') {
                    dispatch({
                        type: 'WEB_CHAT/SEND_EVENT',
                        payload: {
                            name: 'startConversation',
                            type: 'event',
                            value: {
                                text: "hello"
                            }
                        }
                    });
                    return next(action);
                }
                if (action.type === 'DIRECT_LINE/INCOMING_ACTIVITY') {
                    const activity = action.payload.activity;
                    let resourceUri;
                    if (activity.from && activity.from.role === 'bot' &&
                        (resourceUri = getOAuthCardResourceUri(activity))) {
                        exchangeTokenAsync(resourceUri).then(function(token) {
                            if (token) {
                                directLine.postActivity({
                                    type: 'invoke',
                                    name: 'signin/tokenExchange',
                                    value: {
                                        id: activity.attachments[0].content.tokenExchangeResource.id,
                                        connectionName: activity.attachments[0].content.connectionName,
                                        token,
                                    },
                                    "from": {
                                        id: userID,
                                        name: clientApplication.account.name,
                                        role: "user"
                                    }
                                }).subscribe(
                                    id => {
                                        if (id === 'retry') {
                                            // bot was not able to handle the invoke, so display the oauthCard
                                            return next(action);
                                        }
                                        // else: tokenexchange successful and we do not display the oauthCard
                                    },
                                    error => {
                                        // an error occurred to display the oauthCard
                                        return next(action);
                                    }
                                );
                                return;
                            } else
                                return next(action);
                        });
                    } else
                        return next(action);
                } else
                    return next(action);
            });

            const styleOptions = {

                // Add styleOptions to customize Web Chat canvas
                hideUploadButton: true
            };

            window.WebChat.renderWebChat({
                    directLine: directLine,
                    store,
                    userID: userID,
                    styleOptions
                },
                document.getElementById('webchat')
            );
        })().catch(err => console.error("An error occurred: " + err));
    </script>
    ```

### Full sample code

For reference, you can find the full sample code, with the MSAL and store conditional scripts already included [at our GitHub repo](https://github.com/microsoft/PowerVirtualAgentsSamples/blob/master/BuildYourOwnCanvasSamples/3.single-sign-on/index.html).

[!INCLUDE[footer-include](includes/footer-banner.md)]
