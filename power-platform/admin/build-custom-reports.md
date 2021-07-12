---
title: "Create custom dashboards with Power Apps inventory and usage data"
description: Use Power Apps exported data with other line-of-business scenarios and display data insights at tenant and environment levels across business units.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/25/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Create custom dashboards by using Power Apps inventory and usage data
<!--note from editor: The title of this topic makes me expect to see some guidance about actually creating dashboards. Will the reader understand how to use the information here to accomplish this task, or might the title be adjusted to reflect what's in this topic? Something like "Understand Power Apps inventory and usage data to power data insights." But better.-->
[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This topic discusses how you can use data exported from Power Apps with other line-of-business scenarios, and display data insights at tenant and environment levels across business units. For example, you can use exported Power Apps inventory and usage data for your existing enterprise dashboards and other custom solutions.

## Background

Microsoft Power Platform self-service analytics enables you to export Power Apps inventory and usage data to [Azure Data Lake Storage Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration)<!--note from editor: The target topic doesn't follow the Cloud Style Guide, and in fact the style guide would say that "Gen2" isn't required in this topic either because it doesn't mention Gen1, but you probably had your reasons. --> storage locations. To learn more about exporting Power Apps inventory and usage data to a [Common Data Model](/common-data-model/) schema file, go to [Set up Microsoft Power Platform self-service analytics to export Power Apps inventory and usage data](self-service-analytics.md).

<!--note from editor: It's not a good user experience to repeat this section wholesale. Recommend removing it from this topic.
## Extensible analytics with Data Lake Storage

You can use Power Platform admin center self-service options based on Data Lake Storage to extend Power Apps telemetry by using data from other sources. Use cloud analytics and AI to take advantage of predictive analytics within service monitoring solutions. The following diagram illustrates an example of how to derive intelligence from Power Apps telemetry data. 

:::image type="complex" source="media/azure-resources.png" alt-text="Diagram showing Azure resources.":::
NEED A LONG DESCRIPTION HERE
:::image-end:::
-->

## View exported data

### View exported data by using Power BI

Exported data intended for use with Power BI is stored internally by default. When using Power BI to view exported data, make sure you select the same location for the data lake [storage account](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) as your Power BI tenant. If you need to find the location of your Power BI tenant, see [Where is my Power BI tenant located](/power-bi/admin/service-admin-where-is-my-tenant-located)?

As soon as data is available in your data lake, you can choose to move data to any reporting store; for example, a SQL data warehouse. For this you'll need to build custom Power BI reports. You can also choose to build [Power BI reports off Data Lake Storage](/power-bi/transform-model/service-dataflows-azure-data-lake-integration).
<!-- 
### View data using Azure Data Lake Gen 2  

You can store your dataflows in your organization's Azure Data Lake Storage Gen2 account. Before you can export data to a data lake service, you need to create an Azure storage account. Learn more: [Create a storage](/azure/storage/common/storage-account-create?tabs=azure-portal) account.

1. Use the ARM Template located at this [GitHub location](https://gist.github.com/dazfuller/0740f1640225dc8ea0eb29a8e6f88a6a) in your automation script.

2. Set your storage as Storagev2 (general purpose v2).

3. The storage account must have the **Hierarchical Name Space** feature enabled.

4. The admin setting up the data export option in the [Power Platform Admin Center](https://aka.ms/ppac) (PPAC) must be granted an *Owner role* for the resources and have a subscription in a storage account.

For more information, see [Configuring dataflow storage to use Azure Data Lake Gen 2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration).

> [!NOTE]
> To view data in your own storage data lake, you first need to download the [Azure Storage Explorer](https://azure.microsoft.com/features/storage-explorer).
-->
### View data in the Azure portal  

You can also view data by using the Azure portal.

1. Go to [https://portal.azure.com](https://portal.azure.com/).

2. Navigate to your storage account by going to **Home** > **Subscriptions** > *your subscription name* > **Resource Groups** > *your resource group* > *your storage accounts* > **Storage Account**.

<!--
### Provision using Azure Data Lake Gen2

To provision using a Azure Data Lake Gen2 storage location:

1. In the [Azure portal(https://portal.azure.com), select Storage accounts &gt; Access Control (IAM).

2. Select the **Role Assignments** tab.

3. Search for "Power Platform Data Analytics".

4. Then you should see:

   - A new **Power Platform Data Analytics** service principal (app) that is created in Azure AD.
   - The principal assigned as the **Storage Blob Data Contributor**, who now should have access to your Azure Data Lake Gen 2 storage account.
-->

> [!NOTE]
> To view data in your own storage data lake, you first need to download the [Azure Storage Explorer](https://azure.microsoft.com/features/storage-explorer).

## Structure of the data output

When you export Power Apps and usage data to your Data Lake Storage, self-service analytics makes the data available in a [Common Data Model](/common-data-model/) schema format. This Common Data Model&ndash;based metadata makes it possible for you to share your data across applications and business processes, such as Power Apps, Power BI, Dynamics 365, and Azure.

The data export file includes:  

- A full inventory for all apps, connectors, and associated metadata that exist in the tenant.
- Usage data comprising data starting from the time that the export starts.

After the first time you generate a data export, Power Automate generates incremental daily updates. Each daily update includes details about all new and existing apps, including connector information. The data export contains the Azure Active Directory (Azure AD) *principal object ID (userid)*. Optionally, you can further use Azure AD to retrieve actual usernames and business units, such as marketing, sales, or finance.

The main root folder for Power Apps has the following folder structure:

- \Applications
- \ConnectionReference
- \Connections
- \Environments
- \Usage

> [!NOTE] 
> Data listed in these folders can be viewed through your Azure portal. For information, go to [https://portal.azure.com](https://portal.azure.com/) and navigate to your storage account (**Home** > **Subscriptions** > *your subscription name* > **Resource Groups** > *your resource group* > *your storage accounts* > **Storage Account**).
<!--
**Data export options**

This section discusses options for establishing your organization's custom export requirements at the tenant and individual business unit level. After you set up the initial data export, data will continue to be exported to your tenant's data lake every 24 hours.

**Create a Power BI dashboard with data in your Azure Data Lake Gen2 storage**

Some organizations need to configure longer durations for data exports. For example, some customers may want to ensure a charge back model across different departments, divisions, and so on. Other customers are looking to layer their export data with other LOB scenarios and build custom reports as part of their existing enterprise dashboards.

Follow these steps to build a Power BI dashboard:

1. Create a [Power BI data flow](/power-bi/transform-model/service-dataflows-create-usee).  

2. Connect to [Azure Data Lake Gen2 for dataflows](/power-bi/transform-model/service-dataflows-connect-azure-data-lake-storage-gen2).

3. Create a new [dashboard](/power-bi/transform-model/desktop-connect-dataflows).

## Configuration options

If you decide to add a new data lake destination, the Power Platform service admin needs access to the PPAC. In addition, they must have *owner* or *contributor* access to the Azure Data Lake Gen 2 storage account, as well as owner or contributor access to the Azure subscription.

After the admin has been granted these permissions, they should be able to set up a new data export connection. For the first time, granting permissions for Microsoft to export data to customers data lake requires the Azure AD global admin to do the setup process.

### Delete the data connection set up for data export

To delete an existing connection that has been set up for data export to your data lake, use the [Power Platform Admin Center](https://aka.ms/ppac). Once you delete a connection, you can configure a new one using the Power Platform admin center.

> [!NOTE]
> You can't edit an existing connection. Instead, you must delete it first and then set up a new connection.

### Configure a firewall

When configuring your firewall, we recommend that you select the **Isolate this storage** option.

> [!NOTE]
> Microsoft plans to make this data export service part of Microsoft Trusted principals list over the course of maturing the data export process. With Dynamic IP allocation model, IP range restrictions are not an option for firewall setups.
-->
## Schema definition tables

The following tables detail the schema definitions of the data. Metadata are considered as inventory data.


### Apps 

| **Property name**       | **Property type**  | **Description**                               |
|-------------------------|--------------------|-----------------------------------------------|
| AppName                 | Guid               | Unique app ID that can be used to join tables |
| Name                    | Longtext           | App name                                      |
| Description             | Longtext           | App description (not available currently)         |
| tenantId                | Guid               | Customer tenant ID                             |
| Environmentid           | Longtext           | Environment ID                                |
| Type                    | Longtext           | Power Apps app<!--note from editor: Edit okay? -->                                     |
| Subtype                 | Longtext           | Canvas \| Model \| Pages                      |
| DocumentVersion         | Datetime           | The date-and-time stamp is used as the app version          |
| Uri                     | Longtext           | App URI                                       |
| Lifecyclestate          | Longtext           | Draft \| Published                            |
| DocumentUri             | Longtext           | App information URI                         |
| IconUri                 | Longtext           | App icon URI                                  |
| Owner                   | Longtext           | Name of the app owner                         |
| createdPrincipalId      | Guid               | Azure AD object ID of the app creator principal        |
| CreatedTime             | Datetime           | Date the app was created                          |
| lastModifiedPrincipalId | Guid               | Azure AD object ID of last modified user           |
| lastModifiedTime        | Datetime           | Date the app was last updated          |
| lastenabledprincipalid  | Guid               | Azure AD object ID of last published user          |
| lastEnabledTime         | Datetime           | Date the app was last published        |
| DeletedTime             | Datetime           | Date the app was last deleted                 |
| Deletedprincipalid      | Longtext           | Azure AD object ID of the user who deleted the app          |
| sharedUsers             | Int                | Number of users the app is shared with        |
| sharedGroups            | Int                | Number of groups the app is shared with       |
| Solution                | Longtext           | Solution ID the app belongs to             |
| Creationtype            | Longtext           | Generated \| Scratch development              |
| embeddingHost           | Longtext           | Teams \| Power Apps \| Power BI                |
| Settings                | Longtext           | Reserved                                      |
| customExtensions        | Longtext           | Reserved                                      |

### Connection reference 

| **Property name** | **Property type** | **Description**                     |
|-------------------------|-------------------------|-------------------------|
| resourceId | Guid  | Unique app ID (can be used to join with the Usage table) |
| Display name | Longtext | User-entered descriptive name&mdash;for example, Office 365 Outlook |
| connectionrefId | Guid | Unique connection ID |
| Environmentid | Longtext | Environment ID |
| Tier | Longtext | Premium or Standard |
| Type | Longtext | Connection type&mdash;for example SQL, Office 365, or Azure |


### Connections 

| **Property name** | **Property type** | **Description**                                              |
|--------------------|--------------------|------------------------------------------------------------|
| Connectionid       | Guid               | Unique connection ID                                      |
| connectionName     | Longtext           | User-entered descriptive name&mdash;for example, Office 365 Outlook |
| apiId              | Guid               | Connector type                                             |
| Environmentid      | Longtext           | Environment ID                                             |
| Displayname        | Longtext           | URI of the connection                                      |
| isCustomApI        | Longtext           | Yes \| No                                                  |
| createdPrincipalId | Guid               | Azure AD object ID of the app creator principal                     |
| CreatedTime        | Datetime           | Date the app was created                                       |
| Swaggerurl         | Longtext           | Swagger URL for custom API                                 |
| tenantId           | Guid               | Customer tenant ID                                          |

### Environments 

| **Property name**       | **Property type**  | **Description**                                              |
|-------------------------|--------------------|--------------------------------------------------------------|
| Environmentid           | Longtext           | Environment ID                                               |
| name                    | Longtext           | Environment name                                             |
| Purpose                 | Longtext           | Details about what the environment container was created for  |
| tenantGuid              | Guid               | Customer tenant ID                                            |
| Environmentstate        | Longtext           | Enabled \| Disabled                                          |
| environmenttype         | Longtext           | Sandbox \| Production \| Trial \| Teams                      |
| Securitygroup           | Longtext           | Owner security group ID                                      |
| Environmentregion       | Longtext           | Environment geo location                                     |
| EnvironmentUrl          | Longtext           | Environment URL                                              |
| isDefault               | Longtext           | Boolean value to indicate whether this is the default environment  |
| CdsInstanceURL          | Longtext           | Common Data Service<!--note from editor: Should this be Dataverse?--> environment URI                                          |
| CdsInstanceId           | Guid               | Common Data Service<!--note from editor: Should this be Dataverse?--> instance identifier                                      |
| createdPrincipalId      | Guid               | Azure AD object ID of the app creator principal                       |
| CreatedTime             | Datetime           | Date the app was created                                         |
| lastModifiedPrincipalId | Guid               | Azure AD object ID of the user who last modified the app          |
| lastModifiedTime        | Datetime           | Date the app was last updated                         |
| DeletedTime             | Datetime           | Date the app was last deleted                                |
| Deletedprincipalid      | Longtext           | Azure AD object ID of the user who deleted the app                         |

### Usage

| **Property name**  | **Property type** |**Description**                                                |
|--------------------|--------------------|--------------------------------------------------------------|
| AppId              | Guid              | Unique app ID (can be used to join tables)                     |
| environmentId      | Guid              | Environment ID                                      |
| tenantid           | Guid               | Customer tenant ID                                            |
| ObjectID           | Guid              | Azure AD user object ID                        |
| SessionId          | Guid              | Session ID                                               |
| timeaccessed       | Datetime           | Time the user opened or accessed the app                         |
| Country            | Longtext           | The country from which the app is opened; is filter            |
| platform           | Longtext           | Platform or operating system from which the app is opened (see the note following this table)                  |
| PlayerVersion      | LongText           | The Power Apps player version from which the app is opened |
| AppVersion         | Datetime           | App version                                                  |
| Browsername        | Longtext           | Client browser                                               |
| DataVersion        | Int(11)            | Table data, not user-related                                 |

> [!NOTE]
> The latest versions of generally well-known platform operating systems should contain data, but in some cases this data might not be available and isn't always guaranteed to be valid.<!--note from editor: Edit okay? I wasn't sure what "isn't always guaranteed" referred to.---> 

## FAQ

### After setup, what's provisioned in my Data Lake Storage?

Using the [Azure portal](https://portal.azure.com), select **Storage accounts** > **Access Control(IAM)**, and then select the **Role Assignments**
tab. Search for **Power Platform Data Analytics**. You'll see: 

1. That a new Power Platform Data Analytics service principal (app) has been created in Azure AD.
2. This principal has been assigned the Storage Blob Data Contributor access to your Data Lake Storage account.

### What setting should I choose for the firewall configuration?

The recommendation for this preview is to use the **Isolate this storage** option. We plan to make our service principal part of the Microsoft Trusted Principals list over the course of maturing our data export process. However, this isn't currently supported in the feature preview. With the dynamic IP allocation model, IP range restrictions aren't an option for firewall setups.

### Is the data model in a standard format?

The data mode uses the extensible Common Data Model schema to describe the entities in the data lake. This will allow easier consumption by different products across Microsoft Power Platform, including Power BI and other systems like SAP or Adobe.

## What is the structure of the containers and folders inside the data lake?

- The main root folder is in the yyyy-mm-dd date format&mdash;for example, 2020-02-28.
- The root folder contains two folders, Metadata and KPI: 
  - The Metadata folder contains inventory data in a list of files, one for each region.
  - The KPI folder contains usage data.

### See also

[Create a storage account](/azure/storage/common/storage-account-create) <br />
[Set up Power Platform self-service analytics to export Power Apps inventory and usage data](self-service-analytics.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]

