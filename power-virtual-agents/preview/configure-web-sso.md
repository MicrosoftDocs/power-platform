---
title: "Configure single sign-on for a custom website (preview)"
description: "Enable your bot to authenticate an already-signed-in user in Power Virtual Agents preview."
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA, preview"
ms.date: 10/10/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: kamrani
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure single sign-on for your custom website (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Power Virtual Agents supports single sign-on (SSO), which means chatbots can sign the user in if they're in to the page where the bot is deployed. For example, the bot is hosted on the corporate intranet or in an app that the user is already signed in to.

> [!IMPORTANT]
>
> SSO is currently not supported when a bot has been either:
>
> - Published to Teams
> - Published to a SharePoint website.
> - Published to a Power Apps portal.
> - Integrated with Dynamics 365 Customer Service.

## Supported channels

The following table details the channels that currently support SSO in Power Virtual Agents preview:

| Channel                    | Supported |
| -------------------------- | :-------: |
| Azure Bot Service channels |           |
| Custom Website             |     ✔     |
| Demo Website               |           |
| Facebook                   |           |
| Microsoft Teams            |           |
| Mobile App                 |           |

## Create an app registration for your custom website

To enable SSO, you'll need two separate app registrations:

- An _authentication app registration_ which enables user authentication in your bot with Azure AD.
- A _canvas app registration_ which enables SSO for your custom web page.

> [!IMPORTANT]
> It's not recommended to reuse the same app registration for both your bot and your custom website for security reasons.

### Create an authentication app registration

1. Sign in to the [Azure portal](https://portal.azure.com), using an admin account on the same tenant as your bot.

1. Go to **App registrations**, either by selecting the icon or searching in the top search bar.

    :::image type="content" source="media/configure-web-sso/start-app-reg.png" alt-text="Screenshot showing new app registration in azure." border="false":::

1. Select **New registration** and enter a name for the registration.

    It can be helpful to use the name of your bot. For example, if your bot is called "Contoso sales help", you could name the app registration "ContosoSalesReg".

    :::image type="content" source="media/configure-web-sso/new-app-reg.png" alt-text="Screenshot showing new registration form." border="false":::

1. Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

    :::image type="content" source="media/configure-web-sso/register-an-app.png" alt-text="Screenshot accounts in organizational directory." border="false":::

1. Leave the **Redirect URI** section blank for now. You'll enter that information in the next steps.

1. Select **Register**.

1. Once the registration is complete, go to **Overview**.

1. Copy the **Application (client) ID** and store it in a temporary place. You'll need this in later steps.

### Add the redirect URL

1. In the Azure portal, go to **Authentication** and then select **Add a platform**.

    :::image type="content" source="media/configure-web-sso/add-platform.png" alt-text="Screenshot showing authentication." border="false":::

1. Under **Platform configurations** select **Add a platform**, then select **Web**.

    :::image type="content" source="media/configure-web-sso/configure-platform.png" alt-text="Screenshot showing add a platform." border="false":::

1. Under **Redirect URIs**, enter `https://unitedstates.token.botframework.com/.auth/web/redirect`.

1. Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

    :::image type="content" source="media/configure-web-sso/redirect-uri.png" alt-text="Screenshot showing implicit grant and hybrid flow." border="false":::

1. Select **Configure** to confirm your changes.

### Generate a client secret

1. In the Azure portal, go to **Certificates & Secrets**.

1. Under the **Client secrets** section, select **New client secret**.

1. (Optional) Enter a description. One will be provided if you leave it blank.

1. Select the expiry period. Select the shortest period that's relevant for the life of your bot.

1. Select **Add** to create the secret.

1. Store the secret's **Value** in a secure temporary place. You'll need it when you configure your bot's authentication later on.

> [!IMPORTANT]
> If you navigate away from the page, the secret's Value is obfuscated, and you'll need to generate a new client secret.

### Configure API Permissions

1. Go to **API Permissions**. Select **Grant admin consent for _your tenant name_** and then select **Yes**.

    > [!IMPORTANT]
    > To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator must grant tenant-wide consent to your app registrations.

    :::image type="content" source="media/configure-web-sso/api-permission.png" alt-text="Screenshot API permission." border="false":::

1. Select **Add a permission**, then **Microsoft Graph**.

    :::image type="content" source="media/configure-web-sso/request-api-permission.png" alt-text="Screenshot showing request API permission." border="false":::

1. Select **Delegated permissions**. A list of permissions will appear below.

    :::image type="content" source="media/configure-web-sso/delegated-permission.png" alt-text="Screenshot showing delegated permission." border="false":::

1. Expand **OpenId permissions** and turn on **openid** and **profile**.

    :::image type="content" source="media/configure-web-sso/select-permission.png" alt-text="Screenshot showing delegated permission selection." border="false":::

1. Select **Add permissions** to save your settings.

### Define a custom scope for your bot

[Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights. You'll create a custom scope for your canvas app registration that you'll create in a later step.

1. In the Azure portal, go to **Expose an API** and select **Add a scope**.

    :::image type="content" source="media/configure-web-sso/expose-api.png" alt-text="Screenshot showing API scopes" border="false":::

1. Set the following properties:

   | Property                   | Value                                      |
   | -------------------------- | ------------------------------------------ |
   | Scope name                 | Enter `Test.Read`                          |
   | Who can consent?           | Select **Admins and users**                |
   | Admin consent display name | Enter `Test.Read`                          |
   | Admin consent description  | Enter `Allows the app to log in the user.` |
   | State                      | Select **Enabled**                         |

   > [!NOTE]
   > The scope name `Test.Read` is a placeholder value and should be replaced with a name that makes sense in your environment.

    :::image type="content" source="media/configure-web-sso/add-scope.png" alt-text="Screenshot adding of API scopes" border="false":::

1. Select **Add** scope.

### Configure authentication in Power Virtual Agents

The token exchange URL is used to exchange the On-Behalf-Of (OBO) token for the requested access token.

1. In Power Virtual Agents side navigation pane, under **Settings**, select **Security**. Then select **Authentication**.

    :::image type="content" source="media/configure-web-sso/pva-security-auth.png" alt-text="Screenshot Power Virtual Agents security and authentication page" border="false":::

1. Select **Manual (for any channel including Teams)** then turn on **Require users to sign in**.

    :::image type="content" source="media/configure-web-sso/pva-auth.png" alt-text="Screenshot Power Virtual Agents authentication settings page" border="false":::

1. Enter the values for the following properties:

    - **Service provider**: Select **Azure Active Directory V2**.

    - **Client ID**: Enter the application (client) ID that you copied earlier from the Azure portal.

    - **Client secret**: Enter the client secret you generated earlier from the Azure portal.

    - **Scopes**: Enter `profile openid`.

1. Select **Save** to finish the configuration.

### Test your bot using the test pane

1. Publish your bot.

1. In the test bot pane send a message to your bot.

1. When the bot responds, select **Login**.

    :::image type="content" source="media/configure-web-sso/test-bot.png" alt-text="Screenshot testing Power Virtual Agents bot" border="false":::

1. A new browser tab will open asking you to sign in. Sign in, then copy the code that is presented.

    :::image type="content" source="media/configure-web-sso/validation-code.png" alt-text="Screenshot bot login" border="false":::

1. Send the code to the bot to complete the sign-in process.

    :::image type="content" source="media/configure-web-sso/paste-code.png" alt-text="Screenshot paste validation code" border="false":::

## Create a canvas app registration

1. Create a second app registration to serve as your canvas app registration. You can refer to the earlier steps on [how to create an authentication app registration](#create-an-authentication-app-registration).

1. Once you've created your canvas app registration, go to **Authentication** and then select **Add a platform**.

1. Under **Platform configurations** select **Add a platform**, then select **Web**.

1. Under **Redirect URIs**, enter the URL for your web page. For example, `http://contoso.com/index.html`.

    :::image type="content" source="media/configure-web-sso/configure-web-setting-for-canvas.png" alt-text="Screenshot of configure webpage" border="false":::

1. Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

1. Select **Configure** to confirm your changes.

## Configure SSO in your web page

You can use the code provided in the [Power Virtual Agents' GitHub repo](https://github.com/microsoft/PowerVirtualAgentsSamples/blob/master/BuildYourOwnCanvasSamples/3.single-sign-on/index.html) to create an web page for the redirect URL. Copy the code from the GitHub repo and modify it using the instructions provided below.

1. To make changes to the code, you will need the **Application (client) ID** and **Directory (tenant) ID** from your canvas app registration. You can get these IDs from the **Overview** page in Azure portal.

    :::image type="content" source="media/configure-web-sso/canvas-client-tenant-id.png" alt-text="Screenshot app registration overview page in azure" border="false":::

1. To configure the Microsoft Authentication Library (MSAL):
    - Assign `clientId` to your **Application (client) ID**.
    - Assign `authority` to `https://login.microsoftonline.com/` and add your **Directory (tenant) ID** to the end.

    For example:

    ```csharp
    var clientApplication;
        (function (){
        var msalConfig = {
            auth: {
                clientId: 'd146-4060-b388f4d9c',
                authority: 'https://login.microsoftonline.com/7ef988bf-86f1-51af-01ab-2d7fd011db47'     
            },
    ```

1. Find your bot's ID in Power Virtual Agents:
    1. In the side navigation pane, under **Settings**, select **Channels**.

    1. Select **Mobile app**.

    1. Under **Token Endpoint**, select **Copy** to copy your bot's token endpoint URL to your clipboard.

        :::image type="content" source="media/configure-web-sso/pva-bot-id.png" alt-text="Screenshot of copying token endpoint URL in Power Virtual Agents.":::

1. Set the `theURL` variable to your token exchange URL you copied in the previous step. For example:

    ```csharp
    (async function main() {

        var theURL = "https://1c0.0.environment.api.powerplatform.com/powervirtualagents/bots/5a099fd/directline/token?api-version=2022-03-01-preview"
    ```

1. Update the value of `userId` to include a customized prefix. For example:

    ```csharp
    var userId = clientApplication.account?.accountIdentifier != null ? 
            ("My-custom-prefix" + clientApplication.account.accountIdentifier).substr(0, 64) 
            : (Math.random().toString() + Date.now().toString()).substr(0,64);
    ```

1. Save code changes.

## Test bot using your web page

1. Open your web page in your browser.

   > [!NOTE]
   > If your browser blocks popups, or you are using incognito mode, you will be prompted to log in, otherwise the log in will complete using a validation code.

1. Select **Login**. A new browser tab will open.

    :::image type="content" source="media/configure-web-sso/chat-canvas-test.png" alt-text="Screenshot of logging in using validation code" border="false":::

1. Switch to the new browser tab and copy the validation code.

1. Switch back to the tab with your bot, and send your bot the validation code.

## Reference

- [Azure App Registration](/azure/active-directory/develop/quickstart-register-app)
