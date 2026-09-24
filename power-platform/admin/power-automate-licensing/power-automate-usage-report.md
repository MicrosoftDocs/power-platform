---
title: Monitor Power Automate usage and find flow group candidates
description: Use the Power Automate Usage page in the Power Platform admin center to see which users and flows are over their daily limits, and find candidates for flow groups.
author: radioblazer
ms.service: power-platform
ms.subservice: admin
ms.topic: how-to
ms.date: 09/24/2026
ms.author: matow
ms.reviewer: ellenwehrle
search.audienceType:
  - admin
---

# Monitor Power Automate usage and find flow group candidates

The Power Automate **Usage** page in the Power Platform admin center shows which users and flows in your tenant are exceeding their daily Power Automate action or request limits.

## Open the Usage page

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the navigation pane, select **Licensing**.
1. Under **Products**, select **Power Automate**.
1. Select the **Usage** tab.

## What you can see

- **Users over their daily limit**: a list of users whose Power Automate action or request consumption exceeds their daily entitlement, with a usage trend over time and the top consumers called out.
- **Per-user detail**: for a selected user, the license context they're consuming under (Power Automate, Power Apps, Dynamics 365, or Microsoft 365/free) and a breakdown of the flows driving that user's consumption. For automated or scheduled flows, this data reflects the flow owner; for on-demand flows, it reflects the person who ran it.
- **Download**: export options aren't available yet.

> [!NOTE]
> The **Usage** page currently shows consumption attributed to users. It doesn't show consumption attributed to service principals or flows covered by Process or legacy Per-flow licenses.

For the license assignment overview and flows needing attention (no owner, standalone premium flows on a standard or expired license, or premium flows used outside the context of Power Apps, Microsoft Copilot Studio, or Dynamics 365), see [View license consumption for Power Automate](../view-license-consumption-power-automate.md).

For a complete, tenant-wide download of per-user and per-flow Power Platform request consumption, use a [Power Platform request report](../api-request-limits-allocations.md#view-detailed-power-platform-request-usage-information-in-the-power-platform-admin-center-preview) instead.

## Find candidates for flow groups

Use the **Usage** page's top consumers and per-user flow breakdown to spot flows that could share capacity through a flow group instead of each needing its own license:

- **Users or flows nearing their daily limit**: check the top consumers and per-user flow breakdown on the **Usage** page, or download a [Power Platform request report](../api-request-limits-allocations.md#view-detailed-power-platform-request-usage-information-in-the-power-platform-admin-center-preview) for a full tenant-wide view.
- **Related flows without a Process license**: if a user's flow breakdown shows several eligible flows that support the same business process, consider adding them to a [flow group](/power-automate/flow-groups) so they can share one Process license. Flows covered by Process or legacy Per-flow licenses don't appear in this report.

> [!TIP]
> If a single high-volume flow drives a user's request consumption, consider assigning that flow a dedicated [Process license](types.md#capacity-licenses). The license provides 250,000 Power Platform requests per 24 hours for the flow, independent of the licenses held by the people who use it. For several related eligible flows, consider a [flow group](/power-automate/flow-groups) instead so they can share one Process license.

## Related content

- [View license consumption for Power Automate](../view-license-consumption-power-automate.md)
- [Power Automate licensing](types.md)
- [Share Process license capacity with flow groups](/power-automate/flow-groups)
- [Power Platform request limits and allocations](../api-request-limits-allocations.md)
