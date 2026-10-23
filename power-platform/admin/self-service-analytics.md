---
title: Set up self-service analytics to export inventory and usage data (preview)
description: Learn how to use Power Platform self-service analytics to export inventory and usage data for your organization's business needs.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/22/2026
ms.subservice: admin
author: souravmukherjeedotnet
ms.author: somukhe
ms.reviewer: ellenwehrle
contributors:
  - Mattp123
search.audienceType: 
  - admin
ms.custom: 
  - sfi-ga-blocked
  - NewPPAC
ai-usage: ai-assisted
---

# Set up Microsoft Power Platform self-service analytics to export inventory and usage data (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use the Power Platform admin center to export Power Platform inventory and usage data directly to Azure Data Lake Storage. In your own data lake, you can retain data according to your organization's data retention policies. You can also use Power BI to create custom reports with business unit-level views and detailed app information at the tenant and environment levels.

> [!IMPORTANT]
>
> - This feature is in preview.
> - Preview features aren't meant for production use and might have restricted functionality. Microsoft provides these features before an official release so that customers can get early access and provide feedback.
> - During this preview, the list of established subscriptions shows only the first 50 subscriptions created in the tenant.

> [!NOTE]
> Microsoft is retiring the preview version of data export. Inventory data exports stop after December 1, 2026. Usage and environment data exports continue through existing and new configurations. Data you already exported remains in your data lake. Expect another notification from Microsoft when inventory data exports stop.
>
> To prepare, use the [Power Platform inventory API](inventory-api.md) to export inventory data programmatically. Before you migrate, review the [field mappings and known gaps](inventory-data-availability-differences.md). Some data export inventory fields aren't available through the API or have different coverage.
>
> The Power Platform inventory API doesn't automatically export data to customer-owned storage. To create a recurring export, use an Azure service, such as [Azure Functions](/azure/azure-functions/functions-overview), [Azure Logic Apps](/azure/logic-apps/logic-apps-overview), or [Azure Automation](/azure/automation/overview), to query the Power Platform inventory API on a schedule and write the results to [Azure Blob Storage](/azure/storage/blobs/storage-blobs-introduction), [Azure Data Lake Storage](/azure/storage/blobs/data-lake-storage-introduction), or another supported destination.

Azure Data Lake Storage integrates with [Azure Synapse Analytics](/azure/synapse-analytics/overview-what-is), [Power BI](/power-bi/fundamentals/power-bi-overview), and [Azure Data Factory](/azure/data-factory/introduction) to support large-scale data and advanced analytics. It's designed for cloud scale and performance and provides a cost-effective way to run big data workloads. Your organization can use Data Lake Storage to analyze data in one location without artificial constraints.

Data export is available only to customers who have a paid, premium Microsoft Dataverse license for the tenant. Minimum Dataverse capacity requirements for data export will be announced before general availability. See [Power Platform licensing guidance](https://www.microsoft.com/licensing/guidance/Power-Platform) for licensing details.

If you're a Government Community Cloud (GCC) customer and need to integrate with Data Lake Storage hosted in an Azure Government subscription, open a [support request](get-help-support.md).

## Prerequisites

- To access data export in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), you must have one of the following roles: Power Platform Administrator, Dynamics 365 Administrator, or Global Administrator.
- [Create a storage account](/azure/storage/blobs/create-data-lake-storage-account) for Azure Data Lake Storage Gen2. Select the same location for the storage account as your Power BI tenant. To find your Power BI tenant location, see [Find your Fabric home region](/fabric/admin/find-fabric-home-region).

This preview feature supports the following Azure Data Lake Storage Gen2 configurations:

- **Storage account type:** Standard general-purpose v2 or premium block blobs.
- **Hierarchical namespace:** Select **Enable hierarchical namespace**.
- **Network access:** Select **Enable public access from all networks**.
- **Routing preference:** We recommend **Microsoft network routing**.
- **Security:** Select **Require secure transfer for REST API operations**.

## Simplify data with Data Lake Storage

[Data Lake Storage](/azure/architecture/data-guide/scenarios/data-lake) lets you store captured data of any size, type, or ingestion speed in a single, secure location for operational and exploratory analytics. Use Power Platform self-service analytics to export Power Apps inventory and usage data directly to your [Data Lake Storage Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) location.

> [!NOTE]
> The Power Platform inventory API doesn't automatically export data to customer-owned storage. To create a recurring export, use an Azure service, such as Azure Functions, Azure Logic Apps, or Azure Automation, to query the Power Platform inventory API on a schedule and write the results to Azure Blob Storage, Azure Data Lake Storage, or another supported destination.

You can retain exported data for extended periods and move it to data warehouses. To learn how to build custom reports at the tenant and environment levels across business units, see [Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md).

## Extensible analytics with Data Lake Storage

Use self-service options in the Power Platform admin center with Data Lake Storage to extend Power Apps remote monitoring by using data from various sources. You can also apply cloud analytics and AI to incorporate predictive analytics into service-monitoring solutions. The following diagram shows how you can derive intelligence from Power Platform data.

:::image type="complex" source="media/azure-resources.png" lightbox="media/azure-resources.png" alt-text="Diagram showing Azure resources.":::
The diagram has three areas. On the left, Power BI, Power Apps, and Power Automate provide governance, monitoring, and management data to the customer's Data Lake Storage in the center. The data lake contains Power Platform admin center analytics and organizational datasets informed by cloud intelligence. On the right, a dashboard in an app workspace uses the data lake data for analysis and action.
:::image-end:::

## Data

The amount of data you can export depends on your app and flow usage. The initial export includes inventory data for all Power Apps and cloud flows in your environment. After the initial export, the service pushes incremental data daily.

For example, an enterprise customer with two years of inventory data might have 300 MB of data to export. After the initial export, the service might push approximately 5 MB to 10 MB of data daily.

### Set up the data export process for your tenant

Use the Power Platform admin center to set up data export. Before you begin, verify that your Data Lake Storage Gen2 account meets the [prerequisites](#prerequisites) and that the administrator who sets up the export has access to the storage account.

To set up data export:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) as a Microsoft Entra Global Administrator, and then select **Manage** > **Data export**.
2. On the command bar, select **New data export**.
3. Select either **Power Apps** or **Power Automate**. If not already enabled, set **Enable tenant-level analytics** to **On**, and then select **Next**.

   > [!NOTE]
   > The Global Administrator must have the access described in [First-time setup of data export](#first-time-setup-of-a-data-export).

4. Choose a subscription to associate with the Azure storage account.
5. Select a resource group from the list of resource groups in the subscription.
6. Select the Azure storage account from the list of storage accounts in the resource group.
7. Select **Create** to set up the connection to Data Lake Storage Gen2.

After you set up data export, allow up to 12 hours for the resource inventory and 30 days of historical usage data to be exported to the Azure Data Lake Storage account.

### First-time setup of a data export

For the first data export to your organization's data lake, a Microsoft Entra Global Administrator must create the connection.

> [!IMPORTANT]
> To give the service principal access to your organization's [Data Lake Storage Gen2 account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration), you must establish a one-time connection with the Microsoft tenant service. The Global Administrator who creates the connection must meet one of the following requirements:
>
> - Have [elevated access](/azure/role-based-access-control/elevate-access-global-admin#elevate-access-for-a-global-administrator) to all Azure subscriptions and management groups.
> - Have the **Contributor** Azure role-based access control (RBAC) role on the Azure subscription and the **User Access Administrator** and **Contributor** roles on the target Azure storage account.
>
> These permissions allow the service to access the Data Lake Storage account and assign the required permissions.

## Related articles

- [Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md)
- [Azure Data Lake Storage](https://azure.microsoft.com/solutions/data-lake/)
