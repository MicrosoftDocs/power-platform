---
title: "Microsoft Power Platform self-service analytics export Power Platform inventory and usage data (preview)"
description: Export Power Apps canvas apps inventory and usage data to use with your organization's line-of-business scenarios.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/15/2023
ms.subservice: admin
author: sericks007
ms.author: sericks
ms.reviewer: sericks
contributors:
- StephenRauchPM
search.audienceType: 
  - admin
ms.contributors:
- johnev
---

# Set up Microsoft Power Platform self-service analytics to export Power Platform inventory and usage data (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

With the Power Platform admin center, you can export Power Platform inventory and usage data directly into [Azure Data Lake Storage](https://azure.microsoft.com/solutions/data-lake/) to use with your organization's line-of-business scenarios. By using your own Data Lake Storage, you can "slice and dice" the data based on your unique requirements. You can build custom reports with Power BI, including views at the individual business unit level and detailed app-level reports at the tenant and environment level. Having the data in your own data lake also means that you can store data for the durations specified in your organization's data retention policies.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - During this preview, the user experience displaying the list of established subscriptions is limited to show only first 50 subscriptions created within the tenant.

Data Lake Storage is a key part of Cortana Intelligence, meaning that it works with Azure Synapse Analytics, Power BI, and Azure Data Factory for a complete cloud big-data and advanced analytics platform that helps you with everything from data preparation to doing interactive analytics on large-scale datasets. Architected from the ground up for cloud scale and performance, Data Lake Storage is a cost-effective solution to run big data workloads. With Data Lake Storage, your organization can analyze all its data in a single place with no artificial constraints. 

> [!NOTE]
> Enablement of data export will be limited to customers with a paid, premium Microsoft Dataverse license available for the tenant. Details of additional licensing requirements will be provided in admin documentation and in general availability [release plans](/dynamics365/release-plans/). Additional details about minimum Dataverse capacity requirements to access the data export features will be announced in advance of general availability.
>
> For Government Community Cloud (GCC) customers who need to configure integration to Data Lake storage hosted in an Azure Government subscription, please open a [support request](get-help-support.md).

## Prerequisites

- To access data export in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), you'll need one a member of these roles: Power Platform admin, Dynamics 365 admin, or Microsoft 365 Global admin.

- [Create a storage account](/azure/storage/blobs/create-data-lake-storage-account) to use with Azure Data Lake Storage Gen2. Make sure you select the same location for the data lake storage account as your Power BI tenant. To learn more about how to determine your Power BI tenant location, see [Where is my Power BI tenant located?](/power-bi/admin/service-admin-where-is-my-tenant-located).

  > [!NOTE]
  > The following Azure Data Lake Storage Gen2 configurations are supported for this preview feature:
  > - Storage Account Types: Standard general-purpose v2 or Premium block blobs.
  > - Hierarchical Namespace: **Enable hierarchical namespace** must be selected.
  > - Network Connectivity, Network Access: **Enable public access from all networks** must be selected.
  > - Network Routing, Routing Preference: **Microsoft network routing** is recommended.
  > - Security: **Require secure transfer for REST API operations** must be selected.

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

1. Sign in to the Power Platform admin center as an Microsoft Entra Global Admin, select **Export to Azure Data Lake**, and then select **Power Apps** or **Power Automate**.  The Global Admin user must have specific roles described in [First-time setup of data export](#first-time-setup-of-a-data-export).

2. Set **Enable tenant-level analytics** to **On**.

3. Choose a subscription to associate with the Azure storage account.

4. In the list of resource groups under this subscription, select a resource group.

5. In the list of storage accounts under the selected resource group, select the Azure storage account.

6. Select **Create** to set up the connection to Data Lake Storage Gen2.

> [!NOTE]
> Customers can expect to see resource inventory and 30 days of historical usage data being exported to the Azure Data Lake Storage account within the 12 hours upon successful setup of a data export process.

### First-time setup of a data export

Microsoft requires that the first time you set up a data export to your organization's data lake, your Microsoft Entra global admin must be the person who sets up the connection.

> [!IMPORTANT]
> A connection with Microsoft's tenant service is required because your tenant must enable principal access to your organization's property; in this case, a [Data Lake Storage Gen2 account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration).  A one-time connection setup must be performed by a user who is a member of your organization's Microsoft Entra (Microsoft Entra ID) Global Admin built-in role [with elevated access](/azure/role-based-access-control/elevate-access-global-admin#elevate-access-for-a-global-administrator) to subscriptions. Or a Global Admin who has at least a "Contributor" Azure RBAC role on the Azure Subscription with a "User Access Administrator" and "Contributor" Azure RBAC role on the target Azure Storage account. This is required because the tenant must allow the service to access and assign specific permissions on the Data Lake Storage account.



### See also
[Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md) <br />



[!INCLUDE[footer-include](../includes/footer-banner.md)]