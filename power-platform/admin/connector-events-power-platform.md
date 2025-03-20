---
title: View the Power Platform connector activity logs
description: View Power Platform audit logs for events related to connections and custom connectors.
services: ''
suite: flow
documentationcenter: na
author: schabungbam
editor: ''
tags: ''
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/30/2024
ms.subservice: admin
ms.author: sameerch
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
contributors:
  - DanaMartens
  - sericks007
  - angieandrews
---

# View the Power Platform connector activity logs

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Audit logs are logs for important system level events. In the audit log feature, audit logs are available for events related to connections and custom connectors.

## Access the logs

1. Sign into the [Microsoft Purview compliance portal](https://compliance.microsoft.com/) as a tenant admin.

1. On the menu to the left under **Solutions**, select **Audit**.

   :::image type="content" source="./media/audit-logs/solutions-audit.png" alt-text="Screenshot of the Audit selection on the Microsoft Purview menu under Solutions.":::

   In the **New Search** tab, you can search for connector events.

   :::image type="content" source="./media/audit-logs/purview-audit.png" alt-text="Screenshot of the Audit screen in the Microsoft Purview compliance portal.":::

## Search for connector events

As an admin, you can search for connector events related to connections and custom connectors.

1. In the **Activities** field, start typing **PowerPlatform connector events**.

1. When you see the **PowerPlatform connector events** heading, select the connector events to display.

   :::image type="content" source="./media/audit-logs/connector-events.png" alt-text="Screenshot of the Power Platform connector events.":::

### Available connector events

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
|Added ConnectionDlpEvaluationResult |	When connection is turned off due to data policies |

## Get details on activities for logging

In the **Audit search** screen, you can select the log to view the details of the event in a list to the right.

### Available logging details

The following table lists logging details available in the audit logs.

|Detail  |Description  |
|---------|---------|
|Date     | Date and time in this format: YYYY-MM-DD HH:MM:SS       |
|IP Address   | Client’s IP address        |
|Users     | User’s email address        |
|Activity     | Event being audit logged        |
|Item     |  Unique ID of the resource       |
|CreationTime     |  Creation time       |
Id     | Request Correlation ID        |
|Operation     | Name of the operation being audit logged        |
|OrganizationId     | The unique ID of the tenant        |
|UserType     | A digit representing the type of user. Examples: 0 = normal user, and 2 = admin user       |
|ClientIP     | Client’s IP address     |
|ObjectID     | The unique ID of the user      |
|UserId     |  Email address of the user     |
|AdditionalInfo     | Additional information about the event:<br/></li><li>EnvironmentName: The unique ID of the environment<br/></li><li>ActionName: The API action that led to the event     |
|ResourceId     | The unique ID of the resource. Examples: custom api, and connection or gateway     |

### See also

- [Microsoft Purview compliance portal](https://compliance.microsoft.com/)
- [Microsoft Purview: Search the audit logs](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#search-the-audit-log)
