---
title: Collect historic audit log events
description: Learn how to export old LaunchPowerApp events from Purview audit logs and import them into the CoE Kit Audit Logs Dataverse table.
author: pete-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/02/2024
ms.subservice: guidance-toolkit
ms.author: petrip
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- Grant-Archibald-MS
  
---

# Collect historic audit log events

This solution collects app launches after they've being configured, but it isn't set up to collect historic app launches. Depending on your [Microsoft 365 license](https://www.microsoft.com/licensing/docs), historic data is available for up to one year using the audit log in Microsoft Purview.

You can load historic data into the CoE Starter Kit tables manually, using one of the flows in the solution.

> [!NOTE]
> The user retrieving audit logs needs permission to access them. Learn more in [Before you search the audit logs](/microsoft-365/compliance/audit-log-search?preserve-view=true&view=o365-worldwide#before-you-search-the-audit-log).

1. Browse to the [Purview Audit search](https://compliance.microsoft.com/auditlogsearch).
1. Search for the launched app activity in the date range available to you.

   :::image type="content" source="media/coe-oldauditlogs-1.png" alt-text="Screenshot that highlights the date range and launched app activity for a search in the Audit page of Microsoft Purview." lightbox="media/coe-oldauditlogs-1.png":::
   
1. After the search runs, select **Export** to download the results.
1. Browse to this flow in the core solution: **Admin | Audit Logs | Load events from exported Audit Log CSV file**.
1. Turn on the flow and run it, selecting the downloaded file for the Audit Log CSV parameter.

   :::image type="content" source="media/coe-oldauditlogs-3.png" alt-text="Screenshot that shows the Audit Log CSV import field and Run flow button of the Run flow pane." lightbox="media/coe-oldauditlogs-3.png":::

   > [!NOTE]
   > If you don't see the file loading after selecting **Import**, it might exceed the allowed content size for this trigger. Try breaking up the file into smaller files (50,000 rows per file) and run the flow once per file. The flow can be run simultaneously for multiple files.

1. When complete, these logs are included in your telemetry. The _last launched_ list for the apps is updated if more recent launches are found.

## Provide feedback
If you find a bug with the CoE Starter Kit, file a bug against the solution at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
