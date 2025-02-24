---
title: Rental Portal with AI-Driven Search Agent and Payment Processing
description: Discover how to build a rental portal with AI-driven search and payment processing using Power Platform and Azure.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 02/06/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---


# Rental portal with AI-driven search agent and payment processing

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.


In this article, you'll learn how to build a comprehensive rental portal that leverages AI-driven search capabilities and seamless payment processing. Utilizing the Power Platform and Azure, this solution integrates various components to provide a robust and user-friendly experience for both users and administrators. From browsing and reserving listings to managing payments and generating insightful reports, this architecture ensures a well-rounded and efficient rental management system. Follow along to understand the key components, workflow, and best practices for implementing this solution.

## Architecture diagram

:::image type="content" source="../../media/image6.png" alt-text="Architecture diagram" border="true":::

## Workflow

### Browsing and reserving listings

1. **User browses listings**

    -   A user navigates to the Power Pages portal.

    -   The user searches for available real estate listings using the React search component.

    -   The Dataverse database is searched using the Power Pages Web API.

2. **Viewing listing details**

    -   The user selects a listing to view detailed information.

    -   The listing details are fetched from the Dataverse database via the Power Pages Web API and displayed in using a React UI.

3. **Initiating reservation**

    -   The user decides to reserve a listing.

    -   The user initiates the reservation process, triggering a checkout flow.

    -   A reservation record is created using an update lock transaction to prevent double bookings.

4. **Completing reservation**

    -   The checkout flow creates a Stripe checkout session using the Payments API.

    -   The user is redirected to the Stripe checkout page to complete the payment.

5. **Payment confirmation**

    -   Upon successful payment, Stripe sends a webhook to the Payments API.

    -   The Payments API updates the reservation status in the Azure SQL database.

6. **Reservation confirmation**

    -   The user is redirected back to the portal.

    -   The reservation status is updated to completed in Dataverse.

    -   The portal confirms the reservation and redirects the user to their profile page, which shows the reservations and payment status.

### Portal AI agent

1. **User interacts with Portal AI agent**

    -   The user engages with the portal agent for assistance.

    -   The bot uses Copilot Studio, which is configured to search the portal content to understand and respond to user queries.

2. **Searches listings**

    -   The agent extracts search terms from the user's query using an AI Builder prompt.

    -   The agent uses the Dataverse connector to search for listings matching the criteria.

3. **AI agent provides results**

    -   The AI agent returns the search results to the user using an adaptive card.

    -   The user can then select a listing to view more details or initiate a reservation.

### Managing listings and payments

1. **Admin manages listings**

    -   An admin uses the Model Driven App to manage real estate listings.

    -   The admin can add, update, or delete listings in the Dataverse database, and upload photographs using a custom page.

2. **Virtual table for payments**

    -   The Payments API exposes payment data as a virtual table in Dataverse.

    -   This allows the admin to view payment details directly within the Model Driven App.

3. **Custom connector for payments**

    -   The custom connector facilitates communication between Power Platform and the Azure Payments API.

    -   The custom connector is used in cloud flows to automate payment-related processes.

    -   The Payments API handles payment approvals and refunds

### Reporting and analytics

1. **User activity on portal**

    -   Users interact with the Power Pages portal, browsing and reserving listings.

    -   Each user action generates telemetry data.

    -   Application Insights captures telemetry data from the portal and Copilot studio agent. This includes page views, user queries, agent responses, errors logs and performance metrics.

2. **API activity logging**

    -   The Payments API and other backend services log activity to Application Insights.

    -   This includes API calls, payment transactions, and error logs.

3. **Data aggregation in Fabric**

    -   Application Insights aggregates telemetry data from the portal and APIs.

    -   Dataverse Link to Fabric synchronizes listing and reservation information from Dataverse to Fabric.

4. **Power BI reporting**

    -   Reports use Fabric to aggregate telemetry data from the portal and APIs, and listing and reservation data from Dataverse.

## Use case details

The Contoso Rental Property system provides an integrated platform for managing rental property listings, reservations, and payments. Users interact with the Power Pages portal to browse listings and make reservations. AI Builder models in Copilot Studio analyze user interactions and provide personalized property recommendations. Azure Functions handle payment processing, and Dataverse manages listing and reservation data. Automated workflows in Power Automate ensure seamless integration between the portal and backend services, while Power BI dashboards provide real-time insights into listing performance and reservation trends.

## Components

1. **Dataverse:** A cloud-based storage space that lets you securely store and manage data used by business applications. It stores listing and reservation data, including property details, user information, and reservation statuses.  
  **Learn more**: [Dataverse](https://www.microsoft.com/en-us/power-platform/dataverse)

2. **Power Apps:** Power Apps is a suite of apps, services, connectors, and a data platform that provides a rapid application development environment to build custom apps for your business needs. It's used to create custom applications for managing rental property listings and tracking tenant interactions efficiently.  
    Learn more: [Power Apps](https://www.microsoft.com/en-us/power-platform/products/power-apps)

3. **Power Pages:** A platform for building secure, low-code websites.  
    It lets users browse listings, make reservations, and view personalized property recommendations. Users authenticate via Power Pages, ensuring secure access to their data.  
    Learn more: [Power Pages](https://www.microsoft.com/en-us/power-platform/products/power-pages)

4. **AI builder prompts in Copilot Studio:** AI Builder models that analyze user interactions and provide personalized property recommendations. They enhance user experience by offering tailored property suggestions based on user behavior and preferences.  
    Learn more: [AI & Low code](https://www.microsoft.com/en-us/power-platform/ai)

5. **Azure Functions, Azure Key Vault, Azure SQL, Application Insights:** Azure Functions are an event-driven serverless compute platform that runs on demand and at scale in the cloud.  
    They handle payment processing securely, integrating with payment gateways like Stripe. Azure Functions use managed identities to securely access the payment database. Azure Key Vault stores sensitive secrets such as the Stripe authentication key.  
    Learn more: [Azure Functions](/azure/azure-functions/functions-overview?pivots=programming-language-csharp)

6. **Power Automate:** A service that helps automate workflows between apps and services.  It ensures seamless integration between the portal, Azure Functions, and Dataverse. It automates tasks such as calling the Payment API using a custom connector, sending confirmation emails, and updating reservation statuses.  
    Learn more: [Power Automate](https://www.microsoft.com/en-us/power-platform/products/power-automate)

7. **Power BI:** A business analytics service that provides interactive visualizations and business intelligence capabilities.  
    It provides insights into listing performance, user interactions, and reservation trends. Property managers use dashboards to make data-driven decisions. Data held in Application Insights and Azure SQL is joined with Dataverse reservation and property data.  
    Learn more: [Power BI](https://www.microsoft.com/en-us/power-platform/products/power-bi)

8. **GitHub Actions:** GitHub Actions are used for CI/CD, automating workflows to ensure consistent and efficient testing, validation, and deployment of changes. Automated builds and tests are triggered on code pushes, successful builds are deployed to staging and production environments, and unit tests are integrated into the pipelines to maintain code quality and catch issues early.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that can improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

Here is an Azure example of considerations for inspiration: [Student attrition prediction](/azure/architecture/example-scenario/ai/student-attrition-prediction#considerations).

### Reliability

- **Redundancy and failover:** Redundancy for critical functions provided by Dataverse and Azure Functions.

- **Monitoring and alerts:** Application Insights monitors the health of the portal and APIs. Alerts are set up for critical issues to ensure timely responses and minimize downtime.

- **Automated backups:** Power Platform's built-in capabilities for automated backups of Dataverse data are utilized. Azure SQL Database automatically performs full, differential, and transaction log backups to protect your data.

- **High availability**: High availability is ensured by Power Platform's built-in redundancy. Power Automate retries are implemented to allow for transient connection outages.

### Security

- **Authentication:** Power Pages supports various authentication methods, including Azure Active Directory (AAD), Microsoft accounts, and external identity providers. This ensures that only authenticated users can access the portal.

- **Role-Based Access Control (RBAC):** Implement RBAC to restrict access to specific pages, data, and functionalities based on user roles. This ensures that users only have access to the information and actions relevant to their roles.

- **Web Application Firewall (WAF):** Azure Front Door protects the portal from common web vulnerabilities and attacks, such as SQL injection and cross-site scripting (XSS).

- **Data protection:** Azure Key Vault stores and manages sensitive information such as API keys and connection strings. This ensures that sensitive data is encrypted and securely accessed.

- **Access control:** Role-based access control (RBAC) restricts access to sensitive data and operations. Only authorized users can perform critical actions.

- **Compliance:** The architecture complies with relevant data protection regulations, such as GDPR. Security policies are regularly reviewed and updated to maintain compliance.

- **Data Loss Prevention (DLP):** Power Platform's built-in DLP policies were configured to prevent unauthorized sharing of sensitive information. These policies protected data across all Power Platform services.

- **Microsoft Purview:** Microsoft Purview was used for data governance and compliance management. This helped in maintaining data integrity and ensuring that data handling practices met regulatory requirements.

### Operational excellence

- **Automation:** Power Automate is used to streamline routine tasks such as notifications and approvals. This reduces manual effort and minimizes the risk of human error.

- **Documentation:** Comprehensive documentation for all components and processes is maintained. This helps in troubleshooting issues and onboarding new team members.

- **Training:** Regular training sessions are provided for users and administrators to ensure they are familiar with the system and can use it effectively.

- **CI/CD Pipelines:** Automated CI/CD pipelines are implemented using Azure DevOps or GitHub Actions. This ensures that changes to the portal and applications are tested, validated, and deployed consistently and efficiently.

- **Unit testing:** Unit tests are created for critical components to ensure that they function correctly. Automated testing is integrated into the CI/CD pipelines to catch issues early in the development process.

### Performance efficiency

- **Scalability:** Power Platform and Azure's scalable infrastructure is leveraged to handle varying workloads. Auto-scaling features adjust resources based on demand, ensuring optimal performance. Power Pages CDN improves page load times.

- **Optimization:** Queries and workflows are regularly reviewed using Application Insights and optimized to improve performance and address bottlenecks.

### Experience optimization

- **Ease of use and streamlined processes:** Ease of use is prioritized by minimizing user effort and maximizing task efficiency. Complex processes, such as payment processing, are streamlined to minimize user input.

- **Consistent design and information architecture:** Common design patterns and consistent terminology are used across the interface. A consistent information architecture with clear navigation structures and visual indicators is maintained.

- **User feedback and notifications:** Meaningful guidance and feedback on user actions are provided through notifications and messages. Users are informed about what happened and what they need to do next.

- **Adaptive and responsive design:** Layouts are optimized for different devices and screen sizes. Adaptive techniques are used to dynamically render content, ensuring a consistent experience across contexts.

- **Visual appeal and engagement:** The design focuses on creating visually appealing and engaging experiences. Modern UI elements and interactive features like chatbots are used to enhance user perception and engagement.

- **AI interaction design:** Natural, intuitive interactions with AI are designed. Fallback mechanisms are included to handle misunderstandings and provide alternative suggestions or support.

## Reference implementation

A sample architecture implementation is available for reference – <https://aka.ms/pp/contoso-real-estate>
