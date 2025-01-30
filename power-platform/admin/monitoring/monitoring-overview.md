---
title: Monitor page (preview)
description: Learn about how to monitor and improve operational health.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/30/2025
ms.custom: ignite-2024
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - arjunmayur 
---

# Monitor page (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

The **Monitor** page allows your organization to measure and improve operational health metrics of resources built or deployed in Power Platform, such as apps. It's available to both makers and admins in their respective experiences, such as [make.powerapps.com](https://make.preview.powerapps.com/) and [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com/). Makers use this data to improve their resources and admins use this data to understand aggregate operational health in the tenant or select environments. Metrics are calculated by aggregating daily event logs from runtime activity. Recommendations are calculated from: 

- Aggregating runtime event logs to highlight a measurable opportunity to improve a health metric
- Static analysis of resource properties that can be altered to improve a health metric

The event logs used to calculate metrics are available for review and download in the **Logs** page to aid operational health analysis. 

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Prerequisites
- [Tenant-level analytics](../tenant-level-analytics.md) must be turned on for data to be available for monitoring experiences.
- You must have [system administrator role of the environment](../manage-high-privileged-admin-roles.md#self-elevate-to-the-system-administrator-role) to see the name of the resources belonging to the environment 
- **Optional**: [Managed Environments](../managed-environment-overview.md) is required to view monitoring recommendations.

The availability of monitoring health metrics, logs, and recommendations in Power Platform admin center is based on tenant and environment settings.  

| Are tenant-level analytics turned on? | Is this a Managed Environment? | Are health metrics available? | Are logs available? | Are recommendations available?|
|---------------------------------------|----------------------------------|--------------------------|----------------------|-----------------------------------|
| Yes | Yes| Yes| Yes| Yes|
| Yes| No | Yes| Yes|  No|
| Yes| No| Yes| Yes| No|
| No | No  | No| No| No|

## Architecture
Power Platform monitoring experiences require runtime activity to produce health metrics and generate recommendations. Unused resources don't appear in monitoring experiences. Admin experiences are available to Power Platform service and Dynamics 365 admins, who can see monitoring data across the tenant. Makers can only see data for resources for which they have edit privileges to in the runtime environment. Power Automate doesn't have a specific maker experience for Monitor, but users can use Automation Center for a similar experience. To learn more, please follow this link: https://learn.microsoft.com/en-us/power-automate/automation-center-overview

:::image type="content" source="../media/monitoring-architecture.png" alt-text="Upload the deployment profile.":::

## Purpose of the Monitor page
The **Monitor** page exists to bring attention to resources with degraded operational health and highlight which resources have opportunities for improvement. Since Power Apps are the first resources to appear in the **Monitor** experience, the cards highlight apps where end users face obstacles accessing an app or they have higher wait times to use the app. As more resources and metrics appear in the **Monitor** page, this experience will evolve to bring attention to more than apps. 

## Products
The products view allows you to compare health metrics across a pool of common resources, such as apps, and select a resource to view its health metrics, recommendations, and logs. 

## See a resource’s health metrics, recommendations, and logs 

1. Select a product, for example **Power Apps**.
1. Select a specific resource.
1. See the details pane with time-series charts for each metric available.  
1. **Optional**: If a recommendation is available, select the contextual button in the recommendation and/or share the recommendation with a user.

For resources available in the monitoring experience, you can learn more about resource-specific metrics in the maker documentation. The following table indicates which resources are available at this time.


| Product | Resource | Availability in Power Platform Admin Center | Availability in Maker Experience |
|---------|------------|------------|------------|
| Power Apps | Canvas app | Preview| Preview|
| Power Apps | Model-driven apps | Not available yet| Not available yet|
| Power Automate | Cloud flows | Preview| Not available, please go to Automation Center for similar experience https://learn.microsoft.com/en-us/power-automate/automation-center-overview|
| Power Automate | Desktop flows | Preview| Not available, please go to Automation Center for similar experience https://learn.microsoft.com/en-us/power-automate/automation-center-overview|
| Power Automate | Work Queue | Not available yet| Not available, please go to Automation Center for similar experience https://learn.microsoft.com/en-us/power-automate/automation-center-overview|
| Dataverse | Dataverse | Not available yet| Not available yet|
| Copilot Studio | Copilot Studio agents | Not available yet| Not available yet|
| Dynamics 365 |Apps | Not available yet| Not available yet|
   
## Monitoring experiences for makers
When tenant-wide analytics is turned on, metrics and logs are available to makers. Makers can only see metrics and logs for which they have edit privileges. Environment-level settings exist to control what analytics information is available to makers. One setting controls whether makers see any analytics data in monitoring experiences including metrics and logs. The second setting controls whether makers see End User Pseudonymous Identifiers (EUPI), like session IDs and user object IDs in event logs.


### Turn on the monitoring experiences for makers
The following [Power Platform Administrator](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.200) PowerShell cmdlets may be used to control what monitoring data is available to makers. 

#### Get settings values for maker access to analytics data

```PowerShell
Get-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName 
{environment id}
```

#### Turn on maker access to analytics data
This setting doesn't include availability of End User Pseudonymous Identifiers (EUPI) in event logs, such as the session IDs or user object IDs. 

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName 
     {environment id} -EnableAnalyticsForMakers $true
```

#### Turn on maker access to session IDs and user object IDs in event logs
This setting controls maker access to End User Pseudonymous Identifiers (EUPI) in event logs, such as session IDs or user object IDs, in event logs.

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName 
     {environment id} -EnableEUPIForMakerAnalytics $true
```
     
## Frequently asked questions

### How does Power Platform monitoring coexist with Azure Application Insights? 
Power Platform monitoring includes recommendations to improve a metric. Azure Application Insights doesn't auto derive recommendations. 

Power Platform monitoring doesn't require Azure subscriptions. 

Azure Application Insights contains a superset of runtime event logs:
- Event logs beyond the scope of Power Platform monitoring resource metrics. 
- Allows for customer-defined data retention. 
- Allows for custom traces, which allows custom events, metrics, and dimensions. 
- Allows for correlating and joining event logs across resources emitting data to the same Azure Application Insights instance. 

### Why do makers in my organizations see an experience saying settings must be enabled for their monitoring experience? 
In addition to the tenant-level analytics setting, the environment setting **Analytics data available to Makers** must be turned on. Availability of monitoring health metrics, logs, and recommendations in maker monitoring experiences based on tenant and environment settings.

| Are tenant-level analytics turned on? | Is analytics data available to Makers? | Is this a Managed Environment?| Is Operational health metrics available? | Are logs available? | Are recommendations available?|
|---------------------------------|------------------------------------------------|---------|-----------------------------------|--------------------------|--------------------------------|
| Yes | Yes| Yes| Yes| Yes |Yes|
| Yes | Yes| No | Yes| Yes |No |
| Yes | No | Not applicable | No | No  |No |
| No  | Not applicable | Not applicable | No | No  |No |

## Known limitations
- Environment admins can't see monitoring data in the Power Platform admin center.
- Only logs associated with metric recommendations are available.
- Time-based metrics only report out the 75th percentile.

## Considerations
- Metrics are aggregated at a point in time, per their aggregation rate. For example, app open success is calculated daily and only has one value per day.   
- Event logs in the monitoring experiences are only available for up to seven days.
- Metrics are only available for up to 28 days.

## Related content
[Overview of integration with Application Insights](../overview-integration-application-insights.md)









