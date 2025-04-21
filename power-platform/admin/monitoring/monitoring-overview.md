---
title: Monitor page (preview)
description: Learn how to use the Monitor page monitor and improve operational health.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/30/2025
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

# Monitor page (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Your organization can use the **Monitor** page to measure and improve operational health metrics of resources that are built or deployed in Microsoft Power Platform. Those resources include apps. The **Monitor** page is available to both makers (in experiences such as [Power Apps](https://make.powerapps.com/)) and admins (in experiences such as the [Power Platform admin center](https://admin.powerplatform.microsoft.com/)). Makers use the data to improve their resources. Admins use it to understand aggregate operational health in the tenant or in specific environments. Metrics are calculated by aggregating daily event logs from runtime activity. Recommendations are calculated from the following sources:

- Aggregation of runtime event logs to highlight a measurable opportunity for improving a health metric
- Static analysis of resource properties that can be changed to improve a health metric

The event logs that are used to calculate metrics are available for review and download on the **Logs** page. They can help with operational health analysis.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Prerequisites

- [Tenant-level analytics](../tenant-level-analytics.md) must be turned on to make data available for monitoring experiences.
- You must be assigned to the [system administrator role of the environment](../manage-high-privileged-admin-roles.md#self-elevate-to-the-system-administrator-role) to view the name of resources that belong to the environment.
- **Optional**: A [Managed Environment](../managed-environment-overview.md) is required to view monitoring recommendations.

The availability of monitoring health metrics, logs, and recommendations in the Power Platform admin center depends on tenant and environment settings.

| Are tenant-level analytics turned on? | Is the environment a Managed Environment? | Are health metrics available? | Are logs available? | Are recommendations available? |
|---|---|---|---|---|
| Yes | Yes| Yes | Yes | Yes |
| Yes | No | Yes | Yes | No |
| Yes | No| Yes| Yes | No |
| No | No | No | No | No |

## Architecture

To produce health metrics and generate recommendations, Power Platform monitoring experiences require runtime activity. Unused resources don't appear in monitoring experiences.

Admin experiences are available to Power Platform service and Dynamics 365 admins, who can view monitoring data across the tenant. Makers can view data only for resources that they have edit privileges for in the runtime environment. Power Automate doesn't have a **Monitor** page in the maker portal. However, users can use the [Automation center](/power-automate/automation-center-overview) for a similar experience.

:::image type="content" source="../media/monitoring-architecture.svg" alt-text="Diagram that shows the flow of monitoring data to both a maker and an admin, starting from users in the runtime environment." lightbox="../media/monitoring-architecture.svg":::

## Purpose of the Monitor page

The purpose of the **Monitor** page is to bring attention to resources that have degraded operational health and highlight resources that have opportunities for improvement.  

The first resources that appear in the monitoring experience are apps that were created by using Power Apps. Therefore, the cards initially highlight apps where users experience the following issues:

- They face obstacles when they try to access an app.
- They have higher wait times to use the app.

As more resources and metrics appear on the **Monitor** page, this experience evolves and brings attention to more than just apps.

## Products

In the products view, you can compare health metrics across a pool of common resources, such as apps. You can select a resource to view its health metrics, recommendations, and logs.

### View a resource's health metrics, recommendations, and logs

1. Select a product, such as **Power Apps**.
1. Select a specific resource.
1. Review the details pane, which includes time-series charts for each available metric.
1. **Optional**: If a recommendation is available, select the contextual button in it. You can also share the recommendation with a user.

For resources that are available in the monitoring experience, you can learn more about resource-specific metrics in the maker documentation. The following table shows which resources are currently available.

| Product | Resource | Availability in the Power Platform admin center | Availability in the maker experience |
|---|---|---|---|
| Power Apps | Canvas app | Preview | Preview |
| Power Apps | Model-driven apps | Not yet available | Not yet available |
| Power Automate | Cloud flows | Preview | Not available. Use the [Automation center](/power-automate/automation-center-overview) for a similar experience. |
| Power Automate | Desktop flows | Preview | Not available. Use the [Automation center](/power-automate/automation-center-overview) for a similar experience. |
| Power Automate | Work queue | Not yet available| Not available. Use the [Automation center](/power-automate/automation-center-overview) for a similar experience. |
| Dataverse | Dataverse | Not yet available | Not yet available |
| Copilot Studio | Copilot Studio agents | Not yet available | Not yet available |
| Dynamics 365 | Apps | Not yet available | Not yet available |

## Monitoring experiences for makers

When tenant-wide analytics are turned on, metrics and logs are available to makers. Makers can view only metrics and logs that they have edit privileges for. Two environment-level settings control what analytics information is available to makers. The first setting controls whether makers can view any analytics data in monitoring experiences, including metrics and logs. The second setting controls whether makers can view End User Pseudonymous Identifiers (EUPI) such as session IDs and user object IDs in event logs.

### Turn on the monitoring experiences for makers

The following [Power Platform Administrator](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.200) PowerShell cmdlets can be used to control what monitoring data is available to makers.

#### Get settings values for maker access to analytics data

```PowerShell
Get-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName
{environment id}
```

#### Turn on maker access to analytics data

This setting doesn't include availability of EUPI such as the session IDs and user object IDs in event logs.

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName
     {environment id} -EnableAnalyticsForMakers $true
```

#### Turn on maker access to session IDs and user object IDs in event logs

This setting controls maker access to EUPI such as session IDs or user object IDs in event logs.

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName
     {environment id} -EnableEUPIForMakerAnalytics $true
```

## Frequently asked questions

### How does Power Platform monitoring coexist with Application Insights?

Power Platform monitoring includes recommendations for improving a metric. Application Insights doesn't automatically derive recommendations.

Power Platform monitoring doesn't require Azure subscriptions.

Application Insights contains a superset of runtime event logs.

- It contains event logs that are beyond the scope of Power Platform monitoring resource metrics.
- It allows for customer-defined data retention.
- It allows for custom traces, which support custom events, metrics, and dimensions.
- Event logs can be correlated and joined across resources that emit data to the same Application Insights instance.

### Why do makers in my organizations receive a message that settings must be enabled for their monitoring experience?

In addition to the tenant-level analytics setting, the environment-level **Analytics data available to Makers** setting must be turned on. The availability of monitoring health metrics, logs, and recommendations in maker monitoring experiences is based on tenant and environment settings.

| Are tenant-level analytics turned on? | Is analytics data available to makers? | Is the environment a Managed Environment? | Are operational health metrics available? | Are logs available? | Are recommendations available? |
|---|---|---|---|---|---|
| Yes | Yes | Yes | Yes | Yes | Yes |
| Yes | Yes | No | Yes | Yes | No |
| Yes | No | Not applicable | No | No | No |
| No | Not applicable | Not applicable | No | No |No |

## Known limitations

- Environment admins can't view monitoring data in the Power Platform admin center.
- Only logs that are associated with metric recommendations are available.
- Time-based metrics report out only the seventy-fifth percentile.

## Considerations

- Metrics are aggregated at a point in time, according to their aggregation rate. For example, the *App open success rate* metric is calculated daily and has only one value per day.
- Event logs in the monitoring experiences are available for only up to seven days.
- Metrics are available for only up to 28 days.

## Related information

[Overview of integration with Application Insights](../overview-integration-application-insights.md)
