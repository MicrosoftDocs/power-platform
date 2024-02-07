---
title: Autoclaim policies for Power Automate licenses
description: Automatically assign Power Automate licenses to users with autoclaim policies in the Microsoft 365 admin center.
author: kenseongtan
ms.topic: conceptual
ms.subservice: admin
ms.author: kenseongtan
ms.date: 02/12/2024
search.audienceType:
  - admin
ms.custom:
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:02/07/2024
---

# Autoclaim policies for Power Automate licenses (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

As an administrator, you traditionally assign licenses to users _manually_. [Autoclaim for Power Automate licenses](/microsoft-365/commerce/licenses/manage-auto-claim-policies) allows administrators to easily set-up policies within the Microsoft 365 admin center, similar to other Microsoft products and services. Once a policy is configured, any user in the organization who requires an individual Power Automate user license is automatically assigned a license.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

You can create and manage these autoclaim policies in the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2259913).

## Autoclaim policies scope

The current scope of Power Automate license autoclaim policy applies to the following licenses:

- Power Automate premium plan
- Power Automate per user plan (legacy)

When the autoclaim policy is configured, the following scenarios automatically assign a license to a user when the user lacks the required entitlement.

### Power Automate per user plan

In the Power Automate portal:

- User triggers a premium cloud flow
- User saves a premium cloud flow
- User turns on a premium cloud flow
- User requests the Power Automate premium license (roadmap)

### Power Automate premium

In addition to the scenarios listed for the [Power Automate per user plan](#power-automate-per-user-plan), users perform these tasks.

In the Power Automate portal:

- User triggers a premium cloud flow with attended RPA
- User saves a premium cloud flow with attended RPA
- User turns on a premium cloud flow with attended RPA
- User requests the Power Automate premium license (roadmap)

In the Power Automate for desktop application:

- User selects **Go Premium** (roadmap)
- User has a self-assisted premium trial and is actively using RPA capabilities (roadmap)

## Create an autoclaim policy for Power Automate licenses

Use the information described here to set up an autoclaim policy for Power Automate.

For more information on managing autoclaim policies in the Microsoft 365 admin center, go to [Manage autoclaim policies in the Microsoft 365 admin center](/microsoft-365/commerce/licenses/manage-auto-claim-policies).

### Who can create and manage autoclaim policies?

You must have Microsoft 365 global admin privileges to create and manage autoclaim policies. More information: [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

### Turn on the autoclaim policy feature

You must first enable the autoclaim policy feature in the Microsoft 365 admin center before creating an autoclaim policy.

1. Go to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2259913).
1. In the **Navigation menu**, select **Billing** > **Licenses**.
1. Select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
1. Select **Turn on setting**.

After you turn on the feature, you can create an autoclaim policy.

### Create an autoclaim policy for Power Automate

The [autoclaim policy](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab displays the policies you created. You can view the policy's name, the associated app, the assigned product, the available licenses, and the policy's status.

To create a new policy, complete the following steps:

1. In the Microsoft 365 admin center, select **Billing** > **Licenses**.
1. Select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab, and then select **Add a policy**.
1. On the **Name this auto-claim policy** page, enter a name for the policy, and then select **Next**.
1. On the **Set an auto-claim app and product** page, select from the following plans displayed in the dropdown list based on your license type:

   | License Type | Autoclaim app | Product assigned |
   |--------------|----------------|------------------|
   | Power Automate per user plan | Power Automate per User Plan | Power Automate per user plan |
   | Power Automate premium | Power Automate RPA Attended | Power Automate Premium |

1. On the **Select apps** page, select or clear the checkboxes for the apps to include or exclude with the license.	Select **Next**.
1. On the **Review and finish** page, verify the new policy information, make any necessary changes, and then select **Create policy**.

The policy details are displayed.
:::image type="content" source="../media/power-automate-licensing/auto-claim-policy.png" alt-text="Autoclaim policy configuration for Power Automate.":::

## View license assignment in autoclaim policy report

The autoclaim policy report displays all license assignments from the autoclaim policy within the last 90 days.

To view the autoclaim policy report:

1. In the Microsoft 365 admin center, select **Billing** > **Licenses**, and then select the **Auto-claim policy** tab.
1. Select **View report**. The Autoclaim policy report page lists all licenses assigned from each policy in the last number of days. By default, the page shows the past 90 days.

To change the time period shown, select the **Past 30 days** drop-down list. You can view reports for the past 1, 7, 30, and 90 days.

## Limitations

This section presents all the limitations of the autoclaim policy for Power Automate.

### Autoclaim policy might take up to two hours to activate after creation

After creating the Power Automate license autoclaim policy, it might take up to two hours for the configured policy to be activated and propagated across the relevant Microsoft services.

### Successful license autoclaim isn't immediately reflected in Power Automate portal

When a Power Automate user license is successfully autoclaimed, it might take a few minutes for a successfully autoclaimed Power Automate user license to be reflected in the Power Automate portal. During this time, the Power Automate portal might still indicate that the user doesn't have the autoclaimed license. However, this doesn't affect the premium capabilities that the user has access to.

## See also

[Types of Power Automate licenses](types.md)

[Frequently asked questions about Power Automate licensing](faqs.md)