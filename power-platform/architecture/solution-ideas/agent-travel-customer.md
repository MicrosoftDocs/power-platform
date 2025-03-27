---
title: Travel concierge using generative AI with Copilot Studio
description: Discover how to use generative AI with Copilot Studio to create a travel concierge that transforms customer experience.
#customer intent: As a cloud architect, I want to build a travel concierge that transforms customer experince by using generative AI with Copilot Studio. .
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

# Travel concierge using generative AI with Copilot Studio

This article outlines a solution idea for a travel company's customer service, employing AI-driven solutions to enhance customer interactions and streamline information access.

- AI-driven customer support: The Microsoft Copilot Studio agent is designed to assist customers with travel-related inquiries, including reservation checks and balance inquiries, reducing the need for call center interactions.
- Data management: The architecture uses Microsoft Dataverse as a central repository for customer and location data, and a SQL database for tracking reservations and transactions.
- Platform governance: The Power Platform admin center is employed for managing and monitoring components to maintain operational efficiency, with Microsoft Entra ID ensuring secure access to sensitive customer data.  
- Performance optimization: The architecture emphasizes experience optimization through data unification, sentiment analysis, and user personalization.

> [!NOTE]
> This solution idea is inspired by Holland America, who developed an agent using Microsoft Copilot Studio that acts as a digital concierge on their website to support new and existing customers and travel advisors. Learn more: [Holland America customer story](https://www.microsoft.com/customers/story/19787-holland-america-dataverse).

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.

## Architecture diagram

:::image type="content" source="media/travel-agent/travel-agent-arch.png" alt-text="Architecture diagram of a property rental portal with an AI-driven search and payment processing." border="true"  lightbox="media/travel-agent/travel-agent-arch.png":::

## Workflow

### User interface

- **[Microsoft Copilot Studio agent](/microsoft-copilot-studio/)**: An AI-driven agent is used to assist customers with common questions about travel including the ability to answer common questions and provide in-depth responses and allow customers to check on their reservations and balance owed. 
- **Public website**: A customer facing website currently in use by the travel business that they’re looking to adapt with a custom agent.  

### Knowledge

Knowledge refers to the information and data sources that agents use to provide relevant and accurate responses.

- **Rescheduling documents**: Documents that contain information about each how to go about rescheduling vacations. 
- **Travel documents**: Documents that contain information about recommendations for destinations, identification customers might need, visa’s etc. 
- **Insurance policy documents**: Documents that contain information about insurance policies. 
- **Customer service website**: Linking to the location on the website to the Customer Service information. 
- **Location documents**: Documents that contain information about each location offered by the travel agency. 
- **Airport documents**: Documents that contain information about each airport offered by the travel agency. 

### Other services 

- **[Bing Custom Search](/microsoft-copilot-studio/nlu-generative-answers-bing)**: A list of filtered webpage locations from the public website to ensure not all of the information across the website is referred to when using Generative AI. 

### Processing 

- **[AI Builder models](/ai-builder/)**: Adding custom sentiment models. 
- **[Power Automate cloud flows](/power-automate/overview-cloud)**: Automation of workflows such as travel itineraries, Payment dates, and reservation status. 

### Data Sources 

- **[Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro)**: Dataverse is used as the central repository for customer and location data and the customer feedback information. Dataverse is a foundational part of Power Platform and seamlessly integrates with the Copilot Studio. 
- **[Azure SQL Database](/azure/azure-sql/)**: A SQL database is used to  keep track of reservations and payment transactions. 

### Platform governance, compliance, and fundamentals

- **[Power Platform admin center](/power-platform/admin/new-admin-center)**: Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions. 
- **[Power Fx](/power-platform/power-fx/overview)**: Enables custom logic for advanced functionality in apps and workflows. Selected for its simplicity and integration with other Power Platform components. 
- **[Microsoft Entra ID](/entra/fundamentals/whatis)**: Enables checking of access to data for certain individuals. 
- **[Application Insights](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry)**: Used with Copilot Studio to deliver real-time telemetry and proactive diagnostics to allow for continuously optimizing performance and user experience. 

### Reporting 

- **[Power BI Dashboards](/power-bi/fundamentals/power-bi-overview)**: Visualizes operational and customer-centric data to provide actionable insights. Power BI is used because of its seamless integration with Dataverse and ability to create interactive, real-time dashboards. 

## Use case details 

This use case is based on a travel companies approach to improving their customer experience with customer service, information, and conversion processes.  

> [!NOTE]
> This solution idea is inspired by Holland America, who developed a virtual agent using Microsoft Copilot Studio that acts as a digital concierge on their website to support new and existing customers and travel advisors. Learn more: [Holland America customer story](https://www.microsoft.com/customers/story/19787-holland-america-dataverse).

### Business problem 

- A significant number of customers call the call center to request information that is readily available on the website.
- Website information is stored in various locations, often making it difficult for customers to find the information they need.
- Many customers simply want to check their remaining balance, leading to numerous customer service interactions that consume considerable time as employees locate their bookings.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that can improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

For agents, the principle of "garbage in, garbage out" highlights the importance of data quality. Ensuring that the information provided to the agent is accurate makes sure the agent is able to provide reliable and correct responses.

### Security 

Implementing row-level security in Dataverse allows precise control over access to sensitive customer data, ensuring that only authorized individuals can view or update specific records. Combined with the security features of Power Platform, this approach not only safeguards customer information but also simplifies compliance and audits,  enhancing trust in your digital services.

- [Security and compliance considerations for intelligent application workloads](/well-architected/intelligent-application/security)
- [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds)
- [Managed security](/power-platform/admin/security/managed-security)

### Performance Efficiency 

- Tracking usage, dropouts, technical difficulties, and Customer Satisfaction Score (CSAT) scores enable adjustments to the agent's approaches, offerings, and structure.  Learn more: [Measuring agent engagement](/microsoft-copilot-studio/guidance/measuring-engagement)
Certainly! Here's a revised version with the appropriate reference links:
- Power Automate flows can be used to handle processes asynchronously. Learn more: [Use an asynchronous flow pattern](/power-automate/guidance/coding-guidelines/asychronous-flow-pattern)
- Bing Custom Search can be utilized to filter and manage allowed and blocked sections of website locations. Learn more: [Search public data or use a Bing Custom Search for generative answers nodes](/microsoft-copilot-studio/nlu-generative-answers-bing)

### Experience Optimization 

- Consolidate data into one centralized platform, such as Dataverse, to streamline access and management. Consider using [virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve) to integrate external data.
- Review documents used for the Generative AI Knowledge section and remove any data not required.
- Request the users name at the start of the agent to build a personalized approach. 

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
