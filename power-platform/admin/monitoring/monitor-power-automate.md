---
title: Metrics and recommendations for Power Automate (preview)
description: Learn more about the metrics and recommendations for Power Automate.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
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

# Metrics and recommendations for Power Automate (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Automate operational health metrics and recommendations are available in the new Power Platform admin center.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## View Power Automate metrics and recommendations

 1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
 1. In the navigation pane, select **Monitor**.
 1. In the **Monitor** pane, under **Products**, select **Power Automate**.

    The **Power Automate (preview)** page displays the metrics and recommendations.

## Power Automate metrics and recommendations

### Metric definitions
| Type | Metric | Definition |
|---|---|---|
| Flows| Success rate| A percentage that describes how often flows are able to run successfully. |
| Flows| Run count| Count of flow runs. |
| Flows| Duration| Average (in seconds) total execution time of flow run. |
| Desktop flows| Time in queue| The minimum time (in seconds) that the slowest 10% of desktop flows have to wait before a machine is assigned to run them. |


### Metric and recommendation pairings
| Metric | Secondary metric | Recommended title | Recommended description |
|---|---|---|---|
| Success rate | N/A |There are one or more runs that need your attention. | Review the list of runs and open flows or run details to troubleshoot.| 
| Time in queue| N/A | Investigate and adjust the machine capacity and prioritization. | Your current machine capacity is preventing your desktop flows from running efficiently. Investigate and adjust the machine capacity and prioritization.  |


