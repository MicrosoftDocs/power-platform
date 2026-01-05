---
title: View Power Automate audit logs
description: Learn how to view Power Automate logs in the Microsoft Purview compliance portal.
author: msftman
ms.topic: how-to
ms.date: 07/16/2024
ms.subservice: admin
ms.author: kenseongtan
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# View Power Automate audit logs

You can find logs of Power Automate activities in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/). These logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview).

## Access the logs

1. Sign into the [Microsoft Purview compliance portal](https://compliance.microsoft.com/) as a tenant admin.
1. In the left hamburger menu, select **Show all**.
1. Select **Audit** from the **Solutions** category.

    ![Select audit from the menu.](./media/audit-logs/show-all.png)

Power Platform admins can search the **Audit** screen for details from the following popular services.

- Power BI
- Microsoft Entra ID
- Microsoft Teams
- Dynamics 365
- Power Apps
- Power Automate
- Dataverse

Admins can filter for specific activities via the **Activities** list. You'll find the Power Automate activities in this list.

## See audited events

All logging is done at the SDK layer, so a single action can trigger multiple logged events. Here's a list of events that you can audit.

| Category | Event | Description |
|-|-|-|
|Flows | Created flow | The time when a flow is created.|
|Flows | Edited flow | Any updates made to the flow.|
|Flows | Deleted flow | When the flow is deleted.|
|Flow permissions | Edited permissions | Every time a user's permissions to a flow changes, for example, when a user is added as co-owner.|
|Flow permissions | Deleted permissions | Every time a user's permissions to the flow is removed.|
|Trials | Started a paid trial | When a user starts a paid trial.|
|Trials | Renewed a paid trial | When a user renews a paid trial.|
|Hosted RPA | Microsoft Entra ID joined | When a hosted RPA bot is joined to the customer's tenant Microsoft Entra ID.|

> [!NOTE]
> For events under the Hosted RPA category, the events appear under the record type of *HostedRPA* and *PowerPlatformAdministratorActivity*. Starting on September 30th of 2024, the record type *HostedRPA* will be discontinued. Please use the RecordTypes *PowerPlatformAdministratorActivity* to view Hosted RPA events.

## Get details on base schema for logging

Schemas define the Power Automate fields that are sent to the Microsoft Purview compliance portal. Some fields are common to all applications that send audit data to Microsoft 365, while others are specific to Power Automate. The base schema contains these common fields.

|Field display name | Logical name | Type | Mandatory | Description|
|-|-|-|-|-|
|Date | CreationTime | Edm.Date | No | Date and time when the log was generated in UTC.|
|Flow details | FlowDetailsUrl | Edm. String | No | Link to the flow’s details page.|
|IP address | ClientIP | Edm.String | No | IP address of the user’s device.|
|ID | ID | Edm.Guid | No | A unique GUID for every row logged.|
|Result status | ResultStatus | Edm.String | No | Status of the row logged.|
|Organization ID | OrganizationId | Edm.Guid | Yes | A unique identifier of the organization from which the log was generated.|
|Operation | Operation | Edm.String | No | Name of an operation.|
|Workload | Workload | Edm.String | No | Workload of an operation.|
|User | UserKey | Edm.String | No | A unique identifier of the user in Microsoft Entra ID.|
|User type | UserType | Edm.String | No | The audit type (admin, regular, or system)|
|Flow connector names | FlowConnectorNames | Edm.String | No | Connector names listed in the flow.|
|SharingPermission | SharingPermission | Edm.String | No | Type of permission shared with another user (3 = “Owner”/ReadWrite, 2 = "Run-only user"/Read).|
|Recipient UPN | RecipientUPN | Edm.String | No | If permission was updated, shows the UPN of the permission recipient.|
|LicenseDisplayName | LicenseDisplayName | Edm.String | No | Display name of the license.|
|UserTypeInititated | UserTypeInititated | Edm.Int32 | No | Which type of user initiated the operation. Applicable for delete flow, edit permissions (1 = user, 2 = admin).|
|UserUPN | UserUPN | Edm.String | No | Unique ID of the user. Always equivalent to UserKey.|
|Additional info | More information, for example, the environment name).|

## Retention

Microsoft retains the audit data for 90 days. You can export the audit data in .csv format and then further explore the data with Microsoft Excel or Power BI.

## Timing

Events become available in the logs within 90 minutes of their occurrence.

## Limitations

Only activity from cloud flows is available in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/). Activity for desktop flows is in the Microsoft Dataverse audit logs.
