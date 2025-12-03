---
title: View analytics for Power Automate desktop flows | Microsoft Docs
description: Learn about trends, usage patterns, and more analytics for desktop flows in the Power Platform admin center.
author: Zeffin
ms.topic: how-to
ms.date: 07/08/2025
ms.subservice: admin
ms.author: cvassallo
ms.reviewer: sericks
search.audienceType: 
  - flowadmin
contributors:
  - isaacwinoto 
---

# View analytics for desktop flows

As an admin, you need to view the overall status of automation that runs in your organization. There are two options to monitor the analytics for automation that's built with desktop flows:

- The Power Platform admin center.
- The Center of Excellence (CoE) Starter Kit.

This article discusses the viewing desktop flows analytics reports in the Power Platform admin center.

The easiest option for an admin to view analytics for the desktop flows in their organization is to visit [Power Platform admin center](https://admin.powerplatform.microsoft.com/). There are three reports:

|Report | Description|
|--- | ---|
|Runs | This report gives you an overview of the daily, weekly, and monthly desktop flows run statistics. This report also provides trend lines and run results (success/failure/cancel). This report gives insights on how actively desktop flows are used in each environment.|
|Usage | This report shows you the desktop flows that are being used most, giving you insights into your automation inventory.|
|Created | This report shows you analytics against recently created desktop flows, giving you insights into your most active desktop flows makers.|

## Data storage

When a user creates an environment in a region, the environment is hosted in that region. All data for that environment resides within that region for a maximum period of 28 days.

The data refresh cycle is about 24 hours and you can find the last refresh time at the top-right corner of the page.

## Prerequisites

You need to be a **environment admin** to access the Power Platform admin center reports.

To access the reports:

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

   > [!NOTE]
   > You may have to select your country/region if it's your first time signing in.

1. On the Manage pane, in the Products section, select **Power Automate**.
1. On the Power Automate analytics page, you see two views, *Overview* and  *Environment View*. Both views offer options to apply filters to the report data.

## Power Automate analytics overview <!-- update-add one image for this section -->

The Overview view allows you to view Power Automate *Usage*, *Maker activity*, and *Inventory*. For each tab, you have the option to apply *Environment filters*. You can view which environments to include in the report.

### View the usage report

For Power Automate usage, you can see the counts for:

- Total flows
- Total runs
- Successful runs
- Failed runs
- Environments

The report displays individual tables for:

- Runs
- Top flows: max runs
- Top environments: max runs
- Flow details (Flow name, Runs, Name, Flow id, and Environment id)

Go to the upper-right corner of each table to access filtering and display options. You can also access additional options that allow you to change the view, gain insights, and export the data.

## View the created report

> [!IMPORTANT]
> You must upgrade the Power Automate Desktop (preview) app to the version of 2.1.43.20312 or later, in order to generate correct data for this report.

1. Select **Created**.

   ![A screenshot of the desktop flow created reports tab.](./media/analytics-ui-flow/select-created.png)

1. [Filter](#filter-your-view) the view to display the **Created** reports from a specific environment and for a specific time period. 

   ![A screenshot of the desktop flow created reports.](./media/analytics-ui-flow/created-ppac.png)

## Limitations of downloaded reports
Some fields, such as the creator's email address and the app or flow display name, may appear blank in the exported reports. This is expected behavior, as these values are resolved at runtime and aren't part of the underlying stored dataset.

## Related content

- Run [desktop flows](/power-automate/desktop-flows/run-desktop-flow).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
