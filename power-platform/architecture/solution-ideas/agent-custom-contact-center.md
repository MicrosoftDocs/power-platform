---
title: Custom Contact Center solution with Microsoft Copilot Studio agents
description: Discover how to use Copilot Studio to enhance customer service efficiency by integrating Copilot Studio with a non-Microsoft contact center.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/22/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - remidyon
search.audienceType:
  - admin
  - flowmaker
---

<!-- comment from Manuela: This solution explains how to integrate with a non-Microsoft/third party contact center solution. Based on acrolinx guidance I've replaced third-party with non-Microsoft and sometimes with "other database" but let me know if there is a different way of phrasing this -->

# Custom Contact Center solutions with Copilot Studio agent

This article outlines the architecture and services of a national banking company aiming to enhance customer service efficiency through integrated platforms and technologies.

- Contact Center as a Service (CCaaS): The system includes a contact center with various agent types, enabling seamless transitions to company employees and integrating with Azure and other databases.
- Data management: Microsoft Dataverse serves as the central repository for customer feedback and knowledge data. Azure Data Lake is used for long-term storage of conversation transcripts. A non-Microsoft database is the primary storage for customer and transaction data.  
- Governance and compliance: The Power Platform admin center manages all Power Platform components, ensuring operational efficiency and compliance, while Microsoft Entra ID checks data access permissions.  
- User experience improvement: The use case focuses on improving employee access to information to enhance customer service, addressing challenges posed by disparate document types and existing contact center limitations.  

> [!NOTE]
> This solution idea is inspired by ABN AMRO Bank, who migrated to Microsoft Copilot Studio to support over 3.5 million customer conversations. Learn more: [ABN AMRO Bank customer story](https://www.microsoft.com/customers/story/19754-abn-amro-bank-microsoft-copilot-studio#asset_idabn-amro-bank-customer-experience-architecture).

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.

## Architecture diagram

:::image type="content" source="media/agent-contact-center/contact-center-arch.png" alt-text="Architecture diagram of a property rental portal with an AI-driven search and payment processing." border="true"  lightbox="media/agent-contact-center/contact-center-arch.png":::

## Workflow

### User interface 

- **Contact Center as a Service (CCaaS)**: A non-Microsoft contact center featuring diverse agent types, including chat and voice, facilitates seamless hand-offs to company employees via an escalation path and integrates with Azure and another database.
- **Employee portal website**: A portal for employees to perform tasks featuring an employee agent developed with Microsoft Copilot Studio.

### Knowledge

Knowledge refers to the information and data sources that agents use to provide relevant and accurate responses.

- **Latest offers website**: Web location of active offers by the company. 
- **Banking process documents**: Documents that contain information about the banking’s processes. 
- **Customer service website**: Web location that contains all the customer service information including FAQ’s, contact information, general information, and location information. 
- **Regulatory documents**: Documents that contain banking regulatory information such as governance, cybersecurity, compliance, and more. 
- **Card process documents**: Documents that contain information about payment authorization processes, transaction processes, card insurance, fraud detection and more. 

### Generative AI services 

- **[Azure AI Foundry](/azure/ai-foundry/)**: <!-- TBD, this was missed by the writer and I'm just following up on details -->
- **[Azure AI Search](/azure/search/search-what-is-azure-search)**: Azure AI Search is used for vectorized indexes for knowledge sources held outside of the knowledge section of Microsoft Copilot Studio. 

### Data sources 

- **[Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro)**: Microsoft Dataverse is used as the central repository for knowledge and metric data including customer feedback information. Dataverse is a foundational part of the Power Platform and seamlessly integrates with Copilot Studio.
- **[Azure Data Lake](/azure/storage/blobs/data-lake-storage-introduction)**: Azure Data Lake is used as the storage location for long-term storage of conversation transcripts. 

### Other sources 

- **Database**: The non-Microsoft database is the primary storage solution, serving as the central repository for all core customer and transaction data. This platform provides the scalability, security, and performance required to support the bank’s operational needs while seamlessly integrating with the agent built with Microsoft Copilot Studio and Power BI Dashboards. 

### Platform governance, compliance, and fundamentals

- **[Power Platform admin center](/power-platform/admin/new-admin-center)**: Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions. 
- **[Power Fx](/power-platform/power-fx/overview)**: Enables custom logic for advanced functionality in apps and workflows. Selected for its simplicity and integration with other Power Platform components. 
- **[Microsoft Entra ID](/entra/fundamentals/whatis): Enables checking of access to data for certain individuals. 
- **[Application Insights](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry)**: Used with Copilot Studio to deliver real-time telemetry and proactive diagnostics to allow for continuously optimizing performance and user experience. 

### Reporting 

- **[Power BI Dashboards](/power-bi/fundamentals/power-bi-overview)**: Visualizes operational and customer-centric data to provide actionable insights. Power BI is used because of its seamless integration with Dataverse while also being able bring other data storage information into the reports.

## Use case details 

This use case illustrates how a national banking company enhances customer experience by improving customer service, information access, and conversation processes through faster information retrieval for their employees.

> [!NOTE]
> This solution idea is inspired by ABN AMRO Bank, who migrated to Microsoft Copilot Studio to support over 3.5 million customer conversations. Learn more: [ABN AMRO Bank customer story](https://www.microsoft.com/customers/story/19754-abn-amro-bank-microsoft-copilot-studio#asset_idabn-amro-bank-customer-experience-architecture).

### Business problem 

- Business information is dispersed across various document types and websites in multiple locations, often leading to delays for employees in locating the correct information to assist customers seeking support.
- The employee agent solution must integrate with an existing non-Microsoft contact center service that maintains customer data.
- Consistent use of prebuilt Azure AI functionality across the company should be extended to this solution.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that can improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

For agents, the principle of "garbage in, garbage out" highlights the importance of data quality. Ensuring that the information provided to the agent is accurate makes sure the agent is able to provide reliable and correct responses.

### Security 

Implementing row-level security in Dataverse ensures that only authorized users can access specific information. This approach can also be applied to non-Microsoft data used by agents, ensuring secure handling when an API requests information.

Learn more:

- [Security and compliance considerations for intelligent application workloads](/well-architected/intelligent-application/security)
- [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds)

### Performance Efficiency 

- Tracking usage, dropouts, technical difficulties, and Customer Satisfaction Score (CSAT) scores enable adjustments to the agent's approaches, offerings, and structure.  Learn more: [Measuring agent engagement](/microsoft-copilot-studio/guidance/measuring-engagement)
Certainly! Here's a revised version with the appropriate reference links:
- Power Automate flows can be used to handle processes asynchronously. Learn more: [Use an asynchronous flow pattern](/power-automate/guidance/coding-guidelines/asychronous-flow-pattern)
- Bing Custom Search can be utilized to filter and manage allowed and blocked sections of website locations. Learn more: [Search public data or use a Bing Custom Search for generative answers nodes](/microsoft-copilot-studio/nlu-generative-answers-bing)
- Consider using Microsoft's contact center offerings to integrate everything into the Power Platform environment, facilitating the creation of agents with Microsoft Copilot Studio. Learn more: [Copilot onboarding guide for digital contact centers](/dynamics365/guidance/resources/cs-contact-center-copilot-onboarding-guide)
- Consider using the Microsoft 365 Agents SDK to utilize multiple agents. Learn more: [Microsoft 365 Agents SDK](/microsoft-365/agents-sdk/)

### Experience Optimization 

- Consolidate data into one centralized platform, such as Dataverse, to streamline access and management. Consider using [virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve) to integrate external data.
- Review documents used for the Generative AI Knowledge section and remove any data not required.
- Extending the employees' agent to provide more information directly to the employee, such as HR information.

Learn more:

- [Recommendations for designing conversational user experiences](/power-platform/well-architected/experience-optimization/conversation-design)
- [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview)

### Responsible AI 

Ensure fair treatment across all customer segments by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, enforce strict data privacy and security protocols, and incorporate human oversight to continuously monitor these processes.

Learn more: [Responsible AI considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/responsible-ai)

## Related resources 

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Copilot Studio documentation](/microsoft-copilot-studio/)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance/)
- [Copilot Studio implementation guide](https://aka.ms/CopilotStudioImplementationGuide)