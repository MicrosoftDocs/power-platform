---
title: Configure single sign-on for your custom website (preview)
description: Enable your bot to authenticate a user who has already signed in in Power Virtual Agents preview.
keywords: "Single Sign-on, SSO, User Authentication, Authentication, AAD, MSA, Identity Provider, PVA, preview"
ms.date: 12/07/2022
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: kamrani
ms.custom: authentication, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Configure single sign-on for your custom website (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

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

## Create app registrations for your custom website

To enable SSO, you'll need to create two separate app registrations:

- An _authentication app registration_, which enables Azure Active Directory (Azure AD) user authentication for your bot
- A _canvas app registration_, which enables SSO for your custom web page

We don't recommend reusing the same app registration for both your bot and your custom website for security reasons.

1. Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md) to create an authentication app registration.
1. Follow the same instructions again to create a second app registration, which will serve as your canvas app registration.
1. Return to this article.

## Configure your canvas app registration

1. After you create your canvas app registration, go to **Authentication**, and then select **Add a platform**.

1. Under **Platform configurations**, select **Add a platform**, and then select **Web**.

1. Under **Redirect URIs**, enter the URL for your web page; for example, `http://contoso.com/index.html`.

    :::image type="content" source="media/configure-web-sso/configure-web-setting-for-canvas.png" alt-text="Screenshot of the Configure Web page.":::

1. In the **Implicit grant and hybrid flows** section, turn on both **Access tokens (used for implicit flows)** and **ID tokens (used for implicit and hybrid flows)**.

1. Select **Configure**.

## Find your bot's token endpoint URL

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

1. Find your bot's ID in Power Virtual Agents:
    1. In the side navigation pane, under **Settings**, select **Channels**.

    1. Select **Mobile app**.

    1. Under **Token Endpoint**, select **Copy** to copy your bot's token endpoint URL to your clipboard.

        :::image type="content" source="media/configure-web-sso/pva-bot-id.png" alt-text="Screenshot of copying token endpoint URL in Power Virtual Agents.":::

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

## Test your bot using your web page

1. Open your web page in your browser.

1. Select **Login**.

    :::image type="content" source="media/configure-web-sso/chat-canvas-test.png" alt-text="Screenshot of logging in using validation code":::

   > [!NOTE]
   > If your browser blocks popups or you are using an incognito or private browsing window, you will be prompted to log in. Otherwise, the log in will complete using a validation code.

    A new browser tab opens.

1. Switch to the new tab and copy the validation code.
1. Switch back to the tab with your bot, and paste the validation code into the bot conversation.

## Reference

- [Azure App Registration](/azure/active-directory/develop/quickstart-register-app)
