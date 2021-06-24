---
title: "Preview: Set up Power Platform self-service analytics to export Power Apps inventory and usage data"
description: Export Power Automate canvas apps inventory and usage data to use with your organization's line of business (LOB) scenarios.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/21/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Preview: Set up Power Platform self-service analytics to export Power Apps inventory and usage data

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Power Platform admin center enables you to export Power Apps inventory and usage data directly into your [Azure Data Lake](https://azure.microsoft.com/solutions/data-lake/) to use with your organization's line of business (LOB) scenarios. Using your own Azure Data Lake allows you to slice and dice the data based on your unique requirements. You can build custom reports with Power BI, including views at the individual business unit level and detailed app-level reports at the tenant and environment level. Having the data in your own data lake also means the data can be stored for durations as required by your organization's data retention policies.

Data Lake is a key part of Cortana Intelligence, meaning that it works with Azure Synapse Analytics, Power BI, and Data Factory for a complete cloud big data and advanced analytics platform that helps you with everything from data preparation to doing interactive analytics on large-scale datasets. Architected from the ground up for cloud scale and performance, Azure Data Lake is a cost-effective solution to run big data workloads.  With Azure Data Lake Store your organization can analyze all of its data in a single place with no artificial constraints. 

> [!NOTE]
> At general availability, enablement of data export will be limited to customers with a paid/premium Microsoft Dataverse licenses available for the tenant. Details of these requirements will be provided in admin documentation and in general availability [release plans](/dynamics365/release-plans/). Additional details on minimum Dataverse capacity requirements to access the Data Export features will be announced in advance of general availability.

## Prerequisites

Follow these steps to export Power Apps inventory and usage data.

1. To set up data export in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) you'll need one of these roles: Power Platform Service admin, Dynamics 365 admin, or Microsoft 365 Global admin.

2. [Create a storage account](/azure/storage/blobs/create-data-lake-storage-account) to use with Azure Data Lake Gen 2.  Make sure you select the same location for the data lake storage account as your Power BI tenant. To learn more on how to determine the Power BI tenant location, see [Where is my Power BI tenant located?](/power-bi/admin/service-admin-where-is-my-tenant-located).  In addition, they must have *owner* or *contributor* access to the Azure Data Lake storage account, as well as *owner* or *contributor* access to the Azure subscription. 

3. The organization's Azure Active Directory global admin to be the one who sets up the connection.

   > [!NOTE]
   > This is required as your tenant has to allow the service to access the Azure Data Lake storage 
   > account. This is a one-time set up only and will need to be performed by the Azure AD admin.   

## Simplify data with Azure Data Lake Store

[Azure Data Lake Store](/azure/architecture/data-guide/scenarios/data-lake) enables you to store captured data of any size, type, and ingestion speed in one single secure location for operational and exploratory analytics. You can use Power Platform self-service analytics to export Power Apps inventory and usage data directly to your [Azure Data Lake Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) storage locations.

You can store exported data for extended durations, as well as move data to data warehouses. To learn more about building custom reports at tenant and environment levels across business units, see [Prepare Power Apps inventory and usage data for consumption and displaying data insights](build-custom-reports.md).

## Extensible analytics with Azure Data Lake

[TBD architecture diagram]

## Data

The amount of data that you can export depends upon your Power Apps usage. The initial [Common Data Model (CDM)](/common-data-model/) schema file contains inventory data of all the Power Apps in your related information. After the initial export, an incremental data push occurs daily.

For example, an enterprise customer with two years of inventory data may have about 300MB of data to export. After the initial export, approximately 5-10 MB of that data would be pushed daily.

<!--
## Simplify data with Azure Data Lake Store

[Azure Data Lake Store](/azure/architecture/data-guide/scenarios/data-lake) enables you to store captured data of any size, type, and ingestion speed in one single secure location for operational and exploratory analytics. You can use Power Platform self-service analytics to export Power Apps inventory and usage data directly to your [Azure Data Lake Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) storage locations.

You can store exported data for extended durations, as well as move data to data warehouses. To learn more about building custom reports at tenant and environment levels across business units, see [Prepare Power Apps inventory and usage data for consumption and displaying data insights](build-custom-reports.md).
-->
## Set up the data export process for your tenant

Admins should use the Power Platform admin center to set up the data export. Before you begin exporting data, ensure that your Data Lake Gen2 storage account has been set up as described in this section. Be certain that the admin who sets up the data export already has access to your storage account.

Follow these steps to set up the data lake.

1. Sign in to the Power Platform admin center as an Azure AD global admin, select **Export to Azure Data Lake**, and then select **Power Apps**.

   :::image type="content" source="media/export-data-lake-power-apps.png" alt-text="Export Power Apps to data lake":::

2. Set **Enable tenant-level analytics** to **On**.

   :::image type="content" source="media/enable-tenant-level-analytics-data-export.png" alt-text="Enable tenant-level analytics for data export":::

3. Choose a subscription to associate with the Azure storage account.

4. A list of resource groups under this subscription will be displayed. Select a resource group.

5. A list of storage accounts under the selected resource group will be displayed. Select the Azure storage account.

6. Select **Create** to set up the connection to your Azure Data Lake Gen2.

> [!NOTE]
> Resource inventory and 30 days of historical usage data will be exported into the Azure storage account over the next several hours.

### First time setup of a data export

The first time you set up a data export to your organization's data lake, Microsoft requires that your Azure Active Directory (Azure AD) global admin be the person who sets up the connection.

> [!IMPORTANT]
> A connection with Microsoft's tenant service is required because your tenant must enable principal access to your organization's property; in this case, an [Azure Data Lake Gen2 storage account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration). This is a one-time set up which must be performed by your Azure AD admin.  When your AAD admin grants access permissions to your Azure AD tenant, the process temporarily allows the Microsoft service principal account to export and write data to your Azure Data Lake's specified storage account only. The Microsoft service principal account used for this will not be granted any permissions for other operations in your Azure Data Lake account.
<!-- 
**Set up using the Power Platform admin center portal**

Follow the steps below for setting up your data lake using the [Power Platform Admin Center](https://aka.ms/ppac) portal, and for setting up an Azure Data Lake Gen 2 connection for the first time:

1. Have your Azure AD global admin log into the PPAC portal at [https://aka.ms/ppac](https://aka.ms/ppac).

2. Select the **Export to Azure Data Lake** option.

3. Select **Power Apps**.

4. Choose a subscription from the list that the admin has access to.

5. Choose a resource group from the list in the **Subscription** group.

6. Choose a storage account from the list of accounts in the **Resource** group.

7. Select **Create** to provide consent for the Power Platform admin center to set up the connection to your Azure Data Lake Gen2 account.

> [!NOTE]
> This option also provides *write* permissions for export of the data to the specified storage account only. No other permissions are being consented to by the customer's global tenant admin.

8. You will now be taken to a dashboard that displays the connection name.

The setup process is now complete, and your data will be exported within 48 hours. The data will then be exported to your tenant's data lake every 24 hours.
-->
## Set up the data export process for your tenant

[TBD add feature setup process]

Check back for the setup process.

### See also
[Prepare Power Apps inventory and usage data for consumption and displaying data insights](build-custom-reports.md) </br>
[Creating custom dashboards using Power Apps inventory and usage data](build-custom-reports.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
