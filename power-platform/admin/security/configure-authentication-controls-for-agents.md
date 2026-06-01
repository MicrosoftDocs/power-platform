---
title: Configure authentication controls in Power Platform admin center (preview)
description: Configure agent authentication in Power Platform admin center to control sign-in methods, enforce security policies, and maintain secure access for your organization.
ms.subservice: admin
ms.topic: concept-article
ms.collection: bap-ai-copilot
author: mikerapid
ms.author: mobajemu
ms.reviewer: mobajemu
manager: rickcatalano
ms.date: 06/02/2026
---

# Configure agent authentication controls in Power Platform admin center (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Authentication for agents is an admin control in Power Platform admin center that lets admins govern which authentication methods users can choose when they configure an agent in Microsoft Copilot Studio. Use this control to enforce your organization's security policies and ensure agent authentication settings aligned with identity requirements.

For organizations that want to reduce exposure to anonymous access or unsupported external sign-in patterns, the authentication for agents admin control provides a centralized, environment-level control.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

This article shows you how to:

- Configure authentication settings for specific environments
- Understand how admin policies map to user options in Copilot Studio
- Choose the right authentication method for your organization's needs

To modify the agent authentication setting:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. On the sidebar, select **Security**, and then select **Identity and access**.

1. From the **Identity and access** menu, select **Authentication for agents**. A panel opens.

1. In the panel, select the environments or environment groups you want to configure.

1. Select **Set up** at the bottom of the panel.

1. On the next page, choose whether to require authentication for your agent. If you select the checkbox for **Require authentication**, more options appear:

    - **[No authentication](#no-authentication)**.
    
    - **[Require Microsoft authentication](#require-microsoft-authentication)**: User-created agents must require Microsoft Entra ID authentication in Microsoft Teams, SharePoint, Power Apps, or Microsoft 365 Copilot. By selecting this option, all other authentication options in Copilot Studio aren't available.
    
    - **[Require Entra authentication](#require-entra-authentication)**: User-created agents require either manual authentication or Microsoft authentication. By selecting this option, manual authentication with Generic OAuth 2 isn't supported.
    
    - **[Allow all supported authentication methods](#allow-all-supported-authentication-methods)**: User-created agents require either manual authentication or Microsoft authentication.

1. After you make your selection, select **Save** to apply the changes.

    If you change the authentication settings, users in managed environments receive a Copilot notification when their previous authentication method is no longer available. For example, a user-created agent might be set to **Authenticate manually** with **Microsoft Entra ID** while **Allow all supported authentication methods** is the admin policy. If you later change the environment policy to **Require Microsoft authentication**, the user's agent authentication setting updates after the page is refreshed, and disallowed options are no longer selectable. This behavior keeps existing agents aligned with current environment governance.

## Admin control model

The following table summarizes how admin settings map to the user experience:

| Admin setting                                                            | No authentication | Authenticate with Microsoft | Manual auth: Microsoft Entra ID | Manual auth: Generic OAuth 2 | Result in Copilot Studio                                                            |
| :----------------------------------------------------------------------- | :---------------- | :-------------------------- | :------------------------------ | :--------------------------- | :---------------------------------------------------------------------------------- |
| Require authentication = Off                                             | Enabled           | Enabled                     | Enabled                         | Enabled                      | Users can select any supported authentication type.                                 |
| Require authentication = On                                              | Disabled          | Enabled                     | Disabled                        | Disabled                     | Only Authenticate with Microsoft can be selected.                               |
| Require authentication = On + Require Entra authentication               | Disabled          | Enabled                     | Enabled                         | Disabled                     | Users can use Microsoft authentication or manual authentication with Entra ID only. |
| Require authentication = On + Allow all supported authentication methods | Disabled          | Enabled                     | Enabled                         | Enabled                      | Users can use all authenticated methods, but not anonymous access.                  |

### No authentication

When you [turn off](/microsoft-copilot-studio/configuration-end-user-authentication.md#no-authentication) Require authentication, users can configure any supported authentication type for their agents in Copilot Studio. Choose No authentication only when users must be able to configure public or anonymous experiences.

When you turn off Require authentication, all supported options are enabled, including anonymous access.

### Require authentication

When you turn on Require authentication, anonymous access is no longer allowed. The available user options depend on the admin choice you select. Choose this option along with the desired authentication method when your organization wants a more controlled sign-in model.

#### Require Microsoft authentication

If you select [Require Microsoft authentication](/microsoft-copilot-studio/configuration-end-user-authentication.md#authenticate-with-microsoft), only Authenticate with Microsoft is available for user-created agents. Choose this option when your organization wants the strictest user-facing experience and supports only Microsoft-based sign-in.

In this mode, Authenticate with Microsoft is enabled. This configuration blocks No authentication and manual authentication.

#### Require Entra authentication

If you select [Require Entra authentication](/microsoft-copilot-studio/configuration-end-user-authentication.md#authenticate-manually), users can use Microsoft authentication or manual authentication backed by Microsoft Entra ID. Choose this option if users must use Microsoft sign-in but still need manual configuration scenarios that depend on Microsoft Entra ID.

This configuration allows Authenticate with Microsoft and Manual authentication with Microsoft Entra ID. This configuration blocks No authentication and Manual authentication with Generic OAuth 2.

### Allow all supported authentication methods

If you select **Allow all supported authentication methods**, users can use all supported authenticated methods, but not anonymous access. Choose this option when authentication is required, but your organization wants to support both Microsoft Entra ID and Generic OAuth 2 in manual authentication scenarios.

This configuration allows Authenticate with Microsoft and Manual authentication with Microsoft Entra ID and Generic OAuth 2. This configuration blocks No authentication.