---
title: Configure user authentication with Azure Active Directory
description: Use Azure Active Directory as your service provider for user authentication.
keywords: "Authentication, IdP, PVA, AAD"
ms.date: 03/24/2023

ms.topic: article
author: KendalBond007
ms.author: iawilt
manager: leeclontz
ms.reviewr: micchow
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure user authentication with Azure Active Directory

Adding authentication to your bot allows users to sign in, giving your bot access to a restricted resource or information.

This article covers how to configure Azure Active Directory (Azure AD) as your service provider. To learn about other service providers and user authentication in general, see [Configure user authentication](configuration-end-user-authentication.md).

If you have tenant administration rights, you can [configure API permissions](#configure-api-permissions). Otherwise, you'll need to ask a tenant administrator to do it for you.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- [Learn how to use user authentication in a topic](advanced-end-user-authentication.md).

You'll complete the first several steps in the Azure portal. You'll complete the final two steps in Power Virtual Agents.

### Create an app registration

1. Sign in to the [Azure portal](https://portal.azure.com), using an admin account in the same tenant as your bot.

1. Go to **App registrations**, either by selecting the icon or searching in the top search bar.

    :::image type="content" source="media/configure-web-sso/start-app-reg.png" alt-text="Screenshot showing App registrations in Azure services.":::

1. Select **New registration** and enter a name for the registration.

    It can be helpful later to use the name of your bot. For example, if your bot is called "Contoso sales help," you might name the app registration "ContosoSalesReg".

1. Under **Supported account types**, select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

1. Leave the **Redirect URI** section blank for now. You'll enter that information in the next steps.

1. Select **Register**.

1. After the registration is complete, go to **Overview**.

1. Copy the **Application (client) ID** and paste it in a temporary file. You'll need it in later steps.

### Add the redirect URL

1. Go to **Authentication**, and then select **Add a platform**.

    :::image type="content" source="media/configure-web-sso/add-platform.png" alt-text="Screenshot of the App registrations window with Authentication and the Add a platform button highlighted.":::

1. Under **Platform configurations**, select **Add a platform**, and then select **Web**.

    :::image type="content" source="media/configure-web-sso/configure-platform.png" alt-text="Screenshot of the Platform configurations window with the Web application platform highlighted.":::

1. Under **Redirect URIs**, enter `https://token.botframework.com/.auth/web/redirect` and `https://europe.token.botframework.com/.auth/web/redirect`.

> [!NOTE]
> The authentication configuration pane in Power Virtual Agents might show the following redirect URL instead of the ones listed above: ` https://unitedstates.token.botframework.com/.auth/web/redirect`. Using that URL will make the authentication fail. Please use the URI listed above instead,

1. In the **Implicit grant and hybrid flows** section, turn on both **Access tokens (used for implicit flows)** and **ID tokens (used for implicit and hybrid flows)**.

    :::image type="content" source="media/configure-web-sso/redirect-url.png" alt-text="Screenshot of the Configure Web window with the redirect URI and implicit grant and hybrid flow tokens highlighted.":::

1. Select **Configure**.

### Generate a client secret

1. Go to **Certificates & secrets**.

1. In the **Client secrets** section, select **New client secret**.

1. (Optional) Enter a description. One will be provided if you leave it blank.

1. Select the expiry period. Select the shortest period that's relevant for the life of your bot.

1. Select **Add** to create the secret.

1. Store the secret's **Value** in a secure temporary file. You'll need it when you configure your bot's authentication later on.

> [!TIP]
> Don't leave the page before you copy the value of the client secret. If you do, the value is obfuscated and you'll need to generate a new client secret.

### Configure manual authentication

1. In Power Virtual Agents, in the navigation menu under **Settings**, select **Security**. Then select the **Authentication** card.

    :::image type="content" source="media/configuration-end-user-authentication/auth-manage-sm.png" alt-text="Screenshot of selecting the Authentication card.":::

1. Select **Manual (for any channel including Teams)** then turn on **Require users to sign in**.

    :::image type="content" source="media/configuration-end-user-authentication/auth-select-manual.png" alt-text="Screenshot of selecting the manual authentication option.":::

1. Enter the values for the following properties:

    - **Service provider**: Select **Azure Active Directory V2**.

    - **Client ID**: Enter the application (client) ID that you copied earlier from the Azure portal.

    - **Client secret**: Enter the client secret you generated earlier from the Azure portal.

    - **Scopes**: Enter `profile openid`.

1. Select **Save** to finish the configuration.

### Configure API permissions

1. Go to **API permissions**.

1. Select **Grant admin consent for \<your tenant name>**, and then select **Yes**. If this button isn't available, you'll need to ask a tenant administrator to do this for you.

    :::image type="content" source="media/configure-web-sso/api-permission.png" alt-text="Screenshot of the API permissions window with a tenant permission highlighted.":::

    > [!NOTE]
    > To avoid users from having to consent to each application, a Global Administrator, Application Administrator, or Cloud Application Administrator can grant tenant-wide consent to your app registrations.

1. Select **Add a permission**, and then select **Microsoft Graph**.

    :::image type="content" source="media/configure-web-sso/request-api-permission.png" alt-text="Screenshot of the Request API permissions window with Microsoft Graph highlighted.":::

1. Select **Delegated permissions**.

    :::image type="content" source="media/configure-web-sso/delegated-permission.png" alt-text="Screenshot with Delegated permissions highlighted.":::

1. Expand **OpenId permissions** and turn on **openid** and **profile**.

    :::image type="content" source="media/configure-web-sso/select-permission.png" alt-text="Screenshot with OpenId permissions, openid, and profile highlighted.":::

1. Select **Add permissions**.

### Define a custom scope for your bot

[Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights. You'll create a custom scope for the canvas app registration that you'll create in a later step.

1. Go to **Expose an API** and select **Add a scope**.

    :::image type="content" source="media/configure-web-sso/expose-api.png" alt-text="Screenshot with Expose an API and the Add a scope button highlighted.":::

1. Set the following properties. You can leave the other properties blank.

   | Property                   | Value                                                                  |
   | -------------------------- | ---------------------------------------------------------------------- |
   | Scope name                 | Enter a name that makes sense in your environment, such as `Test.Read` |
   | Who can consent?           | Select **Admins and users**                                            |
   | Admin consent display name | Enter a name that makes sense in your environment, such as `Test.Read` |
   | Admin consent description  | Enter `Allows the app to sign the user in.`                            |
   | State                      | Select **Enabled**                                                     |

1. Select **Add scope**.

### Configure authentication in Power Virtual Agents

1. In Power Virtual Agents, under **Settings**, select **Security**, and then select **Authentication**.

    :::image type="content" source="media/configure-web-sso/pva-security-auth.png" alt-text="Screenshot of the Power Virtual Agents Security page with Settings, Security, and Authentication highlighted.":::

1. Select **Manual (for custom website)**.

1. Turn on **Require users to sign in**.

1. Set the following properties.

   | Property                   | Value                                      |
   | -------------------------- | ------------------------------------------ |
   | Service provider           | Select **Azure Active Directory V2**       |
   | Client ID                  | Enter the application (client) ID that you copied earlier in the Azure portal |
   | Client secret              | Enter the client secret you generated earlier in the Azure portal             |
   | Scopes                     | Enter `profile openid`                     |

1. Select **Save**.

> [!TIP]
> The token exchange URL is used to exchange the On-Behalf-Of (OBO) token for the requested access token. For more information, see [Configure single sign-on for your custom website (preview)](configure-sso.md).

### Test your bot

1. Publish your bot.

1. In the **Test bot** pane, send a message to your bot.

1. When the bot responds, select **Login**.

    :::image type="content" source="media/configure-web-sso/test-bot.png" alt-text="Screenshot of testing a Power Virtual Agents bot with Azure AD user authentication.":::

    A new browser tab opens, asking you to sign in.

1. Sign in, and then copy the validation code that's displayed.

1. Paste the code in the bot chat to complete the sign-in process.

    :::image type="content" source="media/configure-web-sso/paste-code.png" alt-text="Screenshot of a successful user authentication in a bot conversation, with the validation code highlighted.":::
[!INCLUDE[footer-include](includes/footer-banner.md)]
