---
title: Access and monitor Power Platform connector activity logs in Microsoft Purview
description: Learn how to access Power Platform connector activity logs in Microsoft Purview and explore what connector activities you can monitor.
author: schabungbam
ms.topic: how-to
ms.workload: na
ms.date: 11/05/2025
ms.subservice: admin
ms.author: ellenwehrle
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

Activity logs show events related to connections and custom connectors.
This article covers prerequisites, how to access the logs in Microsoft Purview, and details about connector activity event types and categories.

You can access and view connector activity logs in the [Microsoft Purview compliance portal](https://purview.microsoft.com/). These logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview).

## Prerequisites

To view connector activity logs in Microsoft Purview, make sure you've:

- Reviewed and completed all the [prerequisites](activity-logs-overview.md#prerequisites) listed in the overview article.
- Confirmed you're an admin who's assigned a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Confirmed you have either the *Audit Logs* or *View-Only Audit Logs* role assigned to you in Microsoft Purview.

Learn more:

- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

### Explore connector events

The following table lists the connector events available for searching in the audit logs.

|Connector event  |Description  |
|---------|---------|
|API created  |  When a custom API is created      |
|API edited    | When a custom API is updated        |
|API deleted    | When a custom API is deleted        |
|Connection created or edited    | When a connection is created or updated        |
|Connection deleted    | When a connection is deleted       |
|Connection edited    | When a connection is updated        |
|API permission added or edited   | When a custom API is shared or the permissions are updated |
|API made solution-aware    | When a non-solution API is moved to a solution        |
|API permission removed    | When sharing permissions of a custom API are removed        |
|Connection permission added or edited    | When a connection is shared or sharing permissions are updated       |
|Connection permission removed    | When sharing permissions of a connection are removed        |
|Gateway cluster edited    | When a gateway cluster is updated        |
|Gateway permission added or edited    | When a gateway is shared or the sharing permissions are updated      |
|Gateway permission removed   | When sharing permissions of a gateway are removed        |
|Added ConnectionDlpEvaluationResult |    When connection is turned off due to data policies |

## View logged activity details

In the **Audit search** screen, select the log to view the details of the event in a list to the right.

### Available activity details

The following table lists logging details available in the audit logs.

|Detail  |Description  |
|---------|---------|
|Date     | Date and time in this format: YYYY-MM-DD HH:MM:SS       |
|IP Address   | Client's IP address        |
|Users     | User's email address        |
|Activity     | Event being audit logged        |
|Item     |  Unique ID of the resource       |
|CreationTime     |  Creation time       |
| Id     | Request Correlation ID        |
|Operation     | Name of the operation being audit logged        |
|OrganizationId     | The unique ID of the tenant        |
|UserType     | A digit representing the type of user. Examples: 0 = normal user, and 2 = admin user       |
|ClientIP     | Client's IP address     |
|ObjectID     | The unique ID of the user      |
|UserId     |  Email address of the user     |
|AdditionalInfo     | Additional information about the event:<br/></li><li>EnvironmentName: The unique ID of the environment<br/></li><li>ActionName: The API action that led to the event     |
|ResourceId     | The unique ID of the resource. Examples: custom api, and connection or gateway     |

### Related content

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)
- [Audit log activities](/purview/audit-log-activities)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
