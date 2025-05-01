---
title: Use the Power Platform Environment Settings app
description: Learn how to use the Power Platform Environment Settings app.
author: yingchin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/03/2025
ms.subservice: admin
ms.author: yingchin
search.audienceType: 
  - admin
---
# Use the Power Platform Environment Settings app

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The Power Platform Environment Settings app provides a modern, performant, accessible, secure, and extensible management experience. This app is generally available to the public, replacing the legacy advanced settings experience to provide a unified experience for system administrators to create and manage their environment-wide settings.

> [!IMPORTANT]
> By default, the Power Platform Environment Settings app requires a system administrator or system customizer role to access. A system administrator can grant additional user roles to access this app. Learn more about sharing an app in [Share a model-driven app](/power-apps/maker/model-driven-apps/share-model-driven-app).

Any existing extensions created by system administrators to extend the Advanced settings site map are preserved and shown in the Power Platform Environment Settings app.

Existing Advanced Settings links in the Power Platform are redirected to the Power Platform Environment Settings app.

:::image type="content" source="media/environment-settings-app/environment-settings-app.png" alt-text="Screenshot of the Power Platform Environment Settings app.":::

## Turn off the Power Platform Environment Settings app

To turn off the Power Platform Environment Settings app for an environment, follow these steps:

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage**, select **Environments**, and then select an environment.
1. Select **Settings**.
1. Expand **Product**, and then select **Features**.
1. Set the **Advanced Settings redirection** toggle to **Off**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Environments** and select an environment.
1. Select **Settings**.
1. Expand **Product**, and then select **Features**.
1. Set the **Advanced Settings redirection** toggle to **Off**.

---
