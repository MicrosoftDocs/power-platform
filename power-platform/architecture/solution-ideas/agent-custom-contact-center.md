---
title: Custom contact center solution with Copilot Studio agent
description: Explore a custom contact center solution that uses Copilot Studio to enhance customer service efficiency and integrate with non-Microsoft platforms.
#customer intent: As a business decision maker, I want to explore an example implementation that uses integrated platforms and solutions so that I can gain insights into improving my own organization's customer service.
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
search.audienceType:
- admin
- flowmaker
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:04/06/2025
---

# Custom contact center solution with Copilot Studio agent

In this article, you learn about a national banking company that uses Microsoft and other platforms and technologies to enhance the efficiency of employees in its contact center and improve customer experiences. The solution integrates a non-Microsoft contact center and data sources with Microsoft Copilot Studio, Microsoft Dataverse, and Azure Data Lake Storage to provide a seamless experience for employees and customers.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/agent-contact-center/contact-center-arch.png" alt-text="Architecture diagram of a customer service solution that integrates a non-Microsoft contact center and customer database with Microsoft generative AI and middleware services." border="true" lightbox="media/agent-contact-center/contact-center-arch.png":::

## Components

The solution described in this article includes the following components.

### User interface

**Contact center as a service (CCaaS)**: A non-Microsoft contact center that features diverse agent types, including chat and voice, facilitates seamless hand-offs to employees through an escalation path, and integrates with Microsoft and other data sources.

**Employee portal website**: A portal where employees can perform tasks with the help of an agent developed with Microsoft Copilot Studio.

### Knowledge

"Knowledge" refers to the information and data sources that agents use to provide relevant and accurate responses.

**Latest offers website**: Web location of active customer promotions.

**Banking process documents**: Documents that contain information about the company's banking processes.

**Customer service website**: Web location of all customer service information, including FAQs, contact information, general information, and location information.

**Regulatory documents**: Documents that contain banking regulatory information, such as governance, cybersecurity, and compliance.

**Card process documents**: Documents that contain information such as payment authorization processes, transaction processes, card insurance, and fraud detection.

### Generative AI services

[**Azure AI Foundry**](/azure/ai-foundry/): A platform for building, modifying, and launching enterprise-grade generative AI apps.

[**Azure AI Search**](/azure/search/search-what-is-azure-search): Creates vectorized indexes for knowledge sources that are stored outside the knowledge of Copilot Studio.

### Data sources

[**Microsoft Dataverse**](/power-apps/maker/data-platform/data-platform-intro): Serves as the central repository for knowledge and metrics data, including customer feedback. Dataverse is a foundational part of Power Platform and seamlessly integrates with Copilot Studio.

[**Azure Data Lake Storage**](/azure/storage/blobs/data-lake-storage-introduction): Used for long-term storage of conversation transcripts.

**Database**: A non-Microsoft database is the primary storage solution for all core customer and transaction data. It provides the scalability, security, and performance required to support the bank's operational needs, and seamlessly integrates with the Copilot Studio agent and Power BI dashboards.

### Platform governance, compliance, and fundamentals

[**Power Platform admin center**](/power-platform/admin/new-admin-center): Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions.

[**Power Fx**](/power-platform/power-fx/overview): Enables custom logic for advanced functionality in apps and workflows. Chosen for its simplicity and integration with other Power Platform components.

[**Microsoft Entra ID**](/entra/fundamentals/whatis): Ensures that only authenticated users have access to data. Chosen for its integration with Microsoft services and ability to manage user identities and access.

[**Application Insights**](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry): Used with Copilot Studio to deliver real-time telemetry and proactive diagnostics, optimizing performance and user experience.

### Reporting

[**Power BI dashboards**](/power-bi/fundamentals/power-bi-overview): Visualize operational and customer-centric data to provide actionable insights. Power BI integrates seamlessly with Dataverse and can bring data from other storage sources into reports.

## Scenario details

This use case illustrates how a national banking company enhances customer experience by improving customer service, information access, and conversation processes through faster information retrieval for their employees.

> [!NOTE]
> This solution idea is inspired by ABN AMRO Bank, which used Copilot Studio to create customer and employee agents that support more than 2 million text conversations and 1.5 million voice conversations every year and provide easier access to internal resources. Learn more in [ABN AMRO Bank migrates to Microsoft Copilot Studio to support over 3.5 million customer conversations](https://www.microsoft.com/customers/story/19754-abn-amro-bank-microsoft-copilot-studio#asset_idabn-amro-bank-customer-experience-architecture).

### Business problem

Business information was scattered in various websites and documents in multiple locations. Employees faced challenges in locating the correct information to assist customers, and customers seeking support were often met with delayed responses to their inquiries.

The employee agent solution had to integrate with an existing non-Microsoft contact center service that maintains customer data.

The solution needed to be included in the consistent use of prebuilt Azure AI functionality across the company.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

The principle of "garbage in, garbage out" is particularly important for agents and emphasizes the need for high-quality data. Providing accurate information to the agent ensures reliable and correct responses.

### Security

Implementing row-level security in Dataverse ensures that only authorized users can access specific information. This approach can also be applied to non-Microsoft data used by agents, ensuring secure handling when an API requests data. Learn more in [Security and compliance considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/security) and [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds).

### Performance Efficiency

Tracking usage, dropouts, technical difficulties, and customer satisfaction scores (CSAT) inform adjustments to the agents' approaches, offerings, and structure. Learn more in [Measuring agent engagement](/microsoft-copilot-studio/guidance/measuring-engagement).

Power Automate flows can be used to handle processes asynchronously. Learn more in [Use an asynchronous flow pattern](/power-automate/guidance/coding-guidelines/asychronous-flow-pattern).

Bing Custom Search can filter and manage allowed and blocked sections of website locations. Learn more in [Search public data or use a Bing Custom Search for generative answers nodes](/microsoft-copilot-studio/nlu-generative-answers-bing).

Consider using Microsoft's contact center offerings to integrate everything into the Power Platform environment, facilitating the creation of agents with Copilot Studio. Learn more in [Copilot onboarding guide for digital contact centers](/dynamics365/guidance/resources/cs-contact-center-copilot-onboarding-guide).

Consider using the Microsoft 365 Agents SDK to utilize multiple agents. Learn more in [Microsoft 365 Agents SDK](/microsoft-365/agents-sdk/).

### Experience Optimization

Consolidate data on one centralized platform, such as Dataverse, to streamline access and management. Consider using virtual tables in Dataverse to integrate external data. Learn more in [Get started with virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve).

Review documents used for generative AI knowledge and remove any unnecessary data.

Extend the employee agent to provide more information directly to employees, like human resources information.

Learn more in [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview) and [Recommendations for designing conversational user experiences](/power-platform/well-architected/experience-optimization/conversation-design).

### Responsible AI

Ensure fair treatment across all customer segments by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, enforce strict data privacy and security protocols, and incorporate human oversight to continuously monitor these processes. Learn more in [Responsible AI considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/responsible-ai).

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Copilot Studio documentation](/microsoft-copilot-studio/)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance/)
- [Copilot Studio implementation guide](https://aka.ms/CopilotStudioImplementationGuide) (PDF)
