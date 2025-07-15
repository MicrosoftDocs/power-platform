---
title: Travel concierge using generative AI with Copilot Studio
description: Explore a travel concierge solution that uses Copilot Studio to reduce call center interactions, enhance data management, and optimize customer engagement.
#customer intent: As a business decision maker, I want to explore an example implementation that employs AI-driven solutions so that I can improve my own organization's customer service experience.
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

# Travel concierge using generative AI with Copilot Studio

In this article, you learn about a travel agency that uses AI-driven solutions to reduce call center interactions, improve data management, and optimize customer engagement.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/travel-agent/travel-agent-arch.png" alt-text="Architecture diagram of a call center solution that integrates Microsoft and other sources of data and knowledge with AI models and automated workflows." border="true" lightbox="media/travel-agent/travel-agent-arch.png":::

## Workflow

- **AI-driven customer support**: The Copilot Studio agent is designed to assist customers with travel-related inquiries, including reservation checks and balance inquiries, reducing the need for call center interactions.
- **Data management**: The architecture uses Microsoft Dataverse as a central repository for customer and location data, and a SQL database for tracking reservations and transactions.
- **Platform governance**: The Power Platform admin center is used for managing and monitoring components to maintain operational efficiency, with Microsoft Entra ID ensuring secure access to sensitive customer data.  
- **Performance optimization**: The architecture emphasizes experience optimization through data unification, sentiment analysis, and user personalization.

## Components

The solution described in this article includes the following components.

### User interface

[**Copilot Studio agent**](/microsoft-copilot-studio/): An AI-driven agent that assists customers with common travel questions, provides in-depth responses, and allows customers to check their reservations and balance owed.

**Public website**: The travel agency's existing customer-facing website, which it wants to enhance with a custom agent.

### Knowledge

"Knowledge" refers to the information and data sources that agents use to provide relevant and accurate responses.

**Rescheduling documents**: Documents that contain information about how to reschedule vacations.

**Travel documents**: Documents that contain information about destinations, such as recommendations, required identification, and visas.

**Insurance policy documents**: Documents that contain information about insurance policies.

**Customer service website**: Links to the customer service information on the website.

**Location documents**: Documents that contain information about each location the travel agency serves.

**Airport documents**: Documents that contain information about each airport the travel agency serves.

### Other services

[**Bing custom search**](/microsoft-copilot-studio/nlu-generative-answers-bing): A list of filtered locations from the public website to limit the information that's referred to when using generative AI.

### Processing

[**AI Builder**](/ai-builder/): For adding custom sentiment models.

[**Power Automate cloud flows**](/power-automate/overview-cloud): Automates workflows such as travel itineraries, payment dates, and reservation status.

### Data sources

[**Microsoft Dataverse**](/power-apps/maker/data-platform/data-platform-intro): Used as the central repository for customer and location data and customer feedback information. Dataverse is a foundational part of Power Platform and seamlessly integrates with Copilot Studio.

[**Azure SQL database**](/azure/azure-sql/): Used to track reservations and payment transactions.

### Platform governance, compliance, and fundamentals

[**Power Platform admin center**](/power-platform/admin/new-admin-center): Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions.

[**Power Fx**](/power-platform/power-fx/overview): Enables custom logic for advanced functionality in apps and workflows. Chosen for its simplicity and integration with other Power Platform components.

[**Microsoft Entra ID**](/entra/fundamentals/whatis): Ensures that only authenticated users have access to data. Chosen for its integration with Microsoft services and ability to manage user identities and access.

[**Application Insights**](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry): Used with Copilot Studio to deliver real-time telemetry and proactive diagnostics, optimizing performance and user experience.

### Reporting

[**Power BI dashboards**](/power-bi/fundamentals/power-bi-overview): Visualize operational and customer-centric data to provide actionable insights. Power BI integrates seamlessly with Dataverse and can bring data from other storage sources into reports.

## Scenario details

This use case is based on a travel company's approach to improving their customer experience with customer service, information, and conversion processes.

> [!NOTE]
> This solution idea is inspired by Holland America Line, which developed a virtual agent using Microsoft Copilot Studio that acts as a digital concierge on its website to support customers and travel advisors. Learn more in [Holland America Line sees early signs of more informed purchasing using Microsoft Copilot Studio](https://www.microsoft.com/customers/story/19787-holland-america-dataverse).

### Business problem

Customers often call the call center to request information that's readily available on the website. However, information on the site is stored in various locations, making it difficult for customers to find the information they need.

Many customers simply want to check their remaining balance, which requires numerous customer service interactions and consumes time as employees locate bookings.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

The principle of "garbage in, garbage out" is particularly important for agents and emphasizes the need for high-quality data. Providing accurate information to the agent ensures reliable and correct responses.

### Security

Implementing row-level security in Dataverse allows precise control over access to sensitive customer data, ensuring that only authorized individuals can view or update specific records. Combined with the security features of Power Platform, this approach not only safeguards customer information but also simplifies compliance and audits, enhancing trust in your digital services. Learn more in the following articles:

- [Security and compliance considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/security)
- [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds)
- [Managed security](/power-platform/admin/security/managed-security)

### Performance Efficiency

Tracking usage, dropouts, technical difficulties, and customer satisfaction scores (CSAT) informs adjustments to the agent's approaches, offerings, and structure. Learn more in [Measuring agent engagement](/microsoft-copilot-studio/guidance/measuring-engagement).

Power Automate flows can be used to handle processes asynchronously. Learn more in [Use an asynchronous flow pattern](/power-automate/guidance/coding-guidelines/asychronous-flow-pattern).

Bing Custom Search can filter and manage allowed and blocked sections of website locations. Learn more in [Search public data or use a Bing Custom Search for generative answers nodes](/microsoft-copilot-studio/nlu-generative-answers-bing).

### Experience Optimization

Consolidate data on one centralized platform, such as Dataverse, to streamline access and management. Consider using virtual tables in Dataverse to integrate external data. Learn more in [Get started with virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve).

Review documents used for generative AI knowledge and remove any data that isn't required.

Request the customer's name at the start of the agent experience to build a personalized approach.

Learn more in [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview) and [Recommendations for designing conversational user experiences](/power-platform/well-architected/experience-optimization/conversation-design).

### Responsible AI

Ensure fair treatment across all customer segments by actively addressing bias and maintaining equity in every interaction. Transparently disclose data sources with appropriate links, enforce strict data privacy and security protocols, and incorporate human oversight to monitor these processes continuously. Learn more in [Responsible AI considerations for intelligent application workloads](/power-platform/well-architected/intelligent-application/responsible-ai).

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Copilot Studio documentation](/microsoft-copilot-studio/)
- [Copilot Studio guidance](/microsoft-copilot-studio/guidance/)
- [Copilot Studio implementation guide](https://aka.ms/CopilotStudioImplementationGuide) (PDF)
