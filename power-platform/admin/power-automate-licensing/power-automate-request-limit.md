---
title: Power Automate Request limists
description: Learn about the PPR limits of Power Automate licenses and add-ons
author: cvassallo
contributors:
  - cvassallo
  - samathur
  - PriyaKodukula
  - kenseongtan
ms.subservice: admin
ms.topic: overview
ms.date: 07/04/2024
ms.author: cvassallo
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Power Automate Request limits

## Overview of PPR limits per license

> [!IMPORTANT]
> Desktop flow executions don't consume Power Platform requests

To ensure service availability and quality, there are limits to the number of Power Platform requests (PPR) users can make across all Power Platform products. PPR limits are set against normal usage patterns in both five minutes and per 24 hour intervals. Most organizations don't exceed these limits.

The 24 hour limit is based on the user license or on the Process / Per-flow plan license allocated to a cloud flow
  - If a user has a Power Automate Premium license, they can make 40,000 Power Platform requests across all of their cloud flows in a tenant within a 24 hour period. This limit includes requests the platform makes to third party connectors too. 
  - If a cloud flow has a Process license, the flow, its child flows, and its associated flows can make 250,000 Power Platform requests across all users of the flow in a 24 hour period.
  - If a cloud flow has a Per-flow plan (legacy), the flow can make 250,000 Power Platform requests across all users of the flow in a 24 hour period.


To prevent a usage-heavy flow or user from impacting other users, this capacity is tracked based on consumption at an individual user or flow level and it can't be pooled at any other level like environment or tenant levels. The 24 hours is a sliding window, meaning that anytime a cloud flow runs, the system looks at the requests in the past 24 hours to determine if the user is at their limit. For example, two users in a tenant may have Premium licenses, and each user gets 40,000 requests per 24 hour period. If the first person uses more than 40,000 requests 24 hour period, their flows slow down and don't impact the second user who only used 20,000 requests and still has 20,000 requests remaining.

Currently all organizations are in [a transition period](/power-platform/admin/power-automate-licensing/types#transition-period) during which higher transition period limits apply. Once transition period ends, the official limits are applicable. Build your cloud flows based on official limits. 

The five-minute limit is 100,000 requests and it's independent of a user's license. For example, flows with a Process license can make 250,000 requests in 24 hours but they can't make more than 100,000 requests within five minutes.

Power Platform request limits per license:

|License name|PPR official limit per 24 hours|PPR transition period limit per 24 hours|
|--------|--------|----------|
Power Automate Premium|40k per user | 200k per cloud flow|
Power Automate Process|250k per license | 500k per license|
Power Automate Hosted Process|250k per license | 500k per license|
Power Automate Per-user plan (legacy)|40k per user | 200k per cloud flow|
Power Automate Per-flow plan (legacy)|250k per license | 500k per license|
Power Automate Free|6k per user| 10k per cloud flow|
Office 365|6k per user| 10k per cloud flow|
Power Apps Premium|40k per user | 200k per cloud flow|
Dynamics 365 professional|40k per user | 200k per cloud flow|
Dynamics 365 Enterprise applications|40k per user | 200k per cloud flow|
Dynamics 365 Team member|6k per user| 10k per cloud flow|

> [!NOTE]
> - The Power Automate Process licenses can be stacked on a cloud flow to increase its PRR limit
> - [FAQ on Power Platform Request within Power Automate](faqs.md#power-platform-requests-questions) 


## Transition period

All organizations are in a transition period. That means that enforcement isn't strict and PPR limits are higher. The transition period ends after [Power Platform admin center reports](/power-platform/admin/api-request-limits-allocations#view-detailed-power-platform-request-usage-information-in-the-power-platform-admin-center-preview) are generally available. Organizations then have six months to analyze their usage and purchase licenses that are appropriate before strict enforcement on license limits begins.

Here are a few things to be aware of during the transition period:

1. The transition period doesn't mean that there are no daily limits. It means that the currently enforced limits are more generous than the official limits to prevent potential unintended impact on your apps or flows. See [Requests limits and allocations](../api-request-limits-allocations.md) to understand both license limits and transition period limits. 

2. These transition period limits are applied at the cloud flow level during the transition period. Additionally, a separate per user level limit of 1,000,000 cloud flow actions is applied during the transition period to ensure users don't exceed 1M actions across all their flow runs in a day. After the transition period ends, the actual limits will be applied at user level for Premium licenses and cloud flow level for Process / Per flow-plan licenses.

3. During the transition period, manual cloud flows don't use the flow owners/flow invokers limits. Every manual cloud flow has a performance profile of Medium (100,000 requests/flow/24 hours). After the transition period, manual cloud flows will use the request limits of invoking user.

4. Since the limits are more generous during the transition period, [stacking of user licenses isn't supported](../api-request-limits-allocations.md). If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow uses the higher plan (Dynamics 365 plan).

5. Power Platform requests capacity add-on packs aren't assignable to users or cloud flows during the transition period. However, Microsoft recommends that you purchase these add-ons to remain within your license terms and to be prepared for when the transition period ends. If your cloud flows are currently being throttled, purchase add-ons and create a support ticket with the flow details and add-on details so that the support team can provide exceptions for your throttled flows.

6. Seeded license users can only use cloud flows within the context of the app. To learn more, see [seeded licenses](#seeded-licenses) section. The enforcement on license limits is less strict during transition period and Microsoft recommends that you remain within your license terms to avoid any disruptions when the transition period ends.
