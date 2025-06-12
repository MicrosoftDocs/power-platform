---
title: Microsoft Power Platform self-service analytics export  inventory and usage data (preview)
description: Learn how to enable Power Platform self-service analytics to export inventory and usage data to use with your organization's line-of-business.
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/15/2023
ms.subservice: admin
author: sericks007
ms.author: mesaelee
ms.reviewer: sericks
contributors:
- Zeffin
search.audienceType: 
  - admin
ms.contributors:
- johnev
---

# Set up Microsoft Power Platform self-service analytics to export inventory and usage data (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

With the Power Platform admin center, you can export Power Platform inventory and usage data directly into [Azure Data Lake Storage](https://azure.microsoft.com/solutions/data-lake/) for your organization's business needs. Having the data in your own data lake means you can store data for the durations specified in your organization's data retention policies.
You can also create custom reports with Power BI, with views at the business unit level and detailed app reports at the tenant and environment level.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - During this preview, the user experience displaying the list of established subscriptions is limited to show only first 50 subscriptions created within the tenant.

Data Lake Storage is a key part of Cortana Intelligence and seamlessly integrates with Azure Synapse Analytics, Power BI, and Azure Data Factory. Data Lake Storage offers a comprehensive cloud platform designed for handling large-scale data and advanced analytics.
Architected from the ground up for cloud scale and performance, Data Lake Storage is a cost-effective solution to run big data workloads. With Data Lake Storage, your organization can analyze all its data in a single place with no artificial constraints.

The enablement of data export is limited to customers with a paid, premium Microsoft Dataverse license available for the tenant. Details of other licensing requirements are provided in admin documentation and in general availability [release plans](/dynamics365/release-plans/). More details about minimum Dataverse capacity requirements to access the data export features are announced in advance of general availability.

Government Community Cloud (GCC) customers who need to configure integration to Data Lake Storage hosted in an Azure Government subscription should open a [support request](get-help-support.md).

## Prerequisites

- To access data export in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), you must have one of these roles: Power Platform admin, Dynamics 365 admin, or Microsoft 365 Global admin.

- [Create a storage account](/azure/storage/blobs/create-data-lake-storage-account) to use with Azure Data Lake Storage Gen2. Make sure you select the same location for the Data Lake Storage account as your Power BI tenant. To learn more about how to determine your Power BI tenant location, see [Where is my Power BI tenant located](/power-bi/admin/service-admin-where-is-my-tenant-located)?

This preview feature supports the following Azure Data Lake Storage Gen2 configurations:

- Storage Account Types: Standard general-purpose v2 or Premium block blobs.
- Hierarchical Namespace: **Enable hierarchical namespace** must be selected.
- Network Connectivity, Network Access: **Enable public access from all networks** must be selected.
- Network Routing, Routing Preference: **Microsoft network routing** is recommended.
- Security: **Require secure transfer for REST API operations** must be selected.

## Simplify data with Data Lake Storage

[Data Lake Storage](/azure/architecture/data-guide/scenarios/data-lake) enables you to store captured data of any size, type, or ingestion speed in one single, secure location for operational and exploratory analytics. You can use Microsoft Power Platform self-service analytics to export Power Apps inventory and usage data directly to your [Data Lake Storage Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) locations.

You can store exported data for extended durations, and you can move data to data warehouses. To learn more about building custom reports at tenant and environment levels across business units, see [Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md).

## Extensible analytics with Data Lake Storage

You can use self-service options in the Power Platform admin center with Data Lake Storage to extend Power Apps remote monitoring using data from various sources. You can also use cloud analytics and AI to take advantage of predictive analytics within service monitoring solutions. The following diagram illustrates an example of how to derive intelligence from Power Platform data collection.

:::image type="complex" source="media/azure-resources.png" alt-text="Diagram showing Azure resources.":::
A diagram of limitless extensibility options through using cloud analytics and AI is divided into three areas. Microsoft Power Platform apps - Power BI, Power Apps, and Power Automate - are shown collectively supplying governance, monitoring, and management to the middle area, the customer's Data Lake Storage. The data lake includes Power Platform admin center analytics and organizational datasets, all informed by cloud intelligence. On the right, the customer's dashboard is the core of an app workspace where data lake data is analyzed and acted on.
:::image-end:::

## Data

The amount of data that you can export depends on your app and flow usage. The initial export includes inventory data of all the Power Apps and Cloud flows across your environment. After the initial export, an incremental data push occurs daily.

For example, an enterprise customer with two years' worth of inventory data might have 300 MB of data to export. After the initial export, approximately 5 MB to 10 MB of that data would be pushed daily.

## Set up the data export process for your tenant

Admins should use the Power Platform admin center to set up the data export. Before you export data, make sure that your Data Lake Storage Gen2 account is set up as described in this section. Make sure that the admin who sets up the data export already has access to your storage account.

Follow these steps to set up your data lake:

1. Sign in to the Power Platform admin center as a Microsoft Entra Global Admin, expand **Analytics** menu and select **Data export**, and then select either **Power Apps** or **Power Automate**.  
    The Global Admin user must have specific roles described in [First-time setup of data export](#first-time-setup-of-a-data-export).

   ![image](https://github.com/MicrosoftDocs/power-platform/assets/110391372/acc8d8b0-8faf-4fd0-a70c-2fc7976583eb)


3. Set **Enable tenant-level analytics** to **On**.

4. Choose a subscription to associate with the Azure storage account.

5. In the list of resource groups under this subscription, select a resource group.

6. Select the Azure storage account, in the list of storage accounts under the selected resource group.

![image](https://github.com/MicrosoftDocs/power-platform/assets/110391372/7ab1350d-d5bd-4d62-b2ff-1af64904f08c)


7. Select **Next** to review your configuration selections and then select **Create** to set up the connection to Data Lake Storage Gen2.

![image](https://github.com/MicrosoftDocs/power-platform/assets/110391372/719bb27b-e1fa-4ffa-b279-7cd79c686cf9)


Allow up to 12 hours after you set up the data export for resource inventory and 30 days of historical usage data to be exported to the Azure Data Lake Storage account.

### First-time setup of a data export

When setting up the first data export to your organization's data lake, Microsoft requires your Microsoft Entra global admin be the one to create the connection.

> [!IMPORTANT]
> To enable principal access to your organization's property, specifically a  [Data Lake Storage Gen2 account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration), a connection with Microsoft's tenant service is necessary. A one-time connection setup must be performed by a user who is a member of your organization's Microsoft Entra (Microsoft Entra ID) Global Admin built-in role [with elevated access](/azure/role-based-access-control/elevate-access-global-admin#elevate-access-for-a-global-administrator) to subscriptions. Or a Global Admin who has at least a "Contributor" Azure role-based access control (RBAC) on the Azure Subscription with a "User Access Administrator" and "Contributor" Azure RBAC role on the target Azure Storage account. This is required because the tenant must allow the service to access and assign specific permissions on the Data Lake Storage account.

### See also

[Create custom dashboards by using Power Platform inventory and usage data](build-custom-reports.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
