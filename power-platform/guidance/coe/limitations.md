---
title: "Limitations | MicrosoftDocs"
description: "Limitations of some components within the CoE Starter Kit, such as potential timeouts, Government Community Cloud availability, and more."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Limitations

There is no "one size fits all" solution for a Center of Excellence (CoE). Some companies will want a restrictive set of rules on their organization in hopes of mitigating the unknown, while others will want to let users personally explore without limitations. Because of this, the CoE Starter Kit doesn't come equipped with a set of design patterns for everyone. If your organization wants a more restrictive implementation, it must implement those restrictions in addition to using the tools from the starter kit.

The following sections describe limitations for some components.

## Long running flows

There are some flows, which crawl the tenant in order to do their work. Specifically, the inventory flows in Core solution and the start archival flows in Governance solution.

To help ensure service levels, availability, and quality, there are entitlement limits to the number of requests users can make each day across Power Apps, Power Automate. Learn more: [Requests limits and allocations](../../admin/api-request-limits-allocations.md)

Larger tenants might require a per flow license in order for these flows to complete in a timely manner. More information: [Power Automate License Pricing](https://flow.microsoft.com/pricing/)

>[!TIP]
>The first run of the Sync flows in the Core Solution will run long as it will do an update for every flow/app/etc in the tenant. Subsequent runs  will only update apps/flows/etc that have changed since the last run and so these will not require a per flow license for most tenants.

## Incomplete Inventory

The sync flows in the Core Component solution will only update resources that have changed since the last run. After an upgrade, you will only see the benefits of bug fixes or changes when you run a full inventory sync: 

1) Set the **Full inventory** environment variable to *Yes* (Learn more: [update environment variables](setup-core-components.md#update-environment-variables)).
1) Run the *Admin | Sync Template v3* flow.
1) Set the **Full inventory** environment variable back to *No*.

## Dataverse for Teams

Model Driven Apps, Business Process Flows and Custom Connectors are not available in Dataverse for Teams. If you are installing the CoE Starter Kit in Dataverse for Teams, you will notice those components missing.

## Flows that use the Microsoft Dataverse (Current Environment) connector

The Admin | Sync Template v3 (Flows) and CLEANUP - Admin | Sync Template v3 (Connection Status) will fail to collect inventory information for flows that use the Microsoft Dataverse (Current Environment) connector. The [Get Flow as Admin](/connectors/flowmanagement/) currently has a limitation, where flows using that connector cannot be retrieved.

## Flows that are imported or owned by a service principle

The Admin | Sync Template v3 (Flows) flow will fail to collect inventory information for flows that were imported or are owned by a service principle.

## Timeouts in the Admin | Sync Template v3

The Dataverse connector might experience some throttling limits if the tenant has many resources. If you see 429 errors in the flow run history occurring in later runs, you can try the following resolution steps:

- **Configure the retry policy**
  1. Open **Admin \| Sync Template v3**, and then select **Edit**.
  1. Expand the step **Get Environments and store them in the CoE Table**.
  1. Expand the step **Apply to each Environment**
  1. Go to the **Settings** pane for each call to Dataverse, and configure the timeout/retry settings. The default count is set to **10** and the default interval is set to **PT10S** - increase the values incrementally here.

     ![Configure retry policy](media/coe72.PNG "Configure the retry policy")

- **Configure (reduce) concurrency in Foreach loops to reduce simultaneous calls**
  1. Open **Admin \| Sync Template v3**, and then select **Edit**.
  1. Expand the step **Get Environments and store them in the CoE Table**.
  1. Go to **Settings** for the **Apply to each Environment** step.

     ![Configure concurrency in Foreach](media/coe73.PNG "Configure concurrency in Foreach")

  1. Use the slider to reduce the value of **Degree of Parallelism**. The default value is 50; reducing the parallelism here will increase the runtime of the flow, so we suggest gradually lowering the number.

<!-- currently this apps are not available ## DLP Editor

- The Environments call returns only the first 2,000 environments.
- The app can't write back environment-type policies.

## DLP Customizer

The app currently doesn't work for custom connectors that are installed as part of a managed solution. -->

## Developer environments from the Power Apps Community Plan

Microsoft Power Platform protects developer-type SKUs from inquiry by non-authenticated users. This configuration means that the model-driven apps in developer SKUs will be skipped from our tally work in the sync flow Admin | Sync Template v3 (Model Driven Apps).

To fix this, you must have your admin security role added to the security roles for all developer environments, and then remove the selection from the sync flow. More information: [Power Apps Community Plan](/powerapps/maker/dev-community-plan)

## Sync Flow limitations for Developer and Microsoft Team environments

It currently isn't possible to retrieve the model-driven apps, chatbots, and Desktop flows for developer environments (*My Name's* environment) and Microsoft Teams environments.

## Security groups and approvals

We recommend against using security groups to control access to the CoE environment, because it's likely that users who don't have access to this environment will be participating in approvals.
If you choose to use a security group to control access, users will have to be a part of that group to work with the archival solutions.

## Shared component library in the theming components solution

The shared component library in the [theming components solution](theming-components.md) isn't editable. Make your own copy if you want to extend it.

## Trial Licenses

Trial licenses do not have sufficient [API call allowances](/power-automate/limits-and-config#looping-and-debatching-limits) to run the CoE Starter Kit flows.
For full list of license requirements see [Setup Prerequisite](setup.md#prerequisites).

## PIM (Privileged Identity Management)

If your Power Platform admin role is managed via  **[PIM](/azure/active-directory/privileged-identity-management/pim-getting-started)** ensure the Sync Flows of the Core Components solution are set up to complete during the time whilst your user is granted admin permission. If your user loses admin access during the run of the sync flows, you may end up with incomplete or incorrect data if you use PIM and your Power Platform Admin Role.


[!INCLUDE[footer-include](../../includes/footer-banner.md)]