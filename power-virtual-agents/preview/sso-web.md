---
title: "Configure single sign-on for chat canvas"
description: "Enable your bot to authenticate an already-signed-in user (preview)"
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA, preview"
ms.date: 10/10/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: pawant
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on for custom website in Power Virtual Agents (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Power Virtual Agents supports single sign-on (SSO), which means chatbots can sign the user in if they're in to the page where the bot is deployed.  
For example, the bot is hosted on the corporate intranet or in an app that the user is already signed in to. 

> [!IMPORTANT]
>
> SSO is currently not supported when a bot has been either:
>
> - Published to Teams 
> - Published to a SharePoint website.
> - Published to a Power Apps portal.
> - Integrated with Dynamics 365 Customer Service.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](https://learn.microsoft.com/power-virtual-agents/fundamentals-what-is-power-virtual-agents).

## Supported channels

The following table details the channels that currently support SSO in public preview release of PVA.


| Channel                          | Supported |
| -------------------------------- | :-------: |
| Azure Bot Service channels       |           |
| Custom Website                   |     ✔     |
| Demo Website                     |           |
| Facebook                         |           |
| Microsoft Teams                  |           |
| Mobile App                       |           |


## Create an app registration for your custom canvas

To enable SSO, you'll need two separate app registrations:

- One for your bot to enable user authentication with Azure AD.
- One for your custom canvas (aka website the bot is hosted on) to enable SSO.

You should not reuse the same app registration for both your bot and your custom canvas for security reasons. 

### Create an app registration for the bot
Use Azure Active Directory to create an app registration for your PVA bot
1.	Sign in to the Azure portal, using an admin account on the same tenant as your bot.
2.	Go to **App registrations**, either by selecting the icon or searching in the top search bar.

 :::image type="content" source="media/sso/start-app-reg.png" alt-text="Screenshot showing new app registration in azure." border="false":::
 
 3.	Select **New registration** and enter a name for the registration.

 :::image type="content" source="media/sso/new-app-reg.png" alt-text="Screenshot showing new registration form." border="false":::

It can be helpful to use the name of your bot. For example, if your bot is called "Contoso sales help", you might name the app registration "ContosoSalesReg" or something similar.

4.	Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

 :::image type="content" source="media/sso/register-an-app.png" alt-text="Screenshot accounts in organizational directory." border="false":::

5.	Leave the **Redirect URI** section blank for now. You'll enter that information in the next steps.
6.	Select **Register**.

### Add the redirect URL

1.	Once the registration is complete, the **Overview** page opens. Go to **Authentication** and then select **Add a platform**.

 :::image type="content" source="media/sso/add-platform.png" alt-text="Screenshot showing authentication." border="false":::

2.	Under **Platform configurations** select **Add a platform**, then select **Web**.

 :::image type="content" source="media/sso/configure-platform.png" alt-text="Screenshot showing add a platform." border="false":::
 
3.	Under **Redirect URIs**, enter `https://token.botframework.com/.auth/web/redirect`.

4.	Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

:::image type="content" source="media/sso/redirect-uri.png" alt-text="Screenshot showing implicit grant and hybrid flow." border="false":::

5.	Select **Configure** to confirm your changes.

### Generate a client secret
1.	Go to **Certificates & Secrets**.
2.	Under the **Client secrets** section, select **New client secret**.
3.	(Optional) Enter a description. One will be provided if you leave it blank.
4.	Select the expiry period. Select the shortest period that's relevant for the life of your bot.
5.	Select **Add** to create the secret.
6.	Store the secret's **Value** in a secure temporary place. You'll need it when you configure your bot's authentication later on.

> [!IMPORTANT]
>  If you navigate away from the page, the secret's Value is obfuscated, and you'll need to generate a new client secret.

### API Permissions
1.	Go to **API Permissions**. Select ** Grant admin consent for _your tenant name_ ** and then select **Yes**.
 
> [!Important]
> To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must grant tenant-wide consent to your app registrations.
 
 :::image type="content" source="media/sso/api-permission.png" alt-text="Screenshot API permission." border="false":::

2.	Next, select **Add a permission**, then **Microsoft Graph**.
 
  :::image type="content" source="media/sso/request-api-permission.png" alt-text="Screenshot showing request API permission." border="false":::

3.	Next, select **Delegated permissions**.

  :::image type="content" source="media/sso/delegated-permission.png" alt-text="Screenshot showing delegated permission." border="false":::
 
4.	Select **openid** and **profile**.
 
  :::image type="content" source="media/sso/select-permission.png" alt-text="Screenshot showing delegated permission selection." border="false"::: 
 
5. Select **Add permissions** to save your settings.
 
### Define a custom scope for your bot
Define a custom scope by exposing an API for the canvas app registration within the authentication app registration. Scopes allow you to determine user and admin roles and access rights.
 
1.	Go to Expose an API and select Add a scope.

 :::image type="content" source="media/sso/expose-api.png" alt-text="Screenshot showing API scopes" border="false"::: 
 
2.	Select Save and continue.
3.	Enter a Scope name.
4.	Under Who can consent?, select Admins and users.
5.	Enter Admin consent display name and Admin consent description. 

 :::image type="content" source="media/sso/add-scope.png" alt-text="Screenshot adding of API scopes" border="false"::: 
 
6.	Select **Add** scope.
 
### Configure authentication in Power Virtual Agents to enable SSO
The Token Exchange URL in the Power Virtual Agents authentication configuration page is used to exchange the OBO token for the requested access token through the bot framework. ower Virtual Agents calls into Azure AD to perform the actual exchange.
 
1.	Sign in to Power Virtual Agents.
 
2.	Confirm you've selected the bot for which you want to enable authentication by selecting the bot icon on the top menu and choosing the correct bot.
 
3.	Select **Manage** on the side pane, then **Security**.

:::image type="content" source="media/sso/pva-security-auth.png" alt-text="Screenshot PVA security and authentication page" border="false"::: 
 
4.	Next, select **Authentication**.
 
:::image type="content" source="media/sso/pva-auth.png" alt-text="Screenshot PVA authentication settings page" border="false"::: 
 
5.	Select **Manual (for any channel including Teams)**.
 
6.	Make sure **Require users to sign in** is checked.
 
7.	Select **Azure Active Directory v2**.
 
8.	In the **Token exchange URL** field, enter the full scope URI from the **Expose an API** blade in the Azure portal for the bot’s authentication app registration. The URI will be in the format of `api://1234-4567/scopename` as shown below.

 :::image type="content" source="media/sso/copy-scope.png" alt-text="Screenshot copy scope for use in PVA" border="false"::: 

 9.	Update **Client ID** for your PVA bot with the **Application (client) ID** for the canvas app registration. You get the ID from the Overview page for the canvas app registration in the Azure portal as shown below.

  :::image type="content" source="media/sso/copy-clientid.png" alt-text="Screenshot Azure client id page for app registration" border="false"::: 
 
10.	Next, add the *Client Secret* to your bot. This is the secret value you created in the Azure portal (and stored in a temporary place) in an earlier step.
 
11.	Add `profile` and `openid` in the **Scopes** field. 
 
12.	Select **Save**.
 
### Test your bot
1.	After saving the changes, you need to publish your bot before you can test it. 
 
2.	Run it in the Test bot window. When you interact with the bot, it should ask you to login (as shown below). 

  :::image type="content" source="media/sso/test-bot.png" alt-text="Screenshot testing PVA bot" border="false"::: 

3.	Click on the **Login** button, sign in, and copy the code that is presented. 
 
  :::image type="content" source="media/sso/validation-code.png" alt-text="Screenshot bot login" border="false"::: 
 
4.	Paste that code in the bot, and you should be able to communicate with the bot. 
 
   :::image type="content" source="media/sso/paste-code.png" alt-text="Screenshot paste validation code" border="false"::: 
 
Next, we will set up the App Registration for the Web page.

 ### Create custom canvas app registration
The steps for setting up app registration for custom canvas in the Azure portal are the same as the bot’s app registration that you just completed. The only difference is that instead of using `https://token.botframework.com/.auth/web/redirect` as the redirect URL, provide the canvas app URL. For example, `http://contoso.com/index.html` as shown below. So go ahead and create the app registration using the steps provided earlier. 
 
   :::image type="content" source="media/sso/configure-web-setting-for-canvas.png" alt-text="Screenshot of configure webpage" border="false"::: 

### Configure your custom canvas HTML code to enable SSO

 In this example, we will use the code provided in the [GitHub repo](https://github.com/microsoft/PowerVirtualAgentsSamples/blob/master/BuildYourOwnCanvasSamples/3.single-sign-on/index.html) to create the a html page that you specified as the redirect URI (above). Copy the code from the GitHub repo and modify it using the instructions provided below.
 
1.	To make changes to the code, you will need **Application (client) ID** and **Directory (tenant) ID**. You get these IDs from the **Overview** page for the canvas app registration in the Azure portal as shown below.
 
  :::image type="content" source="media/sso/canvas-client-tenant-id.png" alt-text="Screenshot app registration overview page in azure" border="false"::: 
 
 2.	Configure the Microsoft Authentication Library (MSAL) by updating _clientId_ with the **Application (client) ID**  and _Directory ID_ with the **Directory (tenant) ID**. 

 ```csharp
 ...     
var clientApplication;
     (function (){
       var msalConfig = {
     auth: {
          clientId: '<Client ID [CanvasClientId]>',
       authority: 'https://login.microsoftonline.com/<Directory ID>'     
},
...
```

3.	Update **BOT ID** with your bot's ID. You can see your bot's ID by going to the Channels tab for the bot you're using and selecting Mobile app on the Power Virtual Agents portal. 

 :::image type="content" source="media/sso/pva-bot-id.png" alt-text="Screenshot of copying bot id in PVA" border="false"::: 
 
 ```csharp
 ...
(async function main() {

    // Add your BOT ID below 
    var BOT_ID = "<BOT ID>";
    var theURL = "https://powerva.microsoft.com/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;

  var userId = clientApplication.account?.accountIdentifier != null ? 
          ("Your-customized-prefix-max-20-characters" + clientApplication.account.accountIdentifier).substr(0, 64) 
          : (Math.random().toString() + Date.now().toString()).substr(0,64);
 ...

 ```
 
4.	Replace `Your-customized-prefix-max-20-characters` above with any customized prefix you want to use.
 
5.	Save code changes.

### Test bot using the custom canvas
1.	Load the index.html page. If your browser blocks popup or you are using incognito mode, you will be prompted to log in, otherwise the log in will complete automatically. 
 
2.	Next, you should be able to log in to the bot by clicking the Login button and using the validation code provided in a separate browser tab.
 
  :::image type="content" source="media/sso/chat-canvas-test.png" alt-text="Screenshot of logging in using validation code" border="false"::: 

 ## Reference
- [Azure App Registration](https://learn.microsoft.com/azure/active-directory/develop/quickstart-register-app)
