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

Before configuring SSO for your website, you'll first need to create an app registration.

1. Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md).
1. Return to this article.

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
    1. In the navigation menu, under **Settings**, select **Channels**.

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
