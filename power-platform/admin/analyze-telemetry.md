---
title: "Preview: Analyze model-driven apps and Dataverse telemetry with Application Insights | Microsoft Docs"
description: About analyzing model-driven apps and Microsoft Dataverse telemetry with Application Insights
services: powerapps
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/28/2021
author: tjvass
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
# Preview: Analyze model-driven apps and Microsoft Dataverse telemetry with Application Insights
<!-- fwlink: 2147020 2151390 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can set up an Application Insights environment to receive telemetry on diagnostics and performance captured by the Dataverse platform.

You can subscribe to receive telemetry about operations that applications perform on your Dataverse database and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance.

You don't need to write any code to enable this telemetry. You can enable or disable the telemetry feed at any time.

[Application Insights](/azure/azure-monitor/app/app-insights-overview) is part of the Azure Monitor ecosystem. It's widely used by enterprises for monitoring and diagnostics. Many customers have added code to their extensions to capture this data into their Application Insights environments. This additional code has a cost, however&mdash;not only the cost to write and maintain, but also a performance cost at runtime. These costs can be avoided by using Application Insights built-in integration.

> [!NOTE]
> At general availability, enablement of Application Insights will be limited to customers with a paid/premium Dataverse licenses available for the tenant. Details of these requirements will be provided in admin documentation and in general availability [release plans](/dynamics365/release-plans/). Additional details on minimum Dataverse capacity requirements to access the Data Export features will be announced in advance of general availability.
        

## Why do I need telemetry?

Telemetry provides data about what's going on within a model-driven app or on the server. Without this data, the app or service is a "black box"; the only way to get insight if you have an issue is to contact technical support. Telemetry enables you to detect and measure specific operations to better understand whether things are working normally or something is negatively affecting the system.

If you've extended model-driven apps by using client-side JavaScript or added server-side logic by using plug-ins, you can see the impact these extensions might have on performance and find ways to optimize them, including changing the design if required.

You can also use telemetry to observe overall performance trends so you can proactively manage them rather than react to user incidents. With Application Insights, you can define conditions where you'll be alerted when a metric exceeds a specific threshold.

## How does it work?

Microsoft already gathers extensive telemetry on Dataverse and model-driven apps. With Application Insights integration, an environment or tenant admin provides the Application Insights instrumentation key while setting up the data export process in the Power Platform admin center. As soon as setup is complete, telemetry that Microsoft gathers about your Dataverse environment and any model-driven apps that use Application Insights are sent to your Application Insights environment. More information: [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource)

If you decide to opt out, you can go to the Power Platform admin center and delete the data export connection. This will stop the data export process. You can restart the process any time.

## Benefits of this integration approach

When you use Application Insights integration, you'll receive a standardized set of telemetry that follows the Application Insights [telemetry data model](/azure/azure-monitor/app/data-model).

The telemetry is correlated so that you can follow operations that start with a mouse click in a model-driven app all the way through to the server and back. Along the way, you'll be able to see what parts of the application are being used and how much time each step takes.

If you need to contact technical support, you can use the ID values for the operations (the operation_id field). These are the same values that Microsoft engineers use when they query telemetry data.

If you're working with a partner or you're a system integrator, standardized telemetry means that people won't need to learn about the different design choices that were made for custom telemetry in different environments.

Note that Monitor can be used for [live detailed debugging for canvas apps and model-driven apps](https://powerapps.microsoft.com/blog/monitor-now-supports-model-driven-apps/).

## Custom telemetry

If the standard telemetry doesn't provide some specific metric that you need, you can write code to supplement what's already being gathered.

When you have enabled this Application Insights capability you can use the [Microsoft.Xrm.Sdk.PluginTelemetry.ILogger Interface](/dotnet/api/microsoft.xrm.sdk.plugintelemetry.ilogger) in your plug-in code to write telemetry data directly to your Application Insights resource. This telemetry is never sent to Microsoft. More information: [Write Telemetry to your Application Insights resource using ILogger (Preview)](/powerapps/developer/data-platform/application-insights-ilogger)

For client-side JavaScript in model-driven apps, you can use the same patterns you use today to write to your Application Insights resource.

## What is included and not included?

Multiple telemetry types will be available in your Application Insights environment. It's important to note that Application Insights has a defined [schema](/azure/azure-monitor/app/data-model). The tables in Application Insights are populated in accordance with this schema during data export.

For model-driven apps, the telemetry covers common application features such as edit form, grid, and dashboard load events. These are events where performance is typically an issue. Currently, save events and ribbon commands aren't included. This feature is currently available for model-driven apps only. See [telemetry events for model-driven apps](telemetry-events-model-driven-apps.md#what-kind-of-page-loads-are-available). 

For canvas apps, an [existing capability](https://powerapps.microsoft.com/blog/log-telemetry-for-your-apps-using-azure-application-insights/) allows the app maker to [log custom telemetry](/powerapps/maker/canvas-apps/application-insights) with Application Insights when developing the app.

Dataverse includes all the requests made on the server. You'll be able to see how the requests are processed within the web server. You won't get detailed information from the database itself, except for the duration of time spent processing the operation. You also won't have telemetry related to the physical resources of the server, such as memory consumption. More information: [Telemetry events for Dataverse](telemetry-events-dataverse.md)



