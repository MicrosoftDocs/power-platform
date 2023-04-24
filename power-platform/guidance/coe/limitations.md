---
title: "Limitations | MicrosoftDocs"
description: "Limitations of some components within the CoE Starter Kit, such as potential timeouts, Government Community Cloud availability, and more."
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/07/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---
# Limitations

There is no "one size fits all" solution for a Center of Excellence (CoE). Some companies will want a restrictive set of rules on their organization in hopes of mitigating the unknown, while others will want to let users personally explore without limitations. That's why the CoE Starter Kit doesn't come equipped with a set of design patterns for everyone. If your organization wants a more restrictive implementation, it must implement those restrictions in addition to using the tools from the starter kit.

The following sections describe limitations for some components.

## Long running flows

There are some flows, which crawl the tenant in order to do their work. Specifically, the inventory flows in Core solution and the start archival flows in Governance solution.

To help ensure service levels, availability, and quality, there are entitlement limits to the number of requests users can make each day across Power Apps, Power Automate. Learn more: [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations)

Larger tenants might require a [Power Automate Per Flow](https://powerautomate.microsoft.com/pricing/) license for these flows to complete in a timely manner.

>[!NOTE]
>The first run of the sync flows will perform a full inventory and will run long as it will do an update for every flow/app/etc in the tenant. Subsequent runs  will only update apps/flows/etc that have changed since the last run and so these will not go over Power Platform request entitlements for most tenants.

## Flows that have never been turned on

The Admin | Sync Template v3 (Flows) flow will fail to collect flows that have never been turned on. For example, if you import a solution with flows that are off, these will not be collected to inventory as they are not returned by the connector.

## Co-authoring and Connections

If you have multiple identities managing the CoE Starter Kit, you may see this error when trying to use the flows:

`The caller with object id '...GUID...' does not have permission for connection...`

The product does not yet support multiple people using connection references.

If you see this error, you should either log in with the identity that installed the solution to run the flows, or update the flows to use your identity.

To do the later, browse to the default solution, filter to connection references, and edit each connection to use your connection instead.

## Developer and Microsoft Teams environments from the Power Apps Community Plan

Microsoft Power Platform protects developer and Microsoft Teams type SKUs from inquiry by non-authenticated users. This configuration means that the model-driven apps, bots, desktop flows, solutions, business process flows and AI builder models in developer SKUs will be skipped from our inventory work in the sync flow.

## Supported languages

The CoE Starter Kit solutions are not localized, and only support English. Add the English language pack to your environment to make sure all apps and flows work. More information: [Regional and language options for your environment](/power-platform/admin/enable-languages)

## Security groups and approvals

We recommend against using security groups to control access to the CoE environment, because it's likely that users who don't have access to this environment will be participating in approvals.
If you choose to use a security group to control access to the environment, manually add users to the Approvals Users security role.

## Trial licenses

Trial licenses do not have sufficient [API call allowances](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits) to run the CoE Starter Kit flows.
For full list of license requirements, see [Setup Prerequisite](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## MFA (Multi-Factor Authentication)

Multi-factor authentication can be used for the account setting up the CoE Starter Kit, if **MaxAgeMultiFactor** is set to **Until-Revoked** instead of a fixed time. Learn more: [Conditional access and multi-factor authentication in Power Automate](/troubleshoot/power-platform/power-automate/conditional-access-and-multi-factor-authentication-in-flow).

## PIM (Privileged Identity Management)

These roles and licenses must be available to this user continuously; if admin access is granted only temporarily via [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management), this won't be sufficient to run the CoE Starter Kit.

## Monitoring cloud flow runs

Monitoring Cloud flow runs is currently not included in the CoE Starter Kit, however you can explore [self-serve analytics](/power-platform/admin/self-service-analytics) to get cloud flow run information and extend the CoE Starter Kit with this data.

Monitoring Desktop flow runs is included, although limited. For more details on managing Desktop flows, check out the [Automation Kit](https://aka.ms/automationkit) solution.

## Unpublished model-driven apps

Due to a product limitation, model-driven apps that are not published are not surfaced in the inventory because the are not returned to us from the storage table.

## Large desktop flows

Due to a product limitation, large Desktop Flows may not show up in the inventory as the content field is too large for cloud flows to process.

## Desktop flow runs

In order to see desktop flow runs in the inventory, one of the following must be true:

- Have [attended or unattended desktop flow runs](/power-automate/desktop-flows/run-desktop-flow) in the environment
- Another user has [shared their desktop flow](/power-automate/create-team-flows#share-a-cloud-flow-with-run-only-permissions) with you, which has attended or unattended runs
- You have [permission](/power-platform/admin/database-security) to view all data in the environment

Learn more:

- [Monitor Desktop Flow runs](/power-automate/desktop-flows/monitor-desktop-flow-runs)
- [Automation Kit](https://aka.ms/automationkit)

## Missing custom connectors

We are able to collect only the intersect of all custom connectors outside of solutions, and all custom connectors to which you have access. As a result, custom connectors in a solution, to which the identity running the sync flows do not have access, will not show up in the inventory.

## Inventory and telemetry differences between PowerShell, Power Platform Admin Center, and CoE Starter Kit

If you are using [PowerShell for Power Platform Administrators](/power-platform/admin/powershell-getting-started) and the [Power Platform Admin Center](/power-platform/admin/wp-work-with-admin-portals) together with the CoE Starter Kit, you may be noticing a discrepancy in inventory - for example, the number of apps returned by PowerShell looks different than the number of apps returned by the CoE Starter Kit.

There are expected differences, and the below information should help you understand what to expect.

### App usage

The CoE Starter Kit will display usage (session and unique users) information as far back as to when the [audit log](setup-auditlog.md) was first set up, and gather data to show usage trends over time. The longer you have the CoE starter kit installed for, the more usage data will be gathered. The usage reports in the [Power Platform Admin Center](/power-platform/admin/powerapps-analytics-reports#power-apps---usage-reports) show usage data for the past 30 days only.

### PowerShell

[Get-AdminPowerApp](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerapp) and [Get-AdminFlow](/powershell/module/microsoft.powerapps.administration.powershell/get-adminflow) will always return the latest and most up-to-date inventory of the environment you're querying.

[Get-AdminPowerApp](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerapp) returns only canvas apps and SharePoint custom forms, but not model-driven apps.

[Get-AdminFlow](/powershell/module/microsoft.powerapps.administration.powershell/get-adminflow) returns all cloud flows.

### Power Platform Admin Center

[Power Apps](/power-platform/admin/admin-manage-apps) and [Power Automate](/power-platform/admin/manage-power-automate) resources will always return the latest and most up-to-date inventory of the environment you're looking at. Make sure to refresh the page in the Admin Center to show the latest information.

[Power Apps resources](/power-platform/admin/admin-manage-apps) returns canvas apps and published and unpublished model-driven apps, but not SharePoint custom forms.

[Power Automate resources](/power-platform/admin/manage-power-automate) returns all cloud flows.

### CoE Starter Kit

The [inventory](setup-core-components.md) in the CoE Starter Kit runs daily to look for new and modified resources since the last run. However, certain cleanup flows only run every two weeks. One of these flows is [CLEANUP - Admin | Sync Template v3 (Check Deleted)](core-components.md#flows) which checks if a resource, for example a canvas app, is still in the environment and if not marks it as deleted. This flow compares every row in the CoE tables to every Power Platform resource in your tenant and consumes a high volume of API calls, therefore this and similar flows are scheduled to run only every two weeks. This schedule means that your data may be out of date if resources have been deleted in the past two weeks.

The CoE starter kit expects all [inventory flows](core-components.md#flows) to always run with elevated Power Platform admin privileges. If admin access expires during a flow run or if the flow is run with a user that doesn’t have admin privileges, any resources that can’t be retrieved are marked as deleted in the CoE tables. Once an app is marked as deleted, it will not be marked as active again. Just one flow run with insufficient privileges can therefore have a significant impact on the inventory.

The CoE Starter Kit shows canvas apps, published model-driven apps, and SharePoint custom forms but not unpublished model-driven apps (if the "play" button on a model-driven apps is disabled).

The CoE Starter Kit shows all cloud flows.

### SharePoint custom forms

SharePoint custom forms apps can be either in the Default environment or a [designated SharePoint form environment](/power-platform/admin/powerapps-powershell#designate-sharepoint-custom-form-environment) – or both. For example, if you have existing SharePoint custom forms in the Default environment before you designate a SharePoint form environment, existing forms will remain in the Default environment and will not be migrated.

### Deleted apps and flows

There are two options in the CoE Starter Kit to handle deleted resources – either they are deleted from the inventory table or they are kept in the inventory table and a 'Deleted' field is set to yes (true). This setting is controlled via an Environment Variable called [Also Delete from CoE](setup-core-components.md#all-environment-variables).

If this environment variable is set to **No**, it will keep a record of deleted apps and flows and highlight them as deleted via a field. Depending on the filter you have on the data, you may then still see deleted apps and flows.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
