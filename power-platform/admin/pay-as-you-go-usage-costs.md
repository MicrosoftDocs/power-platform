---
title: "View usage and billing for pay-as-you-go plan | MicrosoftDocs"
description: Aggregated billing information is available in the Azure portal, and detailed usage drill-downs are available in the Power Platform admin center.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/09/2021
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

Aggregated billing information is available in the Azure portal, and detailed usage drill-downs are available in the Power Platform admin center. Reporting is available for Power Apps per-app meter and Dataverse capacity add-on meters. Overages for the Power Platform request meter are not reported or charged at this point.

### View billing information in the Azure portal

All Power Platform meters are billed to Azure subscriptions. You can view the amounts that have been billed for each meter in the Azure portal using Azure Cost Management. Billed amounts are updated daily (and sometimes more frequently), but it can take up to 24 hours after usage of a Microsoft Power Platform service to show up in Azure Cost Management.

Within Azure Cost Management, you can filter and view billing details by meter and/or by Azure resource. Note that each billing policy corresponds to a Power Platform account resource. So to view charges for a specific billing policy, simply filter for the Power Platform account resource of the same name.

:::image type="content" source="media/pay-as-you-go-billing-info-azure-portal.png" alt-text="Billing information in the Azure portal":::

### View detailed usage information in the Power Platform admin center

While Azure Cost Management can show the amount that was billed for each meter and each billing policy, it won't provide a breakdown of which environments, apps, and users drove usage of the meters. For this level of information, a downloadable report is available on the **Billing policies** page in the Power Platform admin center.

:::image type="content" source="media/pay-as-you-go-powerapps-download-reports.png" alt-text="Select Download reports":::

>[!NOTE]
>During the preview, detailed usage reporting is only available for the past 30 days.  In the future, more billing periods will be available in the usage report download experience.

The downloadable report contains the following fields:

| Field                  | Description            |
|------------------------|------------------------|
| Billing Policy ID       | The unique policy identifier |
| Azure Subscription ID   | The unique Azure subscription identifier |
| Billing Period Start Date | The first calendar day of the billing period month |
| Billing Period End Date | The last calendar day of the billing period month |
| Environment ID | The unique Power Platform environment identifier |
| Environment Region | Not available during preview |
| Caller ID | The unique identifier of the calling identity. This can be null or empty. |
| Caller Type | The type of caller identity. Applicable values are User, Application, or Microsoft when the caller is Microsoft. |
| Resource Type | The type of resource. Applicable values are Dataverse, Power Apps, and Power Automate. |
| Resource ID | The unique resource identifier. Based on the Resource Type, this could be a Power App ID, Dataverse Organization ID, or Power Automate Flow ID. |
| Meter Category | The top-level classification of the meter. This will be either Power Apps or Dataverse. See [meter details](pay-as-you-go-meters.md). |
| Meter Subcategory | The detailed classification of the meter. For Power Apps, subcategory field is Launch. For Dataverse, subcategory fields are Database, File, and Log, based on the consumption type.
| Usage Datetime | The date and time of when the usage was captured |
| Billing Model | Pay-as-you-go |
| Entitled Quantity | The value of any free entitlement for the submeter |
| Consumed Quantity | The usage for the submeter |
| Overage Quantity | Calculated by reducing Consumed Quantity by Entitled Quantity | 
| Billed Quantity | Calculated by the unit of measure and reporting frequency |
| Unit of measure | The measure that billing occurs to Azure for the submeter | 

Here is a sample of a detailed usage report:

:::image type="content" source="media/paygo_detailedusage.png" alt-text="Sample detailed usage report" lightbox="media/paygo_detailedusage.png":::


### Determining billed quantity

The units of measure and the reporting frequency impact the granular billed quantity amount in both the usage report and the quantities sent to Azure.  Today, usage is reported to Azure three times per 24-hour period. 

There are two types of units of measure: unique users, which are measured in numbers, and the Dataverse capacity, which is measured in gigabytes.

For the Power Apps per-app meter, you'll see the number of unique users in the report, which will be a numeric quantity such as 15. This means that a total of 15 unique users ran at least one app or portal in a month.

For Dataverse capacity add-on meters, units are in gigabytes per month, with three usage reports sent to Azure every 24 hours. In your report, you'll see capacity distribution across database, files, and logs based on your consumption. 

## How to manage costs

You can leverage Azure Cost Management and alerting to effectively manage spending within your organization. When budget amounts are approached or reached, you can configure alerts to be sent automatically or trigger actions to take place. For more details, go to [Tutorial: Create and manage Azure budgets](/azure/cost-management-billing/costs/tutorial-acm-create-budgets) and [Create and manage action groups in the Azure portal](/azure/azure-monitor/alerts/action-groups).  

Azure Cost Management provides options to set budgets for Azure resources and specific meters. You can use these capabilities to set budgets at a billing policy level by setting a budget for its corresponding Power Platform account resource. You can also set budgets for individual Power Platform meters.

## Next step

[Preview: Known issues and frequently asked questions](pay-as-you-go-issues-faq.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
