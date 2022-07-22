---
title: "Automate chatbot actions with flows in Microsoft Teams"
description: "Use Power Automate flows in chatbots you build in the Power Virtual Agents app in Microsoft Teams."
keywords: "PVA, flow, automate"
ms.date: 06/28/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring, teams
ms.collection: virtual-agent
---

# Add actions to a bot using Power Automate  in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](../advanced-flow.md)
> - [Power Virtual Agents app in Microsoft Teams](advanced-flow-teams.md)

[Power Automate](https://flow.microsoft.com) is a service that you can use to build automated processes using low-code, drag-and-drop tools. By using [cloud flows](/power-automate/overview-cloud) in Power Virtual Agents, you can extend the capabilities of your bot to automate complex activities or query back-end systems.

For example, you can use flows with [end-user authentication](advanced-end-user-authentication.md) to retrieve information about a user after they've signed in.

Flows are called from within topics, as a discrete **Call an action** node. You can use flows that have already been created in your [Power Apps environment](environments-first-run-experience.md), or you can create a flow from within the Power Virtual Agents [authoring canvas](authoring-create-edit-topics.md).

> [!IMPORTANT]
> To use flows within Power Virtual Agents, they must meet the following requirements:
>
> - A flow can only be called from a topic located in the same [Microsoft Dataverse environment](/powerapps/maker/common-data-service/data-platform-intro) as your bot.
>
> - Flows must also be in a solution in Power Automate. You can [move flows into solutions](advanced-flow-create.md#optionally-move-a-flow-to-another-solution) so they're listed in the authoring canvas.
>
> - [Flow values must be returned synchronously to Power Virtual Agents](advanced-flow-create.md#disable-asynchronous-responses-from-flows).

See the [Power Virtual Agents web app documentation on using Flows](../advanced-flow.md) for more detailed and complex scenarios.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
