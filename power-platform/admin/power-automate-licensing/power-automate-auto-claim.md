---
title: Auto-claim policies for Power Automate licenses (preview)
description: Learn how to assign Power Automate licenses through auto-claim policies.
author: kenseongtan
ms.topic: conceptual
ms.subservice: admin
ms.author: kenseongtan
ms.custom: bap-template
search.audienceType: 
 - admin
---

# Auto-claim policies for Power Automate licenses (preview)
As an administrator, you traditionally assign licenses to users _manually_. [Auto-claim for Power Automate licenses](/microsoft-365/commerce/licenses/manage-auto-claim-policies) enables administrators to easily establish policies within the Microsoft 365 admin center, much like they can for other Microsoft products and services. Once a policy is configured, any user in the organization who requires an individual Power Automate user license is automatically assigned a license.

You can create and manage these auto-claim policies in the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2259913).

## Auto-claim policies scope
The current scope of Power Automate license auto-claim policy applies to the following licenses:
- Power Automate premium plan
- Power Automate per user plan (legacy)

When the auto-claim policy is configured, The following scenarios will automatically assign a user licenses when the user lacks the required entitlement:


1. Power Automate per user plan
In the Power Automate Portal:
o	User triggers a premium cloud flow 
o	User saves a premium cloud flow
o	User turns on a premium cloud flow
o	User requests the Power Automate premium license (roadmap)

1. Power Automate premium	
In addition to the scenarios listed for Power Automate per user plan:

In the Power Automate Portal:
o	User triggers a premium cloud flow with Attended RPA
o	User saves a premium cloud flow with Attended RPA
o	User turns on a premium cloud flow with Attended RPA
o	User requests the Power Automate premium license (roadmap)

In the Power Automate for Desktop application
o	User selects ‘Go Premium’ (roadmap)
o	User has a self-assisted premium trial and is actively using RPA capabilities (roadmap)

## Create an auto-claim policy for Power Automate licenses
Use the following information to establish an auto-claim policy for Power Automate.

For more information on managing auto-claim policies in the Microsoft 365 admin center, go to [Manage auto-claim policies in the Microsoft 365 admin center](/microsoft-365/commerce/licenses/manage-auto-claim-policies).

### Who can create and manage auto-claim policies?
To create and manage auto-claim policies, you must have global admin privileges. For more information, go to [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

### Turn on the auto-claim policy feature
Before you can create an auto-claim policy, you must first turn on the feature in the Microsoft 365 admin center.  

1.	Go to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2259913).
1.	In the **Navigation menu**, select **Billing** > **Licenses**.
1.	Select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
1.	Click the **Turn on setting** button.

After you turn on the feature, you can create an auto-claim policy.

### Create an auto-claim policy for Power Automate
The [auto-claim policy](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab displays the policies that you created. You can view the policy's name, the associated app, the assigned product, the available licenses, and the policy's status. 

To create a new policy, complete the following steps:
1.	In the Microsoft 365 admin center, click **Billing** > **Licenses**.
1.	Click the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
1.	Click **Add a policy**.
1.	On the **Name this auto-claim policy** page, enter a name for the policy and click **Next**.
1.	On the **Set an auto-claim app and product** page, select the following in the dropdown list based on the license type: 
1.	On the Set an auto-claim app and product page, select the following in the dropdown list:

| License Type | Auto-claim app | Product assigned |
|--------------|----------------|------------------|
| Power Automate per user plan | Power Automate per User Plan | Power Automate per user plan |
| Power Automate premium | Power Automate RPA Attended | Power Automate Premium |

1.	On the **Select apps** page, select or clear the checkboxes for the apps to include or exclude with the license.	Click **Next**.
1.	On the **Review and finish** page, verify the new policy information, make any necessary changes, and click **Create policy**.

:::image type="content" source="../media/power-automate-licensing/auto-claim-policy.png" alt-text="Auto-claim policy configuration for Power AUtomate.":::
 

## View license assignment in auto-claim policy report
The auto-claim policy report shows all licenses assignment from the auto-claim policy in the last 90 days.

To view the auto-claim policy report:
1.	In the Microsoft 365 admin center, click **Billing** > **Licenses**, then select the **Auto-claim policy** tab
1.	Select **View report**. The Auto-claim policy report page lists all licenses assigned from each policy in the last 90 days. By default, the page shows the past 90 days.
1.	To change the time period shown, select the **Past 30 days** drop-down list. You can view reports for the past 1, 7, 30, and 90 days.

## Limitations
This section presents all the limitation of the auto-claim policy for Power Automate.

### Auto-claim policy may take up to two hours to activate after creation
When the Power Automate license auto-claim policy is created, it may take up to two hours before activation for the configured policy to be propagated across the relevant Microsoft services.

### Successful license auto-claim not immediately reflected in Power Automate Portal
When a Power Automate user license is successfully auto-claimed, it may take some minutes to be reflected in in the Power Automate Portal. During this time, Power Automate Portal may still indicate that the user does not have the auto-claimed license. However, this does not affect the premium capability that the user have access to.


