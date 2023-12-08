---
title: Use Power Automate connectors in Microsoft Copilot Studio (Preview)
description: Use Power Automate connectors to extend the capabilities of your bots.
keywords: "PVA, flow, automate"
ms.date: 03/24/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---

# Key concepts - Use Power Automate connectors in Microsoft Copilot Studio (Preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[Connectors from Microsoft Power Automate](https://learn.microsoft.com/en-us/connectors)are a proxy or a wrapper around an API that allows the underlying service to talk to Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. It provides a way for users to connect their accounts and leverage a set of prebuilt actions and triggers to build their apps and workflows.

 They provide the means to connect to various services (both within the Microsoft ecosystem and outside it) to perform a wide array of tasks automatically. 

There are [many connectors available](https://learn.microsoft.com/en-us/connectors/connector-reference/), ranging from Microsoft services like Office 365, SharePoint, and Dynamics 365, to third-party services like Twitter, Google services, Salesforce, and more. These connectors are categorized as:
**Standard Connectors**: Accessible in most Power Automate plans.
**Premium Connectors**: Require specific Power Automate plans.
**Custom Connectors**: For services not covered by the existing connectors, you can create custom connectors to connect to any publicly available API.

### Integration with Microsoft Copilot Studio

Microsoft Power Automate connectors are essential tools that greatly extend the functionality of Microsoft Copilot studio, enabling them to perform a wide range of tasks by connecting with various external services and applications. This integration empowers users to create more dynamic, responsive, and useful chatbots, tailored to specific business needs and processes.

 You can use connectors that already exist in your [Power Apps environment](environments-first-run-experience.md) or create a flow from the [Microsoft Copilot Studio authoring canvas](authoring-create-edit-topics.md). Call bot-ready connectors from bot topics as a discrete **Call an action** node.


[!INCLUDE[footer-include](includes/footer-banner.md)]
