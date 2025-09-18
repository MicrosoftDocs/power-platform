---
title: Microsoft Power Platform self-service analytics schema definition (preview)
description: Learn about the contents of the data exported from Power Platform to Azure Data Lake Gen2 storage locations. 
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/13/2023
ms.subservice: admin
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
  - Zeffin
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Microsoft Power Platform self-service analytics schema definition (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This topic discusses the contents of the data exported from Power Platform to Azure Data Lake Gen2 storage locations.  

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Structure of the data output

When you export Power Apps and Power Automate inventory and usage data to your Data Lake Storage, self-service analytics makes the data available in a [Common Data Model](/common-data-model/) schema format. This Common Data Model-based metadata makes it possible for you to share your data across applications and business processes, such as Power Apps, Power Automate, Power BI, Dynamics 365, and Azure.

The data export file includes:  

- A full inventory for all apps, flows, connectors, and associated metadata that exist in the tenant.

- Usage data comprising data starting from the time that the export starts.

After the first time you generate a data export, Power Automate generates incremental daily updates. Each daily update includes details about all new and existing apps, including connector information. The data export contains the Microsoft Entra *principal object ID (userid)*. Optionally, you can further use Microsoft Entra to retrieve actual usernames and business units, such as marketing, sales, or finance.

## Power Apps folder structure
The main root folder for Power Apps has the following folder structure:

- \Applications
- \ConnectionReference
- \Connections
- \Environments
- \Usage

## Power Automate folder structure

The main root folder for Power Automate has the following folder structure:

- \Flows
-	\FlowsConnectionReference
-	\Usage

## Viewing the data and folders inside Azure portal

Data listed in these folders can be viewed through your Azure portal. To learn more, go to [https://portal.azure.com](https://portal.azure.com/). Then, navigate to your storage account (**Home** > **Subscriptions** > *your subscription name* > **Resource Groups** > *your resource group* > *your storage accounts* > **Storage Account**).

## The structure of the containers and folders inside the data lake

- The main root folder is in the yyyy-mm-dd date format (for example, 2020-02-28).

- The root folder contains two folders: Metadata and KPI: 
  - The Metadata folder contains inventory data in a list of files, one for each region.
  - The KPI folder contains usage data.

## Schema definition tables

The following tables detail the schema definitions of the data. Metadata are considered as inventory data.

## Power Apps subfolder

### Apps

| **Property name**       | **Property type**  | **Description**                               |
|-------------------------|--------------------|-----------------------------------------------|
| AppName                 | Guid               | Unique app ID that can be used to join tables |
| Name                    | Longtext           | App name                                      |
| Description             | Longtext           | App description (not available currently)         |
| tenantId                | Guid               | Customer tenant ID                             |
| EnvironmentId           | Longtext           | Environment ID                                |
| Type                    | Longtext           | App created using Power Apps  |
| Subtype                 | Longtext           | Canvas \| Model \| Pages                      |
| DocumentVersion         | Datetime           | The date-and-time stamp is used as the app version          |
| Uri                     | Longtext           | App URI                                       |
| Lifecyclestate          | Longtext           | Draft \| Published                            |
| DocumentUri             | Longtext           | App information URI                         |
| IconUri                 | Longtext           | App icon URI                                  |
| Owner                   | Longtext           | Name of the app owner                         |
| createdPrincipalId      | Guid               | Microsoft Entra object ID of the app creator principal        |
| CreatedTime             | Datetime           | Date the app was created                          |
| lastModifiedPrincipalId | Guid               | Microsoft Entra object ID of last modified user           |
| lastModifiedTime        | Datetime           | Date the app was last updated          |
| lastenabledprincipalId   | Guid               | Microsoft Entra object ID of last published user          |
| lastEnabledTime         | Datetime           | Date the app was last published        |
| DeletedTime             | Datetime           | Date the app was last deleted                 |
| DeletedprincipalId       | Longtext           | Microsoft Entra object ID of the user who deleted the app          |
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
| EnvironmentId | Longtext | Environment ID |
| Tier | Longtext | Premium or Standard |
| Type | Longtext | Connection type&mdash;for example SQL, Office 365, or Azure |

### Connections

| **Property name** | **Property type** | **Description**                                              |
|--------------------|--------------------|------------------------------------------------------------|
| ConnectionId       | Guid               | Unique connection ID                                      |
| connectionName     | Longtext           | User-entered descriptive name&mdash;for example, Office 365 Outlook |
| apiId              | Guid               | Connector type                                             |
| EnvironmentId      | Longtext           | Environment ID                                             |
| Displayname        | Longtext           | URI of the connection                                      |
| isCustomApi        | Longtext           | Yes \| No                                                  |
| createdPrincipalId | Guid               | Microsoft Entra object ID of the app creator principal                     |
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
| CdsInstanceURL          | Longtext           | Environment URI                                          |
| CdsInstanceId           | Guid               | Environment identifier                                      |
| createdPrincipalId      | Guid               | Microsoft Entra object ID of the app creator principal                       |
| CreatedTime             | Datetime           | Date the app was created                                         |
| lastModifiedPrincipalId | Guid               | Microsoft Entra object ID of the user who last modified the app          |
| lastModifiedTime        | Datetime           | Date the app was last updated                         |
| DeletedTime             | Datetime           | Date the app was last deleted                                |
| DeletedprincipalId      | Longtext           | Microsoft Entra object ID of the user who deleted the app                         |

### Usage

| **Property name**  | **Property type** |**Description**                                                |
|--------------------|--------------------|--------------------------------------------------------------|
| AppId              | Guid              | Unique app ID (can be used to join tables)                     |
| environmentId      | Guid              | Environment ID                                      |
| tenantId            | Guid               | Customer tenant ID                                            |
| ObjectID           | Guid              | Microsoft Entra user object ID                        |
| SessionId          | Guid              | Session ID                                               |
| timeaccessed       | Datetime           | Time the user opened or accessed the app                         |
| Country            | Longtext           | The country from which the app is opened; is filter            |
| platform           | Longtext           | Platform or operating system from which the app is opened (see the note following this table)                  |
| PlayerVersion      | LongText           | The Power Apps player version from which the app is opened |
| AppVersion         | Datetime           | App version                                                  |
| Browsername        | Longtext           | Client browser                                               |
| DataVersion        | Int(11)            | Table data, not user-related                                 |

## Power Automate subfolder

### Flows

| **Property name**             | **Property type** |**Description**                                       |
|-------------------------------|-------------------|------------------------------------------------------|
|ResourceId 	                  |Guid	              |Unique flow ID (can be used to join tables) |
|name 	                        |LongText	          |Flow name |
|type	                          |LongText	          |Power Automate | 
|subtype	                      |LongText	          |Cloud Flow | 
|environmentId                  |Guid	              |Environment ID |
|resourceVersion	              |LongText	          |Flow version |
|lifecycleState	                |LongText	          |Draft, Published |
|events_created_timestamp	      |Datetime 	        |Date the flow was created |
|events_created_principalId	    |Guid	              |Microsoft Entra object ID of the flow creator principal |
|events_lastModified_timestamp 	|Datetime 	        |Date the flow was last updated |
|sharedUsers	                  |int	              |Number of users the flow is shared with |
|sharedGroups	                  |int	              |Number of groups the flow is shared with |

### FlowsConnectionReference

| **Property name**  | **Property type** |**Description**                                                |
|--------------------|--------------------|--------------------------------------------------------------|
|resourceId	         |Guid	              |Unique flow ID (can be used to join tables) |
|tenantId	           |Guid	              |Customer tenant ID |
|environmentId	     |Guid	              |Environment ID |
|connectionrefId	   |LongText	          |Unique connection reference ID |
|connectorType	     |LongText	          |Type of connector used by the flow |
|connectionId	       |LongText	          |Unique connection ID |
|displayName	       |LongText	          |Name of connection reference |
|tier	               |LongText	          |Standard, Premium |

### Usage

| **Property name**  | **Property type** |**Description**                                                |
|--------------------|--------------------|--------------------------------------------------------------|
|resourceId 	       |Guid	              |Unique resource ID (can be used to join tables) |
|environmentId 	     |Guid	              |Environment ID |
|tenantid	           |Guid	              |Customer tenant ID |
|timeaccessed 	     |Datetime 	          |Time the user opened or accessed the app |
|status	             |LongText	          |Succeeded, Failed, Cancelled, Terminated |
|subType	           |LongText	          |Cloud Flow |
|runs	               |Int	                |Number of runs |

> [!NOTE]
> - The latest versions of generally well-known platform operating systems should contain data, but in some cases this data might not be available.
> - There's a known issue for model-driven apps where the value of createdPrincipalID is null.

### See also

- [Create a storage account](/azure/storage/common/storage-account-create) <br />
- [Set up Power Platform self-service analytics to export Power Apps inventory and usage data](self-service-analytics.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
