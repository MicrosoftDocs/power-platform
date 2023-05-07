---
title: "Microsoft Power Platform self-service analytics export Power Platform inventory and usage data (preview)"
description: Export Power Apps canvas apps inventory and usage data to use with your organization's line-of-business scenarios.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/21/2022
ms.subservice: admin
author: tjvass
ms.author: tjvass
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---

# Set up Microsoft Power Platform self-service analytics to export Power Platform inventory and usage data (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

With the Power Platform admin center, you can export Power Platform inventory and usage data directly into [Azure Data Lake Storage](https://azure.microsoft.com/solutions/data-lake/) to use with your organization's line-of-business scenarios. By using your own Data Lake Storage, you can "slice and dice" the data based on your unique requirements. You can build custom reports with Power BI, including views at the individual business unit level and detailed app-level reports at the tenant and environment level. Having the data in your own data lake also means that you can store data for the durations specified in your organization's data retention policies.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

Data Lake Storage is a key part of Cortana Intelligence, meaning that it works with Azure Synapse Analytics, Power BI, and Azure Data Factory for a complete cloud big-data and advanced analytics platform that helps you with everything from data preparation to doing interactive analytics on large-scale datasets. Architected from the ground up for cloud scale and performance, Data Lake Storage is a cost-effective solution to run big data workloads. With Data Lake Storage, your organization can analyze all its data in a single place with no artificial constraints. 

> [!NOTE]
> Enablement of data export will be limited to customers with a paid, premium Microsoft Dataverse license available for the tenant. Details of additional licensing requirements will be provided in admin documentation and in general availability [release plans](/dynamics365/release-plans/). Additional details about minimum Dataverse capacity requirements to access the data export features will be announced in advance of general availability.

## Prerequisites

- To set up data export in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), you'll need one of these roles: Power Platform admin, Dynamics 365 admin, or Microsoft 365 Global admin.

- [Create a storage account](/azure/storage/blobs/create-data-lake-storage-account) to use with Azure Data Lake Storage Gen2. Make sure you select the same location for the data lake storage account as your Power BI tenant. To learn more about how to determine your Power BI tenant location, see [Where is my Power BI tenant located?](/power-bi/admin/service-admin-where-is-my-tenant-located). In addition, you must have *owner* or *contributor* access to the Data Lake Storage account, in addition to *owner* or *contributor* access to the Azure subscription. 

  > [!NOTE]
  > Your organization's Azure Active Directory (Azure AD) global admin must be the one who sets up the connection. This is required because your tenant has to allow the service to access the Data Lake Storage account. This is a one-time setup only, and will need to be performed by the Azure AD admin.

## Simplify data with Data Lake Storage

[Data Lake Storage](/azure/architecture/data-guide/scenarios/data-lake) enables you to store captured data of any size, type, or ingestion speed in one single, secure location for operational and exploratory analytics. You can use Microsoft Power Platform self-service analytics to export Power Apps inventory and usage data directly to your [Data Lake Storage Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) locations.

You can store exported data for extended durations, and you can move data to data warehouses. To learn more about building custom reports at tenant and environment levels across business units, see [Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md).

## Extensible analytics with Data Lake Storage

You can use Power Platform admin center self-service options based on Data Lake Storage to extend Power Apps telemetry by using data from other sources. Use cloud analytics and AI to take advantage of predictive analytics within service monitoring solutions. The following diagram illustrates an example of how to derive intelligence from Power Platform telemetry data. 

:::image type="complex" source="media/azure-resources.png" alt-text="Diagram showing Azure resources.":::
A diagram of limitless extensibility options through using cloud analytics and AI is divided into three areas. Microsoft Power Platform apps - Power BI, Power Apps, and Power Automate - are shown collectively supplying governance, monitoring, and management to the middle area, the customer's Data Lake Storage. The data lake includes Power Platform admin center analytics and organizational datasets, all informed by cloud intelligence. On the right, the customer's dashboard is the core of an app workspace where data lake data is analyzed and acted on.
:::image-end:::

## Data

The amount of data that you can export depends on your app and flow usage. The initial export includes inventory data of all the Power Apps and Cloud flows across your environment. After the initial export, an incremental data push occurs daily.

For example, an enterprise customer with two years' worth of inventory data might have 300 MB of data to export. After the initial export, approximately 5 to 10 MB of that data would be pushed daily.


## Set up the data export process for your tenant

Admins should use the Power Platform admin center to set up the data export. Before you begin exporting data, ensure that your Data Lake Storage Gen2 account has been set up as described in this section. Be certain that the admin who sets up the data export already has access to your storage account.

Follow these steps to set up the data lake.

1. Sign in to the Power Platform admin center as an Azure AD global admin, select **Export to Azure Data Lake**, and then select **Power Apps** or **Cloud flows**.

   :::image type="content" source="media/export-data-lake-power-apps.png" alt-text="Screenshot showing Power Apps selected for export to data lake.":::

2. Set **Enable tenant-level analytics** to **On**.

   :::image type="content" source="media/enable-tenant-level-analytics-data-export.png" alt-text="Screenshot showing Enable tenant-level analytics turned on.":::

3. Choose a subscription to associate with the Azure storage account.

4. In the list of resource groups under this subscription, select a resource group.

5. In the list of storage accounts under the selected resource group, select the Azure storage account.

6. Select **Create** to set up the connection to Data Lake Storage Gen2.

> [!NOTE]
> Resource inventory and 30 days of historical usage data will be exported into the Azure storage account over the next several hours.

### First-time setup of a data export

Microsoft requires that the first time you set up a data export to your organization's data lake, your Azure AD global admin must be the person who sets up the connection.

> [!IMPORTANT]
> A connection with Microsoft's tenant service is required because your tenant must enable principal access to your organization's property; in this case, a [Data Lake Storage Gen2 account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration). This is a one-time setup, which must be performed by your Azure AD admin. When your Azure AD admin grants access permissions to your Azure AD tenant, the process temporarily allows the Microsoft service principal account to export and write data to your Data Lake Storage Gen2 specified storage account only. The Microsoft service principal account used for this will not be granted any permissions for other operations in your Data Lake Storage account.



### See also
[Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md) <br />



[!INCLUDE[footer-include](../includes/footer-banner.md)]
