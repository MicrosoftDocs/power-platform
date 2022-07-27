---
title: Use Power Automate flows in Power Virtual Agents
description: Use Power Automate flows to extend the capabilities of your bots.
keywords: "PVA, flow, automate"
ms.date: 07/27/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---

# Key concepts - Use Power Automate flows in Power Virtual Agents

[Power Automate](https://flow.microsoft.com) is a service that you can use to build automated workflows using low-code, drag-and-drop tools. [Cloud flows](/power-automate/overview-cloud) can extend the capabilities of your bot to automate complex activities or query back-end systems. For example, flows with [user authentication](advanced-end-user-authentication.md) can retrieve information about users after they've signed in.

Call flows from topics as a discrete **Call an action** node. You can use flows that already exist in your [Power Apps environment](environments-first-run-experience.md) or create a flow from the Power Virtual Agents [authoring canvas](authoring-create-edit-topics.md).

[!INCLUDE [Requirements for Power Automate flows](includes/flow-requirements.md)]

## In this section

The examples in this section help you learn to use flows to do more with your bots.<!--NOTE: It makes sense to me to put the two weather-forecast articles one after the other. Please change in the TOC, too.-->

| Article | Description |
| --- | --- |
| [Create a flow](advanced-flow-create.md) | Create a Power Automate flow that provides a weather forecast. |
| [Call a flow as an action](advanced-use-flow.md) | Call a Power Automate flow from a bot topic using an action node. |
| [Add input and output variables](advanced-flow-input-output.md) | Pass variables between a Power Automate flow and a Power Virtual Agents bot. |
| [Return a list of results](advanced-flow-list-of-results.md) | Return a list of results from a Power Automate flow to a Power Virtual Agents bot. |

[!INCLUDE[footer-include](includes/footer-banner.md)]
