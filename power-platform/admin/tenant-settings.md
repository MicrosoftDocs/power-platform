---
title: Tenant settings
description: Review and configure tenant-level settings linked from this page.
author: amiyapatr-zz
ms.topic: overview
ms.date: 10/30/2026
ms.update-cycle: 180-days
ms.author: ampatra
ms.reviewer: ellenwehrle
ai-usage: ai-assisted
contributors:
  - kenseongtan 
  - marcelbf
ms.collection: 
  - bap-ai-copilot
ms.contributors:
  - cwanja-msft
  - abhijp  
---

# Tenant settings

Use the **Tenant settings** page to review and manage tenant-level settings.

You need to have one of the following user roles to access the **Tenant settings** page:

- Power Platform Administrator.
- Dynamics 365 Administrator.

For more information on the user roles, see [Microsoft Entra built-in roles](/entra/identity/role-based-access-control/permissions-reference).

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Tenant settings**.

> [!NOTE]
> You can also select the **Settings** gear icon on the top menu of the Power Platform admin center and then select **Power Platform settings** to access the **Tenant settings** page.

The following settings are configured at the tenant level. The **Managed environments only** column indicates whether a setting applies only to managed environments. **No** means the setting isn't limited to managed environments.

| Name | Description | Managed environments only |
|---------|---------|---------|
| [Add-on capacity assignments](capacity-add-on.md#control-who-can-allocate-add-on-capacity) | Controls who can allocate add-on capacity to an environment. | No |
| Additional Copilot feedback | When using Copilot in Power Apps, allows users to share their prompts, questions, and requests with Microsoft. | No |
| [Agentic coauthoring in Power Apps using GitHub (preview)](/power-apps/maker/canvas-apps/canvas-authoring-agent#enable-github-account-connections) | Controls whether makers can connect their GitHub accounts to use the authoring agent in Power Apps canvas studio. | No |
| AI Builder credits | Allows environments without assigned AI Builder credits to use unassigned tenant credits to perform AI Builder actions. | No |
| [Analytics](tenant-level-analytics.md) | Enables tenant-level analytics. | No |
| [Auto-claim policies for Power Apps](auto-claim-licensing.md) | Controls whether license auto-claim policies for Power Apps apply to all environments or only managed environments. | No |
| [Auto-claim policies for Power Automate](power-automate-licensing/power-automate-auto-claim.md) | Controls whether license auto-claim policies for Power Automate apply to all environments or only managed environments. | No |
| Basic Copilot Feedback | When using Copilot in Power Apps, allows users to submit feedback to Microsoft. | No |
| [Canvas app insights](/power-apps/maker/canvas-apps/application-insights) | Allows canvas app users to collect insights for their app. | No |
| Catalog Assignments | Controls who can create and manage assignments. | No |
| Copilot Credits Overage Notification | Specifies additional recipients for Copilot Credits overage notifications. | No |
| [Copilot help assistance in Power Automate via Bing](/power-automate/desktop-flows/copilot-in-power-automate-for-desktop) | Allows the Copilot-enhanced help feature within Power Automate to enhance answers on product documentation through Bing Search. | No |
| [Copilot in Power Apps (preview)](/power-apps/maker/canvas-apps/ai-overview) | Enables Copilot preview features for users who make apps. | No |
| [Copilot Studio authors](/microsoft-copilot-studio/billing-licensing) | Enables the selection of a security group that might use Copilot Studio. | No |
| Copilot Studio pay-as-you-go users | Controls who can use pay-as-you-go billing to create items in Copilot Studio. | No |
| [Customer Lockbox](about-lockbox.md#enable-the-lockbox-policy) | Enables the Customer Lockbox policy for managed environments. | Yes |
| [Data sharing for Dynamics 365 Copilot and Power Platform Copilot AI Features](../faqs-copilot-data-sharing.md) | Allows Microsoft to capture and manually review inputs, outputs, and telemetry from Dynamics 365 Copilot and Power Platform Copilot AI features to build, improve, and validate Microsoft's machine learning models, features, services, and related systems. By default, this setting is disabled. | No |
| [Desktop flow actions in DLP](/power-automate/prevent-data-loss#data-loss-prevention-for-desktop-flows-preview) | When enabled, desktop flow action groups are visible when creating or editing data policies. | No |
| [Environment assignments: Developer](control-environment-creation.md) | Controls who can create and manage developer environments. | No |
| [Environment assignments: Production](control-environment-creation.md) | Controls who can create and manage production and sandbox environments. | No |
| [Environment assignments: Trial](control-environment-creation.md) | Controls who can create and manage trial environments. | No |
| [Environment retention policies](automatic-environment-cleanup.md#inactivity-based-cleanup) | Shows how long inactive environments are kept before they're automatically cleaned up. | No |
| [Environment routing: Personal development](default-environment-routing.md) | Directs makers to personal developer environments based on defined routing rules. | Yes |
| [Hosted browser in computer use](/microsoft-copilot-studio/administer-computer-use#disable-hosted-browser) | Controls whether users can use the hosted browser for computer use in Copilot Studio. | No |
| [Power Automate flow run resubmission](/power-automate/how-tos-bulk-resubmit#resubmit-flow-runs-initiated-by-instant-triggers) | Allows users to resubmit other users' flow runs initiated by instant triggers. Resubmission might include data used within Power Automate. Users can always resubmit their own runs initiated by instant triggers. | No |
| [Product Feedback](list-tenantsettings.md) | Provides the ability to manage feedback prompts within Power Platform and Dynamics 365 products. | No |
| [Publish Copilots with AI features](/microsoft-copilot-studio/security-and-governance) | Allows Copilot authors to publish from Copilot Studio when AI features are enabled. | No |
| Sales Research Agent (preview) | Selects who can access Sales Research Agents. | No |
| Support Bing search solutions | When enabled, Bing search is used to provide self-help solutions. | No |
| Support requests visibility | Allows users who already have access to the **Support** page in the Power Platform admin center to see support requests created by other users in the tenant. | No |
| Tenant capacity summary view | Controls who can view the tenant capacity summary page: either only tenant admins or both tenant and environment admins. | No |
| Tenant licensing summary view | Controls who can view the tenant licensing summary. | No |
| [Weekly digest](managed-environment-usage-insights.md) | Manages additional recipients for the weekly digest email for managed environments. | Yes |
