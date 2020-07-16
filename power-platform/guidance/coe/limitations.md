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

There is no "one size fits all" solution for a Center of Excellence (CoE). Some companies will want a very restrictive set of rules on their organization in hopes of mitigating the unknown, while others will want to let users personally explore without limitations. Because of this, the CoE Starter Kit doesn't come equipped with a set of design patterns for everyone. For example, there are no components that are configured to automatically delete resources, because we didn't want to provide a tool that might unintentionally disrupt a business when installed. Therefore, if your organization wants a more restrictive implementation, it must be implemented in addition to these tools.

In addition to this high-level warning, the following notes pertain to limitations on some components.

## Timeouts in the Admin | Sync Template V2

The Common Data Service connector might experience some throttling limits if the tenant has a lot of resources. If you see 429 errors in the flow run history occurring in the later runs, you can try the following resolution steps:

1. **Configure retry policy**
    1. Open **Admin \| Sync Template v2**, and then select **Edit**.
    1. Expand the step: **Get Environments and store them in the CoE Common Data Service Entity**.
    1. Expand the step: **Apply to each Environment**
    1. Go to the **Settings** pane for each call to Common Data Service, and configure the timeout/retry settings. <br> ![Configure retry policy](media/coe72.png "Configure the retry policy")

1. **Configure concurrency in Foreach**<br>
    Reduce concurrency in Foreach loops to reduce simultaneous calls:
    1. Open **Admin \| Sync Template v2**, and then select **Edit**.
    1. Expand the step: **Get Environments and store them in the CoE Common Data Service Entity**.
    1. Go to Settings for the **Apply to each Environment** step. <br>![Configure concurrency in Foreach](media/coe73.png "Configure concurrency in Foreach")
    1. Reduce the **Degree of Parallelism** by using the slider. The default value is 50; reducing the parallelism here will increase the runtime of the flow, so we suggest gradually lowering the number.

## Data loss prevention (DLP) editor

- The Environments call returns only the first 2,000 environments.
- The tool can't write back Environment-type policies.

## DLP customizer

- The tool currently doesn't work for custom connectors that are installed as part of a managed solution.

## Government community cloud (GCC) environments

- The CoE Starter Kit is available for GCC environments; however, the custom connector to connect to Office 365 Audit Logs isn't available for GCC environments yet.
- Embedding Power Apps canvas apps in Power BI Dashboards is not available for GCC environments yet.

## Developer environments from the Power Apps Community Plan

- Microsoft Power Platform protects developer-type SKUs from inquiry by non-authenticated users. This means that the Model Driven Apps in developer SKUs will be skipped from our tally work in the sync flow Admin | Sync Template v2 (Model Driven Apps).
- To fix this, you must have your admin security role added to the security roles for all developer environments, and then remove the check from the sync flow.
More information: [Power Apps Community Plan](https://docs.microsoft.com/powerapps/maker/dev-community-plan)

## Sync Flow (Model Driven Apps)

- It currently isn't possible to retrieve model-driven apps for developer environments (*My Name's* environment).

## Custom connectors and DLP

To add custom connectors shipped as part of this solution to the business data&ndash;only group of your DLP policy, use the PowerShell cmdlets.

1. Install the [PowerShell cmdlets for Power Apps](https://docs.microsoft.com/power-platform/admin/powerapps-powershell).

1. List all DLP policies, and copy the *PolicyName* (GUID) of the policy that is applied to your CoE Starter Kit environment.

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

## Shared Component Library in the Theming components

The Shared Component Library part of the [Theming components](theming-components.md) is not editable. Make your own copy to expand it.
