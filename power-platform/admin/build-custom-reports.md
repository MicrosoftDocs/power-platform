---
title: "Create custom dashboards with Power Platform inventory and usage data (preview)"
description: Use Power Apps exported data with other line-of-business scenarios and display data insights at tenant and environment levels across business units.
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/30/2022
ms.subservice: admin
author: Zeffin
ms.author: johnev
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Create custom dashboards by using Power Platform inventory and usage data (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This topic discusses how you can use data exported from Power Platform and with other line-of-business scenarios, and display data insights at tenant and environment levels across business units. For example, you can use exported Power Platform inventory and usage data for your existing enterprise dashboards and other custom solutions.

## Background

Microsoft Power Platform self-service analytics enables you to export Power Apps inventory and usage data to [Azure Data Lake Storage Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) storage locations. To learn more about exporting Power Platform inventory and usage data to a Common Data Model schema file, go to [Set up Microsoft Power Platform self-service analytics to export Power Platform inventory and usage data](self-service-analytics.md). 

## Extensible analytics with Data Lake Storage

You can use Power Platform admin center self-service options based on Data Lake Storage to extend Power Platform telemetry by using data from other sources. Use cloud analytics and AI to take advantage of predictive analytics within service monitoring solutions. The following diagram illustrates an example of how to derive intelligence from Power Platform telemetry data. 

:::image type="complex" source="media/azure-resources.png" alt-text="Diagram showing Azure resources.":::
A diagram of limitless extensibility options through using cloud analytics and AI is divided into three areas. Microsoft Power Platform apps - Power BI, Power Apps, and Power Automate - are shown collectively supplying governance, monitoring, and management to the middle area, the customer's Data Lake Storage. The data lake includes Power Platform admin center analytics and organizational datasets, all informed by cloud intelligence. On the right, the customer's dashboard is the core of an app workspace where data lake data is analyzed and acted on.
:::image-end:::


## View exported data

### View exported data by using Power BI

Exported data intended for use with Power BI is stored internally by default. When using Power BI to view exported data, make sure you select the same location for the data lake [storage account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) as your Power BI tenant. If you need to find the location of your Power BI tenant, see [Where is my Power BI tenant located](/power-bi/admin/service-admin-where-is-my-tenant-located)?

As soon as data is available in your data lake, you can choose to move data to any reporting store; for example, a SQL data warehouse. For this you'll need to build custom Power BI reports. You can also choose to build [Power BI reports off Data Lake Storage](/power-bi/transform-model/service-dataflows-azure-data-lake-integration).

### View data in the Azure portal  

You can also view data by using the Azure portal.

1. Go to [https://portal.azure.com](https://portal.azure.com/).

2. Navigate to your storage account by going to **Home** > **Subscriptions** > *your subscription name* > **Resource Groups** > *your resource group* > *your storage accounts* > **Storage Account**.

> [!NOTE]
> To view data in your own storage data lake, you first need to download the [Azure Storage Explorer](https://azure.microsoft.com/features/storage-explorer).

## FAQ

### After setup, what's provisioned in my Data Lake Storage?

Using the [Azure portal](https://portal.azure.com), select **Storage accounts** > **Access Control(IAM)**, and then select the **Role Assignments**
tab. Search for **Power Platform Data Analytics**. You'll see: 

1. That a new Power Platform Data Analytics service principal (app) has been created in Microsoft Entra ID.
2. This principal has been assigned the Storage Blob Data Contributor access to your Data Lake Storage account.

### What setting should I choose for the firewall configuration?

The recommendation for this preview is to use the **Isolate this storage** option. We plan to make our service principal part of the Microsoft Trusted Principals list over the course of maturing our data export process. However, this isn't currently supported in the feature preview. With the dynamic IP allocation model, IP range restrictions aren't an option for firewall setups.

### Is the data model in a standard format?

The data mode uses the extensible Common Data Model schema to describe the tables in the data lake. This will allow easier consumption by different products across Microsoft Power Platform, including Power BI and other systems like SAP or Adobe.

### See also

[Create a storage account](/azure/storage/common/storage-account-create) <br />
[Set up Power Platform self-service analytics to export Power Apps inventory and usage data](self-service-analytics.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
