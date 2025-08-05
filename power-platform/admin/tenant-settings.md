---
title: Tenant settings
description: Review and configure tenant-level settings linked from this page.
author: amiyapatr-zz
ms.topic: overview
ms.date: 7/28/2025
ms.update-cycle: 180-days
ms.author: ampatra
ms.reviewer: sericks
contributors:
  - marcelbf
  - sericks007
  - syalandur24
ms.collection: 
  - bap-ai-copilot
ms.contributors:
  - abhijp
  - sericks
  - syalandur    
---

# Tenant settings

Use the **Tenant settings** page to review and manage tenant-level settings. 

You need to have one of the following user roles to access the **Tenant settings** page:

- Global Administrator

- Power Platform Administrator

- Dynamics 365 Administrator

For more information on the user roles, see [Microsoft Entra built-in roles](/entra/identity/role-based-access-control/permissions-reference).

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the navigation pane, select **Manage**.

1. In the **Manage** pane, select **Tenant settings**.

> [!NOTE]
> You can also select the **Settings** gear icon on the top menu of the Power Platform admin center and then select **Power Platform settings** to access the **Tenant settings** page.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Settings** > **Tenant settings** in the left-side navigation pane.

---

The following settings apply to all environments within your tenant.

|Name  |Description  |
|---------|---------|
|[Add-on capacity assignments](capacity-add-on.md#control-who-can-allocate-add-on-capacity)    | Controls who can allocate add-on capacity to an environment.        |
|Additional Copilot feedback | When using Copilot and generative AI capabilities in the Power Platform, allows users to share extra feedback data with Microsoft.|
|AI Builder credits |Allows environments without assigned AI Builder credits to use tenant unassigned credits and perform AI Builder actions.|
|[Analytics](tenant-level-analytics.md)   | Enables tenant-level analytics.        |
|Auto-claim policies for Power Apps| Controls where license the auto-claim policies for Power Apps should be applied.|
|Auto-claim policies for Power Automate|Controls where the license auto-claim policies for Power Automate should be applied.|
|Basic Copilot feedback | When using Copilot in Power Apps, allows users to submit feedback to Microsoft. |
|[Canvas app insights](/power-apps/maker/canvas-apps/application-insights) | Allows canvas app users to collect insights for their app. |
| Catalog Assignments  | Controls who can create and manage assignments.     |
|[Copilot help assistance in Power Automate via Bing](/power-automate/desktop-flows/copilot-in-power-automate-for-desktop)| Allows the Copilot-enhanced help feature within Power Automate to enhance answers on product documentation through Bing Search.|
|[Copilot in Power Apps (preview)](/power-apps/maker/canvas-apps/ai-overview)|Enables Copilot preview features for users who make apps. |
|[Copilot Studio authors (preview)](/microsoft-copilot-studio/billing-licensing)| Enables the selection of a security group that might use Copilot Studio.|
|[Customer Lockbox](about-lockbox.md#enable-the-lockbox-policy)*   | Enables the Customer Lockbox policy for Managed Environments.        |
|[Desktop flow actions in DLP](/power-automate/prevent-data-loss#data-loss-prevention-for-desktop-flows-preview)| When enabled, desktop flow action groups are visible when creating or editing DLP policies.|
|[Developer environment assignments](control-environment-creation.md)   | Controls who can create and manage developer environments.  |
|[Environment routing](default-environment-routing.md)* | Allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments. |
|[Power Automate flow run resubmission](/power-automate/how-tos-bulk-resubmit#resubmit-flow-runs)| Allows users to resubmit previous flow runs initiated by other users. |
|[Product Feedback](/power-platform/admin/list-tenantsettings)| Provides the ability to manage feedback prompts within Power Platform products. |
|[Production environment assignments](control-environment-creation.md)   | Controls who can create and manage production and sandbox environments.|
|[Publish Copilots with AI features](/microsoft-copilot-studio/security-and-governance)| Allows Copilot authors to publish from Copilot Studio when AI features are enabled.|
|Sales Research Agent (Preview)| Selects who can access Sales Research Agents.|
|[Support Bing search solutions](/power-platform/admin/tenant-settings)| When enabled, Bing search is used to provide self-help solutions. |
|Support requests visibility | Allows users, who already have access to the **Support** page in the Power Platform admin center, to see support requests created by other users in the tenant.  |
|Tenant capacity summary view | Controls who can view the tenant capacity summary page: either only tenant admins or both tenant and environment admins. |
|Tenant licensing summary view| Controls who can view the tenant licensing summary.|
|[Trial environment assignments](control-environment-creation.md)       | Controls who can create and manage trial environments.|
|[Weekly digest](managed-environment-usage-insights.md)*     | Manages more recipients for the weekly digest email for Managed Environments.  |
<!--
    |[Data sharing for Dynamics 365 Copilot and Power Platform Copilot AI Features](../transparency-note-copilot-data-sharing.md) | Enables Microsoft to capture and human review inputs, outputs, telemetry from Dynamics 365 Copilot and Power Platform Copilot AI features to build, improve, and validate Microsoft's machine leaning models, features, services, and related systems. <br/> By default, this setting is disabled. |
    | Copilot feedback data | When using Copilot in Power Apps, allows users to share their prompts, questions, and requests with Microsoft. |
--/>

*This setting applies only to Managed Environments.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
