---
title: Analyze model-driven apps and Microsoft Dataverse telemetry with Application Insights | Microsoft Docs
description: About analyzing model-driven apps and Microsoft Dataverse telemetry with Application Insights
services: powerapps
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Analyze model-driven apps and Microsoft Dataverse telemetry with Application Insights

<!-- fwlink: 2147020 2151390 -->

Customers can set up their own Application Insights environment to receive telemetry on diagnostics and performance already captured by the Dataverse platform.
 
You can subscribe to receive the telemetry about operations that applications perform on your Dataverse and within model-driven apps. This telemetry provides information that you can use to diagnose and troubleshoot issues related to errors and performance. 

You do not need to write any code to enable this telemetry. You can enable or disable this telemetry feed at any time.

[Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview), is a part of the Azure monitoring ecosystem. It is widely used by enterprises for monitoring and diagnostics. Many customers have added code to their extensions to capture this data into their Application Insights environment. This additional code has a cost. Not only the cost to write and maintain, but also performance cost at runtime. These costs can be avoided by using Application Insights built-in integration.

## Why do I need telemetry?

Telemetry provides data about what is going on within a model-driven app or on the server. Without this data, the app or service is a ‘black box’; the only way to get insights on if you have an issue is to contact technical support. Telemetry enables you to detect and measure specific operations to better understand whether things are working normally, or something is negatively impacting the system.

If you have extended model-driven apps with client-side JavaScript or have added server-side logic with plug-ins, you can see the impact these extensions may have on performance and find ways to optimize them including changing the design as required. 

You can also use telemetry to observe overall performance trends so you can proactively manage them rather than react to user incidents. With Application Insights you can define conditions where you can be alerted when a metric exceeds a specific threshold.

## How does it work?

Microsoft already gathers extensive telemetry on Dataverse and model-driven apps. With Application Insights integration, an environment or tenant admin provides the Application Insights instrumentation key during the data export set-up process in the Power Platform admin center. Once setup is complete, telemetry that Microsoft gathers about your Dataverse environment, and any model-driven apps that use Application Insights, are sent to your Application Insights environment, approximately every hour. To get an Application Insights resource, see [how to create an Application Insights resource](https://docs.microsoft.com/azure/azure-monitor/app/create-new-resource).

If you decide to opt-out, you can go to the Power Platform admin center and delete the data export connection. This will stop the data export process. You can restart the process any time.

## Benefits of this integration approach

When you use Application Insights integration, you will receive a standardized set of telemetry that follows the Application Insights [telemetry data model](https://docs.microsoft.com/azure/azure-monitor/app/data-model).

The telemetry is correlated so that you can follow operations that start with a mouse click in a model-driven app all the way through to the server and back. Along the way you will be able to see what parts of the application are being used and how much time each step takes.

If you need to contact technical support, the ID values for operation (operation_id field) are the same values that Microsoft engineers use when they query telemetry data.

If you are working with a partner, or you are a system integrator, standardized telemetry means that people will not need to learn about the different design choices that were made for custom telemetry in different environments.

Note that the [Monitor tool](https://powerapps.microsoft.com/blog/monitor-now-supports-model-driven-apps/) can be used for live detailed debugging for canvas and model-driven apps.

## What is included and not included?

Multiple telemetry types will be available in your Application Insights environment. It is important to note that Application Insights has a defined [schema](https://docs.microsoft.com/azure/azure-monitor/app/data-model). The tables in Application Insights are populated per this schema with the data export.

For model-driven apps, the telemetry covers common application features such as edit form, grid, and dashboard load events. These are events where performance is typically an issue. Currently, save events and ribbon commands are not included. This feature is currently for model-driven apps only. See [telemetry events for model-driven apps](telemetry-events-model-driven-apps.md#what-kind-of-page-loads-are-available). 

For canvas apps, there is an existing [capability](https://powerapps.microsoft.com/blog/log-telemetry-for-your-apps-using-azure-application-insights/), which allows the app maker to [log custom telemetry](https://docs.microsoft.com/powerapps/maker/canvas-apps/application-insights) with Application Insights when developing the app.

Dataverse includes all the requests made on the server. You will be able to see how the requests are processed within the web server. You will not get detailed information from the database itself except for the duration of time spent processing the operation. You will also not have telemetry related to the physical resources of the server, such as memory consumption. See [telemetry events for Dataverse](telemetry-events-dataverse.md).

Note, if the standard telemetry doesn’t provide some specific metric that you need, you can still write code to supplement what is already being gathered. For client-side JavaScript in model-driven apps, you can use the same patterns you may use today to write to your Application Insights resource. For server-side code using plug-ins, you will find that any trace logs you have written will appear in Application Insights without having to write any code at all. But trace logs are intended for debugging and troubleshooting rather than telemetry.

