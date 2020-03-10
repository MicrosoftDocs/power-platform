---
title: "Configure Single Sign-on in Power Virtual Agents"
description: "Step by step guide to enable your bot to authenticate an already signed in user"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider"
ms.date: 1/31/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: pawant
ms.author: iawilt
manager: shellyha
ms.custom: authentication
ms.collection: virtual-agent
---

# Configure Single Sign-on with Azure Active Directory in Power Virtual Agents

[This topic is pre-release documentation and is subject to change.]

Power Virtual Agents enables you to author personalized conversations and perform actions on behalf of your users. With single sign-on support, bots can be configured to automatically sign-in the user if the user has already signed into the page where bot is deployed (e.g. Coporate Intranet, Applications, etc.)

> [!IMPORTANT] 
> Before using this feature, you must follow the [end-user authentication configuration instructions](configuration-end-user-authentication.md) and [deploy a custom canvas](extend-custom-canvas-connect.md)

## Overview
The following illustration gives you an overview of how Single Sign-on works end-to-end.

  ![Illustration of SSO auth flow](media/sso-illustration.png)

1. Customer enters a trigger phrase that triggers a topic that is authored to sign-in the user and use user's authenticated token (AuthToken)
1. On trigger, Power Virtual Agents sends a login prompt to allow user to sign-in with their configured identity provider
1. Customer's custom canvas intercepts this sign-in prompt and request an 'exchange token' from Azure Active Directory which it sends to Power Virtual Agents' bot
1. On receipt of the 'exchange token', Power Virtual Agents' bot exchanges the 'exchange token' for an 'access token' and fills in the `AuthToken` variable

The above steps completes the Single-Sign-On auth flow and the user is signed in without being prompted.

## Steps to configure SSO with Azure Active Directory
Follow the steps to configure your Power Virtual Agents' bot to accept 'exchange tokens' and seamlessly sign-in without prompting the user.

### 1. Create an app registration in Azure Active Directory

* Navigate to https://portal.azure.com
* Select the 'Azure Active Directory Resource'
* Click on 'New Registration' -- Fill out Name, Selecting Single / Multitenant and click 'Next'
* Once the resource is created, go to the Authentication
* Add the host address into the `Redirect URI` field and make sure that `Web` is selected as the Type. Also ensure
that `Id Tokens` and `Access` Tokens are selected.
* Click 'Save' at the top
* Take a note of the `Client ID` and your `Directory ID`.

### 2. Add 'Token exchange URL' to your bot's authentication page
<@Kyle - add blurb on why it's needed>

* Navigate to `Configure` --> `Authentication`
* Update `Token exchange URL` with the URL configured in Step 1.

### 3. Update your custom canvas to intercept sign-in prompts

* Update your `index.html` to intercept login card request and exchange your token
* Configure Microsoft Authentication Library (MSAL) by adding this code into your `<script>` tag:

```javascript
<script>
   var clientApplication;
     (function ()
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
```
* Insert the following methods to retrieve the `resourceUrl` and exchange your current token for a token requested by the
OAuth prompt.

```javascript
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
```
* Next, set up the interceptor. Within the `main` method, add the following conditional to your `store`

```javascript
const store = WebChat.createStore({}, ({ dispatch }) => next => action => {
    const { type } = action;
     if (action.type === 'DIRECT_LINE/INCOMING_ACTIVITY') {
         const activity = action.payload.activity;
         let resourceUri;
         if (activity.from && activity.from.role === 'bot' &&
            (resourceUri = getOAuthCardResourceUri(activity))) {
            exchangeTokenAsync(resourceUri).then(function (token) {
             if (token) {
             directLine.postActivity({
             type: 'invoke',
             name: 'signin/tokenExchange',
             value: {
               id: activity.attachments[0].content.tokenExchangeResource.id,
               connectionName: activity.attachments[0].content.connectionName,
               token
              },
             "from":{id:"",name:"",role:"user"}
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
   }
   else
     return next(action);
   });
   }
   else
     return next(action);
   }
   else
     return next(action);
});
```

## Compliance considerations
Security and privacy considerations - scope, token caching, etc.

## FAQs
1. How do we configure our Skills with Single-Sign-On?
A) 
