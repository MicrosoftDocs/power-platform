---
title: Access and monitor Power Automate activity logs in Microsoft Purview
description: Learn how to access Power Automate activity logs in Microsoft Purview and explore what Power Automate activities you can monitor.
author: EllenWehrle
ms.topic: how-to
ms.date: 11/06/2025
ms.subservice: admin
ms.author: kenseongtan
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Audit Power Automate activities in Microsoft Purview

You can monitor many Power Automate activities in Microsoft Purview, such as flow creations by specific users or connector calls and flow runs or failures by specific users or agents. You also have the ability to view activity logs within specific date ranges to gain insights.

You can regularly audit Microsoft Power Automate activities in Microsoft Purview to:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot issues
- mitigate failures.

You can access and view Power Automate activity logs in the [Microsoft Purview compliance portal](https://purview.microsoft.com/). The activity logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview). Learn more in [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview).

This article covers prerequisites, how to access the logs in Microsoft Purview, and provides details about Power Automate events and schemas.

## Prerequisites

To view connector activity logs in Microsoft Purview, make sure you've:

- Review and complete all the overview article [prerequisites](activity-logs-overview.md#prerequisites).
- Confirm you're an admin who has a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Confirm either the *Audit Logs* or *View-Only Audit Logs* role is assigned to you in Microsoft Purview.

Learn more:

- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

Admins can filter for specific activities via the **Activities** list. You'll find the Power Automate activities in this list.

## Explore Power Automate activities

Logging takes place at the SDK layer, which means a single action can trigger multiple activities to be logged. The following are a sample of user activities you can audit.

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
> For activities under the Hosted RPA category, the activities appear under the record type of *HostedRPA* and *PowerPlatformAdministratorActivity*. Starting on September 30th of 2024, the record type *HostedRPA* will be discontinued. Please use the RecordTypes *PowerPlatformAdministratorActivity* to view Hosted RPA events.

## Get details on base schema for logging

Schemas define the Power Automate fields that are sent to the Microsoft Purview compliance portal. Some fields are common to all applications that send audit data to Microsoft 365, while others are specific to Power Automate. The base schema contains these common fields.

|Field display name | Logical name | Type | Mandatory | Description|
|-|-|-|-|-|
|Date | CreationTime | Edm.Date | No | Date and time when the log was generated in UTC.|
|Flow details | FlowDetailsUrl | Edm. String | No | Link to the flow's details page.|
|IP address | ClientIP | Edm.String | No | IP address of the user's device.|
|ID | ID | Edm.Guid | No | A unique GUID for every row logged.|
|Result status | ResultStatus | Edm.String | No | Status of the row logged.|
|Organization ID | OrganizationId | Edm.Guid | Yes | A unique identifier of the organization from which the log was generated.|
|Operation | Operation | Edm.String | No | Name of an operation.|
|Workload | Workload | Edm.String | No | Workload of an operation.|
|User | UserKey | Edm.String | No | A unique identifier of the user in Microsoft Entra ID.|
|User type | UserType | Edm.String | No | The audit type (admin, regular, or system)|
|Flow connector names | FlowConnectorNames | Edm.String | No | Connector names listed in the flow.|
|SharingPermission | SharingPermission | Edm.String | No | Type of permission shared with another user (3 = "Owner"/ReadWrite, 2 = "Run-only user"/Read).|
|Recipient UPN | RecipientUPN | Edm.String | No | If permission was updated, shows the UPN of the permission recipient.|
|LicenseDisplayName | LicenseDisplayName | Edm.String | No | Display name of the license.|
|UserTypeInititated | UserTypeInititated | Edm.Int32 | No | Which type of user initiated the operation. Applicable for delete flow, edit permissions (1 = user, 2 = admin).|
|UserUPN | UserUPN | Edm.String | No | Unique ID of the user. Always equivalent to UserKey.|

## Limitations

Only activities from cloud flows are available in the [Microsoft Purview portal](https://compliance.microsoft.com/). Desktop flow activities are in the Microsoft Dataverse audit logs.

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
