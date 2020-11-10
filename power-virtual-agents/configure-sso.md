---
title: "Configure single sign-on"
description: "Enable your bot to authenticate an already-signed-in user"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: pawant
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory in Power Virtual Agents


Power Virtual Agents supports single sign-on (SSO), which means chatbots can sign the user in if they're in to the page where the bot is deployed.  

For example, the bot is hosted on the corporate intranet or in an app that the user is already signed in to.

>[!IMPORTANT] 
>SSO is only supported for Azure Active Directory (Azure AD). Other account types such as Microsoft Account or other OAuth accounts are not supported for SSO in Power Virtual Agents.  
>You can suggest support for additional account types [at the Power Virtual Agents ideas forum](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Ideas/idb-p/pva_ideas).

>[!IMPORTANT] 
>SSO is only supported on the [live website publication channel](publication-connect-bot-to-web-channels.md). Microsoft Teams or other channels are not supported.
>You can suggest support for additional channels [at the Power Virtual Agents ideas forum](https://powerusers.microsoft.com/t5/Power-Virtual-Agents-Ideas/idb-p/pva_ideas).

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Enable end-user authentication with Azure Active Directory](configuration-end-user-authentication.md#use-azure-active-directory-as-your-identity-provider) and [add an authentication topic to your bot](advanced-end-user-authentication.md)
- [Use a custom canvas](customize-default-canvas.md) 



## Technical overview
The following illustration shows how a user is signed in without seeing a login prompt (SSO) in Power Virtual Agents:

  ![Illustration of SSO authentication flow](media/sso-illustration.png)

1. The bot user enters a phrase that [triggers a  sign-in topic](advanced-end-user-authentication.md). The sign-in topic is designed to sign the user in and use the user's [authenticated token (`AuthToken` variable)](advanced-end-user-authentication.md#authtoken-variable).

2. Power Virtual Agents sends a login prompt to allow the user to sign in with their configured identity provider.

3. The bot's [custom canvas](customize-default-canvas.md) intercepts the sign-in prompt and requests an on-behalf-of (OBO) token from Azure AD. The canvas sends the token to the bot.

4. On receipt of the OBO token, the bot exchanges the OBO token for an "access token" and fills in the `AuthToken` variable using the access token's value. The `IsLoggedIn` variable is also set at this time.


## Configure single sign-on

There are four main steps to configuring SSO for Power Virtual Agents:

1. Create an app registration in Azure AD for your custom canvas.

1. Define a custom scope for your bot in the bot's authentication app registration. Defining a scope creates a trust relationship between your canvas and authentication app registrations.

1. Configure authentication in Power Virtual Agents to enable single sign-on.

1. Configure your custom canvas HTML code to enable single sign-on.


### Create an app registration in Azure AD for your custom canvas

To enable single sign-on, you need to register the custom canvas as an app in Azure AD.

The custom canvas app registration needs to be a separate app registration from the one you [created when you configured authentication with Azure AD](configuration-end-user-authentication.md#use-azure-active-directory-as-your-identity-provider).

You then need to redirect the app registration to point to your custom canvas.

**Create an app registration for the bot's canvas**

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to [App registrations](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade), either by selecting the icon or searching in the top search bar.

    ![Screenshot highlighting app registrations tile on the Azure portal](media/sso-app-registrations.png "Screenshot highlighting app registrations tile on the Azure portal")

1. Select **New registration**.

    ![Screenshot of the app registration blade with the New registration button highlighted](media/sso-new-registration.png "Screenshot of the app registration blade with the New registration button highlighted")

1. Enter a name for the registration. It can be helpful to use the name of the bot whose canvas you're registering and include "canvas" to help separate it from the app registration for authentication.  
  For example, if your bot is called "Contoso sales help", you might name the app registration as "ContosoSalesCanvas" or something similar. 

1. Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (for example Skype, Xbox)**.

1. Leave the **Redirect URI** section blank for now, as you'll enter that information in the next steps. Select **Register**.

    ![Screenshot showing the registration form](media/sso-new-registration-details.png "Screenshot showing the registration form")





**Add the redirect URL**

1. After the registration is completed, it will open to the **Overview** page. Go to **Authentication** and then select **Add a platform**.


    ![Screenshot showing Add a platform under Authentication](media/sso-authentication.png "Screenshot showing Add a platform under Authentication")

1. On the **configure platforms** blade, select **Web**. 

    ![Screenshot showing the web tile highlighted](media/sso-platform-web.png "Screenshot showing the web tile highlighted")
 
1. Under **Redirect URIs**,  add the full URL to the page where your chat canvas is hosted. Under the **Implicit grant** section, select the **Id Tokens** and **Access Tokens** checkboxes.

1. Select **Configure** to confirm your changes.

    ![Screenshot showing the redirect URLs form](media/sso-add-redirect-url.png "Screenshot showing the redirect URLs form")

1. Go to **API Permissions**. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.
  
    >[!IMPORTANT]
    >To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide consent](/azure/active-directory/manage-apps/grant-admin-consent) to your app registrations.

    ![Screenshot highlight the Grant admin consent for tenant-name button](media/sso-grant-consent.png "Screenshot highlight the Grant admin consent for tenant-name button")



### Define a custom scope for your bot

Define a custom scope by exposing an API for the canvas app registration within the authentication app registration. [Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights.

This step creates a trust relationship between the authentication app registration for authentication and the app registration for your custom canvas.

**Define a custom scope for your bot**

1. Open the app registration that you created [when you configured authentication](configuration-end-user-authentication.md#use-azure-active-directory-as-your-identity-provider).

1. Go to **API Permissions** and ensure that the correct permissions are added for your bot. Select **Grant admin consent for \<your tenant name\>** and then **Yes**.
  
    >[!IMPORTANT]
    >To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must [grant tenant-wide consent](/azure/active-directory/manage-apps/grant-admin-consent) to your app registrations.


1. Go to **Expose an API** and select **Add a scope**.

    ![Screenshot showing Expose an api and then add a scope](media/sso-expose-an-api-scopes.png "Screenshot showing Expose an api and then add a scope")

1. Enter a name for the scope, along with the display information that should be shown to users when they come to the single sign-on screen. Select **Add scope**.

    ![Screenshot showing the Add scope blade](media/sso-add-scope-bladed.png "Screenshot showing the Add scope blade")

1. Select **Add a client application**. 

1. Enter the **Application (client) ID** from the **Overview** page for the canvas app registration into the **Client ID** field. Select the checkbox for the listed scope that you created. 

1. Select **Add application**.


### Configure authentication in Power Virtual Agents to enable single sign-on
The **Token Exchange URL** in the Power Virtual Agents authentication configuration page is used to exchange the OBO token for the requested access token through the bot framework. 

Power Virtual Agents calls into Azure AD to perform the actual exchange.

**Add the token exchange URL to your bot's authentication page**

1. Sign in to Power Virtual Agents. 

1. Confirm you've selected the bot for which you want to enable authentication by selecting the bot icon on the top menu and choosing the correct bot. 

1. Select **Manage** on the side navigation pane, and then go to the **Authentication** tab.

    ![Go to Manage and then Authentication](media/auth-manage-sm.png)

1. Enter the full scope URI from the **Expose an API** blade for the canvas app registration in the **Token exchange URL** field. The URI will be in the format of `api://1234-4567/scope.name`.

    ![Screenshot highlighting the scope's API](media/sso-api.png "Screenshot highlighting the scope's API")  

    ![Screenshot showing the authentication tab with location for the API](media/sso-pva-token-url.png "Screenshot showing the authentication tab with location for the API")

1. Select **Save** and then publish the bot content.



### Configure your custom canvas HTML code to enable single sign-on

Update the custom canvas page where the bot is located to intercept the login card request and exchange the OBO token.

1. Configure the Microsoft Authentication Library (MSAL) by adding the following code into a \<script\> tag in your \<head\> section.

2. Update `clientId` with the **Application (client) ID** for the canvas app registration. Replace `<Directory ID>` with the **Directory (tenant) ID**. You get these IDs from the **Overview** page for the canvas app registration.

    ![App registration overview highlighting the Application and Directory IDs](media/sso-app-client-id.png "App registration overview highlighting the Application and Directory IDs")



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

3. Insert the following \<script\> in the \<body\> section. This script calls a method to retrieve the `resourceUrl` and exchange your current token for a token requested by the OAuth prompt.

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

4. Insert the following \<script\> in the \<body\> section. Within the `main` method, this code adds a conditional to your `store`, with your bot's unique identifier. It also generates a unique ID as your `userId` variable. 

5. Update `<BOT ID>` with your bot's ID. You can see your bot's ID by going to the **Channels tab** for the bot you're using, and selecting **Mobile app** on the Power Virtual Agents portal.

    ![Bot ID shown on the Mobile app channel configuration page](media/sso-pva-botid.png "Bot ID shown on the Mobile app channel configuration page")
   


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
            var userID = clientApplication.account ? .accountIdentifier != null ?
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

#### Full sample code
For reference, you can find the full sample code, with the MSAL and store conditional scripts already included [at our GitHub repo](https://github.com/microsoft/PowerVirtualAgentsSamples/blob/master/BuildYourOwnCanvasSamples/3.single-sign-on/index.html).
