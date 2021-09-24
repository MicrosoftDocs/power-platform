---
title: "Preview: Power Automate analytics reports" 
description: View tenant-level Power Automate analytics reports.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/20/2021
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

# Preview: Power Automate analytics reports

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The following tenant-level reports are available for Power Automate. 

## Power Automate - Usage reports

Power Automate reports provide insights into tenant and environment usage and inventory of all flows and connectors. The report answers questions such as:

- What is the total unique Cloud & Desktop Flow users across the tenant or environments?
- What is the count of Successful vs Failed runs across Cloud & Desktop flows?
- How many flows exist in my tenant or environment?
- Which of my environments had the most unique users?
- What were the top flows across my tenant or environments by runs?

:::image type="content" source="media/power-automate-usage-report.png" alt-text="Power Automate Usage report.":::

> [!NOTE]
> The service only starts collecting the data visualized in the Usage report when the feature is enabled. It can take up to 12 hours to reflect service activities from the previous day.

## Power Automate - Maker Activity report

The Power Automate report provide insights into the activities of citizen authors of Cloud & Desktop flows across the tenant or environments. The report answers questions such as:

- What is the total number of flows created Makers across the tenant or environments?
- What is the count of first-time makers across Cloud & Desktop flows?
- Who are the top makers across the tenant or environments?
- How many of these flows are using premium or standard connectors?
- Allow me to filter the above list based on connector dependency.

:::image type="content" source="media/power-automate-maker-activity.png" alt-text="Power Automate Maker Activity report.":::

> [!NOTE]
> The service only starts collecting the data visualized in the Maker Activity report when the feature is enabled. It can take up to 12 hours to reflect service activities from the previous day.

## Power Automate - Inventory report

The Power Automate Inventory report offers a complete catalog of Cloud & Desktop flows distributed across the tenant. This view includes filters that allow admins to search for flows based on various criteria. The report answers questions such as:
- What is the total number of Cloud & Desktop flows across the tenant or environments?
- Which flows depend on specific connectors or connector types like Premium?
- Who are the owners of the flows hosted in one or more environments?
- What is the distribution of Cloud & Desktop flows apps across the organization?

:::image type="content" source="media/power-automate-inventory.png" alt-text="Power Automate Inventory report.":::

> [!NOTE]
> Depending on the size of the organization, it can take up to 2 hours to initially populate the data sets backing the Inventory report.

## Download Inventory

Power Platform admin center reports can be downloaded directly from the report visuals. Users have the option of choosing between Summarized and Underlying data.
- Summarized data: select this option to download the data underlying the current report visual
- Underlying data: select this option to download the full result set backing the report

:::image type="content" source="media/power-automate-download-inventory.png" alt-text="Download Inventory report.":::

For more information on downloading data from the tenant level reports, see [Exporting data from Power BI visuals](/power-bi/consumer/end-user-export).

### See also
[Preview: Tenant-level analytics](tenant-level-analytics.md)



 
[!INCLUDE[footer-include](../includes/footer-banner.md)]