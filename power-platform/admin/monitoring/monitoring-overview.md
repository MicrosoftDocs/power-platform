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
