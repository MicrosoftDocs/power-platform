---
title: "Capture telemetry with Application Insights"
description: "Use Bot Framework Composer with Power Virtual Agents to send event data to a telemetry service."
keywords: "composer, adaptive card"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: makolomi
ms.custom: "cex"
ms.collection: virtualagent
---

# Capture telemetry with Application Insights

[!INCLUDE [Composer integrated with Power Virtual Agents](includes/composer-integrated-with-pva.md)]

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

## Analyze bot telemetry with Application Insights

After you've connected your bot to Application Insights, telemetry data is logged when users interact with the bot, including testing within Power Virtual Agents. To see the logged telemetry data, navigate to the **Logs** section of your Application Insights resource in Azure.

From here, you can use [Kusto queries](/azure/data-explorer/kusto/query) to query and analyze your data. See [example queries](#example-queries).

In addition to the native analytics features within Power Virtual Agents, you can send telemetry data to Application Insights. Telemetry offers insights into your bot by tracking: 

- Logged messages and events sent to and from your bot 
- Topics to be triggered during user conversations
- Custom telemetry events that can be sent from your topics

> [!IMPORTANT]
> Application Insights is a feature of [Azure Monitor](/azure/azure-monitor/overview), an extensible Application Performance Management (APM) tool that allows you to monitor your live applications. It requires a subscription to [Microsoft Azure](https://azure.microsoft.com/).

### Example queries

A query can be as simple as specifying a single table, such as `customEvents`, which shows all custom telemetry events logged from Power Virtual Agents. But you can also use [Kusto queries](/azure/data-explorer/kusto/query) to narrow down your results further, including;

- Adding a time interval
- Extending your results using [custom dimensions](#custom-dimensions). Custom dimensions are custom properties that are logged, along with the prebuilt fields, such as timestamp or the event name
- A *where* clause to limit the data returned based on a condition
- Using more built-in Kusto functions to determine what and how information is shown

The example query below results in a line chart that shows how many distinct users communicated with your bot per day for the past 14 days.

```
let queryStartDate = ago(14d);
let queryEndDate = now();
let groupByInterval = 1d;
customEvents
| where timestamp > queryStartDate
| where timestamp < queryEndDate
| summarize uc=dcount(user_Id) by bin(timestamp, groupByInterval)
| render timechart
```

> [!IMPORTANT]
> The data within some fields varies and is more or less applicable, depending on the channel that is being used. For example, you'll only get a correct count of unique users in the query if they're authenticated users and their user ids are consistent across conversations. In anonymous scenarios where a random user id is generated per conversation, the user id field is less useful.

### Excluding telemetry from test conversations from your queries

> [!Note]
> Excluding telementry from test conversations from your queries does not apply to classic bots.

Your bot logs telemetry for all conversations, including those that happen within the Power Virtual Agents test canvas. If you want to exclude telemetry gathered during testing, you can extend your query with the `designMode` custom dimension that is captured on all events, and use a *where* clause in your query.

The following example shows all custom events, excluding those captured through the test canvas.

```
customEvents
| extend isDesignMode = customDimensions['designMode']
| where isDesignMode == "False"
```
### Custom Dimensions

Much of the specific activity data received from Power Virtual Agents is stored in the `customDimensions` field. You can [see a custom dimension field being used](#excluding-telemetry-from-test-conversations-from-your-queries) in a query to exclude telemetry from test conversations.

| Field        | Description                     | Sample Values                                           |
|--------------|---------------------------------|--------------------------------------------------------|
| type | Type of activity                 | `message`, `conversationUpdate`, `event`, `invoke`       |
| channelId    | Channel identifier              | `emulator`, `directline`, `msteams`, `webchat`           |
| fromId       | From Identifier                 | `<id>`                                                 |
| fromName     | Username from client            | `John Bonham`, `Keith Moon`, `Steve Smith`, `Steve Gadd` |
| locale       | Client origin locale            | `en-us`, `zh-cn`, `en-GB`, `de-de`, `zh-CN`              |
| recipientId  | Recipient identifier            | `<id>`                                                 |
| recipientName| Recipient name                  | `John Bonham`, `Keith Moon`, `Steve Smith`, `Steve Gadd` |
| text         | Text in message                 | `find a coffee shop`                                    |
| designMode         | Conversation happened within the test canvas **Note:** does not apply to classic bots | `True` / `False`                                     |



--- 

[!INCLUDE[footer-include](includes/footer-banner.md)]
