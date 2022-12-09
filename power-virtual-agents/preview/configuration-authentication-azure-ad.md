---
title: "Configure user authentication with Azure Active Directory (preview)"
description: "Use Azure Active Directory as your service provider for user authentication in Power Virtual Agents preview."
keywords: "Authentication, IdP, PVA, AAD"
ms.date: 10/10/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: kamrani
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Configure user authentication with Azure Active Directory (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Adding authentication allows users to sign in, giving your bot access to a restricted resource or information.

This article covers how to configure Azure Active Directory (Azure AD) as your service provider. To learn about other service providers and user authentication in general, see [Configure user authentication](configuration-end-user-authentication.md).

If you have tenant administration rights, you can [configure API permissions](#configure-api-permissions). Otherwise, you'll need to ask a tenant administrator to do so for you.

## Create an app registration

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

## Add the redirect URL

1. In the left nav of the app registration blade in Azure portal, go to **Authentication** and then select **Add a platform**.

    :::image type="content" source="media/configure-web-sso/add-platform.png" alt-text="Screenshot showing authentication." border="false":::

1. Under **Platform configurations** select **Add a platform**, then select **Web**.

    :::image type="content" source="media/configure-web-sso/configure-platform.png" alt-text="Screenshot showing add a platform." border="false":::

1. Under **Redirect URIs**, enter `https://unitedstates.token.botframework.com/.auth/web/redirect`.

1. Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

    :::image type="content" source="media/configure-web-sso/redirect-uri.png" alt-text="Screenshot showing implicit grant and hybrid flow." border="false":::

1. Select **Configure** to confirm your changes.

## Generate a client secret

1. In the left nav of the app registration blade in Azure portal, go to **Certificates & Secrets**.

1. Under the **Client secrets** section, select **New client secret**.

1. (Optional) Enter a description. One will be provided if you leave it blank.

1. Select the expiry period. Select the shortest period that's relevant for the life of your bot.

1. Select **Add** to create the secret.

1. Store the secret's **Value** in a secure temporary place. You'll need it when you configure your bot's authentication later on.

> [!IMPORTANT]
> If you navigate away from the page, the secret's Value is obfuscated, and you'll need to generate a new client secret.

## Configure API permissions

1. In the left nav of the app registration blade in Azure portal, go to **API permissions**.

1. Select **Grant admin consent for \<your tenant name>** and then select **Yes**. If this button is greyed out, you'll need to ask a tenant administrator to do this for you

    :::image type="content" source="media/configure-web-sso/api-permission.png" alt-text="Screenshot API permission." border="false":::

    > [!NOTE]
    > To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or a Cloud Application Administrator can grant tenant-wide consent to your app registrations.

1. Select **Add a permission**, then **Microsoft Graph**.

    :::image type="content" source="media/configure-web-sso/request-api-permission.png" alt-text="Screenshot showing request API permission." border="false":::

1. Select **Delegated permissions**. A list of permissions will appear below.

    :::image type="content" source="media/configure-web-sso/delegated-permission.png" alt-text="Screenshot showing delegated permission." border="false":::

1. Expand **OpenId permissions** and turn on **openid** and **profile**.

    :::image type="content" source="media/configure-web-sso/select-permission.png" alt-text="Screenshot showing delegated permission selection." border="false":::

1. Select **Add permissions** to save your settings.

## Define a custom scope for your bot

[Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights. You'll create a custom scope for your canvas app registration that you'll create in a later step.

1. In the left nav of the app registration blade in Azure portal, go to **Expose an API** and select **Add a scope**.

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

## Configure authentication in Power Virtual Agents

The token exchange URL is used to exchange the On-Behalf-Of (OBO) token for the requested access token.

1. In Power Virtual Agents navigation menu, under **Settings**, select **Security**. Then select **Authentication**.

    :::image type="content" source="media/configure-web-sso/pva-security-auth.png" alt-text="Screenshot Power Virtual Agents security and authentication page" border="false":::

1. Select **Manual (for any channel including Teams)** then turn on **Require users to sign in**.

    :::image type="content" source="media/configure-web-sso/pva-auth.png" alt-text="Screenshot Power Virtual Agents authentication settings page" border="false":::

1. Enter the values for the following properties:

    - **Service provider**: Select **Azure Active Directory V2**.

    - **Client ID**: Enter the application (client) ID that you copied earlier from the Azure portal.

    - **Client secret**: Enter the client secret you generated earlier from the Azure portal.

    - **Scopes**: Enter `profile openid`.

1. Select **Save** to finish the configuration.

## Test your bot using the test pane

1. Publish your bot.

1. In the test bot pane send a message to your bot.

1. When the bot responds, select **Login**.

    :::image type="content" source="media/configure-web-sso/test-bot.png" alt-text="Screenshot testing Power Virtual Agents bot" border="false":::

1. A new browser tab will open asking you to sign in. Sign in, then copy the code that is presented.

    :::image type="content" source="media/configure-web-sso/validation-code.png" alt-text="Screenshot bot login" border="false":::

1. Send the code to the bot to complete the sign-in process.

    :::image type="content" source="media/configure-web-sso/paste-code.png" alt-text="Screenshot paste validation code" border="false":::
