---
title: "Microsoft Power Platform self-service analytics schema definition (preview)"
description: This topic discusses the contents of the data exported from Power Platform to Azure Data Lake Gen2 storage locations. 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/14/2021
ms.subservice: admin
author: tjvass
ms.author: tjvass
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Microsoft Power Platform self-service analytics schema definition (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This topic discusses the contents of the data exported from Power Platform to Azure Data Lake Gen2 storage locations.  

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

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

The main root folder for Power Automate has the following folder structure:

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

## The structure of the containers and folders inside the data lake

- The main root folder is in the yyyy-mm-dd date format&mdash;for example, 2020-02-28.
- The root folder contains two folders, Metadata and KPI: 
  - The Metadata folder contains inventory data in a list of files, one for each region.
  - The KPI folder contains usage data.

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
| Type                    | Longtext           | Power Apps app  |
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
| CdsInstanceURL          | Longtext           | Dataverse environment URI                                          |
| CdsInstanceId           | Guid               | Dataverse environment identifier                                      |
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
> The latest versions of generally well-known platform operating systems should contain data, but in some cases this data might not be available. 

### See also

[Create a storage account](/azure/storage/common/storage-account-create) <br />
[Set up Power Platform self-service analytics to export Power Apps inventory and usage data](self-service-analytics.md)





[!INCLUDE[footer-include](../includes/footer-banner.md)]

