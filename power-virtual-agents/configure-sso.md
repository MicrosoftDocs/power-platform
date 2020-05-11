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

> [!IMPORTANT] 
> Before using this feature, you must follow the [end-user authentication configuration instructions](configuration-end-user-authentication.md) and [deploy a custom canvas](extend-custom-canvas-connect.md)

## Overview
The following illustration gives you an overview of how single sign-on works end-to-end.

  ![Illustration of SSO auth flow](media/sso-illustration.png)

1. Customer enters a trigger phrase that triggers a topic that is authored to sign-in the user and use user's authenticated token (AuthToken)
1. On trigger, Power Virtual Agents sends a login prompt to allow user to sign-in with their configured identity provider
1. Customer's custom canvas intercepts this sign-in prompt and request an On-Behalf-Of (OBO) token from Azure Active Directory which it sends to Power Virtual Agents' bot
1. On receipt of the OBO token, Power Virtual Agents' bot exchanges the OBO token for an 'access token' and fills in the `AuthToken` variable using this value.  The 'IsLoggedIn' variable is also set at this time.

The above steps completes the Single-Sign-On auth flow and the user is signed in without being prompted.

## Steps to configure SSO with Azure Active Directory
Follow the steps to configure your Power Virtual Agents' bot to accept OBO tokens and seamlessly sign-in without prompting the user.

### 1. Create an app registration in Azure Active Directory for your canvas application

* Navigate to Manage --> Channels --> Mobile app. Copy your bot's `Bot ID` and `Tenant ID` as you'll need it later.
* Navigate to https://portal.azure.com
* Create a new 'Application Registration' - [click here](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade)
* Click on 'New Registration' -- Fill out Name, "	Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)" and click 'Register'
* Once the resource is created, go to the 'Authentication' --> '+ Add a platform' --> 'Web' 
* Add the full URL to the page where your chat canvas will be hosted (eg. `https://10.127.97.163:8081/sso-<bot_id>.html`) in 'Redirect URI'. Also ensure that `Id Tokens` and `Access` Tokens are selected.
* Click 'Configure'
* Click 'Overview', take a note of the `Application (client) ID` and your `Directory (tenant) ID`.

### 2. Setup authentication with your bot

* Navigate to https://portal.azure.com
* Create a new 'Application Registration' - [click here](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade)
* Click on 'New Registration' -- Fill out Name, "	Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)" and click 'Register'
* Once the resource is created, go to the 'Authentication' --> '+ Add a platform' --> 'Web' 
* Add `https://token.botframework.com/.auth/web/redirect` in 'Redirect URI'. Also ensure that `Id Tokens` and `Access` Tokens are selected.
* Click 'Configure'
* Go to 'Certificates & Secrets', add a New Client Secret, and take note of this secret
* Go to 'API Permissions' and ensure that the correct permissions are added for your bot
* Go to 'Expose an API', Add a Scope, Click 'Save and continue'
* Fill out all required fields, and click 'Add scope'
* Click on 'Add a client application', paste in the 'Client Id' from Step 1. Check the scope you just created and then click 'Add application'
* Take a note of the `Client ID`, `Client Secret` and your `Scope`.

### 3. Add 'Token exchange URL' to your bot's authentication page
The Token Exchange URL is used to exchange the OBO token for the requested access token through the bot framework.  This calls into Azure Active Directory to preform the actual exchange.
* Within your Power Virtual Agent:
* Navigate to `Configure` --> `Authentication`
* Update `Token exchange URL` with the URL configured in Step 2.

### 4. Update your custom canvas to intercept sign-in prompts

* Update your `index.html` to intercept login card request and exchange your token (see sample below)
* Configure Microsoft Authentication Library (MSAL) by adding this code into your `<script>` tag
* Update `clientId` with the Custom canvas ID you copied earlier
* Replace `<Directory ID>` with your tenant's ID you copied earlier

```diff
<head>
+ <script>
+   var clientApplication;
+     (function ()
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
