---
title: Property rental portal with AI-driven search and payment processing
description: Discover how to build a property rental portal with AI-driven search and payment processing using Power Platform and Microsoft Azure.
#customer intent: As a business decision maker, I want to visualize the major components of the AI-driven rental portal so that I can design a well-architected solution.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---


# Property rental portal with AI-driven search and payment processing

In this article, you learn about a rental property portal that provides AI-driven search capabilities and seamless payment processing. This solution uses Power Platform and Microsoft Azure components to provide a robust and user-friendly experience for both users and administrators. From browsing and reserving listings to managing payments and generating insightful reports, this architecture offers a well-rounded and efficient rental management system.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/agent-rental-portal/agent-property-rental.png" alt-text="Architecture diagram of a property rental portal with an AI-driven search agent and payment processing." border="true" lightbox="media/agent-rental-portal/agent-property-rental.png":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram.

### Browsing and reserving listings

1. **User browses listings**
    - A user navigates to the Power Pages portal.
    - The user searches for real estate listings using the React search component.
    - The Power Pages Web API searches the Dataverse database.

1. **User views listing details**
    - The user selects a listing to view detailed information.
    - The Power Pages Web API fetches the listing details from Dataverse.
    - A React UI displays the listing details.

1. **User initiates reservation**
    - The user decides to reserve a listing and initiates the reservation process, triggering a checkout flow.
    - A reservation record is created using an update lock transaction to prevent double bookings.

1. **User completes reservation**
    - The checkout flow creates a Stripe checkout session using the Payments API.
    - The user is redirected to the Stripe checkout page to complete the payment.

1. **Payment confirmation**
    - On successful payment, Stripe sends a webhook to the Payments API.
    - The Payments API updates the reservation status in the Azure SQL database.

1. **Reservation confirmation**
    - The user is redirected back to the portal.
    - The reservation status is updated to be completed in Dataverse.
    - The portal confirms the reservation and redirects the user to their profile page, which shows the reservation and payment status.

### Portal AI agent

1. **User interacts with Portal AI agent**
    - The user engages with the portal agent for assistance.
    - The agent uses Copilot Studio, which is configured to search the portal content to understand and respond to user queries.

1. **AI agent searches listings**
    - The agent extracts search terms from the user's query using an AI Builder prompt.
    - The agent uses the Dataverse connector to search for listings that match the criteria.

1. **AI agent provides results**
    - The agent returns the search results to the user in an adaptive card.
    - The user can select a listing to view details or initiate a reservation.

### Managing listings and payments

1. **Admin manages listings**
    - An admin uses the model-driven app to manage real estate listings.
    - The admin can add, update, or delete listings in the Dataverse database, and upload photographs using a custom page.

1. **Virtual table for payments**
    - The Payments API exposes payment data as a virtual table in Dataverse.
    - The admin can view payment details directly in the model-driven app.

1. **Custom connector for payments**
    - The custom connector facilitates communication between Power Platform and the Azure Payments API.
    - Cloud flows use the custom connector to automate payment-related processes.
    - The Payments API handles payment approvals and refunds.

### Reporting and analytics

1. **User activity in portal**
    - Users interact with the Power Pages portal, browsing and reserving listings.
    - Each user action generates telemetry data.
    - Application Insights captures telemetry data from the portal and the Copilot Studio agent, including page views, user queries, agent responses, error logs, and performance metrics.

1. **API activity logging**
    - The Payments API and other back-end services log activity to Application Insights, including API calls, payment transactions, and error logs.

1. **Data aggregation in Fabric**
    - Application Insights aggregates telemetry data from the portal and APIs.
    - Dataverse Link to Fabric synchronizes listing and reservation information from Dataverse to Fabric.

1. **Power BI reporting**
    - Reports use Fabric to aggregate telemetry data from the portal and APIs and listing and reservation data from Dataverse.

## Components

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): A cloud-based storage space that lets you securely store and manage data used by business applications. It stores listing and reservation data, including property details, user information, and reservation statuses.

[**Power Apps**](/power-apps/): A suite of apps, services, connectors, and a data platform that provides a rapid application development environment to build custom apps for your business needs. It's used to create custom applications for managing rental property listings and tracking tenant interactions efficiently.

[**Power Pages**](/power-pages/): A platform for building secure, low-code websites. Lets users browse listings, make reservations, and view personalized property recommendations. Users authenticate through Power Pages, ensuring secure access to their data.

[**AI Builder prompts in Copilot Studio**](/ai-builder/use-a-custom-prompt-in-mcs): AI Builder models analyze user interactions and provide personalized property recommendations. They enhance the user experience by offering tailored property suggestions based on user behavior and preferences.

[**Azure Functions**](/azure/azure-functions/functions-overview?pivots=programming-language-csharp), [Azure Key Vault](/azure/key-vault/), [Azure SQL](/azure/azure-sql/), [Application Insights](/azure/azure-monitor/app/app-insights-overview): Azure Functions is an event-driven serverless compute platform that runs on demand and at scale in the cloud. It handles payment processing securely, integrating with payment gateways like Stripe. Azure Functions uses managed identities to securely access the payment database. Azure Key Vault stores sensitive secrets such as the Stripe authentication key.

[**Power Automate**](/power-automate/): A service that helps automate workflows between apps and services. It ensures seamless integration between the portal, Azure Functions, and Dataverse. It automates tasks such as calling the Payment API using a custom connector, sending confirmation emails, and updating reservation statuses.

[**Power BI**](/power-bi/): A business analytics service that provides interactive visualizations and business intelligence capabilities. It provides insights into listing performance, user interactions, and reservation trends. Property managers use dashboards to make data-driven decisions. Data held in Application Insights and Azure SQL is joined with Dataverse reservation and property data.

[**GitHub Actions**](/power-platform/alm/devops-github-actions): Used for continuous integration and continuous delivery (CI/CD), automating workflows to ensure consistent and efficient testing, validation, and deployment of changes. Automated builds and tests are triggered on code pushes, successful builds are deployed to staging and production environments, and unit tests are integrated into the pipelines to maintain code quality and catch issues early.

## Scenario details

The Contoso rental property system provides an integrated platform for managing rental property listings, reservations, and payments. Users interact with the Power Pages portal to browse listings and make reservations. AI Builder models in Copilot Studio analyze user interactions and provide personalized property recommendations. Azure Functions handle payment processing, and Dataverse manages listing and reservation data. Automated workflows in Power Automate ensure seamless integration between the portal and backend services, while Power BI dashboards provide real-time insights into listing performance and reservation trends.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Redundancy and failover:** Redundancy for critical functions is provided by Dataverse and Azure Functions.

**Monitoring and alerts:** Application Insights monitors the health of the portal and APIs. Alerts are set up for critical issues to ensure timely responses and minimize downtime.

**Automated backups:** Power Platform's built-in capabilities automate Dataverse data backups. Azure SQL Database automatically performs full, differential, and transaction log backups to protect data.

**High availability**: High availability is ensured by Power Platform's built-in redundancy. Power Automate retries are implemented to allow for transient connection outages.

### Security

**Authentication:** Power Pages supports various authentication methods, including Microsoft Entra ID, Microsoft accounts, and external identity providers. Only authenticated users can access the portal.

**Role-based access control (RBAC):** RBAC restricts access to specific pages, data, and functionalities based on user roles. This security measure ensures that users have access only to the information and actions that are relevant to their roles.

**Web application firewall:** Azure Front Door protects the portal from common web vulnerabilities and attacks, such as SQL injection and cross-site scripting.

**Data protection:** Azure Key Vault stores and manages sensitive information such as API keys and connection strings. Sensitive data is encrypted and accessed securely.

**Access control:** RBAC restricts access to sensitive data and operations. Only authorized users can perform critical actions.

**Compliance:** The architecture complies with relevant data protection regulations. Security policies are regularly reviewed and updated to maintain compliance.

**Data loss prevention (DLP):** Power Platform's built-in DLP policies prevent unauthorized sharing of sensitive information. These policies protect data across all Power Platform services.

**Microsoft Purview:** Microsoft Purview, used for data governance and compliance management, maintains data integrity and ensures data handling practices meet regulatory requirements.

### Operational Excellence

**Automation:** Power Automate streamlines routine tasks such as notifications and approvals, reducing manual effort and minimizing the risk of human error.

**Documentation:** Comprehensive documentation for all components and processes is maintained to aid troubleshooting and onboarding of new team members.

**Training:** Regular training sessions are provided for users and administrators to ensure that they're familiar with the system and can use it effectively.

**CI/CD pipelines:** Automated CI/CD pipelines are implemented using Azure DevOps or GitHub Actions to ensure that changes to the portal and applications are tested, validated, and deployed consistently and efficiently.

**Unit testing:** Unit tests are created for critical components to ensure that they function correctly. Automated testing is integrated into the CI/CD pipelines to catch issues early in the development process.

### Performance Efficiency

**Scalability:** Power Platform and Azure's scalable infrastructure can handle varying workloads. Autoscaling features adjust resources based on demand, ensuring optimal performance. Power Pages content delivery network improves page load times.

**Optimization:** Queries and workflows are regularly reviewed using Application Insights and optimized to improve performance and address bottlenecks.

### Experience Optimization

**Ease of use and streamlined processes:** Ease of use is prioritized by minimizing user effort and maximizing task efficiency. Complex processes, such as payment processing, are streamlined to minimize user input.

**Consistent design and information architecture:** Common design patterns and consistent terminology are used across the interface. A consistent information architecture with clear navigation structures and visual indicators is maintained.

**User feedback and notifications:** Meaningful guidance and feedback on user actions are provided through notifications and messages. Users are informed about what happened and what they need to do next.

**Adaptive and responsive design:** Layouts are optimized for different devices and screen sizes. Adaptive techniques are used to dynamically render content, ensuring a consistent experience across contexts.

**Visual appeal and engagement:** The design focuses on creating visually appealing and engaging experiences. Modern UI elements and interactive features like chatbots are used to enhance user perception and engagement.

**AI interaction design:** Natural, intuitive interactions with AI are designed. Fallback mechanisms are included to handle misunderstandings and provide alternative suggestions or support.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Scott Durow](https://www.linkedin.com/in/scottdurow/)**, Cloud Developer Advocate

## Next steps

A sample implementation of this solution idea is available for reference on [GitHub](https://aka.ms/pp/contoso-real-estate).
