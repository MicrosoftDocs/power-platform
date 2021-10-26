---
title: "Preview: Pay-as-you-go plan| MicrosoftDocs"
description: About the pay-as-you-go plan which is a new way to pay for Power Apps using an Azure subscription which allows you to get started with building and sharing apps without any license commitment or up-front purchasing.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/26/2021
ms.subservice: admin
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Pay-as-you-go plan

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

<!-- https://go.microsoft.com/fwlink/?linkid=2173947 -->

# Pay-as-you-go plan

Pay-as-you-go is a new way to pay for Power Apps using an Azure subscription which allows you to get started with building and sharing apps without any license commitment or up-front purchasing.

Pay-as-you-go allows you to share a Power Apps app with any user in your organization and then only pay if and when users use that app. The pay-as-you-go plan also includes Dataverse storage capacity and provides the flexibility to pay for additional storage as you need it.

This plan reduces the overhead of license procurement and provides ability to manage and split costs across business units by leveraging the cost management reporting capabilities of Azure subscriptions . Pricing information for this plan is available [here.](https://go.microsoft.com/fwlink/?linkid=2169167)

> [!TIP]
> Check out how T-Mobile is innovating with Power Apps pay-as-you-go: [T-Mobile adopts Microsoft Power Platform for fast and powerful low-code development](https://customers.microsoft.com/story/843531-t-mobile-telecommunications-power-platform).

## Common use cases

1. **Widely distributed apps:** Use for apps that need to be shared with a large user base with infrequent and/or unpredictable use.

2. **Establish usage patterns:** Understand adoption patterns for new apps to determine whether pre-paid licenses make sense.

3. **Flexible purchasing:** Use an Azure subscription for Power Apps to reduce the license procurement overhead and consolidate with other service purchases. This is especially helpful in case you already have an Azure subscription that use for other Microsoft services.

## How does this work?

In Power Apps or the Power Platform admin center you can link environments to an Azure subscription using a billing policy.

Once an environment is linked to an Azure subscription, usage of apps as well as any Dataverse or Power Platform request usage above included amounts is billed against the Azure subscription using Azure meters \[ link to section in doc describing meters \].

You can unlink your environment from the Azure subscription at any time and usage will no longer be billed.

:::image type="content" source="media/pay-as-you-go-azure-relationship.png" alt-text="Relationship between Power Platform admin center and Azure Portal":::

## What is a billing policy?

A billing policy creates a link between one or more environments and an Azure subscription. It contains:

- Details of the Azure subscription

- A list of environments that are linked to the Azure subscription

Billing policies can be created in either the Power Platform Admin Center or within Power Apps. When a billing policy is created, a corresponding Azure resource (called a Power Platform Account resource) is created in the Azure subscription associated with that billing policy. Any usage charges for Power Apps, Dataverse, and Power Platform Requests will appear under the Power Platform Account resource on the Azure subscription's bill.

When an environment is linked to Azure via a billing policy it becomes a *pay-as-you-go environment*. An environment can only be linked to one billing policy at a time. You can change the billing policy an environment is linked to, or remove it from a billing policy, at any time. When you remove an environment from a billing policy it goes back to functioning as a regular environment, and usage of Power Platform products in that environment will no longer be billed to Azure.

:::image type="content" source="media/pay-as-you-go-billing-policy-azure-subscription.png" alt-text="Billing policy linked to Azure subscription":::

Billing policies provide flexible options for organizations looking to allocate Power Platform meter costs across teams and departments. In the example below, the customer has decided to set up Power Platform meter usage for the marketing team's environments to be billed again the marketing team's Azure subscription. For the finance team, the customer has decided to setup two different billing policies (each of which will be connected to a separate Power Platform account resource) so that the costs for each sub team within the Finance team (Accounting and Auditing) can be easily broken out even though they are both billed to the same Azure subscription. Customers can also leverage [Azure resource groups](/azure/azure-resource-manager/management/manage-resource-groups-portal) and [Azure tags](/azure/azure-resource-manager/management/tag-resources?tabs=json) to organize their Power Platform account resources and track + allocate spend.

:::image type="content" source="media/pay-as-you-go-billing-policy-azure-subscription-examples.png" alt-text="Billing policy linked to Azure subscription examples":::

## Who can set it up?

The following table describes the permissions of who can create a billing policy to link an environment to the Azure subscription. These permissions apply to both the Power Apps and the Power Platform admin center experience.

| **Role**  | **Create a billing policy** | **Edit a billing policy**   | **Link environments to a billing policy**   |
|--------|----------|-------|-----|
| Environment admin    | Yes  | Yes for billing policies the admin created | Yes for billing policies the admin created and for environments they are Environment admins for. |
| Power Platform admin | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant  |
| Global admin         | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant   |
| D365 Admin           | Yes  | Yes for all billing policies in the tenant | Yes for all environments in the tenant    |

## How do meters work?

| **Meter** | **What is counted?** | **What is billed?** |
|------|--------|--------|
| Power Apps per app | Total number of unique monthly users of each app and portal in the pay-as-you-go environment.</br>A unique monthly user is a user who opens an app/portal at least once in the given month.</br>Repeat access of an app/portal by a user is not counted.</br>Users with Power Apps per user licenses are not counted. | $10/active user/app/month |
| Dataverse capacity | For database storage, any usage above 1GB per pay-as-you-go environment.</br>For file storage, any usage above 1GB per pay-as-you-go environment.</br>If auditing is enabled, any resulting log storage usage will be counted. | For usage above 1GB for database: $48 per GB/month</br>For usage above 1GB for file: $2.40 per GB/month</br>For any log usage: $12 per GB/month |
| Power Platform requests (Coming soon) | Each user in a pay-as-you-go enabled environment will get a daily entitlement of Power Platform requests based on their license. With Power Apps per app meter, you get an entitlement of 2K API calls/per user/app/day. This will be sufficient for most customers and for those with high scale scenarios any Power Platform Requests needed above that entitlement will be counted | $0.0002 per request/day above the daily entitled limits |

For detailed pricing information, see [Power Apps pricing](https://powerapps.microsoft.com/pricing/).

Note: as of Public Preview (11/01/21) if you link an environment to an Azure subscription, Power Platform requests meter will not be reported or billed. Users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages. Reporting and billing will be turned on in the weeks following the Public Preview announcement.

### Power Apps per app meter 

The Power Apps per app meter enables users to use any type of app without needing to have a Power Apps license. Power Apps per app meter provides access to both canvas apps and model apps, as well as portal for authenticated users.

The Power Apps Per App meter measures the number of unique users who opened the app or a portal at least once in an environment in a month. You are charged only for the unique users who opened the app in a month irrespective of how many users have access to the app. For example, if 100 users have access to the app, but only 10 users used the app in a month, then you are charged only for those 10 users. Users can access the same app any number of times over the course of the month and still only be counted as 1 monthly active user of that app. However, if users run multiple apps, they will be counted as monthly active users for each app they run that month.

Let's say an environment has three apps, App A, B, and C and this environment is now enabled for pay-as-you-go:

Note: the prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

:::image type="content" source="media/pay-as-you-go-three-example-apps.png" alt-text="Example of three apps enabled for pay-as-you-go":::

If a user has a Power Apps per user license, user is not counted in the meter. If a user has a [Microsoft 365 license](pricing-billing-skus.md#power-appspower-automate-for-microsoft-365) which provides access to Power Apps and is using an app with standard connectors, user is not counted in the meter. See below for how users are counted in the Power Apps per app meter. 

|    |    |     |
|----|------|-------|
|  | App with Standard connectors    | App with Premium connectors    |
| Unlicensed user   | ![Checkmark outline](media/checkmark.png) | ![Checkmark outline](media/checkmark.png) |
| User with Power Apps for Microsoft 365 plan | Not counted    | ![Checkmark outline](media/checkmark.png) |
| User with Power Apps per user plan          | Not counted     | Not counted    |

Note: If an environment already has [app passes assigned](https://docs.microsoft.com/en-us/power-platform/admin/about-powerapps-perapp) and then the environment is enabled for pay-as-you-go, app passes are ignored and not consumed. You can reallocate those app passes to a different environment.

### Dataverse meter

The Dataverse pay-as-you-go meters let you pay for your usage of all three categories of Dataverse storage (database, log, and file) using an Azure subscription.

When an environment becomes a pay-as-you-go environment (meaning those that are linked to an Azure subscription), it stops consuming storage from the tenant wide Dataverse storage pool. Instead, its consumption is billed to Azure. In pay-as-you-go environments, the first 1GB of Dataverse database storage and the first 1GB of Dataverse file storage capacity will not be billed to Azure. However, any log storage capacity will immediately be billed to Azure. Note that log storage capacity us only used if you decide to turn on auditing for an environment.

Measurement for each category of Dataverse storage usage will happen three times per day (90 measurements per month) at 08:00 UTC, 16:00 UTC, and 00:00 UTC. The usage snapshot in that 8-hour period is then multiplied by 1/90<sup>th</sup> to get the fractional usage of storage during the measurement period. This fractional usage will be multiplied by the monthly per GB rate and shown in Azure cost management. The total amount will be summed and billed based on the customer's Azure billing cycle

Note: the prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

:::image type="content" source="media/pay-as-you-go-measured-usage-above-per-environment-entitlements.png" alt-text="Measured usage above per environment entitlements":::

### Power Platform request meter

Note: as of Public Preview (11/01/21) if you link an environment to an Azure subscription this meter will not be reported or billed. Users and flows in the environment can consume more than their entitled usage without being throttled or paying for overages. Reporting and billing will be turned on in the weeks following the Public Preview announcement.

Each Power Platform license includes a large entitlement of Power Platform requests which is designed to sufficient for most customers and scenarios. For customers with extremely high scale scenarios who need to exceed these entitlements, the Power Platform requests meter enables them to scale without getting throttled and only pay for the Power Platform requests used above those entitlements.

For more information on Power Platform requests and the entitlements that are included in each Power Platform license please visit \[ ADD LINK: aka.ms/platformlimits\].

Power Platform request entitlements are structured as daily entitlements (requests/day). In pay-as-you-go environments (meaning those that are linked to an Azure subscription), users and flows that go above their daily entitlement will be billed to the Azure subscription. In a pay-as-you-go environment, with Power Apps per app meter, you get an entitlement of 2K API calls/per user/app/day. Note that flows still need to be licensed with a base licensed (either Power Automate per user, Power Automate per flow, or Office).

In the example below User A is licensed with a Power Apps per user license and Flow A is licensed with a Power Automate per flow license. The number of Power Platform requests consumed by User A and Flow B are measured daily and any usage above the daily entitlement is multiplied by a $/request rate and shown in Azure Cost Management. The total amount will be summed and billed based on the customer's Azure billing cycle.

Note: the prices shown in this example are illustrative only. Your organization's pricing may vary based on your contract with Microsoft.

:::image type="content" source="media/pay-as-you-go-measured-usage-above-entitlements.png" alt-text="Measured usage above entitlements":::

## How to set up pay-as-you-go for an environment

1. Procure or create an Azure subscription you can use

   If you do not already have an Azure subscription in your tenant, please work through the standard process in your organization to obtain one or create a new one [here](https://azure.microsoft.com/en-us/free/). You will need to have permissions to create new resources and register resource providers in the subscription (or have the ability to work with an Azure subscription owner or contributor who can register resource providers). Learn more about [Azure subscriptions](https://go.microsoft.com/fwlink/?linkid=2174703).

2. Enable the Power Platform Account feature in the Azure portal. Note that this is temporary and will be automated. Here's how:

   1. Sign in to the Azure portal and start the Cloud Shell.

      :::image type="content" source="media/pay-as-you-go-azure-start-cloud-shell.png" alt-text="Start the Cloud Shell in Azure Portal":::

      Azure Cloud Shell
      :::image type="content" source="media/pay-as-you-go-azure-cloud-shell.png" alt-text="Azure Cloud Shell in Azure Portal":::

   2. Enter the following command in the Azure Cloud Shell to enable the Purchase via Azure feature (remove the { } in the subscriptionId parameter):

      ```PowerShell
      az feature register --namespace Microsoft.PowerPlatform --name accountPreview --subscription {subscriptionId}
      ```
      
      The above command will run asynchronously and may take a few minutes to complete. You can check the status of whether the command is completed by running:

      ```PowerShell
      az feature show --namespace Microsoft.PowerPlatform --name accountPreview --subscription {subscriptionId}
      ```
   3. Enter the following command in the Azure Cloud Shell to register the Power Platform resource provider the { } in the subscriptionId parameter):

      ```PowerShell
      az provider register -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```

      Note that the above command will run asynchronously and may take a few minutes to complete. You can check the status of whether the command is completed by running:

      ```PowerShell
      az provider show -n Microsoft.PowerPlatform --subscription {subscriptionId}
      ```
      
Now your Azure subscription is set up to use Power Platform pay as you go.

## Step by step experience to link Azure subscription to an environment 

Pay-as-you-go can be set up via [Power Apps](https://make.powerapps.com/) or the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

### In the Power Platform Admin Center

Here are the steps to create a billing policy, link environments to it, and add Azure subscription details for billing.

**STEP 1:** Navigate to https://admin.powerplatform.microsoft.com/azurebilling

   This page will show you a list of previously created billing policies and allow you to create a new one. **Select New billing policy**.

   :::image type="content" source="media/pay-as-you-go-select-billing-policy.png" alt-text="Select New billing policy":::

**STEP 2:** Provide a name for your new billing policy, then select **Next**.

   :::image type="content" source="media/pay-as-you-go-billing-policy-name.png" alt-text="Select New billing policy":::

**STEP 3:** Add Azure subscription details

   1. Choose the Azure subscription you would like to bill to from the Azure subscription drop down list. The drop down list will show the Azure subscriptions in your tenant for which you have permissions to create resources and register resource providers (aka "RPs"). Most commonly this will mean that you have an owner or contributor role for the subscription. If you don't see a subscription you expect listed, please contact the owner of that subscription and ensure you have permissions.

   2. Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription you will need to create one in the Aure portal (portal.azure.com) before proceeding. Learn more about Azure resources here.

   3. Specify a region. Choose from the list of available regions. Note that any environments you add to the billing policy in the following step can only be in this region.

   4. Select "Next".

      :::image type="content" source="media/pay-as-you-go-billing-policy-azure-details.png" alt-text="Select New billing policy":::

**STEP 4:** Choose environments to link to the new billing policy

   1. Select one or more environments from the list of environments then click "Add to policy" at the top of the screen. These environments will then appear on the "Added to policy" list. Click "Next" to continue.

      NOTE: An environment can be linked to only one billing policy at a time. So if you attempt to add an environment to your new policy that has already been linked to another policy, you will receive a warning message asking you to confirm you would like to change which billing policy that environment is linked to.

   2. The list of environments will be filtered to only show environments whose region matches the region that was selected in the prior step.

      As of Public Preview (11/01/21) only environments of the type Production or Sandbox are available to add to billing policies. Trial environments, developer environments, Dataverse for Teams environments and Default environments cannot be added.

      :::image type="content" source="media/pay-as-you-go-available-environments.png" alt-text="Available environments to add billing policy":::

      Environments with policy added.
      :::image type="content" source="media/pay-as-you-go-environments with-billing-policy.png" alt-text="Environments with policy added":::

**STEP 5:** Review and confirm

   Review and confirm the options, then select **Create billing policy**. The billing policy will now appear in the list of billing policies shown on [http://admin.powerplatform.com/azurebilling](http://tip.admin.powerplatform.com/azurebilling).

   :::image type="content" source="media/pay-as-you-go-review-create-billing-policy.png" alt-text="Review and create the billing policy":::

   List of billing policies
   :::image type="content" source="media/pay-as-you-go-billing-policy-list.png" alt-text="List of billing policies":::

**STEP 6 - OPTIONAL:** View the billing policy's Power Platform account resource in the Azure Portal

   When a billing policy is created, a corresponding Power Platform account resource is created in the Azure subscription that is specified by the billing policy. All Azure meters for Power Platform products will be billed to this resource. To view this resource, navigate to the Azure portal (portal.azure.com), selected the subscription and resource group which you specific when you created the billing policy. Click "View hidden types" above the resource list. You will see a Power Platform account resource which has the same name as the billing policy you created.

   You can optionally tag this resource just like you would any other Azure resource.

   In the Azure portal
   :::image type="content" source="media/pay-as-you-go-view-billing-policy-in-azure.png" alt-text="Billing policies in Azure Portal":::

### In Power Apps 

You can set up pay-as-you-go for your environment right from your app's setting for both canvas apps and model apps without needing to go to the admin center. Once set up, you can easily add new environments to the same Azure subscription in the Power Platform admin center.

**STEP 1:** Sign into [Power Apps](https://make.powerapps.com/) and navigate to "Apps". Select your app and click on "Settings". Make sure that that you have the right environment selected.

   :::image type="content" source="media/pay-as-you-go-powerapps-settings.png" alt-text="In Power Apps sign in and select Apps > Settings":::

   If pay-as-you-go is already enabled for an environment via Power Platform admin center, then you will see the following experience. You can opt your app out of using Azure subscription by turning off the toggle. Once turned off, users will need Power Apps user licenses to access the app. You can turn it on anytime. You can also view and edit the subscription details by clicking on "Edit pay-as-you-go billing" which will direct you to the Power Platform admin center.

   Note: If app passes are already available for this environment, they are ignored and not consumed. Instead, Azure subscription is used for accessing the apps.

   :::image type="content" source="media/pay-as-you-go-powerapps-edit.png" alt-text="Select Edit pay-as-you-go billing":::

   If pay-as-you-go is not enabled for an environment and you have the right permissions (shared under billing policy section), you will see the following experience and can easily set up pay-as-you-go using the steps below.

**STEP 2:** Select "Set up pay-as-you-go" to connect your Azure subscription to this environment.

   Note: Connecting Azure subscription to an environment turns on pay-as-you-go billing for all apps within that environment.

   :::image type="content" source="media/pay-as-you-go-powerapps-setup.png" alt-text="Select Set up pay-as-you-go billing":::

**STEP 3:** Enter a billing policy name and your Azure subscription details. Once entered, select **Connect subscription** to complete the set up.

   Choose the Azure subscription you would like to bill to from the Azure subscription drop down list. The drop-down list will show the Azure subscriptions in your tenant for which you have permissions to create resources and register resource providers (aka "RPs"). Most commonly this will mean that you have an owner or contributor role for the subscription. If you don't see a subscription you expect, please contact the owner of that subscription, and ensure you have permissions.

   Specify a resource group with that subscription. The Power Platform account resource that will be associated with this billing policy will be created in this resource group. If there are no resource groups in the specified subscription you will need to create one in the Aure portal (portal.azure.com) before proceeding. Learn more about Azure resources here.

   If you don't have an Azure subscription, procure one within your organization or create a new one.

   Enter billing policy name
   :::image type="content" source="media/pay-as-you-go-powerapps-billing-policy-name.png" alt-text="Select Set up pay-as-you-go billing":::

   Enter Azure subscription details
   :::image type="content" source="media/pay-as-you-go-powerapps-connect-subscription.png" alt-text="Select Connect subscription":::

**STEP 4:** Once Azure subscription is successfully linked to your environment, you will land back on the app settings screen and will see the following experience. Check out \[Add link to Step 6 above\] to see how to view the Power Platform resource in Azure.

   :::image type="content" source="media/pay-as-you-go-powerapps-app-settings.png" alt-text="Select Connect subscription":::

   If you have app passes available for your environment and still want to set up pay-as-you-go, you use the steps 2-4 to set it up. Once pay-as-you-go is set up, app passes are not consumed.

## How to view usage and billing information

Aggregated billing information is available in the Azure portal, and a detailed usage drill downs are available in the Power Platform admin center.

### View billing information in the Azure portal

All Power Platform meters are billed to Azure subscriptions. You can view the amounts that have been billed for each meter in the Azure Portal using Azure Cost Management. Billed amounts are updated daily (and sometimes more frequently), but it can take up to 24h between usage of a Power Platform service to show up in Azure Cost Management.

Within Azure Cost Management you can filter and view billing details by meter and/or by Azure resource. Note that each billing policy corresponds to a Power Platform account resource. So to view charges for a specific billing policy simply filter for the Platform account resource of the same name,

### View detailed usage information in the Power Platform admin center

While Azure Cost Management can show the amount that was billed for each meter and each billing policy, it will not provide a breakdown of which environments, apps, and users drove usage of the meters. For this level of information downloadable report is available on the billing policies page in the Power Platform admin center.

:::image type="content" source="media/pay-as-you-go-powerapps-download-reports.png" alt-text="Select Download reports":::

The downloadable report contains the following fields:

| Environment ID        | \[ add description \[\] |
|-----------------------|-------------------------|
| Billing policy ID     |                         |
| Azure subscription ID |                         |
|                       |                         |

## How to manage costs

When these budgets amounts are approached or reached you can configure alerts to be sent automatically or trigger actions to take place. For more details please visit: https://docs.microsoft.com/en-us/azure/cost-management-billing/costs/tutorial-acm-create-budgets and Create and manage action groups in the Azure portal - Azure Monitor \| Microsoft Docs

Azure Cost Management provides options to set budgets for Azure resources and specific meters. You can use this capability to set budgets at a billing policy level by setting a budget for its corresponding Power Platform account resource. You can also set budgets for individual Power Platform meters.

## Turning off pay-as-you-go 

You can turn off pay-as-you-go for an environment at any time by doing either of the following:

1. Remove the environment from a billing policy by going to the Power Platform admin center > Billing Policies page and editing the billing policy.

**OR**

2. Delete the environment's billing policy.

   As soon as you take either action above, the environment will cease to be a pay-as-you-go environment and it will go back to functioning as a regular environment. Any usage that was already incurred up to the point the action was taken will be billed to Azure, but no further usage beyond that point will be billed.

   Note that deleting the billing policy in the Power Platform admin center will not automatically delete its corresponding Power Platform account resource in the Azure portal. You can delete this resource in the Azure portal.

## Known Issues/Scope for Public Preview

- Tagging not working yet
- Deleting a BP does not delete corresponding PP Account resource
- PPAC downloadable usage reports provide data for last 30-day period only
- Billing is only for first 30 days of a month

## Frequently Asked Questions 

### When should I consider existing Power Apps subscription plans vs pay-as-you-go?

The addition of pay-as-you-go provides flexibility to pay based on the number of unique apps or portals a user runs each month.

Some common scenarios where it might be useful:

- When you have a team of professional developers who already have access to an Azure subscription. Using their existing Azure subscription to use Power Apps may help reduce procurement processes, while maintaining consistency with other services the team is consuming from Microsoft.
- Pay-as-you-go may be an option when exploring premium capabilities but unsure how many licenses to procure in advance. Enabling pay-as-you-go delivers the flexibility to establish usage patterns, which could then be transitioned into subscription licenses, if needed.
- Similarly, there may be scenarios where an app needs to be shared with a large user base, though usage and frequency may significantly fluctuate. In this case, pay-as-you-go would enable you to pay only for those users who ran an app during the monthly period.

### Is pay-as-you-go available for both canvas apps and model apps?

Yes.

### How is the Power Apps per app meter unit counted?

Number of unique users who opened an app or a portal in each month. Repeat access to the same app or portal is counted only once.

### Can I set up pay-as-you-go for my environment without an Azure subscription?

No. You need an Azure subscription to set up pay-as-you-go.

### Which environments are available for pay-as-you-go?

Production and Sandbox environments are available at this point.

### Can pay-as-you-go be set up for individual apps?

No. Pay-as-you-go is set up for an environment and all apps within that environment are billed against the associated Azure subscription. You can however exclude an app from using the Azure subscription in which case a user will need a per user license to use the app. Per app licenses cannot be used in a pay-as-you-go environment.

### What if I already have a user license and use an app in a pay-as-you-go enabled environment? Will I be billed against Azure subscription?

Users with per user licenses are not counted towards the Power Apps Per app meter, and hence will not incur charges. However, note that when an environment is linked to a billing policy, any Dataverse usage will be billed to the billing policy's Azure subscription.

### What happens if I have an Office license and using an app with standard connectors in a pay-as-you-go enabled environment?

Users who are using an app with standard connectors and have office licenses, are not counted towards the Power Apps per app meter, and hence will not incur charges.

### Can guest users use apps in a pay-as-you-go environment without licenses?

Yes.

### What if a user uses the same app multiple times in a month? How will that user be charged?

Repeat access of the same app by a user in a month is counted only once, resulting in a charge for only 1 active user in that month.

### If a user uses multiple apps in a single environment, how will that user be charged?

You will be charged for the number of apps that a unique user accesses in a month. If a user uses three different apps in a month, you will be charged for three active users.

### What if my app is already using app passes that are available at the environment? Can I still use pay-as-you-go billing for my app?

Yes, you can set up pay-as-you-go for your app's environment. Doing so will disregard the app passes and you can pay for your app via Azure subscription.

### Can I use pay-as-you-go billing for some apps and use per app passes for the others in the same environment?

No. As soon as you enable pay-as-you-go for your environment, all apps will be billed against it.

### I do not have admin permissions for the environment I'm working with. Can I set up pay-as-you-go for the environment?

No. You need an environment admin permission to be able to link the environment to a billing policy.

### Can I enable/disable specific meters?

No. Once you enable pay-as-you-go, both Power Apps per app meter and Dataverse meter will be enabled and both app access and storage will be charged.

### How is Dataverse capacity calculated when one environment is enabled for PAYG and the other is not within my tenant?

Environments draw from a tenant-wide pool of Dataverse storage. When an environment is linked to an Azure subscription however, it stops drawing from the tenant-wide pool. All pay-as-you-go linked environments will get an initial entitlement of 1.0GB of Dataverse database and 1.0GB of Dataverse file storage capacities to cover the typical initial storage footprint consumed by Dataverse. Any usage above the initial environment is billed to Azure via the Dataverse pay-as-you-go meter.

### Will I be throttled if I exceed Power Platform requests entitlement in a pay-as-you-go environment?

No. If you exceed your entitlement, you will automatically be charged for the overages via Azure subscription without experiencing any disruption. However, at this time, you are not getting charged even if you exceed entitlements.

### Can I stop using pay-as-you-go billing at any time?

Yes, you can disable pay-as-you-go at any point by either deleting the billing policy or removing the environment from the billing policy. Doing so will stop any further charges on the Azure subscription.

### What admin guardrails are available to prevent accidental costs?

### What If my bill is wrong?

### Can I use the Power Platform request or Dataverse capacity add-ons in a pay-as you-go environment?

No, you cannot use add-ons in a pay-as-you-go environment.


### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
