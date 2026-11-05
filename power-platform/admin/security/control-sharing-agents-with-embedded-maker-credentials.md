---
title: Control sharing agents with embedded maker credentials (preview)
description: Learn how to control whether makers can share agents that include their own credentials.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/04/2026
author: akadrno
ms.author: kauguillard
ms.contributors:
  - vibhutinair
ms.reviewer: vibhutinair
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Control sharing agents with embedded maker credentials (preview)

[!INCLUDE [cc-preview-features-top-note](../../includes/cc-preview-features-top-note.md)]

Administrators can prevent makers from sharing or publishing Copilot Studio agents that expose a connection with maker-provided credentials to end users when the connection isn't safe to share. The **Sharing agents with embedded maker credentials** setting controls whether makers can share agents that include their own credentials. It lets Copilot Studio evaluate the connections used by an agent and can prevent the agent from being shared or published when a connection violates the organization's connection-sharing policy.

You can configure the setting for an individual environment or an environment group.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Security**, and then select **Threat detection**.
1. Select **Sharing agent with embedded maker credentials**. A panel opens.
1. In the panel, configure the setting for the following:
   - **Environment groups**: In the **Environment groups** tab, select the environment group for which you want to configure the setting.
   - **Environments**: In the **Environments** tab, select the environment for which you want to configure the setting.
1. Select **Set up**.
1. Select the following options to allow or block sharing agents with embedded maker credentials:
   - **Don't let makers share agents with their own credentials embedded (recommended)**
   - **Let makers share agents with their own credentials embedded**
1. Select **Save**.

## Related information

- [Sharing agents with embedded maker credentials (preview)](/power-platform/admin/settings-features#sharing-agents-with-embedded-maker-credentials-preview) - Environment-level setting
- [Control sharing of agents that use maker-provided credentials](/microsoft-copilot-studio/admin-sharing-controls-limits#control-sharing-of-agents-that-use-maker-provided-credentials) in Copilot Studio
