---
title: "Preview: View usage and billing information | MicrosoftDocs"
description: View usage and billing information for your pay-as-you-go plan.
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
# Preview: View usage and billing information

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

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

## Next step

[Preview: Known issues and frequently asked questions](pay-as-you-go-issues-faq.md)


### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]