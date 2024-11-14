---
title: Monitor operational health (preview)
description: Learn about how to monitor and improve operational health.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/14/2024
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Monitor operational health (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

The built-in monitoring experience enables your organization to measure and improve operational health metrics of resources built or deployed in Power Platform, e.g. apps. It is available to both Makers and Admins in their respective experiences, e.g. make.powerapps.com and admin.powerplatform.microsoft.com. Makers use this data to improve their resources and Admins use this data to understand aggregate operational health in the tenant or select environments. Metrics are calculated by aggregating event logs from runtime activity. Recommendations are calculated from: i) aggregating runtime event logs to highlight a measurable opportunity to improve a health metric or ii) static analysis of resource properties that can be altered to improve a health metric. The event logs used to calculate metrics are available for review and download in 'Logs’ experiences to aid operational health analysis. 

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Prerequisites
- [Tenant-level analytics](../tenant-level-analytics.md) must be turned on for data to be available for monitoring experiences. 
- **Optional**: [Managed Environments](../managed-environment-overview.md) is required to view monitoring recommendations.

The availability of monitoring health metrics, logs, and recommendations in Power Platform admin center is based on tenant and environment settings.  

| Are tenant-level analytics turned on? | Is this a Managed Environment | Are health metrics availabe? | Are logs available? | Are recommendations available?|
|---------------------------------------|----------------------------------|--------------------------|----------------------|-----------------------------------|
| Yes | Yes| Yes| Yes| Yes|
| Yes| No | Yes|| Yes| Yes|
| Yes| No| Yes| Yes| No|
| No | ??  | No| No| No|

## Architecture
Power Platform monitoring experiences require runtime activity to produce health metrics and generate recommendations. Unused resources do not appear in monitoring experiences. Admin experiences are available to Power Platform service and Dynamics 365 admins which can see monitoring data across the tenant. Makers can only see data for resources they have edit privileges to in the runtime environment.  

(image)

## Overview
The monitoring overview exists to bring attention to resources with degraded operational health and highlight which resources have opportunities for improvement. Since Power Apps are the first resource to appear in Monitoring experiences the cards highlight apps where end-users face obstacles accessing an app or they have higher wait times to use the app. As additional resources and metrics appear in monitoring this experience will evolve to bring attention to more than apps. 

## Products
The products view allows you to compare health metrics across a pool of common resources, such as apps, and select a resource to view its health metrics, recommendations and logs. 

## See a resource’s health metrics, recommendations, and logs 

1. Select a Product (e.g. Power Apps)
1. Select a specific resource (a specific app)  
1. See the details pane with time-series charts for each metric available.  
1. Optional, if a recommendation is available. Select ‘view logs’. 

 






