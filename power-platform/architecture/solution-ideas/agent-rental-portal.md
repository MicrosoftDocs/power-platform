---
title: Property rental portal with AI-driven search and payment processing
description: Discover how to build a property rental portal with AI-driven search and payment processing using Power Platform and Microsoft Azure.
#customer intent: As a cloud architect, I want to visualize the major components of the rental portal so that I can design a well-architected solution.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/22/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---


# Property rental portal with AI-driven search and payment processing

In this article, you learn how to build a comprehensive rental portal that uses AI-driven search capabilities and seamless payment processing. Using Power Platform and Microsoft Azure, this solution integrates various components to provide a robust and user-friendly experience for both users and administrators. From browsing and reserving listings to managing payments and generating insightful reports, this architecture ensures a well-rounded and efficient rental management system. 

This article outlines the key components, workflow, and best practices for implementing this solution.

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.

## Architecture diagram

:::image type="content" source="media/agent-rental-portal/agent-property-rental.png" alt-text="Architecture diagram of a property rental portal with an AI-driven search and payment processing." border="true"  lightbox="media/agent-rental-portal/agent-property-rental.png":::

## Workflow

### Browsing and reserving listings

1. **User browses listings**
    - A user navigates to the Power Pages portal.
    - The user searches for available real estate listings using the React search component.
    - The Dataverse database is searched using the Power Pages Web API.

1. **Viewing listing details**
    - The user selects a listing to view detailed information.
    - The listing details are fetched from the Dataverse database via the Power Pages Web API and displayed in using a React UI.

1. **Initiating reservation**
    - The user decides to reserve a listing.
    - The user initiates the reservation process, triggering a checkout flow.
    - A reservation record is created using an update lock transaction to prevent double bookings.

1. **Completing reservation**
    - The checkout flow creates a Stripe checkout session using the Payments API.
    - The user is redirected to the Stripe checkout page to complete the payment.

1. **Payment confirmation**
    - Upon successful payment, Stripe sends a webhook to the Payments API.
    - The Payments API updates the reservation status in the Azure SQL database.

1. **Reservation confirmation**
    - The user is redirected back to the portal.
    - The reservation status is updated to completed in Dataverse.
    - The portal confirms the reservation and redirects the user to their profile page, which shows the reservations and payment status.

### Portal AI agent

1. **User interacts with Portal AI agent**
    - The user engages with the portal agent for assistance.
    - The bot uses Microsoft Copilot Studio, which is configured to search the portal content to understand and respond to user queries.

1. **Searches listings**
    - The agent extracts search terms from the user's query using an AI Builder prompt.
    - The agent uses the Dataverse connector to search for listings matching the criteria.

1. **AI agent provides results**
    - The AI agent returns the search results to the user using an adaptive card.
    - The user can then select a listing to view more details or initiate a reservation.

### Managing listings and payments

1. **Admin manages listings**
    - An admin uses the model-driven app to manage real estate listings.
    - The admin can add, update, or delete listings in the Dataverse database, and upload photographs using a custom page.

1. **Virtual table for payments**
    - The Payments API exposes payment data as a virtual table in Dataverse.
    - The admin can view payment details directly within the model-driven app.

1. **Custom connector for payments**
    - The custom connector facilitates communication between Power Platform and the Azure Payments API.
    - The custom connector is used in cloud flows to automate payment-related processes.
    - The Payments API handles payment approvals and refunds

### Reporting and analytics

1. **User activity on portal**
    - Users interact with the Power Pages portal, browsing and reserving listings.
    - Each user action generates telemetry data.
    - Application Insights captures telemetry data from the portal and the Copilot Studio agent, including page views, user queries, agent responses, errors logs, and performance metrics.

1. **API activity logging**
    - The Payments API and other backend services log activity to Application Insights.
    - Includes API calls, payment transactions, and error logs.

1. **Data aggregation in Fabric**
    - Application Insights aggregates telemetry data from the portal and APIs.
    - Dataverse Link to Fabric synchronizes listing and reservation information from Dataverse to Fabric.

1. **Power BI reporting**
    - Reports use Fabric to aggregate telemetry data from the portal and APIs, and listing and reservation data from Dataverse.

## Components

1. [Microsoft Dataverse](/power-apps/maker/data-platform/): A cloud-based storage space that lets you securely store and manage data used by business applications. Stores listing and reservation data, including property details, user information, and reservation statuses.

1. [Power Apps](/power-apps/): Power Apps is a suite of apps, services, connectors, and a data platform that provides a rapid application development environment to build custom apps for your business needs. Used to create custom applications for managing rental property listings and tracking tenant interactions efficiently.  

1. [Power Pages](/power-pages/): A platform for building secure, low-code websites. Lets users browse listings, make reservations, and view personalized property recommendations. Users authenticate via Power Pages, ensuring secure access to their data.  

1. [AI Builder prompts in Copilot Studio](/ai-builder/use-a-custom-prompt-in-mcs): AI Builder models that analyze user interactions and provide personalized property recommendations. Enhance the user experience by offering tailored property suggestions based on user behavior and preferences.  

1. [Azure Functions](/azure/azure-functions/functions-overview?pivots=programming-language-csharp), [Azure Key Vault](/azure/key-vault/), [Azure SQL](/azure/azure-sql/), [Application Insights](/azure/azure-monitor/app/app-insights-overview): Azure Functions is an event-driven serverless compute platform that runs on demand and at scale in the cloud. It handles payment processing securely, integrating with payment gateways like Stripe. Azure Functions uses managed identities to securely access the payment database. Azure Key Vault stores sensitive secrets such as the Stripe authentication key.  

1. [Power Automate](/power-automate/): A service that helps automate workflows between apps and services. Ensures seamless integration between the portal, Azure Functions, and Dataverse. Automates tasks such as calling the Payment API using a custom connector, sending confirmation emails, and updating reservation statuses.  

1. [Power BI](/power-bi/): A business analytics service that provides interactive visualizations and business intelligence capabilities. Provides insights into listing performance, user interactions, and reservation trends. Property managers use dashboards to make data-driven decisions. Data held in Application Insights and Azure SQL is joined with Dataverse reservation and property data.

1. [GitHub Actions](/power-platform/alm/devops-github-actions): GitHub Actions are used for continuous integration and continuous delivery (CI/CD), automating workflows to ensure consistent and efficient testing, validation, and deployment of changes. Automated builds and tests are triggered on code pushes, successful builds are deployed to staging and production environments, and unit tests are integrated into the pipelines to maintain code quality and catch issues early.

## Use case details

The Contoso Rental Property system provides an integrated platform for managing rental property listings, reservations, and payments. Users interact with the Power Pages portal to browse listings and make reservations. AI Builder models in Copilot Studio analyze user interactions and provide personalized property recommendations. Azure Functions handle payment processing, and Dataverse manages listing and reservation data. Automated workflows in Power Automate ensure seamless integration between the portal and backend services, while Power BI dashboards provide real-time insights into listing performance and reservation trends.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that can improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

- **Redundancy and failover:** Redundancy for critical functions provided by Dataverse and Azure Functions.
- **Monitoring and alerts:** Application Insights monitors the health of the portal and APIs. Alerts are set up for critical issues to ensure timely responses and minimize downtime.
- **Automated backups:** Leverages Power Platform's built-in capabilities for automated backups of Dataverse data. Azure SQL Database automatically performs full, differential, and transaction log backups to protect your data.
- **High availability**: High availability is ensured by Power Platform's built-in redundancy. Power Automate retries are implemented to allow for transient connection outages.

### Security

- **Authentication:** Power Pages supports various authentication methods, including Microsoft Entra ID, Microsoft accounts, and external identity providers. Only authenticated users can access the portal.
- **Role-based access control (RBAC):** Implement RBAC to restrict access to specific pages, data, and functionalities based on user roles. This security measures ensures that users only have access to the information and actions relevant to their roles.
- **Web Application Firewall (WAF):** Azure Front Door protects the portal from common web vulnerabilities and attacks, such as SQL injection and cross-site scripting (XSS).
- **Data protection:** Azure Key Vault stores and manages sensitive information such as API keys and connection strings. Sensitive data is encrypted and securely accessed.
- **Access control:** Role-based access control (RBAC) restricts access to sensitive data and operations. Only authorized users can perform critical actions.
- **Compliance:** The architecture complies with relevant data protection regulations, such as the General Data Protection Regulation (GDPR). Security policies are regularly reviewed and updated to maintain compliance.
- **Data Loss Prevention (DLP):** Power Platform's built-in DLP policies prevent unauthorized sharing of sensitive information. These policies protect data across all Power Platform services.
- **Microsoft Purview:** Microsoft Purview, used for data governance and compliance management, maintains data integrity and ensures that data handling practices meet regulatory requirements.

### Operational excellence

- **Automation:** Power Automate streamlines routine tasks such as notifications and approvals, reducing manual effort and minimizing the risk of human error.
- **Documentation:** Comprehensive documentation for all components and processes is maintained to aid troubleshooting and onboarding of new team members.
- **Training:** Regular training sessions are provided for users and administrators to ensure they're familiar with the system and can use it effectively.
- **CI/CD pipelines:** Automated CI/CD pipelines are implemented using Azure DevOps or GitHub Actions, to ensure that changes to the portal and applications are tested, validated, and deployed consistently and efficiently.
- **Unit testing:** Unit tests are created for critical components to ensure that they function correctly. Automated testing is integrated into the CI/CD pipelines to catch issues early in the development process.

### Performance efficiency

- **Scalability:** Power Platform and Azure's scalable infrastructure can handle varying workloads. Auto-scaling features adjust resources based on demand, ensuring optimal performance. Power Pages CDN improves page load times.
- **Optimization:** Queries and workflows are regularly reviewed using Application Insights and optimized to improve performance and address bottlenecks.

### Experience optimization

- **Ease of use and streamlined processes:** Ease of use is prioritized by minimizing user effort and maximizing task efficiency. Complex processes, such as payment processing, are streamlined to minimize user input.
- **Consistent design and information architecture:** Common design patterns and consistent terminology are used across the interface. A consistent information architecture with clear navigation structures and visual indicators is maintained.
- **User feedback and notifications:** Meaningful guidance and feedback on user actions are provided through notifications and messages. Users are informed about what happened and what they need to do next.
- **Adaptive and responsive design:** Layouts are optimized for different devices and screen sizes. Adaptive techniques are used to dynamically render content, ensuring a consistent experience across contexts.
- **Visual appeal and engagement:** The design focuses on creating visually appealing and engaging experiences. Modern UI elements and interactive features like chatbots are used to enhance user perception and engagement.
- **AI interaction design:** Natural, intuitive interactions with AI are designed. Fallback mechanisms are included to handle misunderstandings and provide alternative suggestions or support.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Scott Durow](https://www.linkedin.com/in/scottdurow/)**, Cloud Developer Advocate

## Reference implementation

A sample architecture implementation is available for reference in [GitHub](https://aka.ms/pp/contoso-real-estate).
