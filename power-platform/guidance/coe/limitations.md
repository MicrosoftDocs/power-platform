---
title: "Limitations | MicrosoftDocs"
description: "Limitations of some components within the CoE Starter Kit, such as potential timeouts, Government Community Cloud availability, and more."
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/10/2022
ms.subservice: guidance
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

There is no "one size fits all" solution for a Center of Excellence (CoE). Some companies will want a restrictive set of rules on their organization in hopes of mitigating the unknown, while others will want to let users personally explore without limitations. That's why the CoE Starter Kit doesn't come equipped with a set of design patterns for everyone. If your organization wants a more restrictive implementation, it must implement those restrictions in addition to using the tools from the starter kit.

The following sections describe limitations for some components.

## Long running flows

There are some flows, which crawl the tenant in order to do their work. Specifically, the inventory flows in Core solution and the start archival flows in Governance solution.

To help ensure service levels, availability, and quality, there are entitlement limits to the number of requests users can make each day across Power Apps, Power Automate. Learn more: [Requests limits and allocations](../../admin/api-request-limits-allocations.md)

Larger tenants might require a per flow license in order for these flows to complete in a timely manner. More information: [Power Automate License Pricing](https://flow.microsoft.com/pricing/)

Whilst we work on a long term solution, you can also request for your [limits to be raised](https://github.com/microsoft/coe-starter-kit/issues/917). 

>[!TIP]
>The first run of the Sync flows in the Core Solution will run long as it will do an update for every flow/app/etc in the tenant. Subsequent runs  will only update apps/flows/etc that have changed since the last run and so these will not require a per flow license for most tenants.

## Dataverse for Teams

Model Driven Apps, Business Process Flows, and Custom Connectors are not available in Dataverse for Teams. If you are installing the CoE Starter Kit in Dataverse for Teams, you will notice those components missing.

## Flows that use the Microsoft Dataverse connector

The Admin | Sync Template v3 (Flows) and CLEANUP - Admin | Sync Template v3 (Connection Status) will fail to collect inventory information for flows that use the [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector. The [Get Flow as Admin](/connectors/flowmanagement/) currently has a limitation, where flows using that connector cannot be retrieved.

## Flows that are imported or owned by a service principle

The Admin | Sync Template v3 (Flows) flow will fail to collect inventory information for flows that were imported or are owned by a service principle.

## Co-authoring and Connections

If you have multiple identities managing the CoE Starter Kit, you may see this error when trying to use the flows:

`The caller with object id '...GUID...' does not have permission for connection...`

The product does not yet support multiple people using connection references.

If you see this error, you should either log in with the identity that installed the solution to run the flows, or update the flows to use your identity.

To do the later, browse to the default solution, filter to connection references, and edit each connection to use your connection instead.

## Developer environments from the Power Apps Community Plan

Microsoft Power Platform protects developer-type SKUs from inquiry by non-authenticated users. This configuration means that the model-driven apps in developer SKUs will be skipped from our inventory work in the sync flow Admin | Sync Template v3 (Model Driven Apps).

To collect model-driven app inventory, add your admin identity to the security roles for all developer environments, and then remove the selection from the sync flow. More information: [Power Apps Community Plan](/powerapps/maker/dev-community-plan)

## Sync flow limitations for Developer and Microsoft Team environments

It currently isn't possible to retrieve the model-driven apps, chatbots, and Desktop flows for developer environments (*My Name's* environment) and Microsoft Teams environments.

## Supported languages

The CoE Starter Kit solutions are not localized, and only support English. Add the English language pack to your environment to make sure all apps and flows work. More information: [Regional and language options for your environment](../../admin/enable-languages.md)

## Security groups and approvals

We recommend against using security groups to control access to the CoE environment, because it's likely that users who don't have access to this environment will be participating in approvals.
If you choose to use a security group to control access, users will have to be a part of that group to work with the archival solutions.

## Shared component library in the theming components solution

The shared component library in the [theming components solution](theming-components.md) isn't editable. Make your own copy if you want to extend it.

## Trial licenses

Trial licenses do not have sufficient [API call allowances](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits) to run the CoE Starter Kit flows.
For full list of license requirements, see [Setup Prerequisite](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## PIM (Privileged Identity Management)

If your Power Platform admin role is managed via **[PIM](/azure/active-directory/privileged-identity-management/pim-getting-started)**, ensure the Sync Flows of the Core Components solution are set up to complete during the time whilst your user is granted admin permission. If your user loses admin access during the run of the sync flows, you may end up with incomplete or incorrect data if you use PIM and your Power Platform Admin Role.

## Monitoring cloud flow runs

Monitoring Cloud flow runs is currently not included in the CoE Starter Kit. Monitoring Desktop flow runs is included, although limited.

For more details on managing Desktop flows, check out the [Advanced Power Automate RPA Run Log Analytics with Power BI and Dataverse](https://flow.microsoft.com/blog/advanced-power-automate-rpa-run-log-analytics-with-power-bi-and-dataverse/) solution.

## Unpublished model-driven apps

Due to a product limitation, model-driven apps that are not published are not surfaced in the inventory because the are not returned to us from the storage table.

## Large desktop flows

Due to a product limitation, large Desktop Flows may not show up in the inventory as the content field is too large for cloud flows to process.

## Missing custom connectors

We are able to collect only the intersect of all custom connectors outside of solutions, and all custom connectors to which you have access. As a result, custom connectors in a solution, to which the identity running the sync flows do not have access, will not show up in the inventory.

## Inventory differences between PowerShell, Power Platform Admin Center, and CoE Starter Kit

If you are using [PowerShell for Power Platform Administrators](../../admin/powershell-getting-started.md) and the [Power Platform Admin Center](../../admin/wp-work-with-admin-portals.md) together with the CoE Starter Kit, you may be noticing a discrepancy in inventory - for example, the number of apps returned by PowerShell looks different than the number of apps returned by the CoE Starter Kit.

There are expected differences, and the below information should help you understand what to expect.

### PowerShell

[Get-AdminPowerApp](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerapp) and [Get-AdminFlow](/powershell/module/microsoft.powerapps.administration.powershell/get-adminflow) will always return the latest and most up-to-date inventory of the environment you're querying.

[Get-AdminPowerApp](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerapp) returns only canvas apps and SharePoint custom forms, but not model-driven apps.

[Get-AdminFlow](/powershell/module/microsoft.powerapps.administration.powershell/get-adminflow) returns all cloud flows.

### Power Platform Admin Center

[Power Apps](../../admin/admin-manage-apps.md) and [Power Automate](../../admin/manage-power-automate.md) resources will always return the latest and most up-to-date inventory of the environment you're looking at. Make sure to refresh the page in the Admin Center to show the latest information.

[Power Apps resources](../../admin/admin-manage-apps.md) returns canvas apps and published and unpublished model-driven apps, but not SharePoint custom forms.

[Power Automate resources](../../admin/manage-power-automate.md) returns all cloud flows.

### CoE Starter Kit

The [inventory](setup-core-components.md) in the CoE Starter Kit runs daily to look for new and modified resources since the last run. However, certain cleanup flows only run every two weeks. One of these flows is [CLEANUP - Admin | Sync Template v3 (Check Deleted)](core-components.md#flows) which checks if a resource, for example a canvas app, is still in the environment and if not marks it as deleted. This flow compares every row in the CoE tables to every Power Platform resource in your tenant and consumes a high volume of API calls, therefore this and similar flows are scheduled to run only every two weeks. This schedule means that your data may be out of date if resources have been deleted in the past two weeks.

The CoE starter kit expects all [inventory flows](core-components.md#flows) to always run with elevated Power Platform admin privileges. If admin access expires during a flow run or if the flow is run with a user that doesn’t have admin privileges, any resources that can’t be retrieved are marked as deleted in the CoE tables. Once an app is marked as deleted, it will not be marked as active again. Just one flow run with insufficient privileges can therefore have a significant impact on the inventory.

The CoE Starter Kit shows canvas apps, published model-driven apps, and SharePoint custom forms but not unpublished model-driven apps (if the "play" button on a model-driven apps is disabled).

The CoE Starter Kit shows all cloud flows.

### SharePoint custom forms

SharePoint custom forms apps can be either in the Default environment or a [designated SharePoint form environment](../../admin/powerapps-powershell.md#designate-sharepoint-custom-form-environment) – or both. For example, if you have existing SharePoint custom forms in the Default environment before you designate a SharePoint form environment, existing forms will remain in the Default environment and will not be migrated.

### Deleted apps and flows

There are two options in the CoE Starter Kit to handle deleted resources – either they are deleted from the inventory table or they are kept in the inventory table and a 'Deleted' field is set to yes (true). This setting is controlled via an Environment Variable called [Also Delete from CoE](setup-core-components.md#all-environment-variables).

If this environment variable is set to **No**, it will keep a record of deleted apps and flows and highlight them as deleted via a field. Depending on the filter you have on the data, you may then still see deleted apps and flows.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]