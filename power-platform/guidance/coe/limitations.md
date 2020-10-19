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

There is no "one size fits all" solution for a Center of Excellence (CoE). Some companies will want a very restrictive set of rules on their organization in hopes of mitigating the unknown, while others will want to let users personally explore without limitations. Because of this, the CoE Starter Kit doesn't come equipped with a set of design patterns for everyone. For example, there are no components that are configured to automatically delete resources, because we didn't want to provide a tool that might unintentionally disrupt a business. Therefore, if your organization wants a more restrictive implementation, it must implement those restrictions in addition to using the tools from the starter kit.

The following sections describe limitations for some components.

## Timeouts in the Admin | Sync Template V2

The Common Data Service connector might experience some throttling limits if the tenant has a lot of resources. If you see 429 errors in the flow run history occurring in later runs, you can try the following resolution steps:

- **Configure the retry policy**
  1. Open **Admin \| Sync Template v2**, and then select **Edit**.
  1. Expand the step **Get Environments and store them in the CoE Common Data Service Entity**.
  1. Expand the step **Apply to each Environment**
  1. Go to the **Settings** pane for each call to Common Data Service, and configure the timeout/retry settings. The default count is set to **10** and the default interval is set to **PT10S** - increase the values incrementally here.

     ![Configure retry policy](media/coe72.png "Configure the retry policy")

- **Configure (reduce) concurrency in Foreach loops to reduce simultaneous calls**
  1. Open **Admin \| Sync Template v2**, and then select **Edit**.
  1. Expand the step **Get Environments and store them in the CoE Common Data Service Entity**.
  1. Go to **Settings** for the **Apply to each Environment** step.

     ![Configure concurrency in Foreach](media/coe73.png "Configure concurrency in Foreach")

  1. Use the slider to reduce the value of **Degree of Parallelism**. The default value is 50; reducing the parallelism here will increase the runtime of the flow, so we suggest gradually lowering the number.

<!-- currently this apps are not available ## DLP Editor

- The Environments call returns only the first 2,000 environments.
- The app can't write back environment-type policies.

## DLP Customizer

The app currently doesn't work for custom connectors that are installed as part of a managed solution. -->

## Government Community Cloud (GCC) environments

- The CoE Starter Kit is available for GCC environments; however, the custom connector to connect to Microsoft 365 audit logs isn't available for GCC environments yet.
- Embedding Power Apps canvas apps in Power BI dashboards isn't available for GCC environments yet.

## Developer environments from the Power Apps Community Plan

Microsoft Power Platform protects developer-type SKUs from inquiry by non-authenticated users. This means that the model-driven apps in developer SKUs will be skipped from our tally work in the sync flow Admin | Sync Template v2 (Model Driven Apps).

To fix this, you must have your admin security role added to the security roles for all developer environments, and then remove the selection from the sync flow. More information: [Power Apps Community Plan](https://docs.microsoft.com/powerapps/maker/dev-community-plan)

## Sync flow (model-driven apps)

It currently isn't possible to retrieve model-driven apps for developer environments (*My Name*'s environment).

## Custom connectors and DLP

To add custom connectors shipped as part of this solution to the business data&ndash;only group of your data loss prevention (DLP) policy, use PowerShell cmdlets.

1. Install the [PowerShell cmdlets for Power Apps](https://docs.microsoft.com/power-platform/admin/powerapps-powershell).

1. List all DLP policies, and copy the *PolicyName* (GUID) of the policy that's applied to your CoE Starter Kit environment.

    ```powershell
    Get-AdminDlpPolicy
    ```

1. Go to [flow.microsoft.com](https://flow.microsoft.com) > **Data** > **Custom Connector**, and then select **Edit** on the custom connector.

   ![Edit the  connector](media/DLP-CC2.png "Edit the custom connector")

1. Copy the connector name.

   ![Copy the connector name](media/DLP-CC3.png "Copy the connector name")

1. In PowerShell, use Add-CustomConnectorToPolicy to add the custom connector to your policy.

    ```powershell
    Add-CustomConnectorToPolicy -PolicyName {your policy name GUID} -ConnectorName {the nName you copied from above} -GroupName hbi -ConnectorId /providers/Microsoft.PowerApps/scopes/admin/environments/{your environment GUID{/apis/{your connector name} -ConnectorType "Custom"
    ```

## Security groups and approvals

We recommend against using security groups to control access to the CoE environment, because it's likely that users who don't have access to this environment will be participating in approvals.
If you choose to use a security group to control access, users will have to be a part of that group to work with the archival solutions.

## Shared component library in the theming components solution

The shared component library in the [theming components solution](theming-components.md) isn't editable. Make your own copy if you want to extend it.
