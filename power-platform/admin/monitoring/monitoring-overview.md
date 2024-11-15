---
title: Monitor page overview (preview)
description: Learn about how to monitor and improve operational health.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/14/2024
ms.custom: ignite-2024
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Monitor operational health (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

The built-in monitoring experience allows your organization to measure and improve operational health metrics of resources built or deployed in Power Platform, such as apps. It's available to both Makers and Admins in their respective experiences, such as [make.powerapps.com](https://make.preview.powerapps.com/) and [admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com/). Makers use this data to improve their resources and admins use this data to understand aggregate operational health in the tenant or select environments. Metrics are calculated by aggregating event logs from runtime activity. Recommendations are calculated from: 

- Aggregating runtime event logs to highlight a measurable opportunity to improve a health metric
- Static analysis of resource properties that can be altered to improve a health metric.

The event logs used to calculate metrics are available for review and download in **Logs** experiences to aid operational health analysis. 

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Prerequisites
- [Tenant-level analytics](../tenant-level-analytics.md) must be turned on for data to be available for monitoring experiences. 
- **Optional**: [Managed Environments](../managed-environment-overview.md) is required to view monitoring recommendations.

The availability of monitoring health metrics, logs, and recommendations in Power Platform admin center is based on tenant and environment settings.  

| Are tenant-level analytics turned on? | Is this a Managed Environment? | Are health metrics available? | Are logs available? | Are recommendations available?|
|---------------------------------------|----------------------------------|--------------------------|----------------------|-----------------------------------|
| Yes | Yes| Yes| Yes| Yes|
| Yes| No | Yes| Yes|  No|
| Yes| No| Yes| Yes| No|
| No | No  | No| No| No|

## Architecture
Power Platform monitoring experiences require runtime activity to produce health metrics and generate recommendations. Unused resources don't appear in monitoring experiences. Admin experiences are available to Power Platform service and Dynamics 365 admins, who can see monitoring data across the tenant. Makers can only see data for resources for which they have edit privileges to in the runtime environment.  

(image)

## Overview
The monitoring overview exists to bring attention to resources with degraded operational health and highlight which resources have opportunities for improvement. Since Power Apps are the first resources to appear in monitoring experiences, the cards highlight apps where end users face obstacles accessing an app or they have higher wait times to use the app. As more resources and metrics appear in monitoring, this experience evolves to bring attention to more than apps. 

## Products
The products view allows you to compare health metrics across a pool of common resources, such as apps, and select a resource to view its health metrics, recommendations, and logs. 

## See a resource’s health metrics, recommendations, and logs 

1. Select a product, for example **Power Apps**.
1. Select a specific resource.
1. See the details pane with time-series charts for each metric available.  
1. **Optional**: If a recommendation is available, select **View logs**. 

For resources available in the monitoring experience, you can learn more about resource-specific metrics in the Maker documentation with links the following table. 

| Product | Resource | Availability |
|---------|------------|------------|
| Power Apps | Canvas app | Preview|
| Power Apps | Model-driven apps | Not available yet|
| Power Automate | Cloud flows | Not available yet|
| Power Automate | Desktop flows | Not available yet|
| Dataverse | Dataverse | Not available yet|
| Copilot Studio | Copilot Studio agents | Not available yet|
| Dynamics 365 experiences |?? | Not available yet|

## Logs
All metrics in monitoring experiences are aggregated from runtime event logs and error logs associated to a metric and can be accessed in the **Logs** experience. Logs are available to aid operational health analysis and they may be downloaded for offline review. 

1. Start for **Logs** experience:
    1. Select a resource.
    1. Select a metric.
    1. View the associated logs. 

1. View logs from resource details:
    1. Scroll to the desired metric.
    1. Select **See logs**.
   
## Monitoring experiences for Makers
When tenant-wide analytics is turned on, by default metrics and logs are available to Makers. Makers can only see metrics and logs for which they have edit privileges. Environment-level settings exist to control what analytics information is available to Makers. One setting controls whether Makers see any analytics data in monitoring experiences including metrics and logs. The second setting controls whether Makers see End User Pseudonymous Identifiers (EUPI), like session ids and user object ids in event logs.

### Enable monitoring experiences for Makers
The following [Power Platform Administrator](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell/2.0.200) PowerShell cmdlets may be used to control what monitoring data is available to Makers. 

### Get settings values for Maker access to analytics data

```PowerShell
Get-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName 
{environment id}
```

### Enable Maker access to analytics data
This setting doesn't include availability of End User Pseudonymous Identifiers (EUPI) in event logs such as Session ID or User object ID. 

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName 
     {environment id} -EnableAnalyticsForMakers $true
```

### Enable Maker access to session ids and user object ids in event logs
This setting controls Maker access to End User Pseudonymous Identifiers (EUPI) in event logs, such as Session ID or User object ID, in event logs.

```PowerShell
Set-AdminPowerAppEnvironmentMakerAnalyticsSettings -EnvironmentName 
     {environment id} -EnableEUPIForMakerAnalytics $true
```
     
## Frequently Asked Questions

### How does Power Platform monitoring coexist with Azure Application Insights? 
Power Platform monitoring includes recommendations to improve a metric. Azure Application Insights doesn't auto derive recommendations. 

Power Platform monitoring doesn't require Azure Subscriptions. 

Azure Application Insights contains a superset of runtime event logs:
  1. Event logs beyond the scope of Power Platform monitoring resource metrics. 
  1. Allows for customer defined data retention. 
  1. Allows for custom traces (which enable custom events, metrics and dimensions). 
  1. Allows for correlating and joining event logs across resources emitting data to the same Azure Application Insights instance. 

### Why do Makers in my organizations see an experience saying settings must be enabled for their monitoring experience? 
In addition to the tenant analytics setting, the environment setting ‘Analytics data available to Makers’ must be enabled. Availability of monitoring health metrics, logs and recommendations in Maker monitoring experiences based on tenant and environment settings.

| Are tenant-level analytics turned on? | Is analytics data available to Makers? | Is this a Managed Environment?| Is Operational health metrics available? | Are logs available? | Are recommendations available?|
|---------------------------------|------------------------------------------------|---------|-----------------------------------|--------------------------|--------------------------------|
| Yes | Yes| Yes| Yes| Yes |Yes|
| Yes | Yes| No | Yes| Yes |No |
| Yes | No | ?? | No | No  |No |
| No  | ?? | ?? | No | No  |No |

## Limits
1.	Environment admins can't see monitoring hub data in Power Platform Admin Center.
1.	Only logs associated with metric recommendations are available.
1.	Time based metrics only report out the 75th percentile.
1.	Metrics are aggregated at a point in time, per their aggregation rate. For example, app open success is calculated daily and only has one value per day.   
1.	Event logs in monitoring experiences are only available for up to seven days.
1.	Metrics are only available for up to 28 days.

## Learn more
- [Overview of integration with Application Insights](../overview-integration-application-insights.md)
- Link to Monitor Power Apps









