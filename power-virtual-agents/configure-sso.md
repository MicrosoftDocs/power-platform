---
title: "Configure single sign-on for a custom website"
description: "Enable your bot to authenticate an already-signed-in user"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 03/09/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: pawant
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure single sign-on for a custom website

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Power Virtual Agents supports single sign-on (SSO), which means chatbots can sign the user in if they're in to the page where the bot is deployed. For example, the bot is hosted on the corporate intranet or in an app that the user is already signed in to.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- [Enable end-user authentication with Azure Active Directory](configuration-authentication-azure-ad.md).
  - SSO is only supported for Azure Active Directory (Azure AD) V2. Other account types such as Microsoft Account or other OAuth accounts are not supported.
- [Add an authentication topic to your bot](advanced-end-user-authentication.md).
- [Use a custom canvas](customize-default-canvas.md).


# [Preview](#tab/preview)

With single sign-on (SSO), chatbots on your website can sign customers in if they're already signed in to the page or app where the bot is deployed.

In Power Virtual Agents preview, SSO is supported for the custom website channel only. It's not supported for the following channels:

- Azure Bot Service
- Demo website
- Facebook
- Microsoft Teams
- Mobile app

or when a bot has been:

- Published to Teams, a SharePoint website, or a Power Apps portal
- Integrated with Dynamics 365 Customer Service

### Create app registrations for your custom website

To enable SSO, you'll need to create two separate app registrations:

- An _authentication app registration_, which enables Azure Active Directory (Azure AD) user authentication for your bot
- A _canvas app registration_, which enables SSO for your custom web page

We don't recommend reusing the same app registration for both your bot and your custom website for security reasons.

1. Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md) to create an authentication app registration.
1. Follow the same instructions again to create a second app registration, which will serve as your canvas app registration.
1. Return to this article.

### Configure your canvas app registration

1. After you create your canvas app registration, go to **Authentication**, and then select **Add a platform**.

1. Under **Platform configurations**, select **Add a platform**, and then select **Web**.

1. Under **Redirect URIs**, enter the URL for your web page; for example, `http://contoso.com/index.html`.

    :::image type="content" source="media/configure-web-sso/configure-web-setting-for-canvas.png" alt-text="Screenshot of the Configure Web page.":::

1. In the **Implicit grant and hybrid flows** section, turn on both **Access tokens (used for implicit flows)** and **ID tokens (used for implicit and hybrid flows)**.

1. Select **Configure**.

### Find your bot's token endpoint URL

1. In Power Virtual Agents, go to **Settings**, and then select **Channels**.

1. Select **Mobile app**.

1. Under **Token Endpoint**, select **Copy**.

    :::image type="content" source="media/configure-web-sso/pva-bot-id.png" alt-text="Screenshot of copying the token endpoint URL in Power Virtual Agents.":::

## Configure SSO in your web page

Use the code provided in the [Power Virtual Agents GitHub repo](https://github.com/microsoft/PowerVirtualAgentsSamples/blob/master/BuildYourOwnCanvasSamples/3.single-sign-on/index.html) to create a web page for the redirect URL. Copy the code from the GitHub repo and modify it using the instructions below.

1. Go to the **Overview** page in Azure portal and copy the **Application (client) ID** and **Directory (tenant) ID** from your canvas app registration.

    :::image type="content" source="media/configure-web-sso/canvas-client-tenant-id.png" alt-text="Screenshot of the App registration Overview page in Azure portal, with Overview, Application ID, and Directory ID highlighted.":::

1. To configure the Microsoft Authentication Library (MSAL):
    - Assign `clientId` to your **Application (client) ID**.
    - Assign `authority` to `https://login.microsoftonline.com/` and add your **Directory (tenant) ID** to the end.

    For example:

    <!-- the GUID used in the code block below is a randomly generated one, not one pulled from a live bot -->
    ```csharp
    var clientApplication;
        (function (){
        var msalConfig = {
            auth: {
                clientId: '692e92c7-d146-4060-76d3-b381798f4d9c',
                authority: 'https://login.microsoftonline.com/7ef988bf-86f1-51af-01ab-2d7fd011db47'     
            },
    ```

1. Set the `theURL` variable to the token endpoint URL you copied earlier. For example:

    ```csharp
    (async function main() {

        var theURL = "https://1c0.0.environment.api.powerplatform.com/powervirtualagents/bots/5a099fd/directline/token?api-version=2022-03-01-preview"
    ```

1. Edit the value of `userId` to include a custom prefix. For example:

    ```csharp
    var userId = clientApplication.account?.accountIdentifier != null ? 
            ("My-custom-prefix" + clientApplication.account.accountIdentifier).substr(0, 64) 
            : (Math.random().toString() + Date.now().toString()).substr(0,64);
    ```

1. Save your changes.

### Test your bot using your web page

1. Open your web page in your browser.

1. Select **Login**.

    :::image type="content" source="media/configure-web-sso/chat-canvas-test.png" alt-text="Screenshot of logging in using validation code":::

   > [!NOTE]
   > If your browser blocks popups or you are using an incognito or private browsing window, you will be prompted to log in. Otherwise, the log in will complete using a validation code.

    A new browser tab opens.

1. Switch to the new tab and copy the validation code.

1. Switch back to the tab with your bot, and paste the validation code into the bot conversation.

### Related topics

- [Azure App Registration](/azure/active-directory/develop/quickstart-register-app)


# [Classic](#tab/web)

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

### Supported channels

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
[2]: publication-connect-bot-to-web-channels.md
[3]: publication-connect-bot-to-web-channels.md#custom-website
[4]: publication-connect-bot-to-custom-application.md
[5]: publication-add-bot-to-facebook.md
[6]: publication-connect-bot-to-azure-bot-service-channels.md
[7]: configuration-hand-off-omnichannel.md

<sup>1</sup> If you also have the Teams channel enabled, you need to follow the configuration instructions on the [Configure SSO for Teams channel](configure-sso.md) documentation. Failing to configure the Teams SSO settings as instructed on that page will cause your users to always fail authentication when using the Teams channel.

<sup>2</sup> Only the live chat channel is supported. For more information, see [Configure hand-off to Dynamics 365 Customer Service](configuration-hand-off-omnichannel.md).

### Technical overview

The following illustration shows how a user is signed in without seeing a login prompt (SSO) in Power Virtual Agents:

:::image type="content" source="media/configure-sso/sso-illustration.png" alt-text="Illustration of SSO authentication flow.":::

1. The bot user enters a phrase that [triggers a sign-in topic](advanced-end-user-authentication.md). The sign-in topic is designed to sign the user in and use the user's [authenticated token (`AuthToken` variable)](advanced-end-user-authentication.md#authtoken-variable).

1. Power Virtual Agents sends a login prompt to allow the user to sign in with their configured identity provider.

1. The bot's [custom canvas](customize-default-canvas.md) intercepts the sign-in prompt and requests an on-behalf-of (OBO) token from Azure AD. The canvas sends the token to the bot.

1. On receipt of the OBO token, the bot exchanges the OBO token for an "access token" and fills in the `AuthToken` variable using the access token's value. The `IsLoggedIn` variable is also set at this time.

## Create an app registration in Azure AD for your custom website

To enable SSO, you'll need two separate app registrations:

- An _authentication app registration_ which enables user authentication in your bot with Azure AD.
- A _canvas app registration_ which enables SSO for your custom web page.

> [!IMPORTANT]
> You can't reuse the same app registration for both your bot's user authentication and your custom canvas.

## Create an app registration for your custom website

To enable SSO, you'll need two separate app registrations:

- An _authentication app registration_ which enables user authentication in your bot with Azure AD.
- A _canvas app registration_ which enables SSO for your custom web page.

> [!IMPORTANT]
> It's not recommended to reuse the same app registration for both your bot and your custom website for security reasons.
## Create an authentication app registration

Before configuring SSO for your website, you'll first need to create an app registration.

1. Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md).
1. Return to this article.

## Create a canvas app registration

1. Create a second app registration to serve as your canvas app registration. You can refer to the earlier steps on [how to create an authentication app registration](#create-an-authentication-app-registration).

1. Once you've created your canvas app registration, go to **Authentication** and then select **Add a platform**.

1. Under **Platform configurations** select **Add a platform**, then select **Web**.

1. Under **Redirect URIs**, enter the URL for your web page. For example, `http://contoso.com/index.html`.

    :::image type="content" source="media/configure-sso/configure-web-setting-for-canvas.png" alt-text="Screenshot of configure webpage":::

1. Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

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

    :::image type="content" source="media/configure-sso/sso-pva-botid.png" alt-text="Bot ID shown on the Mobile app channel configuration page.":::

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

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
