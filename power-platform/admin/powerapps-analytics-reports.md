---
title: Tenant-level Analytics for Power Apps
description: View tenant-level analytics for Power Apps.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/16/2022
author: Zeffin
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Tenant-level analytics for Power Apps

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Tenant-level analytics allow Power Platform admins to extract key service metrics based on user adoption across the environments they manage. Tailor made analytics are contained within reports embedded in Power Platform admin center. 

The following tenant-level reports are available for Power Apps. 

## Power Apps - Usage reports

Power Apps reports provide insights into tenant and environment usage and inventory of all apps and connectors. The report answers questions such as:

- What is the count of unique canvas/model-driven apps users across the tenant or environments? 
- What is the count of first-time users across canvas and model-driven apps?
- How many apps exist in my tenant or environment?
- Which of my environments had the most unique users? 
- What were the top apps by unique users/app sessions? 

> [!NOTE]
> The service only starts collecting the data visualized in the Usage report when the feature is enabled. It can take 24 to 36 hours to reflect service activities from the previous day.

**Report metrics**

|Calculation  |Description  |
|---------|---------|
|Unique users     | Unique users included in the current view        |
|Total sessions     | Power Apps sessions performed within the report window        |
|Apps used     | Count of apps included in the current view        |
|New users     | New users registering activity         |
|Environments     | Count of environments with usage reported in the last 30 days        |

**Report filters**

|Scope  |Filter  |Description  |
|---------|---------|---------|
|Environment     | Name        | Friendly name used to identify a given environment        |
|     | Type        | Type of environments to include in the current view        |
|     | Region        | Global regions hosting environments        |
|App     | App type        | Toggle between usage statistics for canvas and model-driven apps        |


## Power Apps - Maker Activity report

The Power Apps Maker Activity report provides insights into tenant and environment usage and inventory of all apps and connectors. The report answers questions such as:

- What is the total number of apps created/published/modified/deleted by app makers across the tenant or environments? 
- What is the count of first-time makers across canvas and model-driven apps? 
- Who are the top makers across the tenant or environments? 
- What is the total number of connections consumed in one or more environments?

:::image type="content" source="media/maker-activity-report.png" alt-text="Power Apps Maker Activity report.":::

> [!NOTE]
> The service only starts collecting the data visualized in the Maker Activity report when the feature is enabled. It can take up to 12 hours to reflect service activities from the previous day.

**Report metrics**

|Calculation  |Description  |
|---------|---------|
|Active apps    | Count of apps with activity logged in the last 30 days       |
|Created     | Number of apps created within the current view        |
|Makers     | Total makers with activity registered in the last 30 days       |
|Connections    | Count of unique connections referenced within the current view         |
|Environments     | Count of environments with maker activity reported in the last 30 days       |

**Report filters**

|Scope  |Filter  |Description  |
|---------|---------|---------|
|Environment     | Name        | Friendly name used to identify a given environment        |
|     | Type        | Type of environments to include in the current view        |
|     | Region        | Global regions hosting environments        |
|App     | App type        | Toggle between usage statistics for canvas and model-driven apps        |


## Power Apps - Inventory report

The Power Apps Inventory report offers a complete catalog of apps distributed across the tenant. This view includes the **Last opened** filter that allows admins to identify stale and orphaned apps. The report answers questions such as:

- What is the total number of model-driven and canvas apps across the tenant or environments? 
- Which apps depend on specific connectors?
- Who are the owners of the apps hosted in one or more environments? 
- What is the distribution of canvas versus model-driven apps across the organization? 

:::image type="content" source="media/power-apps-inventory-report.png" alt-text="Power Apps Inventory report.":::

> [!NOTE]
> Depending on the size of the organization, it can take up to 24 hours to initially populate the data sets backing the Inventory report. 

**Report metrics**

|Calculation  |Description  |
|---------|---------|
|Apps    | Count of apps included in the current view      |
|Makers     | Count of makers with activity registered in the last 30 days       |
|Shared users     | Total count of users that have been granted access to Power Apps       |
|Environments    | Count of environments with apps within the current view       |
|Connections      | Count of unique connections referenced within the current view      |

**Report filters**

|Level  |Filter  |Description  |
|---------|---------|---------|
|App     | Last opened        | Used to filter results based on ‘Last Opened’ date         |
|     | Type        | Toggle between usage statistics for canvas and model-driven apps       |
| Environment    | Name        | Friendly name used to identify a given environment        |
|     | App type        | Type of environments to include in the current view        |
|     | App type        | Global regions hosting environments        |


## Download inventory

Power Platform admin center reports can be downloaded directly from the report visuals.  Users have the option of choosing between Summarized and Underlying data. 

- Summarized data: select this option to download the data underlying the current report visual  
- Underlying data: select this option to download the full result set backing the report 

:::image type="content" source="media/download-inventory-report.png" alt-text="Download Inventory report.":::

For more information on downloading data from the tenant level reports, see [Exporting data from Power BI visuals](/power-bi/consumer/end-user-export).

### See also
[Tenant-level analytics](tenant-level-analytics.md) <br />

 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
