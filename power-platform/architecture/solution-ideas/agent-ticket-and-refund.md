---
title: Ticket management system with Copilot Studio agents
description: Explore a cinema company's use of Copilot Studio agents to automate ticket management and optimize customer service.
#customer intent: As a business decision maker, I want to explore an example implementation that uses Copilot Studio agents so that I can gain insights into improving my own organization's customer and employee experiences.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
- manuelap-msft
ms.contributors:
- remidyon
- hejammes
search.audienceType:
- admin
- flowmaker
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:04/06/2025
--- 
 
# Ticket management system with Copilot Studio agents

In this article, you learn about a cinema ticket management system that uses automation and integration with Microsoft tools to improve customer and employee experiences.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagrams

The following architecture diagram shows a Copilot Studio "guest service" agent used by employees in Teams.

:::image type="content" source="media/ticket-refund/ticket-refund-guestservice.png" alt-text="Architecture diagram displaying a Copilot Studio agent used by employees in Teams." border="true" lightbox="media/ticket-refund/ticket-refund-guestservice.png":::

The following architecture diagram shows an autonomous Copilot Studio agent used with Outlook.

:::image type="content" source="media/ticket-refund/ticket-refund-autonomous.png" alt-text="Architecture diagram displaying an autonomous Copilot Studio agent used with Outlook." border="true" lightbox="media/ticket-refund/ticket-refund-autonomous.png":::

The following architecture diagram shows how a user-based and an autonomous Copilot Studio agent can use the same Power Automate cloud and desktop flows, Azure services, Microsoft 365, and Dataverse infrastructure. This architecture demonstrates that you can reuse assets across the platform for multiple agents.

:::image type="content" source="media/ticket-refund/ticket-refund-overall.png" alt-text="Architecture diagram displaying two agents' use of the same Power Automate flows, Azure services, Microsoft 365, and Dataverse assets." border="true" lightbox="media/ticket-refund/ticket-refund-overall.png":::

## Workflow

**Microsoft Teams integration**: Employees can interact with a Copilot Studio agent in Microsoft Teams for seamless chat support. They can initiate ticket refund processes without accessing legacy systems directly.

**Autonomous agent in Microsoft Outlook**: Outlook provides access to autonomous agents that handle ticket refund requests based on email workflows, minimizing the need for legacy system navigation.

**Cloud and desktop processing**: Power Automate cloud and desktop flows gather information, trigger robotic process automation (RPA) processes, and run legacy applications securely on Azure Virtual Machines, optimizing costs and ensuring data security.

**Governance and compliance**: Azure Key Vault secures credentials and sensitive data, ensuring a reliable and secure automation environment.

## Components

The following steps describe the workflow that's shown in the example architecture diagrams.

1. **User interface**: Microsoft Teams provides easy access for employees to interact with a Copilot Studio agent, integrating with Power Platform for seamless chat support. This integration allows employees to start the ticket refund process directly in Teams through the agent, without accessing the legacy systems themselves. Learn more in [Connect and configure an agent for Teams and Microsoft 365](/microsoft-copilot-studio/publication-add-bot-to-microsoft-teams).

1. **Microsoft Outlook (autonomous agent)**: Outlook provides seamless access to autonomous agents from Copilot Studio, allowing agents to be triggered directly from an employee's email workflow. This approach, unlike the Microsoft Teams method, autonomously processes ticket refund requests based on emails, eliminating the need for employees to navigate legacy systems. Learn more in [Event trigger overview](/microsoft-copilot-studio/authoring-triggers-about).

1. [**Power Automate cloud flows**](/power-automate/overview-cloud): Using Power Automate cloud flows, the agents gather and check information from Dataverse and trigger Power Automate desktop RPA flows.

1. [**Power Automate desktop flows**](/power-automate/desktop-flows/introduction): Using multiple Power Automate desktop flows, the information collected from agents and transferred to Power Automate cloud flows can be used to run legacy applications on Azure Virtual Machines for processing, while ensuring that passwords are securely stored in Azure Key Vault.

1. [**Azure Virtual Machines**](/azure/virtual-machines/overview): Microsoft Azure provides Windows-based virtual machines (VMs) to run legacy systems, enabling automation with Power Automate desktop flows. These VMs can be spun up and down as needed, optimizing costs by running only when required while ensuring secure and scalable access to business-critical applications.

1. [**Microsoft Dataverse**](/power-apps/maker/data-platform/data-platform-intro): Serves as the central repository for ticket, seat, refund, and metric data, including user feedback. Dataverse is a core component of Power Platform and integrates seamlessly with its features.

1. Platform governance, compliance, and fundamentals:

    - **[Power Platform admin center](/power-platform/admin/new-admin-center)**: Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions.

    - **[Power Fx](/power-platform/power-fx/overview)**: Enables custom logic for advanced functionality in apps and workflows. Selected for its simplicity and integration with other Power Platform components.

    - **[Microsoft Entra ID](/entra/fundamentals/whatis)**: Ensures that only authenticated users have access to data. Chosen for its integration with Microsoft services and ability to manage user identities and access.

    - **[Azure Key Vault](/azure/key-vault/)**: Keeps credentials secure for Power Automate desktop flows, making it easy to manage sensitive data while automating workflows. It centralizes secrets management, so RPA bots can authenticate and interact with legacy systems without exposing credentials.

    - [**Power BI dashboards**](/power-bi/fundamentals/power-bi-overview): Visualize operational and customer-centric data to provide actionable insights. Power BI integrates seamlessly with Dataverse and can bring data from other storage sources into reports.

## Scenario details

This use case illustrates how a cinema company enhances customer and employee experiences by streamlining ticket management. Employees can process ticket issues, such as refunds, directly in Microsoft Teams or automatically through an autonomous agent, minimizing the need to interact with or replace legacy applications.

> [!NOTE]
> This solution idea is inspired by Cineplex, one of Canada's largest movie theater chains, which used Power Platform to develop innovative automation solutions for finance, guest services, and other departments. Learn more in [Cineplex automates business processes with generative AI and Power Automate](../../guidance/case-studies/automate-business-processes.md).

### Business problem

Manual processes like ticket refunds consumed excessive time, leading to inefficiencies and increased susceptibility to human errors. Departments, including guest services, experienced delays and reduced productivity due to fragmented workflows and lack of integration with legacy systems. Scaling solutions to meet growing business needs proved challenging, hindering the organization's ability to expand and adapt swiftly.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

To maintain efficiency and performance, Azure Virtual Machines can be scaled dynamically, ensuring that legacy systems are available when needed while minimizing costs. Autonomous agents powered by Copilot Studio handle workflows reliably, reducing manual effort and errors. Power BI tracks agent interactions and system performance, providing insights into automation effectiveness and identifying areas for improvement.

### Security

Implementing row-level security in Dataverse ensures that only authorized users can access specific information.

Azure Key Vault stores and manages credentials, API keys, and other secrets, preventing exposure in automation workflows.

Data loss prevention (DLP) policies are defined by administrators in the Power Platform admin center to govern agent capabilities, including authentication, knowledge sources, and connector usage.

User authentication for agents can be configured to require user sign-in through Microsoft Entra ID or other OAuth2 identity providers, ensuring that only authenticated users can interact with them.

Admins have full visibility into maker activities through audit logs in Microsoft Purview and can monitor agent activities in Microsoft Sentinel, enhancing oversight and compliance.

Learn more in [Security and compliance considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/security) and [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds).

### Performance Efficiency

Tracking usage, dropouts, technical difficulties, and Customer Satisfaction Score (CSAT) enable adjustments to the agent's approaches, offerings, and structure. Learn more in [Measuring agent engagement](/microsoft-copilot-studio/guidance/measuring-engagement).

Power Automate flows can be used to handle processes asynchronously. Learn more in [Use an asynchronous flow pattern](/power-automate/guidance/coding-guidelines/asychronous-flow-pattern).

Consider using the Microsoft 365 Agents SDK to utilize multiple agents. Learn more in [Microsoft 365 Agents SDK](/microsoft-365/agents-sdk/).

### Experience Optimization

Consolidate data on one centralized platform, such as Dataverse, to streamline access and management. Consider using virtual tables to integrate external data. Learn more in [Get started with virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve).

### Responsible AI

AI systems should be fair, reliable, and secure, ensuring they treat all users equitably while maintaining consistent performance. Privacy and security are critical, with safeguards in place to protect sensitive information and prevent unauthorized access. Transparency matters, so users should understand how AI-driven decisions are made, and automation should include human oversight where necessary. This oversight is key, especially when working with autonomous agents. Accountability is essential, with clear ownership of AI operations to ensure ethical standards are met and continuously improved. Learn more in [Responsible AI considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/responsible-ai).

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Copilot Studio documentation](/microsoft-copilot-studio/)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance/)
- [Copilot Studio implementation guide](https://aka.ms/CopilotStudioImplementationGuide) (PDF)
- [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview)
- [Recommendations for designing conversational user experiences](/power-platform/well-architected/experience-optimization/conversation-design)
