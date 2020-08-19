---
title: "Assign user licenses and manage access in Teams"
description: "Assign licenses and manage access to Power Virtual Agents for your organization"
keywords: "Administration, licensing, PVA"
ms.date: 8/3/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "licensing, admin, ceX"
ms.collection: virtual-agent
---

# Assign licenses and manage access to Power Virtual Agents in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Online portal (https://powerva.microsoft.com)](../requirements-licensing.md)
> - [Teams (online or app)](requirements-licensing-teams.md)

To create and manage Power Virtual Agents chatbots in Teams, you need:

- [A license to use Teams](/MicrosoftTeams/user-access)
- [Licenses to use Power Virtual Agents](../requirements-licensing.md)


If you can access Teams, and if you can add the Power Virtual Agents app, then it's likely you already have all the necessary licenses. Users of your bot will also need to access Teams, but you can't add users to a team unless they already have access to Teams as a whole.

If you need more information about licenses, see the following topics:

- [Manage user access to Teams](/MicrosoftTeams/user-access)
- [Assign licenses and manage access to Power Virtual Agents](../requirements-licensing.md)


<!-- are trial plans affected? can you have a trial plan and a teams plan? also, what licenses are required for using PVA in teams - we should call out cds lite etc. are subscription/power automate capacities also applicable for teams?-->

## Trial plans

Users in your organization can try Power Virtual Agents for a limited time period.

You can [disable or enable the ability for users to sign up for a trial themselves](/azure/active-directory/users-groups-roles/directory-self-service-signup) by modifying the **AllowAdHocSubscriptions** flag in your organization settings. 

## Subscription capacity

When you purchase a license, you gain capacity for the specified number of billed sessions. Power Virtual Agents pools this capacity across the entire tenant. 

The consumption of the capacity isn't reported at the tenant level, but [can be seen for each individual bot](analytics-billed-sessions-teams.md).

See [Quotas and rate limit capacity considerations for Power Virtual Agents](requirements-quotas-teams.md) for more information.

## Using Power Automate with a Power Virtual Agents license

[See how to use Power Automate with Power Virtual Agents](advanced-flow-teams.md). 

