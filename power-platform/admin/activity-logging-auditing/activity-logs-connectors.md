---
title: View Power Platform connector activity logs in Microsoft Purview
description: Learn how to access Power Platform connector activity logs in Microsoft Purview and explore what connector activities you can monitor.
author: grbarker
ms.topic: how-to
ms.date: 01/23/2026
ms.subservice: admin
ms.author: grbarker
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
  - DanaMartens
  - sericks007
  - angieandrews
  - EllenWehrle
ms.custom: sfi-image-nochange
---

# View Power Platform connector activity logs in Microsoft Purview

You can view many Microsoft Power Platform connector activities in Microsoft Purview, such as when connectors are created, updated, and deleted, or API calls. You can also view activity logs within specific date ranges to gain insights.

Regularly view Power Platform connectors activities in Microsoft Purview to:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot problems
- mitigate failures.

This article covers prerequisites, how to access the logs in Microsoft Purview, and details about connector activity event types and categories.

## Prerequisites

To view connector activity logs in Microsoft Purview, make sure you:

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

### Explore connector events

This table lists the connector events you can search for in the audit logs.

|Connector event  |Description  |
|---------|---------|
|API created  |  A custom API is created.      |
|API edited    | A custom API is updated.        |
|API deleted    | A custom API is deleted.        |
|Connection created or edited    | A connection is created or updated.        |
|Connection deleted    | A connection is deleted.       |
|Connection edited    | A connection is updated.        |
|API permission added or edited   | A custom API is shared or the permissions are updated. |
|API made solution-aware    | A non-solution API is moved to a solution.        |
|API permission removed    | Sharing permissions of a custom API are removed.        |
|Connection permission added or edited    | A connection is shared or sharing permissions are updated.       |
|Connection permission removed    | Sharing permissions of a connection are removed.        |
|Gateway cluster edited    | A gateway cluster is updated.        |
|Gateway permission added or edited    | A gateway is shared or the sharing permissions are updated.     |
|Gateway permission removed   | Sharing permissions of a gateway are removed.       |
|Added `ConnectionDlpEvaluationResult` |    Connection is turned off due to data policies. |

## View logged activity details

On **Audit search**, you can select a log and view its activity details. This table lists the available activity details.

### Available activity details

The following table lists logging details available in the audit logs.

|Detail  |Description  |
|---------|---------|
|`Date`     | Date and time in this format: `YYYY-MM-DD HH:MM:SS`       |
|`IP Address`   | Client's IP address        |
|`Users`     | User's email address        |
|`Activity`     | Event being audit logged        |
|`Item`     |  Unique ID of the resource       |
|`CreationTime`     |  Creation time       |
| `Id`     | Request Correlation ID        |
|`Operation`     | Name of the operation being audit logged        |
|`OrganizationId`     | The unique ID of the tenant        |
|`UserType`     | A digit representing the type of user. Examples: 0 = normal user, and 2 = admin user       |
|`ClientIP`     | Client's IP address     |
|`ObjectID`     | The unique ID of the user      |
|`UserId`     |  Email address of the user     |
|`AdditionalInfo`     | Additional information about the event:<br/></li><li>`EnvironmentName`: The unique ID of the environment<br/></li><li>`ActionName`: The API action that led to the event     |
|`ResourceId`     | The unique ID of the resource. Examples: custom api, and connection or gateway     |

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)
- [Audit log activities](/purview/audit-log-activities)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
