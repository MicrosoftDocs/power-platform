---
title: View usage and billing for pay-as-you-go plan 
description: Aggregated billing information is available in the Azure portal, and detailed usage drill-downs are available in the Power Platform admin center.
author: Kavishi
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/14/2025
ms.subservice: admin
ms.author: kaagar
ms.reviewer: sericks 
contributors:
  - amiyapatr-zz
  - ShawnNandiMSFT
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---
# View usage and billing information

Aggregated billing information is available in the Azure portal, and detailed usage drill-downs are available in the Power Platform admin center. Reporting is available for Power Platform (Power Apps per-app, Copilot Studio meter, and Dataverse capacity add-on meters) and Microsoft 365 (Copilot Chat via Copilot Studio meter) consumptive services. 

In March 2022, we released a preview of the Power Platform requests meter. During this preview, we'll report on usage of Power Platform requests in the Power Platform admin center downloadable report. However, we won't bill for this usage until we reach general availability (GA) for this meter; usage won't appear in the Azure portal until then. 

### View billing information in the Azure portal

All Power Platform and Microsoft 365 Copilot meters are billed to Azure subscriptions. You can view the amounts that have been billed for each meter in the Azure portal using Azure Cost Management. Billed amounts are updated daily (and sometimes more frequently), but it can take up to 24 hours after usage of a service to show up in Azure Cost Management.

Within Azure Cost Management, you can filter and view billing details by meter and/or by Azure resource. Each billing plan corresponds to a Power Platform account resource. So to view charges for a specific billing plan, simply filter for the Power Platform account resource of the same name.

:::image type="content" source="media/pay-as-you-go-billing-info-azure-portal.png" alt-text="Billing information in the Azure portal":::

### View detailed usage information in the Power Platform admin center

While Azure Cost Management can show the amount that was billed for each meter and each billing policy, it won't provide a breakdown of which environments, apps/agents, and users drove usage of the meters. For this level of information, a downloadable report is available on the **Billing plan** page in the Power Platform admin center.

:::image type="content" source="media/pay-as-you-go-powerapps-download-reports.png" alt-text="Select Download reports":::

The downloadable report contains the following fields:


| Field                  | Description            |
|------------------------|------------------------|
| Billing Policy ID       | The unique policy identifier |
| Billing Policy | The display name of the billing policy |
| Environment ID | The unique Power Platform environment identifier |
| Environment Name | The display name of environment |
| Environment Region | Not available during preview |
| Caller ID | The unique identifier of the calling identity. This can be null or empty. |
| Caller Type | The type of caller identity. Applicable values are User, Non Licensed User, Application, or Microsoft when the caller is Microsoft. |
| Resource Type | The type of resource. Applicable values are Dataverse, Power Apps, and Power Automate. |
| Resource ID | The unique resource identifier. Based on the Resource Type, this could be an app ID, Dataverse Organization ID, or Power Automate Flow ID. This can be null or empty.|
| Meter Category | The top-level classification of the meter. This will be either Power Apps, Dataverse, or Power Platform request. See [meter details](pay-as-you-go-meters.md). |
| Meter Subcategory | The detailed classification of the meter. For Power Apps, subcategory field is Launch. For Dataverse, subcategory fields are Database, File, and Log, based on the consumption type.
| Usage Datetime | The date and time of when the usage was captured |
| Entitled Quantity | The value of any free entitlement for the submeter |
| Consumed Quantity | The usage for the submeter |
| Overage Quantity | Calculated by reducing Consumed Quantity by Entitled Quantity | 
| Billed Quantity | Calculated by the unit of measure and reporting frequency |
| Unit of measure | The measure that billing occurs to Azure for the submeter |
| Status | Indicates if it's getting billed to Azure or if it's in Preview and not billed |


### Determining billed quantity

The units of measure and the reporting frequency impact the granular billed quantity amount in both the usage report and the quantities sent to Azure.  Today, usage is reported to Azure three times per 24-hour period. 

There are three types of units of measure: 

- **Unique users**, which are measured in numbers.
- **Agent usage**, which is measured in messages.
- **Dataverse capacity**, which is measured in gigabytes.

For the Power Apps per-app meter, you'll see the number of unique users in the report, which is a numeric quantity, such as 15. This means that a total of 15 unique users ran at least one app or portal in a month.

For Dataverse capacity add-on meters, units are in gigabytes per month, with three usage reports sent to Azure every 24 hours. In your report, you'll see capacity distribution across database, files, and logs based on your consumption. 

For agent meters, units are in messages consumed, which is a numeric quantity like 32. This means that a total of 32 messages units have been consumed. 

## How to manage costs

You can use Azure Cost Management and alerting to effectively manage spending within your organization. When budget amounts are approached or reached, you can configure alerts to be sent automatically or trigger actions to take place. For more details, go to [Tutorial: Create and manage Azure budgets](/azure/cost-management-billing/costs/tutorial-acm-create-budgets) and [Create and manage action groups in the Azure portal](/azure/azure-monitor/alerts/action-groups).  

Azure Cost Management provides options to set budgets for Azure resources and specific meters. You can use these capabilities to set budgets at a billing policy level by setting a budget for its corresponding Power Platform account resource. You can also set budgets for individual Power Platform meters.

## Next step

[Known issues and frequently asked questions](pay-as-you-go-issues-faq.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
