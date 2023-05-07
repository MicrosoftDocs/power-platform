---
title: Configure user authentication with Azure Active Directory
description: Use Azure Active Directory as your service provider for user authentication.
keywords: "Authentication, IdP, PVA, AAD"
ms.date: 08/18/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewr: micchow
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure user authentication with Azure Active Directory

Adding authentication allows users to sign in, giving your bot access to a restricted resource or information.

This article covers how to configure Azure Active Directory (Azure AD) as your service provider. To learn about other service providers and user authentication in general, see [Configure user authentication](configuration-end-user-authentication.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- [Learn how to use user authentication in a topic](advanced-end-user-authentication.md).

## Create an app registration

1. Sign in to the [Azure portal](https://portal.azure.com), using an admin account on the same tenant as your bot.

1. Go to [App registrations](https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade), either by selecting the icon or searching in the top search bar.

1. Select **New registration** and enter a name for the registration.  

    It can be helpful to use the name of your bot. For example, if your bot is called "Contoso sales help", you might name the app registration "ContosoSalesReg" or something similar.

1. Select **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)**.

1. Leave the **Redirect URI** section blank for now. You'll enter that information in the next steps.

1. Select **Register**.

1. Once the registration is complete, go to **Overview**.

1. Copy the **Application (client) ID** and store it in a temporary place. You'll need this in later steps.

## Add the redirect URL

1. In the Azure portal, go to **Authentication** and then select **Add a platform**.

1. Under **Platform configurations** select **Add a platform**, then select **Web**.

1. Under **Redirect URIs**, enter `https://token.botframework.com/.auth/web/redirect` and `https://europe.token.botframework.com/.auth/web/redirect`.

1. Under the **Implicit grant and hybrid flows** section, turn on both **ID tokens (used for implicit and hybrid flows)** and **Access tokens (used for implicit flows)**.

1. Select **Configure** to confirm your changes.

## Generate a client secret

1. In the Azure portal, go to **Certificates & Secrets**.

1. Under the **Client secrets** section, select **New client secret**.

1. (Optional) Enter a description. One will be provided if you leave it blank.

1. Select the expiry period. Select the shortest period that's relevant for the life of your bot.

1. Select **Add** to create the secret.

1. Store the secret's **Value** in a temporary place. You'll need it when you configure your bot's authentication.

> [!IMPORTANT]
> If you navigate away from the page, the secret's **Value** is obfuscated and you'll need to generate a new client secret.

## Configure manual authentication

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

[!INCLUDE[footer-include](includes/footer-banner.md)]
