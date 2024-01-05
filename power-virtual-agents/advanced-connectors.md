---
title: Use Power Automate connectors in Microsoft Copilot Studio (Preview)
description: Use Power Automate connectors to extend the capabilities of your bots.
keywords: "PVA, flow, automate"
ms.date: 12/8/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.collection: virtual-agent
---

# Key concepts - Use Power Automate connectors in Microsoft Copilot Studio (Preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[Connectors from Microsoft Power Automate](/connectors) are a proxy or "wrapper" around an API that allows the underlying service to talk to Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. Connectors let you connect your accounts and use a set of prebuilt actions and triggers to build your apps and workflows.

With connectors. you can access various services (both within the Microsoft ecosystem and outside it) to perform a wide array of tasks automatically. 

There are [many connectors available](/connectors/connector-reference/), ranging from connections between and to Microsoft services like Office 365, SharePoint, and Dynamics 365, all the way to connections to third-party services like Twitter, Google services, Salesforce, and more. These connectors are categorized as:

- **Standard Connectors**, which are available in most Power Automate plans

- **Premium Connectors**, which require specific Power Automate plans
 
- **Custom Connectors**, which let you connect to any publicly available API for services not covered by existing connectors

### Integration with Microsoft Copilot Studio

Microsoft Power Automate connectors are essential tools that greatly extend the functionality of Microsoft Copilot studio, enabling them to perform a wide range of tasks by connecting with various external services and applications. This integration empowers copilot makers to create more dynamic, responsive, and useful copilots, tailored to specific business needs and processes.

 You can use connectors that already exist in your [Power Apps environment](environments-first-run-experience.md) or create a flow from the [Microsoft Copilot Studio authoring canvas](authoring-create-edit-topics.md) and call copilot-ready connectors from copilot topics as a discrete **Call an action** node.
