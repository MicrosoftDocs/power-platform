---
title: Diagnose issues and analyze performance using a trace parser with the unified developer experience.
description: Learn how you can use a trace parser to consume traces and analyze performance in your deployment from your unified developer experience.
author: pvillads
ms.date: 06/06/2024
ms.topic: how-to
ms.subservice: developer
ms.reviewer: pehecke
ms.author: pvillads
---

# Diagnose issues and analyze performance using the Trace Parser

This article explains how you can use the Trace Parser tool to consume traces and analyze performance in your unified developer experience deployment. The tool can visualize the execution of X++ methods and show execution call trees including the time spent in each method and the time spent for each database operation.

## Finding the Trace Parser
<!-- Windows only? -->
The Trace Parser tool is a desktop application running on the development (client) machine. When you download the metadata, cross reference database, or more for a particular application version, an installation program for the Trace Parser (named TraceParser.msi) is also downloaded. Use this MSI file to install the Trace Parser tool. When the tool is started the first time, it asks for a name for the database that holds the traces. Provide a name that allows you to distinguish the trace database from other databases on your server (for example "Traces").

## How does it work?

The Trace Parser captures events that occur in running application code, when instructed to do so, as described here. The events are stored in an Event Trace Log file (with a .ETL file extension) that can be downloaded to the client tier.

The Trace Parser needs to query the data captured in the ETL file in advanced ways, so the information in the ETL file must be extracted from the file and injected into a SQL database on the client side. This work is done from the tool, where the ETL file can be loaded and the database selected. Any SQL database can be used for this purpose. We suggest using the same database as is used for the cross reference data.

## Caveats

The data injected into the SQL database, that is subject to querying with the Trace Parser, contains queries, data access statements, and call stacks. The user can optionally include extended data into the logs to make diagnosing problems easier. Setting the **Include SQL parameter values** option when collecting the trace may leak information in the application to the trace. The recorded information should be kept as safe as the production environment itself. You're advised to delete any of these databases as soon as you're done using them, to not store ETL files in unsafe places, and to delete them after use. The traces can be deleted in the Trace Parser tool. When the tool starts, it shows an overview of the traces, and individual traces can be deleted from here.

## Capturing a trace

When you wish to diagnose a problem in the running application, you start the tracing, perform the application steps that demonstrate the problem, and then stop the trace. The trace is then analyzed in the Trace Parser. You can provide a meaningful name to the trace when you choose to start the trace.

In this section, we explain how to capture a trace from the application's web page.

1. On the browser navigation bar, select the question mark **?**, and then select **Trace**.
2. In the **Trace name** field, enter a name for the trace that you're about to capture. It's good practice to choose a name that reflects the problem you want to investigate.
3. As required, set the **Include SQL parameter value** option to **Yes**. Refer to the caveats in the previous section.
4. Select the **Start trace** button.
5. Perform actions that must be analyzed, such as navigation to **Accounts payable** > **Vendors** > **All vendors**.
6. When done, select **Stop trace**.
7. After the trace stops, select one of the following options. For this tutorial, select the first option.

    - **Download trace** – Store the captured trace on the local machine. You can then analyze a downloaded trace by using the desktop version of Trace Parser.

        > [!NOTE]
        > If you download a trace, it won't be available for later upload.

    - **Upload trace** – Store the trace in the cloud for later download (for example by the administrator). Uploaded traces are automatically deleted after seven (7) days. They can also be manually deleted from the **Captured traces** page.
    - **Return to main menu** – Return to the main tracing menu to start another trace.

> [!NOTE]
> If your scenario takes more than a few minutes, you should consider splitting it into multiple traces. If a trace is too large, it can't easily be analyzed.

### Assign trace rights to a user

Each system user account that is to capture and view traces must be assigned the "System tracing user" role.

1. To give a user rights to capture a trace, go to **System administration** > **Users** > **Users**.
1. Select the user and assign that person the **System tracing user** role.

:::image type="content" source="../media/unified-experience/trace-assign-to-user.png" alt-text="Assign trace rights to a user.":::

> [!NOTE]
> To help prevent unwanted tracing, remove the user role after the user has finished tracing.

## Viewing traces

The **Timeline view** tab is the first tab that you see after you import a trace into the Trace Parser. This tab is shown in the following illustration.

:::image type="content" source="../media/unified-experience/trace-timeline.png" alt-text="Information displayed in the timeline tab." lightbox="../media/unified-experience/trace-timeline.png":::

The **Timeline** tab has the following major components:

- The **Select Grouping** drop-down allows you to group based on various categories, such as Customer ID, Username, Session Name, and more. Groupings display maximum and minimum timestamp of events, total number of events, and lowest event level within the grouping.
- List of all events in a threaded or unthreaded view.
- Property grid displayed for the selected event.
- Timeline chart for all the selected events.
- Filtering of events.
- Session analysis notes.

The **Call tree view** is accessed by selecting the **Call Tree** tab. You can see the call tree for all X++ methods.

:::image type="content" source="../media/unified-experience/trace-call-tree.png" alt-text="Information displayed in the call tree tab." lightbox="../media/unified-experience/trace-call-tree.png":::

Similarly, you can display the **X++** tab to view a list of all the X++ methods. They are sorted by fields such as inclusive/exclusive durations, RPC, or database calls. These methods are similar to the corresponding tabs in Trace Parser and have the same behavior.

### See also

[X++ language reference](/dynamics365/fin-ops-core/dev-itpro/dev-ref/xpp-language-reference)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
