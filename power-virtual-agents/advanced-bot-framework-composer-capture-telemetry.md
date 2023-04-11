---
title: "Capture telemetry with Application Insights"
description: "Use Bot Framework Composer with Power Virtual Agents to send event data to a telemetry service."
keywords: "composer, adaptive card"
ms.date: 11/03/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Capture telemetry with Application Insights

[!INCLUDE [Composer integrated with PVA](includes/composer-integrated-with-pva.md)]s

You can use Bot Framework Composer with Power Virtual Agents to send event data to a telemetry service in [Application Insights](/azure/azure-monitor/app/app-insights-overview). Telemetry offers insights into your bot by showing which features are used the most, detects unwanted behavior, and provides data on availability, performance, and usage.

> [!IMPORTANT]
> Application Insights is a feature of [Azure Monitor](/azure/azure-monitor/overview), an extensible Application Performance Management (APM) tool that allows you to monitor your live applications. It requires a subscription to [Microsoft Azure](https://azure.microsoft.com/).

## Connect Application Insights

To connect to your Application Insights service in Composer, you need to add your instrumentation key to the project.

1. In Composer, go to the **Configure** page.

    :::image type="content" source="media/advanced-bot-framework-composer-capture-telemetry/configure-tab.png" alt-text="Screenshot of the configure tab.":::

1. Enable **Advanced Settings View (json)**.

    :::image type="content" source="media/advanced-bot-framework-composer-capture-telemetry/advanced-settings.png" alt-text="Screenshot of the Advanced Settings View toggle.":::

1. Find the **applicationInsights** section, then add your Application Insights instrumentation key to the **instrumentationKey** setting.

    :::image type="content" source="media/advanced-bot-framework-composer-capture-telemetry/Configure_AppInsights_Key.png" alt-text="Screenshot of the applicationInsight key in the project JSON.":::

To learn more on how to set up and use Application Insights and create queries for Composer's Adaptive dialogs, see these resources:

- A subscription to [Microsoft Azure](https://azure.microsoft.com/).
- Get started with [Application Insights](/azure/azure-monitor/app/app-insights-overview#get-started).
- The basic concepts of [Log queries](/azure/azure-monitor/log-query/get-started-queries) in Azure Monitor.
- [Example Kusto queries](/azure/bot-service/bot-builder-telemetry-analytics-queries?view=azure-bot-service-4.0&preserve-view=true#adaptive-dialogs-started-and-completed) for Adaptive dialogs in Composer.

[!INCLUDE[footer-include](includes/footer-banner.md)]
