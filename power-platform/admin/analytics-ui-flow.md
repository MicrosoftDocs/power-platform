---
title: View desktop flows analytics in the Power Platform admin center | Microsoft Docs
description: Learn about trends, usage patterns, and more analytics for desktop flows in the Power Platform admin center.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-platform
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/01/2021
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowadmin
---

# View analytics for desktop flows

As an admin, you will need to view the overall status of automation that runs in your organization. There are two options to monitor the analytics for automation that's built with desktop flows:

1. The Power Platform admin center.
1. The Center of Excellence (CoE) Starter Kit.

This article discusses the viewing desktop flows analytics reports in the Power Platform admin center.


The easiest option for an admin to view analytics for the desktop flows in their organization is to visit Power Platform admin center (PPAC). In the PPAC by default, you will find the following three reports:

Report | Description
--- | ---
Runs | This report gives you an overview of the daily, weekly, and monthly desktop flows run statistics. This report also provides trend lines and run results (success/failure/cancel). This report gives insights on how actively desktop flows are used in each environment.
Usage | This report shows you the desktop flows that are being used most, giving you insights into your automation inventory.
Created | This report shows you analytics against recently created desktop flows, giving you insights into your most active desktop flows makers.

## Prerequisites

You must have the **environment admin** privilege to access the Power Platform admin center reports.

To access the reports:

1. Sign into [Power Automate]().

   >[!NOTE]
   >You may have to select your country/region if it's your first time signing in.

1. Select the **Settings** icon > **Admin Center**.

   ![A screenshot that displays the settings icon and the admin center link](./media/analytics-ui-flow/settings-admin-center.png)

1. Expand **Analytics**, and then select **Power Automate**.

   ![A screenshot of the steps to view the Power Automate analytics](./media/analytics-ui-flow/analytics-pa.png)

1. Select **Desktop flows**.

   ![A screenshot that shows the desktop flows tab selected](./media/analytics-ui-flow/select-ui-flows.png)

1. View the reports.

   ![A screenshot of the analytics reports](./media/analytics-ui-flow/runs.png)


## Filter your view

You can filter your view to display reports from a specific **environment** or for a specific **Time period**

1. Select the filter icon.

   ![A screenshot of the filter icon](./media/analytics-ui-flow/select-filter.png)

1. Expand the **Environment** list, and then select the environment for which you'd like to view reports.

1. Expand the **Time period** list, and then select the number of days for which you'd like to view reports.

   ![A screenshot that shows the filters that you can use to manage the reports that you view](./media/analytics-ui-flow/filter.png)

1. Select **Apply**.

## View the runs report

1. Select **Runs**.

   ![A screenshot of the desktop flow runs reports tab](./media/analytics-ui-flow/select-runs.png)

1. [Filter](#filter-your-view) the view to display the **Runs** reports from a specific environment and for a specific time period. 


   ![A screenshot of the desktop flow runs reports](./media/analytics-ui-flow/runs.png)

## View the usage report

1. Select **Usage**.

   ![A screenshot of the desktop flow usage reports tab](./media/analytics-ui-flow/select-usage.png)


1. [Filter](#filter-your-view) the view to display the **Usage** reports from a specific environment and for a specific time period. 

   ![A screenshot of the desktop flow usage reports](./media/analytics-ui-flow/usage-ppac.png)

## View the created report

>[!IMPORTANT]
>You must upgrade the Power Automate Desktop (preview) app to the version of 2.1.43.20312 or later, in order to generate correct data for this report.

1. Select **Created**.

   ![A screenshot of the desktop flow created reports tab](./media/analytics-ui-flow/select-created.png)

1. [Filter](#filter-your-view) the view to display the **Created** reports from a specific environment and for a specific time period. 

   ![A screenshot of the desktop flow created reports](./media/analytics-ui-flow/created-ppac.png)


## Learn more

- Analyze the [desktop flows risk assessment](../guidance/coe/power-bi-govern.md#desktop-flows-risk-assessment) in your environment.
- [Create desktop flows](/power-automate/desktop-flows/create-desktop).
- [Create Selenium IDE flows](/power-automate/ui-flows/create-web).
- Run [desktop flows](/power-automate/desktop-flows/run-desktop-flow).

[!INCLUDE[footer-include](../includes/footer-banner.md)]