---
title: Diagnose issues and analyze performance using a Trace Parser with the Unified Development Experience.
description: Learn how you can use the Trace Parser to consume traces and analyze performance in your deployment from your Unified Developer Experience.
author: pvillads
ms.date: 03/05/2024
ms.topic: article
ms.subservice: developer
ms.reviewer: pehecke
ms.author: pvillads
---

# Diagnose issues and analyze performance using the Trace Parser

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article explains how you can use the Trace parser application to consume traces and analyze performance in your Unified Developer experience deployment. This tool can  visualize the execution of X++ methods, show execution call trees, including the time spent in each method, and the time spent for each database operation.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Finding the Trace parser

The Trace Parser is a desktop application running on the development (client) machine. When the user downloads the metadata, cross reference database etc. for a particular application version, an installation program for the trace parser (TraceParser.msi) is also downloaded. Use this MSI file to install the trace parser. When the application is started the first time, it asks for a name for the database that holds the traces. Provide a name that allows you to distinguish the trace database from other databases in your server, like "Traces".

## How does it work?

The trace parser captures events that happen in running application code, when instructed to do so, as described here. The events are stored into an Event Trace Log (.ETL) file that can be downloaded to the client tier.

The trace parser needs to query the data captured in the ETL file in advanced ways, so the information in the ETL file must be extracted from the file and injected into a SQL database on the client side. This work is done from the tool, where the .ETL file can be loaded and the database selected. Any SQL database can be used for this purpose; we suggest using the same database as is used for the cross reference data.

## Caveats

The data injected into the SQL database (subject to querying with the trace parser) contain queries, data access statements, and call stacks. The user can optionally include extended data into the logs to make diagnosing problems easier. Setting the "Include SQL parameter values" option when collecting the trace may leak information in the application to the trace. The recorded information should be kept as safe as the production environment itself. In particular, you're advised to delete any of these databases as soon as you're done using them, and not store ETL files in unsafe places, and deleting them after use. The traces can be deleted in the trace parser tool - When it starts, it shows an overview of the traces, and individual traces can be deleted from here.

## Capturing a trace

When you wish to diagnose a problem in the running application, you start the tracing, perform the application steps that demonstrate the problem, and then stop the trace. The trace is then analyzed in the trace parser. You can provide a meaningful name to the trace when you opt to start the trace.

In this section, we explain how to capture a trace from the application web page.

1. On the browser navigation bar, select the question mark **?**, and then select **Trace**.
2. In the **Trace name** field, enter a name for the trace that you're about to capture. It's good practice to choose a name that reflects the problem you want to investigate.
3. As required, set the **Include SQL parameter value** option to **Yes**. Refer to the caveats in the previous section.
4. Select the **Start trace** button.
5. Perform actions that must be analyzed, such as navigation to **Accounts payable** \> **Vendors** \> **All vendors**.
6. When done, select **Stop trace**.
7. After the trace stops, select one of the following options. (For this tutorial, select the first option.)

    - **Download trace** – Store the captured trace on a local machine. You can then analyze a downloaded trace by using the desktop version of Trace parser.

        > [!NOTE]
        > If you download a trace, it won't be available for later upload.

    - **Upload trace** – Store the trace in the cloud for later download by, for example, the admin. Uploaded traces are automatically deleted after seven days. They can also be manually deleted from the **Captured traces** page.
    - **Return to main menu** – Return to the main tracing menu to start another trace.

> [!NOTE]
> If your scenario takes more than a few minutes, you should consider splitting it into multiple traces. If a trace is too large, it can't easily be analyzed.

### Assign trace rights to a user

1. To give a user rights to capture a trace, go to **System administration** \> **Users** \> **Users**.
2. Select the user and assign the **System tracing user** role.

    [![Example of assigning trace rights to a user.](./media/trace2-284x300.jpg)](./media/trace2.jpg)

> [!NOTE]
> To help prevent unwanted tracing, remove the user role after the user has finished tracing.

## Viewing traces

**Timeline view** The Timeline tab is the first tab that you see after you import a trace into the Trace Parser. This tab is shown in the following illustration.

[![Example of information in the Timeline tab.](./media/2_desktop.png)](./media/2_desktop.png)

The **Timeline** tab has the following major components:

- The **Select Grouping** drop-down allows you to group based on various categories, such as Customer ID, Username, Session Name, etc. Groupings display maximum and minimum timestamp of events, total number of events, and lowest event level within the grouping.
- List of all events in a threaded or unthreaded view.
- Property grid displayed for the selected event.
- Timeline chart for all the selected events.
- Filtering of events.
- Session analysis notes.

**Call tree view** By selecting the **Call Tree** tab, you can see the call tree for all X++ methods.

[Example of information shown in the Call Tree tab](./media/3_desktop.png)

Similarly, you can display the **X++** tab to view a list of all the X++ methods. They are sorted by fields such as Inclusive/Exclusive durations, RPC, or Database calls. These methods are similar to the corresponding tabs in Trace Parser and have the same behavior.

### See also

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
