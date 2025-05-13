---
title: When premium flows are subject to license enforcement
description: Learn about types of enforcements and recommendations.
author: Samathur
contributors:
  - samathur
  - rakrish84
  - thomasjeffries11
  - v-aangie
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/30/2024
ms.author: samathur
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# When premium flows are subject to license enforcement

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

This article describes when a [Premium user license](types.md#user-licenses) is required for Power Automate flows and enforcement scenarios currently in scope.

## Enforcement

As part of enforcement, admins are notified of flows that need licenses by email and they're pointed to the [admin center report](../view-license-consumption-issues.md) to review details. Using this report, admins can self-serve granular details of the flows that require a license. Admins have 90 days to take remedial actions. Post 90 days, certain environment lifecycle operations such as create, copy, and restore environments are disabled. After another 90 days (total 180 days from admin notification), other enforcement actions can be enacted, including flow suspension.

## Recommendations for proactive license management

To ensure compliance and prevent surprises, admins should keep up-to-date with the following information and ensure proper licenses are attached to flows.  

- Admins are encouraged to enable [Auto-claim user licenses](power-automate-auto-claim.md) so that license assignment is automated.
- Admins should periodically review the [Power Automate license reporting](../view-license-consumption-issues.md), which now includes both tenant and environment level reporting views.

The report identifies flows that require a license for a subset of scenarios that are in scope of the power platform licensing guide. This subset of scenarios constitutes the current scope of enforcement. We expect customers to ensure compliance with all licensing requirements covered in the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). We expect to add more scenarios to this report to help administrators identify flows that require their attention. We might broaden the scope of enforcements at such time.

## Types of enforcements

Admins can access the details of flows that need attention through either the environment level or tenant level [license usage reports](../view-license-consumption-issues.md).

Updated timeline for enforcement using the environment lifecycle operations will be shared in Q4 2024.

|Enforcement type  |Exceptions  |Recommended action   |
|---------|---------|---------|
|Premium flows where flow owner left the organization      |Manual flows licensing is evaluated at runtime and is based on the invoking user license unless the flow is licensed using a per flow or [per process plan](./deep-dive-on-specific-license.md#power-automate-process-license).         |Assign a Power Automate license to the flow owner or per-flow/process license to the flow.      |
|Premium flows where the flow owner doesn't have a Premium license (owner previously had a trial/license that is expired now)     |Manual flows licensing is evaluated at runtime and is based on the invoking user license unless the flow is licensed using a per flow or per process plan.        |Assign a Power Automate license to the flow owner or per-flow/process license to the flow.     |
|Premium flows created by flow owner with a Power Apps license, but the flow isn't triggered by the app built with Power Apps      |Power Apps licensed user flows that are triggered from canvas apps, or that use the Microsoft Dataverse 'For a select record' trigger in a model driven app, are automatically considered as being in context of the app built with Power Apps and are excluded from enforcement.        |Assign a Power Automate license to the flow owner or per-flow/process license to the flow. Alternatively, if the flow is supporting an app built with Power Apps, [associate the flow to the app](faqs.md#how-can-i-associate-in-context-flows-to-power-appsdynamics-365-apps).  |
|Premium flows created by the flow owner with a Dynamics 365 license, but the flow isn't in a Dynamics environment, or the flow isn't interacting with Dynamics entities    |Dynamics 365 licensed user flows that are using a Dataverse connector to talk to Dynamics entities in the environment, or using First party Dynamics connectors like finance and operations, are automatically considered as being in context of the Dynamics 365 app in the environment and are excluded from enforcement.         |Assign a Power Automate license to the flow owner or per-flow/process license to the flow. Alternatively, if the flow is supporting a Dynamics 365 app, [associate the flow to the app](faqs.md#how-can-i-associate-in-context-flows-to-power-appsdynamics-365-apps).  |

Dynamics 365 and Power Apps licenses include a limited set of Power Automate capabilities that allow users to run in-context flows as outlined in the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). To learn more, go to [What Power Automate capabilities are included in Dynamics 365 licenses](faqs.md#what-power-automate-capabilities-are-included-in-dynamics-365-licenses).

> [!NOTE]
> Flows not in context of apps are subject to enforcement. Makers and admins can now associate flows to apps to indicate they are in context. To understand when a flow is considered in or out of context so you're only leveraging this capability for the appropriate scenario, go to [FAQ about Power Automate licensing](faqs.md). When in doubt, consult your account team to clarify this.  

## Identify flows that need Premium licenses to avoid interruptions due to enforcement

Admins can execute the licensing [report](../view-license-consumption-issues.md) to identify flows and take necessary actions. This report is refreshed at a 48-hour delay.

