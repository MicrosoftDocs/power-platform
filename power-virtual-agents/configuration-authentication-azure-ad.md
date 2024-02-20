---
title: Configure user authentication with Microsoft Entra ID
description: Use Microsoft Entra ID as your service provider for user authentication.
keywords: "Authentication, IdP, PVA, Microsoft Entra ID"
ms.date: 03/24/2023

ms.topic: article
author: KendalBond007
ms.author: iawilt
manager: leeclontz
ms.reviewr: micchow
ms.custom: authentication, ceX
ms.service: power-virtual-agents

---

# Configure user authentication with Microsoft Entra ID

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Adding authentication to your copilot allows users to sign in, giving your copilot access to a restricted resource or information.

This article covers how to configure Microsoft Entra ID as your service provider. To learn about other service providers and user authentication in general, see [Configure user authentication](configuration-end-user-authentication.md).

If you have tenant administration rights, you can [configure API permissions](#configure-api-permissions). Otherwise, you need to ask a tenant administrator to do it for you.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Learn how to use user authentication in a topic](advanced-end-user-authentication.md).

You complete the first several steps in the Azure portal, and complete the final two steps in Microsoft Copilot Studio.

### Create an app registration

1. Sign in to the [Azure portal](https://portal.azure.com), using an admin account in the same tenant as your copilot.

1. Go to **App registrations**, either by selecting the icon or searching in the top search bar.

    :::image type="content" source="media/configure-web-sso/start-app-reg.png" alt-text="Screenshot showing App registrations in Azure services.":::

1. Select **New registration** and enter a name for the registration.

    It can be helpful later to use the name of your copilot. For example, if your copilot is called "Contoso sales help," you might name the app registration "ContosoSalesReg."

1. Under **Supported account types**, select **Accounts in any organizational directory (Any Microsoft Entra ID directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

1. Leave the **Redirect URI** section blank for now. Enter that information in the next steps.

1. Select **Register**.

1. After the registration is complete, go to **Overview**.

1. Copy the **Application (client) ID** and paste it in a temporary file. You need it in later steps.

### Add the redirect URL

1. Go to **Authentication**, and then select **Add a platform**.

    :::image type="content" source="media/configure-web-sso/add-platform.png" alt-text="Screenshot of the App registrations window with Authentication and the Add a platform button highlighted.":::

1. Under **Platform configurations**, select **Add a platform**, and then select **Web**.

    :::image type="content" source="media/configure-web-sso/configure-platform.png" alt-text="Screenshot of the Platform configurations window with the Web application platform highlighted.":::

1. Under **Redirect URIs**, enter `https://token.botframework.com/.auth/web/redirect` and `https://europe.token.botframework.com/.auth/web/redirect`.

> [!NOTE]
> The authentication configuration pane in Microsoft Copilot Studio might show the following redirect URL: ` https://unitedstates.token.botframework.com/.auth/web/redirect`. Using that URL makes the authentication fail; use the URI instead.

1. In the **Implicit grant and hybrid flows** section, turn on both **Access tokens (used for implicit flows)** and **ID tokens (used for implicit and hybrid flows)**.

    :::image type="content" source="media/configure-web-sso/redirect-url.png" alt-text="Screenshot of the Configure Web window with the redirect URI and implicit grant and hybrid flow tokens highlighted.":::

1. Select **Configure**.

### Generate a client secret

1. Go to **Certificates & secrets**.

1. In the **Client secrets** section, select **New client secret**.

1. (Optional) Enter a description. One is provided if left blank.

1. Select the expiry period. Select the shortest period that's relevant for the life of your copilot.

1. Select **Add** to create the secret.

1. Store the secret's **Value** in a secure temporary file. You need it when you configure your copilot's authentication later on.

> [!TIP]
> Don't leave the page before you copy the value of the client secret. If you do, the value is obfuscated and you must generate a new client secret.

### Configure manual authentication

1. In Microsoft Copilot Studio, in the navigation menu under **Settings**, select **Security**. Then select the **Authentication** card.

    :::image type="content" source="media/configuration-end-user-authentication/auth-manage-sm.png" alt-text="Screenshot of selecting the Authentication card.":::

1. Select **Manual (for any channel including Teams)** then turn on **Require users to sign in**.

    :::image type="content" source="media/configuration-end-user-authentication/auth-select-manual.png" alt-text="Screenshot of selecting the manual authentication option.":::

1. Enter the following values for the properties:

    - **Service provider**: Select **Microsoft Entra ID**.

    - **Client ID**: Enter the application (client) ID that you copied earlier from the Azure portal.

    - **Client secret**: Enter the client secret you generated earlier from the Azure portal.

    - **Scopes**: Enter `profile openid`.

1. Select **Save** to finish the configuration.

### Configure API permissions

1. Go to **API permissions**.

1. Select **Grant admin consent for \<your tenant name>**, and then select **Yes**. If the button isn't available, you may need to ask a tenant administrator to do enter it for you.

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

### Define a custom scope for your copilot

[Scopes](/azure/active-directory/develop/developer-glossary#scopes) allow you to determine user and admin roles and access rights. You create a custom scope for the canvas app registration that you create in a later step.

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

### Configure authentication in Microsoft Copilot Studio

1. In Microsoft Copilot Studio, under **Settings**, select **Security**, and then select **Authentication**.

    :::image type="content" source="media/configure-web-sso/pva-security-auth.png" alt-text="Screenshot of the Microsoft Copilot Studio Security page with Settings, Security, and Authentication highlighted.":::

1. Select **Manual (for custom website)**.

1. Turn on **Require users to sign in**.

1. Set the following properties.

   | Property                   | Value                                      |
   | -------------------------- | ------------------------------------------ |
   | Service provider           | Select **Microsoft Entra ID**       |
   | Client ID                  | Enter the application (client) ID that you copied earlier in the Azure portal |
   | Client secret              | Enter the client secret you generated earlier in the Azure portal             |
   | Scopes                     | Enter `profile openid`                     |

1. Select **Save**.

> [!TIP]
> The token exchange URL is used to exchange the On-Behalf-Of (OBO) token for the requested access token. For more information, see [Configure single sign-on for your custom website](configure-sso.md).

### Test your copilot

1. Publish your copilot.

1. In the **Test copilot** pane, send a message to your copilot.

1. When the copilot responds, select **Login**.

    :::image type="content" source="media/configure-web-sso/test-bot.png" alt-text="Screenshot of testing a Microsoft Copilot Studio copilot with Microsoft Entra ID user authentication.":::

    A new browser tab opens, asking you to sign in.

1. Sign in, and then copy the displayed validation code.

1. Paste the code in the copilot chat to complete the sign-in process.

    :::image type="content" source="media/configure-web-sso/paste-code.png" alt-text="Screenshot of a successful user authentication in a copilot conversation, with the validation code highlighted.":::
[!INCLUDE[footer-include](includes/footer-banner.md)]
