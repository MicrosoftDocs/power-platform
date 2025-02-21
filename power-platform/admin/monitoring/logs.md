---
title: View event logs and error logs (preview)
description: Use event logs and error logs to aid operational health analysis.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/17/2024
ms.custom: NewPPAC
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# View event logs and error logs (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

All metrics that are part of the monitoring experience are aggregated from runtime event logs and error logs associated to a metric and can be accessed in the **Logs** page. Logs are available to aid operational health analysis and they may be downloaded for offline review. 

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## View logs
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Monitor**.
1. In **Monitor** section, select **Logs**.
1. The **Logs (preview)** page is displayed:
    1. Select a resource.
    1. Select a metric.
    1. View the associated logs. 

1. View logs from resource details:
    1. Scroll to the desired metric.
    1. Select **See logs**.

## Considerations
Only event logs for error conditions are available at this time.
