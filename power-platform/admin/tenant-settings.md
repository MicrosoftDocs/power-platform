---
title: Tenant settings
description: Review and configure tenant-level settings linked from this page.
author: amiyapatr-zz
ms.topic: overview
ms.date: 6/30/2025
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

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the navigation pane, select **Manage**.

1. In the **Manage** pane, select **Tenant settings**.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Settings** > **Tenant settings** in the left-side navigation pane.

---

The following settings apply to all environments within your tenant.

|Name  |Description  |
|---------|---------|
|Additional Copilot feedback | **Request:** *Please review this description* </br> When using Copilot and generative AI capabilities in the Power Platform, allow your users to share extra feedback data with Microsoft.|
|AI Builder credits |**Request:** *Please review this description* </br> Allow environments without assigned AI Builder credits to use tenant unassigned credits and perform AI Builder actions.|
|Auto-claim policies for Power Apps|**Request:** *Please review this description* </br> Control where license the auto-claim policies for Power Apps should be applied.|
|Auto-claim policies for Power Automate|**Request:** *Please review this description* </br> Control where the license auto-claim policies for Power Automate should be applied.|
|[Copilot help assistance in Power Automate via Bing](/power-automate/desktop-flows/copilot-in-power-automate-for-desktop)| **Request:** *Please review this description* </br> Allow the Copilot-enhanced help feature within Power Automate to enhance answers on product documentation through Bing Search.|
|[Copilot in Power Apps (preview)](/power-apps/maker/canvas-apps/ai-overview)|**Request:** *Please review this description* </br> Enable Copilot preview features for people who make apps. |
|[Copilot Studio authors (preview)](/microsoft-copilot-studio/billing-licensing)|**Request:** *Please review this description* </br> Select a security group that might use Copilot Studio.|
|[Desktop flow actions in DLP](/power-automate/prevent-data-loss#data-loss-prevention-for-desktop-flows-preview)|**Request:** *Please review this description* </br> When enabled, desktop flow action groups are visible when creating or editing DLP policies.|
|[Power Automate flow run resubmission](/power-automate/how-tos-bulk-resubmit#resubmit-flow-runs)|**Request:** *Please review this description* </br> Allow users to resubmit previous flow runs initiated by other users. |
|[Product Feedback](/power-platform/admin/list-tenantsettings)|**Request:** *Please review this description* </br> Provides the ability to manage feedback prompts within Power Platform products. |
|[Publish Copilots with AI features](/microsoft-copilot-studio/security-and-governance)|**Request:** *Please review this description* </br> Allow Copilot authors to publish from Copilot Studio when AI features are enabled.|
|Sales Research Agent (Preview)|**Request:** *Please review this description* </br> Select who can access Sales Research Agents.|
|[Support Bing search solutions](/power-platform/admin/tenant-settings)|**Request:** *Please review this description* </br> When enabled, use Bing search to provide self-help solutions. |
|Tenant licensing summary view| **Request:** *Please review this description* </br> Control who can view the tenant licensing summary.|
|Basic Copilot feedback | When using Copilot in Power Apps, allow users to submit feedback to Microsoft. |
|[Weekly digest](managed-environment-usage-insights.md)*     | Manage more recipients for the weekly digest email for Managed Environments.        |
|[Canvas app insights](/power-apps/maker/canvas-apps/application-insights) | Allow canvas app users to collect insights for their app. |
|[Developer environment assignments](control-environment-creation.md)   | Control who can create and manage developer environments.  |
| Tenant capacity summary view | This setting controls who can view the tenant capacity summary page: either only tenant admins or both tenant and environment admins. |
|[Production environment assignments](control-environment-creation.md)   | Control who can create and manage production and sandbox environments.        |
|[Trial environment assignments](control-environment-creation.md)       | Control who can create and manage trial environments.        |
|[Add-on capacity assignments](capacity-add-on.md#control-who-can-allocate-add-on-capacity)    | Control who can allocate add-on capacity to an environment.        |
|[Analytics](tenant-level-analytics.md)   | Enable tenant-level analytics.        |
|[Customer Lockbox](about-lockbox.md#enable-the-lockbox-policy)*   | Enable the Customer Lockbox policy for Managed Environments.        |
| [Environment routing](default-environment-routing.md)* | Allow Power Platform admins to automatically direct new or existing makers into their own personal developer environments. |
| Catalog Assignments  | This setting is reserved for future use. Currently, this setting doesn't drive any enforcement.       |
| Support requests visibility | Allows users, who already have access to the **Help + Support** page in the Power Platform admin center, to see support requests created by other users in the tenant.  |

*This setting applies only to Managed Environments.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
