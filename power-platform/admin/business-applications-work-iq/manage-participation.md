---
title: Manage participation in Business Applications in Work IQ (preview)
description: Configure Work IQ participation controls to manage environment features, data reasoning, and app inclusion. Start setting up your environments now.
#customer intent: As a Power Platform administrator, I want to understand the participation controls for Business Applications in Work IQ, so that I can decide which environments and applications share data with Work IQ.
ms.date: 09/25/2026
author: karissa-larson
ms.author: kalars
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: how-to
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
ms.collection: bap-ai-copilot
---

# Manage participation in Business Applications in Work IQ (preview)

[!INCLUDE [cc-preview-work-iq](../../includes/cc-preview-work-iq.md)]

**Business Applications in Work IQ** is a capability that administrators use to choose which environments and applications participate in Work IQ. It controls which environments have Work IQ features, which environments Work IQ can reason over and return data from, and which applications makers include within those environments.

## Before you begin

To manage participation in Business Applications in Work IQ, you need the appropriate roles assigned:

- **Power Platform Administrator** role to manage settings and assign other roles.
- **Environment Maker** or **System Customizer** role to configure application-level participation.

## Understand participation controls

Participation in Business Applications in Work IQ involves three decisions:

* **Environment features**: Which environments have semantic models, search indexing, business skills, and Business Applications paths in the Work IQ MCP.
* **Environment data participation**: Which environments Work IQ is allowed to reason over and return data from.
* **Application participation**: Which apps within an environment should make their data available to Work IQ and which should not.

> [!NOTE]
> These participation settings don't prevent agentic access to environment data. Use App Access controls to manage that access. See [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md#application-access-control-app-access).

## Environment features for Work IQ

Enable Work IQ features in the environments where you want to use semantic models, search indexing, business skills, and the Business Applications paths in the Work IQ MCP. Enabling these features in an environment is a separate decision from allowing Work IQ to reason over that environment's data.

To turn on Work IQ in an environment:

1. Sign in to the Power Platform admin center.
1. Select **Manage**, and select the environment.
1. Select **Settings** > **Product** > **Features**.
1. Locate **Work IQ**.
1. Turn on **Work IQ** if it's currently off.
1. Select **Save** if you made changes.

## Environment data participation in Work IQ

Choosing which environments Work IQ can reason over and return data from defines the environment data that participates in Work IQ. This decision is separate from the decision to make Work IQ features available in an environment.

This participation decision includes the environment's business data made available through the Business Applications paths in the Work IQ MCP. Allowing or blocking access to the entire Work IQ MCP server is covered in [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md#work-iq-mcp-server-access-control).

## Application participation in Work IQ

Within participating environments, makers choose which apps should send data to Work IQ and which should not. Work with makers to include the applications that provide useful business context for your scenarios.

## Related content

* [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md)
* [Review user, agent, and application access for Business Applications in Work IQ](review-data-access.md)
