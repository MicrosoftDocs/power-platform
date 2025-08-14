---
title: Collect historic audit log events
description: Learn how to export old LaunchPowerApp events from Microsoft Purview audit logs and import them into the CoE Kit Audit Logs Dataverse table.
author: pete-msft
ms.component: pa-admin
ms.topic: how-to
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

This solution collects app launches after they are configured, but it isn't set up to collect historic app launches. Depending on your [Microsoft 365 license](https://www.microsoft.com/licensing/docs), historic data is available for up to one year through the audit log in Microsoft Purview.

You can use one of the flows in the solution to manually load historic data into the Center of Excellence (CoE) Starter Kit tables.

> [!NOTE]
> The user who retrieves audit logs needs permission to access them. Learn more in [Before you search the audit log](/microsoft-365/compliance/audit-log-search?preserve-view=true&view=o365-worldwide#before-you-search-the-audit-log).

1. Go to [Microsoft Purview Audit search](https://compliance.microsoft.com/auditlogsearch).
1. Search for the launched app activity in the date range that is available to you.

    :::image type="content" source="media/coe-oldauditlogs-1.png" alt-text="Screenshot that highlights the UI elements used to search for the date range and launched app activity on the Audit page in Microsoft Purview." lightbox="media/coe-oldauditlogs-1.png":::

1. After the search runs, select **Export** to download the results.
1. Browse to the following flow in the core solution: **Admin | Audit Logs | Load events from exported Audit Log CSV file**.
1. Turn on the flow, and run it. In the **Run flow** pane, select the downloaded file for the **Audit Log CSV** parameter.

    :::image type="content" source="media/coe-oldauditlogs-3.png" alt-text="Screenshot that shows the Audit Log CSV parameter and Run flow button in the Run flow pane." lightbox="media/coe-oldauditlogs-3.png":::

    > [!NOTE]
    > If the file isn't loaded after you select **Import**, it might exceed the allowed content size for this trigger. Try to break the file into smaller files, each of which contains a maximum of 50,000 rows. Then run the flow once per file. The flow can be run for multiple files simultaneously.

After the flow runs, the logs are included in your telemetry. If more recent launches are found, the *last launched* list for the apps is updated.

## Provide feedback

If you find a bug with the CoE Starter Kit, file a bug against the solution at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
