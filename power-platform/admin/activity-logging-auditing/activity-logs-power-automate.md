---
title: View Power Automate activity logs in Microsoft Purview
description: Learn how to access Power Automate activity logs in Microsoft Purview and explore what Power Automate activities you can monitor.
author: grbarker
ms.topic: how-to
ms.date: 03/20/2026
ms.subservice: admin
ms.author: grbarker
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# View Power Automate activity logs in Microsoft Purview

You can view Microsoft Power Automate activities in Microsoft Purview, such as:

- flow creations, edits, and deletions
- flow permission changes
- trial license events

You can also view activity logs within specific date ranges to gain insights. Regularly auditing Microsoft Power Automate activities in Microsoft Purview helps you maintain governance, compliance, and security.

> [!NOTE]
> Purview audit logs capture flow lifecycle and permission events. To monitor flow **runs**, **failures**, and **action-level details**, use [Application Insights](/power-platform/admin/app-insights-cloud-flow), [cloud flow run records in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata), or [Power Automate analytics in the admin center](/power-platform/admin/analytics-flow).

This article covers prerequisites, how to access the logs in Microsoft Purview, and provides details about Power Automate events and schemas.

## Prerequisites

To view Power Automate activity logs in Microsoft Purview, make sure you:

- Review and complete all the [prerequisites](activity-logs-overview.md#prerequisites) in the overview article.
- Have a Microsoft 365 admin role with a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Have either the *Audit Logs* or *View-Only Audit Logs* role in Microsoft Purview.

Learn more about auditing:

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
|Flow permissions | Edited permissions | Each time a user's permissions to a flow change. For example, when you add a user as co-owner.|
|Flow permissions | Deleted permissions | Each time a user's permissions to a flow are removed.|
|Trials | Started a paid trial | A user starts a paid trial.|
|Trials | Renewed a paid trial | A user renews a paid trial.|
|Hosted RPA | Microsoft Entra ID joined | A hosted RPA bot is joined to a customer's tenant Microsoft Entra ID.|

> [!TIP]
> Use RecordType `PowerPlatformAdministratorActivity` to view hosted robotic process automation (RPA) events.

## Get details on base schema for logging

Schemas define which Power Automate fields are sent to the Microsoft Purview compliance portal. Some fields are common to all applications that send audit data to Microsoft Purview, while others are specific to Power Automate activities. This table lists the common fields the base schema contains.

|Field name | Logical name | Type | Mandatory | Description|
|-|-|-|-|-|
|Date | `CreationTime` |:::no-loc text="Edm.Date"::: | No | Date and time when the log is generated in UTC.|
|Flow details | `FlowDetailsUrl` |:::no-loc text="Edm.String"::: | No | Link to the flow's details page.|
|IP address | `ClientIP` |:::no-loc text="Edm.String"::: | No | IP address of the user's device.|
|ID | `ID` |:::no-loc text="Edm.Guid"::: | No | A unique GUID for every row logged.|
|Result status | `ResultStatus` |:::no-loc text="Edm.String"::: | No | Status of the row logged.|
|Organization ID | `OrganizationId` |:::no-loc text="Edm.Guid"::: | Yes | A unique identifier of the organization from which the log is generated.|
|Operation | `Operation` | :::no-loc text="Edm.String":::| No | Name of an operation.|
|Workload | `Workload` | :::no-loc text="Edm.String":::| No | Workload of an operation.|
|User | `UserKey` | :::no-loc text="Edm.String":::| No | A unique identifier of the user in Microsoft Entra ID.|
|User type | `UserType` | :::no-loc text="Edm.String":::| No | The audit type (admin, regular, or system)|
|Flow connector names | `FlowConnectorNames` | :::no-loc text="Edm.String":::| No | Connector names listed in the flow definition at the time of the event (for example, when a flow is created or edited).|
|Sharing permission | `SharingPermission` | :::no-loc text="Edm.String":::| No | Type of permission shared with another user (3 = "Owner"/ReadWrite, 2 = "Run-only user"/Read).|
|Recipient UPN | `RecipientUPN` | :::no-loc text="Edm.String":::| No | If permission was updated, shows the UPN of the permission recipient.|
|License display name | `LicenseDisplayName` | :::no-loc text="Edm.String":::| No | Display name of the license.|
|User type initiated | `UserTypeInitiated` | :::no-loc text="Edm.Int32":::| No | Which type of user initiated the operation. Applicable for *delete flow* and *edit permissions* (1 = user, 2 = admin).|
|User UPN | `UserUPN` | :::no-loc text="Edm.String":::| No | Unique ID of the user. Always equivalent to `UserKey`.|
## Limitations

- Purview audit logs capture **flow lifecycle events** (create, edit, delete) and permission changes. They don't include individual flow runs, action executions, and connector calls at runtime.
- Only cloud flow activities appear in the [Microsoft Purview portal](https://compliance.microsoft.com/). Desktop flow activities are available in the Microsoft Dataverse audit logs. You also have the option to [monitor desktop flow runs in Power Automate](/power-automate/desktop-flows/monitor-desktop-flow-runs).

## Monitor flow runs and performance

To track flow execution at runtime, use these tools:

- **[Application Insights](/power-platform/admin/app-insights-cloud-flow)** — Monitor flow runs, trigger and action execution times, and failures. Available in managed environments.
- **[Cloud flow run records in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata)** — Query per-run records including status, duration, error codes, and trigger type for solution-aware flows.
- **[Power Automate analytics in the admin center](/power-platform/admin/analytics-flow)** — View aggregated run counts, success and failure rates, and connector usage across environments.

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)
- [Set up Application Insights with Power Automate](/power-platform/admin/app-insights-cloud-flow)
- [Manage cloud flow run records in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata)
- [Power Automate analytics](/power-platform/admin/analytics-flow)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
