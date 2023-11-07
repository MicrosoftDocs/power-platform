---
title: Auto-claim for Power Apps licenses
description: Learn how to assign Power Apps licenses through auto-claim functionality.
author: amiyapatr-zz
ms.date: 11/07/2023
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: ampatra
ms.custom: bap-template
search.audienceType: 
 - admin
---

# Auto-claim for Power Apps licenses

In the role of an administrator, you traditionally assign licenses to users manually. [Auto-claim for Power Apps licenses](/microsoft-365/commerce/licenses/manage-auto-claim-policies?view=o365-worldwide&WT.mc_id=365AdminCSH_inproduct#auto-claim-policies-for-microsoft-power-apps&preserve-view=true) enables administrators to easily establish policies within the Microsoft 365 admin center, much like they can for other Microsoft products and services. Once the policy is configured, any user in the organization who requires an individual Power Apps license is automatically granted one under the following circumstances:

- If a user lacks a standalone Power Apps license and launches an app that demands a premium license, the system automatically assigns a Power Apps per user license to that user.
- If a user without a standalone Power Apps license launches an app within a Managed environment, they are automatically granted a Power Apps per user license.
- 
You can create and manage these auto-claim policies in the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339).

## Steps for creating an auto-claim policy for Power Apps

Here are the steps to enable an auto-claim policy for Power Apps:

For more information on managing auto-claim policies in the Microsoft 365 admin center, visit [Manage auto-claim policies in the Microsoft 365 admin center](/microsoft-365/commerce/licenses/manage-auto-claim-policies?view=o365-worldwide&preserve-view=true).

## Who can create and manage auto-claim policies?
To create and manage auto-claim policies, you must have Global admin privileges. For more information, visit [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide).

## Enabling the Auto-Claim Policy Feature
Before you can use the feature, you must first turn it on in the Microsoft 365 admin center. After you turn on the feature, you can create an auto-claim policy. Below are the steps 

1.	Go to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339).
2.	In the **Navigation menu**, go to the **Billing** > **Licenses** page, then select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
3.	In the center of the page, select the **Turn on setting** button.

## Creating an auto-claim policy for Power Apps
The [Auto-claim policy](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab displays the policies you've created. Here, you can view the policy's name, the associated app, the assigned product, the available licenses, and the policy's status. To create a new policy, follow these steps.

1.	On the admin center, go to the **Billing** > **Licenses** page, then select the [**Auto-claim policy**](https://admin.microsoft.com/adminportal/home?#/licenses/autoclaimpolicies) tab.
2.	Select **Add a policy**.
3.	On the **Name this auto-claim policy** page, enter a name for the policy, then select **Next**.
4.	On the **Set an auto-claim app and product** page, select **Power App Per User Plan** in the dropdown. When a user signs in to this app and select the license.
5.	On the **Select apps** page, select or clear the boxes for the apps to include or exclude with the license, then select **Next**.
6.	On the **Review and finish** page, verify the new policy information, make any necessary changes, then select **Create policy**.

## Auto-claim policy enabled by default 
To simplify license management for administrators, in tenants with managed environments, auto-claim policies will no longer require manual activation by admins. These policies will be automatically created. Starting in December 2023, a license auto-claim policy for Power Apps per-user licenses, titled 'Auto-Created Policy for PowerApps,' will be generated in the M365 admin center for tenants with managed environments. Under this policy, if a user without a Power Apps per-user license launches an app in a managed environment, they will automatically receive a Power Apps per-user license if one is available in your tenant.

By default, this policy will be applied when users launch Power Apps in managed environments. However, administrators can choose to extend this policy to cover Power Apps launches in standard environments as well through a setting in the Power Platform admin center.

## Can administrators update the policy?
Yes, administrators can manage the policy in the M365 admin center just like any other auto-claim policy. This includes the ability to disable the policy, delete it, and view reports on which users were assigned licenses.

Additionally, in the Power Platform admin center, administrators can decide whether the policy should apply to managed environments only or all environments:

1.	In the Power Platform admin center, go to **Settings** > select the **Licenses** setting, and then choose the policy name.
2.	Select whether the policy should be applicable to 'All Environments' or 'Managed Environments.'

## Support for group-based license assignment

Auto-claiming supports individual license assignment, meaning licenses are assigned to individual users. If your organization already has an existing process for license assignment, administrators can still make use of the auto-claim policy while maintaining their current workflow. Administrators can review the list of users to whom licenses were assigned via the auto-claim policy in the M365 admin center. They can then adjust as needed, such as unassigning auto-claim-assigned licenses and moving users to designated groups to leverage Entra group-based licensing. More information about group based licensing can be found here : Group-based licensing additional scenarios | Microsoft Learn

Here are some commands that can assist in unassigning licenses and adding users to the required Entra group.


