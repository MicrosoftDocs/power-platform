---
title: Set up Power Platform self-service analytics to export Power Apps inventory and usage data
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

# Set up Power Platform self-service analytics to export Power Apps inventory and usage data

Power Platform self-service analytics enables you to export Power Apps inventory and usage data to use with your organization's line of business (LOB) scenarios. You can then use the exported data to create [Power BI data flow](https://docs.microsoft.com/en-us/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) that access [Azure Data Lake Gen2 storage locations](https://docs.microsoft.com/en-us/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration). You can also use the exported data to build custom reports as part of your existing enterprise dashboards.

## Prerequisites

To export Power Apps inventory and usage data, you need:

-   tenant-level admin permission to access to all your organization's environments.

-   environment-level admin permission to access only those environments that you have a contributor or environment admin role for.

## Export data based on your specific business needs

The amount of data that you can export depends upon your Power Apps usage. The initial [Common Data Model (CDM)](https://review.docs.microsoft.com/en-us/common-data-model/) schema file contains inventory data of all the Power Apps in your related information. After the initial export, an incremental data push occurs daily.

For example, an enterprise customer with two years of inventory data may have about 300MB of data to export. After the initial export, approximately 5-10 MB of that data would be pushed daily.

## Behind the scenes

[TBD architecture diagram]

## Simplify data with Azure Data Lake Store

[Azure Data Lake Store](https://docs.microsoft.com/en-us/azure/architecture/data-guide/scenarios/data-lake) enables you to store captured data of any size, type, and ingestion speed in one single secure location for operational and exploratory analytics. You can use Power Platform self-service analytics to export Power Apps inventory and usage data directly to your [Azure Data Lake Gen2](https://docs.microsoft.com/en-us/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) storage locations.

You can store exported data for extended durations, as well as move data to data warehouses. To learn more about building custom reports at tenant and environment levels across business units, see [Prepare Power Apps inventory and usage data for consumption and displaying data insights](build-custom-reports.md).

## Set up the data export process for your tenant

Admins should use the Power Platform admin center to set up the data export. Before you begin exporting data, ensure that your Data Lake Gen2 storage account has been set up as described in this section. Be certain that the admin who sets up the data export already has access to your storage account.

### First time setup of a data export

The first time you set up a data export to your organization's data lake, Microsoft requires that your Azure Active Directory (Azure AD) global admin be the person who sets up the connection.

> [!IMPORTANT]
> A connection with Microsoft's tenant service is required because your tenant must enable principal access to your organization's property; in this case, an [Azure Data Lake Gen2 storage account](https://docs.microsoft.com/en-us/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration). This is a one-time set up and will need to be performed by your Azure AD admin.

When your ADD admin grants access permissions to your Azure AD tenant, the process temporarily allows the Microsoft service principal account to export and write data to your Azure Data Lake Gen2's specified storage account only. The Microsoft service principal account used for this will not be granted any permissions for other operations in your Azure Data Lake Gen2 account.

**Set up using the Power Platform admin center portal**

Follow the steps below for setting up your data lake using the [Power Platform Admin Center](https://aka.ms/ppac) (PPAC) portal, and for setting up an Azure Data Lake Gen 2 connection for the first time:

1.  Have your Azure AD global admin log into the PPAC portal at [https://aka.ms/ppac](https://aka.ms/ppac).

2.  Select the **Export to Azure Data Lake** option.

3.  Select **Power Apps**.

4.  Choose a subscription from the list that the admin has access to.

5.  Choose a resource group from the list in the **Subscription** group.

6.  Choose a storage account from the list of accounts in the **Resource** group.

7.  Select **Create** to provide consent for the PPAC to set up the connection to your Azure Data Lake Gen2 account.

> [!NOTE]
> This option also provides *write* permissions for export of the data to the specified storage account only. No other permissions are being consented to by the customer's global tenant admin.

8.  You will now be taken to a dashboard that displays the connection name.

The setup process is now complete, and your data will be exported within 48 hours. The data will then be exported to your tenant's data lake every 24 hours.

## See also
[Prepare Power Apps inventory and usage data for consumption and displaying data insights](build-custom-reports.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
