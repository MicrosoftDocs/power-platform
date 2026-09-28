---
title: Understand costs for Business Applications in Work IQ (preview)
description: Manage AI spending policies for Business Applications in Work IQ. Discover how to set limits, alerts, and billing methods for your organization.
#customer intent: As an IT admin, I want to see how charges are attributed across Cowork, Microsoft 365 Copilot Chat, and Work IQ API, so that I can predict where Business Applications costs will appear.
ms.date: 09/25/2026
author: karissa-larson
ms.author: kalars
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
ms.collection: bap-ai-copilot
---

# Understand costs for Business Applications in Work IQ (preview)

[!INCLUDE [cc-preview-work-iq](../../includes/cc-preview-work-iq.md)]

**Cost management** in the Microsoft 365 admin center is a set of controls that you use to manage the consumption of the experiences your organization enables. Spending policies let you choose the users and services covered, set a shared monthly limit, add a per-user limit, and receive alerts as consumption approaches a threshold.

For Business Applications in Work IQ, you track cost by the experiences people use rather than by a dedicated business applications category. Business context accessed through Cowork contributes to Cowork consumption. Direct calls through the [Work IQ API](/microsoft-365/copilot/extensibility/work-iq/api-overview) are reported under Work IQ API. Configure the policy for the consuming experience rather than looking for a separate business applications spending policy.

## Usage-based billing and where charges appear

Usage-based billing (UBB) charges for consumption rather than simply enabling a feature. Copilot credits are the unit used for the participating usage-based experiences. Prepaid capacity packs and pay-as-you-go billing through an Azure subscription provide ways to fund that consumption.

A billing method and a spending policy serve different purposes:

- Billing method: How consumption is paid for.
- Spending policy: Who can consume credits, through which services, and within what limits.

Connect the applicable billing method, then use spending policies to manage consumption for the intended audience and services.

### How charges follow the experience used to access business context

- **Microsoft 365 Copilot Chat**: The applicable entitlement includes business-data grounding in the licensed chat scenario. You don't pay extra for it as a Work IQ API interaction.
- **Copilot Cowork**: Work IQ consumption that supports a Cowork task is attributed to Cowork.
- **Coding agents or custom integrations that call Work IQ directly**: Consumption through that connection appears under Work IQ API. The coding agent's own subscription or consumption charges are separate.
- **Other supported agents and services**: To identify the applicable treatment, review the billing guidance for the consuming experience, including Copilot Studio.

Work IQ API consumption can include both Microsoft 365 productivity context and business applications context. Its total is not a Business Applications-only cost breakdown.

### Why the cost of a task can vary

One user request can involve multiple tool calls and reasoning steps. Work IQ includes deterministic operations and variable-cost contextual reasoning, so a prompt isn't necessarily a single fixed-price operation. Complexity, the context needed, and the work performed affect consumption.

To learn more about access and pricing, see [Work IQ access and pricing](/microsoft-365/copilot/extensibility/work-iq/#access-and-pricing).

For more details on configuring usage-based billing, see [Usage-based billing overview](/microsoft-365/copilot/usage-based-billing-overview-copilot-credits).

## Related content

- [Understand usage-based billing and cost management for Copilot Credits](/microsoft-365/copilot/usage-based-billing-overview-copilot-credits)
- [Quickstart: Set up Business Applications in Work IQ for a pilot](quickstart.md)
- [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md)
