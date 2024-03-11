---
title: Auto-claim policies for Power Automate licenses
description: Automatically assign Power Automate licenses to users with auto-claim policies in the Microsoft 365 admin center.
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
# Auto-claim policies for Power Automate licenses

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

As an administrator, you traditionally assign licenses to users _manually_. [Auto-claim for Power Automate licenses](/microsoft-365/commerce/licenses/manage-auto-claim-policies) allows administrators to easily set-up policies within the Microsoft 365 admin center, similar to other Microsoft products and services. Once a policy is configured, any user in the organization who requires an individual Power Automate user license is automatically assigned a license.

You can create and manage these auto-claim policies in the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2259913).

## Auto-claim policies scope

The current scope of Power Automate license auto-claim policy applies to the following licenses:

- Power Automate premium plan
- Power Automate per user plan (legacy)

When the auto-claim policy is configured, the following scenarios automatically assign a license to a user when the user lacks the required entitlement.

### Power Automate per user plan

In the Power Automate portal:

- User triggers / saves / turnes on a premium cloud flow (or standard flow for managed environments)
- User requests the Power Automate per user license

### Power Automate premium

In addition to the scenarios listed for the [Power Automate per user plan](#power-automate-per-user-plan), users perform these tasks.

In the Power Automate portal:

- User triggers / saves / turns on a premium cloud flow with attended RPA
- User requests the Power Automate premium license

In the Power Automate for desktop application:

- User selects **Go Premium** (roadmap)
- User has a self-assisted premium trial and is actively using RPA capabilities (roadmap)

## Create an auto-claim policy for Power Automate licenses

Use the information described here to set up an auto-claim policy for Power Automate.

For more information on managing auto-claim policies in the Microsoft 365 admin center, go to [Manage auto-claim policies in the Microsoft 365 admin center](/microsoft-365/commerce/licenses/manage-auto-claim-policies).

### Who can create and manage auto-claim policies?

You must have Microsoft 365 global admin privileges to create and manage auto-claim policies. More information: [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

### Turn on the auto-claim policy feature

You must first enable the auto-claim policy feature in the Microsoft 365 admin center before creating an auto-claim policy.

1. Go to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2259913).
1. In the **Navigation menu**, select **Billing** > **Licenses**.
1. Select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/auto-claimpolicies) tab.
1. Select **Turn on setting**.

After you turn on the feature, you can create an auto-claim policy.

### Create an auto-claim policy for Power Automate

The [auto-claim policy](https://admin.microsoft.com/adminportal/home?#/licenses/auto-claimpolicies) tab displays the policies you created. You can view the policy's name, the associated app, the assigned product, the available licenses, and the policy's status.

To create a new policy, complete the following steps:

1. In the Microsoft 365 admin center, select **Billing** > **Licenses**.
1. Select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/auto-claimpolicies) tab, and then select **Add a policy**.
1. On the **Name this auto-claim policy** page, enter a name for the policy, and then select **Next**.
1. On the **Set an auto-claim app and product** page, select from the following plans displayed in the dropdown list based on your license type:

   | License Type | Auto-claim app | Product assigned |
   |--------------|----------------|------------------|
   | Power Automate per user plan | Power Automate per User Plan | Power Automate per user plan |
   | Power Automate premium | Power Automate RPA Attended | Power Automate Premium |

1. On the **Select apps** page, select or clear the checkboxes for the apps to include or exclude with the license.	Select **Next**.
1. On the **Review and finish** page, verify the new policy information, make any necessary changes, and then select **Create policy**.

The policy details are displayed.
:::image type="content" source="../media/power-automate-licensing/auto-claim-policy.png" alt-text="Auto-claim policy configuration for Power Automate.":::

## View license assignment in auto-claim policy report

The auto-claim policy report displays all license assignments from the auto-claim policy within the last 90 days.

To view the auto-claim policy report:

1. In the Microsoft 365 admin center, select **Billing** > **Licenses**, and then select the **Auto-claim policy** tab.
1. Select **View report**. The Auto-claim policy report page lists all licenses assigned from each policy in the last number of days. By default, the page shows the past 90 days.

To change the time period shown, select the **Past 30 days** drop-down list. You can view reports for the past 1, 7, 30, and 90 days.

## Limitations

This section presents all the limitations of the auto-claim policy for Power Automate.

### Auto-claim policy might take up to two hours to activate after creation

After creating the Power Automate license auto-claim policy, it might take up to two hours for the configured policy to be activated and propagated across the relevant Microsoft services.

### Successful license auto-claim isn't immediately reflected in Power Automate portal

When a Power Automate user license is successfully auto-claimed, it might take a few minutes for a successfully auto-claimed Power Automate user license to be reflected in the Power Automate portal. During this time, the Power Automate portal might still indicate that the user doesn't have the auto-claimed license. However, this doesn't affect the premium capabilities that the user has access to.

## See also

[Types of Power Automate licenses](types.md)

[Frequently asked questions about Power Automate licensing](faqs.md)
