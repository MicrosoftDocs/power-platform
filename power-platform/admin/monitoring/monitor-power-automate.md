---
title: Metrics and recommendations for Power Automate (preview)
description: Learn more about the metrics and recommendations for Power Automate.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/31/2025
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

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Here are the power automate operational health metrics and recommendations that are available in Monitor. 

## Power Automate metrics and recommendations

### Metric Definitions
| Type | Metric | Definition |
|---|---|---|
| Flows| Success rate| A percentage that describes how often flows are able to run successfully |
| Flows| Run count| Count of flow runs |
| Flows| Duration| Average (in seconds) total execution time of flow run |
| Desktop flows| Time in queue| The time (in seconds) that desktop flows have to wait before a machine is assigned to run them |


### Metric and Recommendation pairings
| Metric | Secondary metric | Recommendation | Example |
|---|---|---|---|
| Success Rate |  |Review the list of runs and open flow or run details to troubleshoot.|| 
| Time in queue|| Investigate and adjust the machine capacity and prioritization. |  |


