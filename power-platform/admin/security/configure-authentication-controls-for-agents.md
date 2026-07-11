---
title: Configure authentication for agents (preview)
description: Configure agent authentication in the Power Platform admin center to control sign-in methods, enforce security policies, and maintain secure access for your organization.
ms.subservice: admin
ms.topic: concept-article
ms.collection: bap-ai-copilot
author: mikerapid
ms.author: mobajemu
ms.reviewer: mkaur
ms.date: 06/11/2026

---

# Configure authentication for agents (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

**Authentication for agents** is an admin control in the Power Platform admin center that lets admins govern which authentication methods users can choose when they configure an agent in Microsoft Copilot Studio. Use this control to enforce your organization's security policies and ensure agent authentication settings align with identity requirements.

For organizations that want to reduce exposure to anonymous access or non-compliant authentication patterns, the **Authentication for agents** admin control provides a centralized, environment-level control.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Configure authentication for agents in specific environments

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the navigation pane, select **Security**.

1. In the **Security** pane, select **Identity and access**. The **Identity and access management** page appears.

1. Select **Authentication for agents**. The **Authentication for agents (preview)** pane appears.

1. Select the environment group or environment that you want to configure. Select **Set up**. 
   
1. Choose one of the following authentication options for your agent:

    - **[No authentication (Publicly available)](#no-authentication)**: Authentication isn't required for agents.
    
    - **[Require Microsoft authentication](#require-microsoft-authentication)**: User-created agents must require Microsoft Entra ID authentication in Microsoft Teams, SharePoint, Power Apps, or Microsoft 365 Copilot. When you select this option, all other authentication options in Copilot Studio aren't available.
    
    - **[Require Entra authentication](#require-entra-authentication)**: User-created agents require either manual authentication or Microsoft authentication. When you select this option, manual authentication with Generic OAuth 2 isn't supported.
    
    - **[Allow all supported authentication methods](#allow-all-supported-authentication-methods)**: User-created agents support either Microsoft or manual authentication. When you select this option, no authentication is blocked.

1. Select **Save** to apply the changes.

    If you change the authentication settings, users in managed environments receive a notification in Copilot Studio when their previous authentication method is no longer available. For example, a user-created agent might be set to **Authenticate manually** with **Microsoft Entra ID**, while **Allow all supported authentication methods** is the admin policy. If you later change the environment policy to **Require Microsoft authentication**, the user's Copilot agent authentication setting updates after the page is refreshed, and disallowed options are no longer selectable. This behavior keeps existing agents aligned with current environment governance.
    
    If the admin no longer allows the authentication setting for an already published agent, the agent is blocked from further publishing updates and won't respond to users until its authentication settings meet the admin's requirements.

## How admin settings map to user options in Copilot Studio

### No authentication

When you select [**No authentication**](/microsoft-copilot-studio/configuration-end-user-authentication#no-authentication), users can configure any supported authentication type for their agents in Copilot Studio, including anonymous access. Choose **No authentication** only when users must be able to configure public or anonymous experiences.

### Require Microsoft authentication

When you select [**Require Microsoft authentication**](/microsoft-copilot-studio/configuration-end-user-authentication#authenticate-with-microsoft), only **Authenticate with Microsoft** is available for user-created agents in Copilot Studio. This configuration blocks no authentication, manual authentication, and anonymous access. Choose this option when your organization wants the strictest user-facing experience and supports only Microsoft-based sign-in.

### Require Entra authentication

When you select [**Require Entra authentication**](/microsoft-copilot-studio/configuration-end-user-authentication#authenticate-manually), user-created agents can be configured to use Microsoft authentication or manual authentication with Microsoft Entra ID in Copilot Studio. This configuration blocks no authentication, manual authentication with Generic OAuth 2, and anonymous access. Choose this option if users must use Microsoft sign-in, but still need manual configuration scenarios that depend on Microsoft Entra ID.

### Allow all supported authentication methods

When you select **Allow all supported authentication methods**, users can configure their agents to support all authentication methods (authenticate with Microsoft, manual authentication with Microsoft Entra ID, and manual authentication with Generic OAuth 2). This configuration blocks no authentication and anonymous access. Choose this option when authentication is required, but your organization wants to support both Microsoft Entra ID and Generic OAuth 2 in manual authentication scenarios.

