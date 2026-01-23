---
title: View Power Automate activity logs in Microsoft Purview
description: Learn how to access Power Automate activity logs in Microsoft Purview and explore what Power Automate activities you can monitor.
author: grbarker
ms.topic: how-to
ms.date: 01/23/2026
ms.subservice: admin
ms.author: grbarker
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# View Power Automate activity logs in Microsoft Purview

You can view many Microsoft Power Automate activities in Microsoft Purview, such as:

- flow creations by specific users
- connector calls by specific users and agents
- flow runs or failures by specific users or agents

You can also view activity logs within specific date ranges to gain insights. Regularly auditing Microsoft Power Automate activities in Microsoft Purview helps you:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot problems
- mitigate failures

This article covers prerequisites, how to access the logs in Microsoft Purview, and provides details about Power Automate events and schemas.

## Prerequisites

To view Power Automate activity logs in Microsoft Purview, make sure you:

- Review and complete all the [prerequisites](activity-logs-overview.md#prerequisites) in the overview article.
- Are an admin with a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Are assigned either the *Audit Logs* or *View-Only Audit Logs* role in Microsoft Purview.

Learn more:

- [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)
- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

## Explore Power Automate activities

The SDK layer handles logging, so a single action can trigger multiple logged activities. This table lists a sample of user events you can monitor.

| Category | Event | Description |
|-|-|-|
|Flows | Created flow | A flow is created.|
|Flows | Edited flow | An update is made to a flow.|
|Flows | Deleted flow | A flow is deleted.|
|Flow permissions | Edited permissions | Each time a user's permissions to a flow changes. For example, when a user is added as co-owner.|
|Flow permissions | Deleted permissions | Each time a user's permissions to a flow is removed.|
|Trials | Started a paid trial | A user starts a paid trial.|
|Trials | Renewed a paid trial | A user renews a paid trial.|
|Hosted RPA | Microsoft Entra ID joined | A hosted RPA bot is joined to a customer's tenant Microsoft Entra ID.|

> [!TIP]
> Use RecordType `PowerPlatformAdministratorActivity*` to view hosted robotic process automation (RPA) events.

## Get details on base schema for logging

Schemas define which Power Automate fields are sent to the Microsoft Purview compliance portal. Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to Power Automate activities. This table lists the common fields the base schema contains.

|Field name | Logical name | Type | Mandatory | Description|
|-|-|-|-|-|
|Date | `CreationTime` | `Edm.Date` | No | Date and time when the log is generated in UTC.|
|Flow details | `FlowDetailsUrl` | `Edm.String` | No | Link to the flow's details page.|
|IP address | `ClientIP` | `Edm.String` | No | IP address of the user's device.|
|ID | `ID` | `Edm.Guid` | No | A unique GUID for every row logged.|
|Result status | `ResultStatus` | `Edm.String` | No | Status of the row logged.|
|Organization ID | `OrganizationId` | `Edm.Guid` | Yes | A unique identifier of the organization from which the log is generated.|
|Operation | `Operation` | `Edm.String` | No | Name of an operation.|
|Workload | `Workload` | `Edm.String` | No | Workload of an operation.|
|User | `UserKey` | `Edm.String` | No | A unique identifier of the user in Microsoft Entra ID.|
|User type | `UserType` | `Edm.String` | No | The audit type (admin, regular, or system)|
|Flow connector names | `FlowConnectorNames` | `Edm.String` | No | Connector names listed in the flow.|
|Sharing Permission | `SharingPermission` | `Edm.String` | No | Type of permission shared with another user (3 = "Owner"/ReadWrite, 2 = "Run-only user"/Read).|
|Recipient UPN | `RecipientUPN` | `Edm.String` | No | If permission was updated, shows the UPN of the permission recipient.|
|License Display Name | `LicenseDisplayName` | `Edm.String` | No | Display name of the license.|
|User Type Initiated | `UserTypeInitiated` | `Edm.Int32` | No | Which type of user initiated the operation. Applicable for *delete flow* and *edit permissions* (1 = user, 2 = admin).|
|User UPN | `UserUPN` | `Edm.String` | No | Unique ID of the user. Always equivalent to `UserKey`.|

## Limitations

You can only view cloud flow activities in the [Microsoft Purview portal](https://compliance.microsoft.com/). If you want to see desktop flow activities, they're available in the Microsoft Dataverse audit logs. You also have the option [monitor desktop flow runs in Power Automate](/power-automate/desktop-flows/monitor-desktop-flow-runs).

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
