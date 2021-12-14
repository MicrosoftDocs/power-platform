---
title: "Preview: Power Apps license utilization" 
description: View Power Apps license utilization.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/07/2021
author: tjvass
ms.subservice: admin
ms.author: tjvass
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Preview: Power Apps license utilization

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The following tenant-level reports are available for Power Apps. 

## Power Apps - license utilization

License utilization reports provide insights into tenant and environment utilization of Dynamics 365 licenses based on Power Apps usage. The report answers questions such as:

- What is the total number of Dynamics 365 Per User licenses purchased for my tenant or environments?
- How many Dynamics 365 Per User licenses have been assigned across the tenant or environments?
- What is the ratio of Per User licenses actively used in past 28 days compared to the total number of licenses assigned?
- Which active users are assigned to one or more Dynamics 365 Per User license?
- How many applications are being used by licensed users across the tenant or environments?
- When was the last session for an active user that's been assigned a D365 Per User license?
- Which applications are being used by licensed users across the tenant or environments?

:::image type="content" source="media/power-apps-license-utilization.png" alt-text="View Power Apps license utilization.":::

> [!NOTE]
> The service starts collecting the data visualized in the License utilization report once the feature is enabled. User license information is sourced from user sessions interacting with Power Apps, therefore the view is limited to active users.