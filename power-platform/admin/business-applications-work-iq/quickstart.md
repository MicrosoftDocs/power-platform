---
title: "Quickstart: Set up Business Applications in Work IQ for a pilot (preview)"
description: Set up Business Applications in Work IQ so pilot users can query Dynamics 365 and Power Apps data through Microsoft 365 Copilot.
#customer intent: As a Power Platform admin, I want to connect Dynamics 365 and Power Apps data to Work IQ, so that pilot users can ask grounded questions through Microsoft 365 Copilot.
ms.date: 09/25/2026
author: karissa-larson
ms.author: kalars
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: quickstart
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
ms.collection: bap-ai-copilot
---

# Quickstart: Set up Business Applications in Work IQ for a pilot (preview)

[!INCLUDE [cc-preview-work-iq](../../includes/cc-preview-work-iq.md)]

In this quickstart, you connect your business applications to Work IQ so your pilot users can ask questions grounded in Dynamics 365 and Power Apps data through [Microsoft 365 Copilot](/microsoft-365/copilot/). You choose a pilot scenario, confirm availability, enable Work IQ in your environment, and try the experience.

## Before you begin

To complete this quickstart, you need the appropriate Microsoft 365 and Power Platform administrative roles. For role details, see [About admin roles in Microsoft 365](/microsoft-365/admin/add-users/about-admin-roles) and [Use service admin roles to manage your tenant](../use-service-admin-role-manage-tenant.md).

You need user accounts with the following roles:

- **AI Administrator** to configure Microsoft Copilot availability if not already configured.
- **Power Platform Administrator** to configure environment settings.

You need an [environment](../environments-overview.md) with a Dynamics 365 or Power Apps [model-driven application](/power-apps/maker/model-driven-apps/model-driven-app-overview).

You need to review your [Microsoft Copilot setup](/microsoft-365/copilot/microsoft-365-copilot-overview) to ensure you have data availability and all relevant settings are turned on.

## Choose your pilot scenario

Choose an application and a business question that's useful to your pilot users. Start with a familiar scenario so they can assess the usefulness of the results. For example, you might help a sales team answer questions about its opportunities or help an operations team find information about active cases.

- Identify the environment and application to use.
- Identify the people who will try the experience.
- Identify a few questions those people can answer using their existing business data.

> [!NOTE]
> If you're using a usage-based billing feature for the first time, review [Understand usage-based billing and cost management for Copilot Credits](/microsoft-365/copilot/usage-based-billing-overview-copilot-credits) to learn how to set your billing policy.

## Confirm availability for your pilot users

For most customers, business applications are available in Microsoft 365 Copilot for all users by default. Confirm that your pilot users are included.

1. Sign in to the **Microsoft 365 admin center**.
1. Select **Copilot** > **Settings**.
1. Open the setting for **Business Applications in Work IQ available to Copilot** in Microsoft 365 Copilot.
1. Review the selected audience:
   - If **Business Applications in Work IQ available to Copilot** is enabled for all users, your pilot group is already included.
   - If **Business Applications in Work IQ available to Copilot** is enabled for specific groups, confirm that your pilot group is included.
   - If your pilot group isn't included or **Business Applications in Work IQ available to Copilot** is off, turn on **Business Applications in Work IQ available to Copilot** for your pilot group.
1. Select **Save** if you made changes.

## Turn on Work IQ in your environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage**, and select the environment containing your application.
1. Select **Settings** > **Product** > **Features**.
1. Turn on **Work IQ**. If it's already on, continue to the next step.
1. Select **Save** if you made changes.

## Try the experience and enrich your business context

Use a pilot session to test the experience, and then explore resources that make more business context available to Work IQ.

1. Sign in to **Microsoft 365 Copilot** as a pilot user.
1. Ask one of the business questions you identified earlier.
1. Review the answer against the application's data.
1. Try follow-up questions to explore how the experience supports the user's work.

As you explore, use the following resources to make more useful business context available:

- [Business skills](/power-apps/maker/data-platform/data-platform-business-skill-overview): Capture business-process instructions that agents can use to support your workflows.
- [Semantic models](/power-apps/maker/data-platform/semantic-model-overview): Define relevant data scope and enrich it with business terminology and context.

Ask pilot users to share which answers are useful and where additional business context would improve the experience.

## Review usage and expand

Review pilot feedback and the available consumption reports. Use what you learn to refine the business context and plan your next scenarios.

When you're ready, add more users, explore additional applications, or enable another environment.

## Related content

- [Manage participation in Business Applications in Work IQ](manage-participation.md)
- [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md) for information about connections through the Work IQ MCP server and API.
- [Understand costs for Business Applications in Work IQ](understand-costs.md)
