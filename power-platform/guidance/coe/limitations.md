---
title: "Limitations | MicrosoftDocs"
description: "Limitations to some components within the CoE Starter Kit, such as potential timeouts, Government Community Cloud availability etc."
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
    1. Reduce the **Degree of Parallelism** using the slider. The default value is 50 - reducing the parallelism here will increase the runtime of the flow, so we suggest gradually lowering the number.

## DLP editor

- The Environments call returns only the first 2,000 environments.
- The tool can't write back Environment-type policies.

## Government community cloud (GCC) environments

- The CoE Starter Kit is available for government cloud (GCC) environments; however the custom connector to connect to Office 365 Audit Logs isn't available for GCC environments yet.

## Developer Environments from Power Apps Community Plan

- Power Platform protects Developer type SKUs from inquiry by non-authenticated users.
- This means that the Model Driven Apps in Developer SKUs will be skipped from our tally work in the sync flow Admin | Sync Template v2 (Model Driven Apps).
- To fix this you would need to have your admin security role added to the security roles for all Dev environments, and then remove the check from the sync flow.
- For more information on these environments see [Power Apps Community Plan](https://docs.microsoft.com/powerapps/maker/dev-community-plan).

## Sync Flow (Model Driven Apps)

- It is currently not possible to retrieve model driven apps for Developer environments (My Name's environment).

## Custom Connectors and DLP

There is a gap with the Get-AdminPowerAppConnector action in both PowerShell as well as the management connector which leads to it not returning custom connectors that are shipped as part of a managed solution. This has been reported to the owning team who are looking at a resolution.

In order to add custom connectors to the business data only group of your DLP policy, please follow the following steps using PowerShell cmdlets:

1. Follow the steps here to set up the PowerShell cmdlets, if not already done [PowerShell support for Power Apps](https://docs.microsoft.com/power-platform/admin/powerapps-powershell)

1. Open the DLP Policy you want to add the custom connector to, and note the GUID of the DLP Policy. You can also achieve this by calling Get-AdminDlpPolicy in PowerShell and noting the PolicyName
![Note DLP GUID](media/DLP-CC-1.png)

1. Navigate to flow.microsoft.com > Data > Custom Connector and select Edit on the custom connector
![Edit Custom Connector](media/DLP-CC-2.png)

1. Note the Connector Name (everything between custom and edit)
![Note Connector Name](media/DLP-CC-3.png)

1. In PowerShell, use Add-CustomConnectorToPolicy to add the custom connector to your policy.
The format here is:
Add-CustomConnectorToPolicy -PolicyName {your policy name GUID} -ConnectorName {the nName you copied from above} -GroupName hbi -ConnectorId /providers/Microsoft.PowerApps/scopes/admin/environments/{your environment GUID{/apis/{your connector name}

1. for example this should look like this
Add-CustomConnectorToPolicy -PolicyName fbe6cc78-1234-1234-9362-a87c1618abcd -ConnectorName shared_admin-5foffice-20365-20management-20api-5f218397e7aabcdef -GroupName hbi -ConnectorId /providers/Microsoft.PowerApps/scopes/admin/environments/aab123ca-1234-1234-8b12-eae67cabcdef/apis/shared_admin-5foffice-20365-20management-20api-5f218397e7aabcdef
