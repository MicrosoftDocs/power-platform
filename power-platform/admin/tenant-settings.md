---
title: Tenant settings
description: Review and configure tenant-level settings linked from this page.
author: amiyapatr-zz
ms.topic: overview
ms.date: 11/20/2024
ms.author: ampatra
ms.reviewer: sericks
contributors:
  - marcelbf
ms.collection: 
    - bap-ai-copilot
ms.contributors:
- abhijp
---

# Tenant settings

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Use the Tenant settings page to review and manage tenant-level settings.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Settings** > **Tenant settings** in the left-side navigation pane.

The following settings apply to all environments within your tenant.

|Name  |Description  |
|---------|---------|
|[Copilot](/power-apps/maker/canvas-apps/ai-overview)     | Allow canvas app makers and admins to get AI-powered answers to how-to questions.        |
| Copilot feedback | When using Copilot in Power Apps, allow users to submit feedback to Microsoft. |
|[Weekly digest](managed-environment-usage-insights.md)*     | Manage more recipients for the weekly digest email for Managed Environments.        |
|[Canvas app insights](/power-apps/maker/canvas-apps/application-insights) | Allow canvas app users to collect insights for their app. |
|[Developer environment assignments](control-environment-creation.md)   | Control who can create and manage developer environments.  |
| Tenant capacity summary view | This setting controls who can view the tenant capacity summary page: either only tenant admins or both tenant and environment admins. |
|[Production environment assignments](control-environment-creation.md)   | Control who can create and manage production and sandbox environments.        |
|[Trial environment assignments](control-environment-creation.md)       | Control who can create and manage trial environments.        |
|[Add-on capacity assignments](capacity-add-on.md#control-who-can-allocate-add-on-capacity)    | Control who can allocate add-on capacity to an environment.        |
|[Analytics](tenant-level-analytics.md)   | Enable tenant-level analytics.        |
|[Customer Lockbox](about-lockbox.md#enable-the-lockbox-policy)*   | Enable the Customer Lockbox policy for Managed Environments.        |
|[Data sharing for Dynamics 365 Copilot and Power Platform Copilot AI Features](../transparency-note-copilot-data-sharing.md)   | Enable Microsoft to capture and human review inputs, outputs, telemetry from Dynamics 365 Copilot and Power Platform Copilot AI features to build, improve, and validate Microsoft's machine leaning models, features, services, and related systems.<br/>By default, this setting is disabled.       |
| [Environment routing (Preview)](default-environment-routing.md) | Allow Power Platform admins to automatically direct new or existing makers into their own personal developer environments. |
| Catalog Assignments  | This setting is reserved for future use. No enforcement is driven by this setting at the current time.       |
| Copilot feedback data | When using Copilot in Power Apps, allow users to share their prompts, questions, and requests with Microsoft. |
| Support requests visibility | Allows users, who already have access to the **Help + Support** page in the Power Platform admin center, to see support requests created by other users in the tenant.  |

*This setting applies only to Managed Environments.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
