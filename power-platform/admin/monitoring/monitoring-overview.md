---
title: Monitor the health of your resources (preview)
description: Learn how to use the Monitor > Overview page to monitor and improve operational health.
ms.subservice: admin
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/23/2025
ms.custom: NewPPAC
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - arjunmayur
  - trdehove
---

# Monitor the health of your resources (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Your organization can use the **Monitor** area of the Power Platform admin center to measure and improve operational health metrics of resources that are built or deployed. Those resources include apps and flows. 

The **Monitor** experience is available to both makers (in experiences such as [Power Apps](https://make.powerapps.com/)) and admins (in experiences such as the [Power Platform admin center](https://admin.powerplatform.microsoft.com/)). Makers use the data to improve their resources. Admins use it to understand aggregate operational health in the tenant or in specific environments. Metrics are calculated by aggregating daily event logs from runtime activity. Recommendations are calculated from the following sources:

- Aggregation of runtime event logs to highlight a measurable opportunity for improving a health metric
- Static analysis of resource properties that can be changed to improve a health metric

The event logs that are used to calculate metrics are available for review and download on the **Logs** page. They can help with operational health analysis.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Prerequisites

- [Tenant-level analytics](../tenant-level-analytics.md) must be turned on to make data available for Monitor experiences.
- You must be assigned to the [system administrator role of the environment](../manage-high-privileged-admin-roles.md#self-elevate-to-the-system-administrator-role) to view the name of resources that belong to the environment.
- **Optional**: A [Managed Environment](../managed-environment-overview.md) is required to view Monitor recommendations.

The availability of Monitor health metrics, logs, and recommendations in the Power Platform admin center depends on tenant and environment settings.

| Are tenant-level analytics turned on? | Is the environment a Managed Environment? | Are health metrics available? | Are logs available? | Are recommendations available? |
|---|---|---|---|---|
| Yes | Yes| Yes | Yes | Yes |
| Yes | No | Yes | Yes | No |
| Yes | No| Yes| Yes | No |
| No | No | No | No | No |

## Architecture

To produce health metrics and generate recommendations, Power Platform Monitor experiences require runtime activity. Unused resources don't appear in Monitor experiences.

Admin experiences are available to Power Platform service and Dynamics 365 admins, who can view Monitor data across the tenant. Makers can view data only for resources that they have edit privileges for in the runtime environment. Power Automate doesn't have a monitoring page in the maker portal. However, users can use the [Automation center](/power-automate/automation-center-overview) for a similar experience.

:::image type="content" source="../media/monitoring-architecture.svg" alt-text="Diagram that shows the flow of Monitor data to both a maker and an admin, starting from users in the runtime environment." lightbox="../media/monitoring-architecture.svg":::

## Purpose of Monitor area of the Power Platform admin center

The purpose of the **Monitor** area of the Power Platform admin center is to bring attention to resources that have degraded operational health and highlight resources that have opportunities for improvement.  

The first resources that appear in the Monitor experience are resources that were created by using Power Platform products like Power Apps or Power Automate. Therefore, the cards initially highlight resources where users experience the following issues:

- They face obstacles when they try to access a resource.
- They have higher wait times to use the resource.


## Products

In the products view, you can compare health metrics across a pool of common resources, such as apps. You can select a resource to view its health metrics, recommendations, and logs.

### View a resource's health metrics, recommendations, and logs

1. Select a product, such as **Power Apps**.
1. Select a specific resource.
1. Review the details pane, which includes time-series charts for each available metric.
1. **Optional**: If a recommendation is available, select the contextual button in it. You can also share the recommendation with a user.

For resources that are available in the Monitor experience, you can learn more about resource-specific metrics in the maker documentation. The following table shows which resources are currently available.

| Product | Resource | Availability in the Power Platform admin center | Availability in the maker experience |
|---|---|---|---|
| Power Apps | Canvas app | Preview | Preview |
| Power Apps | Model-driven apps | Preview | Preview |
| Power Automate | Cloud flows | Preview | Not available. Use the [Automation center](/power-automate/automation-center-overview) for a similar experience. |
| Power Automate | Desktop flows | Preview | Not available. Use the [Automation center](/power-automate/automation-center-overview) for a similar experience. |
| Power Automate | Work queue | Not yet available| Not available. Use the [Automation center](/power-automate/automation-center-overview) for a similar experience. |
| Dataverse | Dataverse | Not yet available | Not yet available |
| Copilot Studio | Copilot Studio agents | Not yet available | Not yet available |
| Dynamics 365 | Apps | Not yet available | Not yet available |

## Frequently asked questions

### How does Power Platform monitoring coexist with Application Insights?

Power Platform Monitor includes recommendations for improving a metric. Application Insights doesn't automatically derive recommendations.

Power Platform Monitor doesn't require Azure subscriptions.

Application Insights contains a superset of runtime event logs.

- It contains event logs that are beyond the scope of Power Platform monitoring resource metrics.
- It allows for customer-defined data retention.
- It allows for custom traces, which support custom events, metrics, and dimensions.
- Event logs can be correlated and joined across resources that emit data to the same Application Insights instance.


## Known limitations

- Only logs that are associated with metric recommendations are available.
- Time-based metrics report out only the 75th percentile.

## Considerations

- Metrics are aggregated at a point in time, according to their aggregation rate. For example, the *App open success rate* metric is calculated daily and has only one value per day.
- Event logs in the monitoring experiences are available for only up to seven days.
- Metrics are available for only up to 28 days.

## Related content

[Overview of integration with Application Insights](../overview-integration-application-insights.md)
