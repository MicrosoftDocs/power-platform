---
title: "Preview: Tenant-level Analytics for Power Apps" 
description: View tenant-level analytics for Power Apps.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/07/2021
author: tjvass
ms.subservice: admin
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

# Preview: Tenant-level Analytics for Power Apps

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The following tenant-level reports are available for Power Apps. 

## Power Apps - Usage reports

Power Apps reports provide insights into tenant and environment usage and inventory of all apps and connectors. The report answers questions such as:

- What is the total unique canvas/model-driven apps users across the tenant or environments? 
- What is the count of first-time users across canvas and model-driven apps?
- How many apps exist in my tenant or environment?
- Which of my environments had the most unique users? 
- What were the top apps by unique users/app sessions? 

> [!div class="mx-imgBorder"] 
> ![Power Apps usage report.](media/power-apps-usage.png "Power Apps usage report")

> [!NOTE]
> The service only starts collecting the data visualized in the Usage report when the feature is enabled. It can take up to 12 hours to reflect service activities from the previous day.

## Power Apps - Maker Activity report

The Power Apps Maker Activity report provide insights into tenant and environment usage and inventory of all apps and connectors. The report answers questions such as:

- What is the total number of apps created/published/modified/deleted by app makers across the tenant or environments? 
- What is the count of first-time makers across canvas and model-driven apps? 
- Who are the top makers across the tenant or environments? 
- How many of these apps are using premium or standard connectors? 
- What are the total number of connections defined for apps to consume in one or more environments?
- Allow me to filter the above list based on connector type. 

:::image type="content" source="media/maker-activity-report.png" alt-text="Power Apps Maker Activity report.":::

> [!NOTE]
> The service only starts collecting the data visualized in the Maker Activity report when the feature is enabled. It can take up to 12 hours to reflect service activities from the previous day.

## Power Apps - Inventory report

The Power Apps Inventory report offers a complete catalog of Power Apps distributed across the tenant. This view includes the **Apps last used** filter that allow admins to identify stale and orphaned Power Apps. The report answers questions such as:

- What is the total number of model-driven and canvas apps across the tenant or environments? 
- Which apps depend on specific connectors or connector types like Premium? 
- Who are the owners of the apps hosted in one or more environments? 
- What is the distribution of canvas versus model-driven apps across the organization? 

:::image type="content" source="media/power-apps-inventory-report.png" alt-text="Power Apps Inventory report.":::

> [!NOTE]
> Depending on the size of the organization, it can take up to 2 hours to initially populate the data sets backing the Inventory report. 

## Download Inventory

Power Platform admin center reports can be downloaded directly from the report visuals.  Users have the option of choosing between Summarized and Underlying data. 

- Summarized data: select this option to download the data underlying the current report visual  
- Underlying data: select this option to download the full result set backing the report 

:::image type="content" source="media/download-inventory-report.png" alt-text="Download Inventory report.":::

For more information on downloading data from the tenant level reports, see [Exporting data from Power BI visuals](/power-bi/consumer/end-user-export).

### See also
[Preview: Tenant-level analytics](tenant-level-analytics.md)



 
[!INCLUDE[footer-include](../includes/footer-banner.md)]
