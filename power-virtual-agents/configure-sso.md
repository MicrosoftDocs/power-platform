---
title: "Configure single sign-on in Power Virtual Agents"
description: "Enable your bot to authenticate an already-signed-in user"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider"
ms.date: 4/28/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: pawant
ms.custom: authentication
ms.collection: virtual-agent
---

# Configure single sign-on with Azure Active Directory in Power Virtual Agents

[This topic is pre-release documentation and is subject to change.]

Power Virtual Agents supports single sign-on support, which means chatbots can be configured to automatically sign-in the user if they are already signed in to the page where the bot is deployed (for example, they bot is hosted on the corporate intranet or in an app that they're signed in to).





## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Enable end-user authentication with Azure Active Directory](configuration-end-user-authentication.md#use-azure-active-directory-as-your-identity-provider) and [add an authentication topic to your bot](advanced-end-user-authentication.md)
- [Use a custom canvas](customize-default-canvas.md) (you can either customized the default canvas or use a hosted canvas app)

## Overview
The following illustration gives you an overview of how single sign-on works end-to-end.

  ![Illustration of SSO auth flow](media/sso-illustration.png)

1. Customer enters a trigger phrase that triggers a topic that is authored to sign-in the user and use user's authenticated token (AuthToken)
1. On trigger, Power Virtual Agents sends a login prompt to allow user to sign-in with their configured identity provider
1. Customer's custom canvas intercepts this sign-in prompt and request an On-Behalf-Of (OBO) token from Azure Active Directory which it sends to Power Virtual Agents' bot
1. On receipt of the OBO token, Power Virtual Agents' bot exchanges the OBO token for an 'access token' and fills in the `AuthToken` variable using this value.  The 'IsLoggedIn' variable is also set at this time.

The above steps completes the Single-Sign-On auth flow and the user is signed in without being prompted.




There are several steps to achieve single sign-on for your chatbot:

1. Register your chatbot's canvas URL in Azure Active Directory (register an app 1)
2. Enable authentication for PowerVirtual Agents (register an app 2)
3. Grant app 2 tenant wide admin consent (see [link](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent))
4. Configure the authentication-token exchange between Power Virtual Agents and Azure Active Directory
5. Configure the chatbot on the page where you'll host it to intercept sign-in prompts



## Steps to configure SSO with Azure Active Directory
Follow the steps to configure your Power Virtual Agents' bot to accept OBO tokens and seamlessly sign-in without prompting the user.

### 0. Grant tenant-wide admin consent to your Power Virtual Agents' bot application
For single sign-on to work, you will need a Global Administrator, an Application Administrator, or a Cloud Application Administrator user role to grant tenant-wide consent to your bot's application. Click here for more details on [granting tenant-wide admin consent to an application](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent).

Disclaimer - If your bot's application has not been consented to, single sign-on will not work and your bot will not get a valid access token from Azure Active Directory.

### 1. Create an app registration in Azure Active Directory for your canvas application

To enable single sign-on, you'll need to register the custom canvas as an app in Azure AD. This needs to be a separate app registration from the one you [created if you configured  authentication with Azure AD](configuration-end-user-authentication.md#use-azure-active-directory-as-your-identity-provider).

You also need to define a custom scope by exposing an API for the canvas app registration. [Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights.

 Navigate to Manage --> Channels --> Mobile app. Copy your bot's `Bot ID` and `Tenant ID` as you'll need it later.

**Create an app registration for the bot's canvas**

1. Sign in to the [Azure portal](https://portal.azure.com), using an admin account on the same tenant as your Power Virtual Agents chatbot.
1. Go to [App registrations](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade), either by selecting the icon or searching in the top search bar. Create a new 'Application Registration'
1. Select **New registration** and enter a name for the registration. It can be helpful to use the name of the bot whose canvas you're registering. For example, if your bot is called "Contoso sales help", you might name the app registration as "ContosoSalesCanvas" or something similar. 
1. Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)** 
1. Leave the **Redirect URI** section blank for now, as you'll enter that information in the next steps. Select **Register**.

**Add the redirect URL**

1. Once the registration is completed, it will open to the **Overview** page. Go to **Authentication** and then select **Add a platform**.
1. On the **configure platforms** blade select **Web**. Under **Redirect URIs**  add the full URL to the page where your chat canvas is hosted. Under the **Implicit grant** section, select the **Id Tokens** and **Access Tokens** checkboxes.
1. Select **Configure** to confirm your changes.


* Click 'Overview', take a note of the `Application (client) ID` (this is canvas ID) and your `Directory (tenant) ID` (this is canvas tenant id).


**Define a custom scope for your bot (step 2)**
1. Open the app registration that you created when you configured authentication.
1. Go to **API Permissions** and ensure that the correct permissions are added for your bot
1. Go to **Expose an API** and select **Add a scope**.
3. Select **Save and continue**.
1. Enter a name for the scope, along with the display information that should be shown to users when they come to the single sign-on screen. Select **Add scope**.
1. Select **Add a client application**, enter the **Application (client) ID** from the **Overview** page for the canvas registration into the **Client ID** field. Select the checkbox for the listed scope that you created. 
1. Select **Add application**.


### 3. Add 'Token exchange URL' to your bot's authentication page
The Token Exchange URL is used to exchange the OBO token for the requested access token through the bot framework.  This calls into Azure Active Directory to preform the actual exchange.



1. Sign in to Power Virtual Agents. If you are using Azure AD as your identity provider, ensure you log in on the same tenant where you created the app registration.
1. Confirm you have selected the bot for which you want to enable authentication by selecting the bot icon on the top menu and choosing the bot. 
1. Select **Manage** on the side navigation pane, and then go to the **Authentication** tab.

   ![Go to Manage and then Authentication](media/auth-manage-sm.png)

1. Enter the full scope URI in the **Token exchange URL** field. This will be in the format of `api://1234-4567/scope.name`.
1. Select **Save** and then publish the bot content.



### 4. Update your custom canvas to intercept sign-in prompts

* Update your `index.html` to intercept login card request and exchange your token (see sample below)
* Configure Microsoft Authentication Library (MSAL) by adding this code into your `<script>` tag
* Update `clientId` with the Custom canvas ID (application (client) ID from AAD you copied earlier
* Replace `<Directory ID>` with your tenant's ID you copied earlier

```diff
<head>
+ <script>
+   var clientApplication;
+     (function () {
+       var msalConfig = {
+           auth: {
+             clientId: '<Client ID [CanvasClientId]>',
+             authority: 'https://login.microsoftonline.com/<Directory ID>'
+           },
+           cache: {
+             cacheLocation: 'localStorage',
+             storeAuthStateInCookie: false
+           }
+       };
+       if (!clientApplication) {
+         clientApplication = new Msal.UserAgentApplication(msalConfig);
+       }
+     } ());
+ </script>
</head>
```

* Insert the following methods to retrieve the `resourceUrl` and exchange your current token for a token requested by the
OAuth prompt.

```diff
+ <script>
+ function getOAuthCardResourceUri(activity) {
+   if (activity &&
+        activity.attachments &&
+        activity.attachments[0] &&
+        activity.attachments[0].contentType === 'application/vnd.microsoft.card.oauth' &&
+        activity.attachments[0].content.tokenExchangeResource) {
+          // asking for token exchange with AAD
+          return activity.attachments[0].content.tokenExchangeResource.uri;
+    }
+ }
 
+ function exchangeTokenAsync(resourceUri) {
+   let user = clientApplication.getAccount();
+    if (user) {
+      let requestObj = {
+        scopes: [resourceUri]
+      };
+      return clientApplication.acquireTokenSilent(requestObj)
+        .then(function (tokenResponse) {
+          return tokenResponse.accessToken;
+          })
+          .catch(function (error) {
+            console.log(error);
+          });
+          }
+          else {
+          return Promise.resolve(null);
+    }
+ }
+ </script>
   …
```
* Next, set up the interceptor. Within the `main` method, add the following conditional to your `store`
* Update `BOT_ID` by putting in your bot's ID that you copied earlier

```diff
+ <script>
+
+  (async function main() {
+
+        // Add your BOT ID below 
+        var BOT_ID = "<BOT ID>";
+        var theURL = "https://powerva.microsoft.com/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;
+		
+	   const { token } = await fetchJSON(theURL);
+	   const directLine = window.WebChat.createDirectLine({ token });
+     
+          const store = WebChat.createStore({}, ({ dispatch }) => next => action => {
+           const { type } = action;
+            if (action.type === 'DIRECT_LINE/INCOMING_ACTIVITY') {
+               const activity = action.payload.activity;
+               let resourceUri;
+               if (activity.from && activity.from.role === 'bot' &&
+                  (resourceUri = getOAuthCardResourceUri(activity))) {
+                  exchangeTokenAsync(resourceUri).then(function (token) {
+                   if (token) {
+                   directLine.postActivity({
+                   type: 'invoke',
+                   name: 'signin/tokenExchange',
+                   value: {
+                     id: activity.attachments[0].content.tokenExchangeResource.id,
+                     connectionName: activity.attachments[0].content.connectionName,
+                     token
+                    },
+                   "from":{
+                     id:clientApplication.account.account,
+                     name:clientApplication.account.userName,
+                     role:"user"
+                   }
+                   }).subscribe(
+               id => {
+               if (id === 'retry') {
+                 // bot was not able to handle the invoke, so display the oauthCard
+                 return next(action);
+              }
+           // else: tokenexchange successful and we do not display the oauthCard
+           },
+           error => {
+             // an error occurred to display the oauthCard
+             return next(action);
+           }
+           );
+         return;
+         }
+         else
+           return next(action);
+         });
+         }
+         else
+           return next(action);
+         }
+         else
+           return next(action);
+      });
+})().catch(err => console.error("An error occurred: " + err));

</script>
```

#### Full sample code
Here's the full sample code to configure Single Sign-on

	```HTML 
	<!DOCTYPE html>
	<html>
	<head>
	  <title>Contoso Sample Web Chat</title> 
	<script src="https://cdn.botframework.com/botframework-webchat/latest/webchat.js"></script>
	<script type="text/javascript" src="https://alcdn.msauth.net/lib/1.2.0/js/msal.js"></script>
	<script src="https://unpkg.com/@azure/storage-blob@10.3.0/browser/azure-storage.blob.min.js"
	  integrity="sha384-fsfhtLyVQo3L3Bh73qgQoRR328xEeXnRGdoi53kjo1uectCfAHFfavrBBN2Nkbdf"
	  crossorigin="anonymous"></script>
	<script type="text/javascript">
	  if (typeof Msal === 'undefined') document.write(unescape("%3Cscript src='https://alcdn.msftauth.net/lib/1.2.0/js/msal.js' type='text/javascript' %3E%3C/script%3E"));
	</script>

	  <style>
	      html, body {
		  height: 100%;
	      }

	      body {
		  margin: 0;
	      }

	      h1 {
		  font-size: 16px;
		  font-family: Segoe UI;
		  line-height: 20px;
		  color: whitesmoke;
		  display: table-cell;
		  padding: 13px 0px 0px 20px;
	      }

	      #heading {
		  background-color: black;
		  height: 50px;
	      }

	      .main {
		  margin: 18px;
		  border-radius: 4px;
	      }

	      div[role="form"]{
		  background-color: black;
	      }

	      #webchat {
		  position: fixed;
		  height: calc(100% - 50px);
		  width: 100%;
		  top: 50px;
		  overflow: hidden;
	      }
	  #heading {
	    background-color: black;
	    background-repeat: no-repeat;
	    background-size: cover;
	    background-attachment: fixed;
	    background-position: center;
	    height: 50px;
	    width: 100%;
	    overflow: hidden;
	    position: fixed;
	  }

	  h1 {
	    font-size: 14px;
	    font-family: Segoe UI;
	    font-style: normal;
	    font-weight: 600;
	    font-size: 14px;
	    line-height: 20px;
	    color: #F3F2F1;
	    letter-spacing: 0.005em;
	    display: table-cell;
	    vertical-align: middle;
	    padding: 13px 0px 0px 20px;
	  }

	  #chatwindow {
	    height: 80%;
	    width: 100%;
	    overflow: hidden;
	    position: fixed;
	  }

	  #loginButton {

	    height: 100px;
	    width: 100%;
	    position: fixed;
	  }
	  </style>

	</head>
	<body>
	<div id="chatwindow">
	  <div id="heading">
	    <div><span>SSO Test Bot</span></div>
	  </div>
	  <div style="z-index: 100;position: absolute;margin-top: 50px;width: 100%;">
	  <div>
	    <label id="userName" name="userName" style="width:75%;height:15px;border-color: Transparent;">Not logged in.</label>
	    <button id="login" name="login" onclick="onSignInClick()" style="float: right;background-color: aliceblue;">Log In</button>
	  </div>
	</div>
	  <div id="webchat">
	  </div>

	</div>

	<script>
	function onSignin(idToken) {
	      let user = clientApplication.getAccount();
	      document.getElementById("userName").innerHTML = "Currently logged in as " + user.name;
	      let requestObj1 = {
		scopes: ["user.read", 'openid', 'profile']
	      };
	    }

	    function onSignInClick() {
	      let requestObj = {
		scopes: ["user.read", 'openid', 'profile']
	      };

	      clientApplication.loginPopup(requestObj).then(onSignin).catch(function (error) {console.log(error) });
	    }

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

	async function fetchJSON(url, options = {}) {
	    const res = await fetch(url, {
	      ...options,
	      headers: {
		...options.headers,
		accept: 'application/json'
	      }
	    });

	    if (!res.ok) {
	      throw new Error(`Failed to fetch JSON due to ${res.status}`);
	    }

	    return await res.json();
	  } 
	</script>

	<script>
	     var clientApplication;
	     (function (){
	       var msalConfig = {
		   auth: {
		     clientId: '<CANVAS CLIENT APP ID>',
		     authority: 'https://login.microsoftonline.com/<TENANT ID>'
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

	(async function main() {

	      // Add your BOT ID below 
	      var BOT_ID = "<BOT ID>";
	      var theURL = "https://bots.ppe.customercareintelligence.net/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;

	   const { token } = await fetchJSON(theURL);
	   const directLine = window.WebChat.createDirectLine({ token });
	   const store = WebChat.createStore({}, ({ dispatch }) => next => action => {
	      const { type } = action;
	      if (action.type === 'DIRECT_LINE/CONNECT_FULFILLED') {
		dispatch({
		  type: 'WEB_CHAT/SEND_EVENT',
		  payload: {
		    name: 'startConversation',
		    type: 'event',
		    value: { text: "hello" }
		  }
		});
		return next(action);
	      }
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
			"from": {
			  id: clientApplication.account.accountIdentifier,
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

	      const styleOptions = {

		 // Add styleOptions to customize Web Chat canvas
		 hideUploadButton: true
	      };


		      window.WebChat.renderWebChat(
			  {
			      directLine: directLine,
		  store,
			      styleOptions
			  },
			  document.getElementById('webchat')
		      );
	})().catch(err => console.error("An error occurred: " + err));
	  </script>
	</body>
	</html>
	```

## Compliance considerations
Security and privacy considerations - scope, token caching, etc.

## FAQs
1. How do we configure our Skills with Single-Sign-On?
A) Create an app registration for your Skill bot following Step 2.  Navigate to https://portal.azure.com and locate the Bot Channel Registration for your Skill. Go to 'Settings' and then choose your Authentication Setting.  Paste your scope into the 'TokenExchangeUrl' field and click 'Save'.
