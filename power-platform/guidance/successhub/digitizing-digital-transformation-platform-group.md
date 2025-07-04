---
title: Digitizing the Digital Transformation Platform at Microsoft
description: Explore the Success Hub co-development model, enabling scalable app development while maintaining governance and collaboration across teams.
#customer intent: As a business decision maker, I want to understand how Microsoft digitizes app development so that I can apply similar strategies to my organization.  
author: kathyos
ms.component: pa-admin
ms.topic: article
ms.date: 05/14/2025
ms.subservice: guidance
ms.author: kathyos
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/23/2025
---

# Digitizing the Digital Transformation Platform (DTP) at Microsoft 

To digitize a large organization like the Digital Transformation Platform (DTP) at Microsoft, all four aspects of the digital feedback loop are essential.

:::image type="content" source="media/successhub-digital-feedback-loop.png" alt-text="Diagram that shows the digital feedback loop.":::

The four aspects of the digital feedback loop include:

- **Transforming** products to enhance our offerings. For example, publishing release notes about upcoming release wave deliverables.
- **Engaging** with customers and partners to boost business growth. For example, customer engagements and taking feedback and ideas from customers. 
- **Empowering** our own people to improve our organization's performance.
- **Optimizing** business operations to improve efficiency. For example, automating business reviews.

:::image type="content" source="media/successhub-digitally-transforming-dtp.png" alt-text="Diagram that show examples of apps developed on Success Hub and how to digitally transform DTP.":::

## Workstreams and personas

To digitize the four aspects of the feedback loop, apps are divided into different workstreams. Each workstream focuses on a specific persona, such as Customers & Partners, Product lifecycle or ProductOps, Business Operations (BizOps), Community, and DevOps. Each workstream has its own set of apps that are designed to meet the needs of that persona.

:::image type="content" source="media/successhub-persona-focused-workstreams.png" alt-text="Diagram that shows five persona-focused workstreams." border="false":::

The following image shows how 35 apps are modeled across these five workstreams.

:::image type="complex" border="false" source="media/successhub-apps-modelled-across-workstreams.png" alt-text="Diagram that shows apps modeled across workstreams.":::
    Five workstreams listed, each with business apps. Platform and Fundamentals list - Data quality, Schema, Usability, etc. Livesite and Ops list - Monitoring and telemetry, Support, Deploy and test, Maintenance upgrades.
:::image-end:::

Apps add data in Microsoft Dataverse and use data shared by other apps to improve the app experience with automation and intelligence. Data can also be used to provide cost-cutting scenarios for how the data gets used by the various apps.

### Product development scenario

In a product development scenario, the following steps are taken to ensure that the feedback loop is closed with customers and partners. Microsoft does the following:

1. Engages and interacts with the customer. There are numerous apps in the Customers & Partners workstream; for example, customer engagement, executive engagement, FastTrack apps, and Power CAT. Each is focused on a specific persona.
2. Gathers feedback from customers. There are numerous apps in the Customers & Partners and Community workstreams; for example, Ideas, Pulse, and Heartbeat (for FastTrack). 
3. Aggregates and prioritizes feedback and asks by using the Fusion/One feedback app in the ProductOps workstream.
4. Implements the feature feedback and asks by using product planning apps in the ProductOps workstream.
5. Announces the plan to the customers by using the release plan app in the ProductOps workstream executive reviews. This step is automated by using the bedrock portal, which is part of the BusinessOps workstream.

### Supportability scenario

In the supportability scenario:

1. A customer creates a support request. Achieved with the D4M part of the DevOps workstream.
2. An engineer reviews the case to prevent future cases. Achieved with the Case review app, which is part of the DevOps workstream.
3. The product team plans for the work to be done. Achieved with the product planning app in the Product Ops workstream.
4. Close the loop with customers who face the issue by using apps in the Customers & Partners workstream.
5. Close the loop with customers who gave the feedback by using apps in the Customers & Partners workstream.

## Success Hub co-development model

The challenge of the co-development model is to enable everyone to develop at scale, without disturbing other apps. A workstream lead is appointed for each of the five app development workstreams. Their job is to ensure that all the apps in that workstream honor the governance process and, in addition, get the right support from the Success Hub team.

When major changes are requested for an app, it goes through these five steps to reach production:

1. Align scope: Review the high-level user experience and schema changes. 
2. Update Microsoft Azure DevOps: Add feature and user stories, and update them with schema changes. 
3. Obtain partner approval: Send approval requests to affected stakeholders. 
4. Get sign-off on changes: Obtain workstream lead sign-off on the changes. 
5. Deploy changes: Review pull-request and verify schema changes and work items.

With 35 apps on the platform, it's not scalable to review all the changes. Some changes might not affect other apps, such as adding an icon for a custom table or changing the sorting in a custom view for a custom table. These changes are tagged as small in scope, so app teams can choose whether to review them with the Success Hub team. 

The main focus is assessing significant changes associated with tables, such as:

- **Creating a new table**: App teams often want to create their own table to work independently with the data. However, this practice can result in multiple tables for the same work, causing confusion. Reconciling these tables takes more time and effort than asking app teams to use or modify existing tables to meet their needs and the needs of all app teams.  

- **Changes to a shared table**: These are of two types:

  - **Changing the schema**: Requires alignment with the apps that already use the table. 
  - **Changing the data (for example, Taxonomy)**: Since apps share the data in the table, a single team must manage the data or create governance rules for it.  

## Deployment and live site

Success Hub uses a weekly deployment cycle where Microsoft Dataverse components are reviewed in a partner meeting and then deployed to a test environment every Wednesday. Partner teams have two days to validate their apps and solution changes in the test environment. After validation, sign-off is obtained from the partner teams and these components are deployed to a production environment the following Monday. 

Microsoft Power Platform also enables automation of the support process, where emails to the support alias are tracked in a ticketing system. These items are reviewed weekly in a live site review to assess the health of the Success Hub, identify repair items, and analyze user query trends.

To monitor component health, the following measures are implemented:
 
- An application lifecycle management (ALM) model, which includes:
  - Development environment (for each app)
  - Test environment (single environment)
  - User acceptance testing (UAT) environment (single environment)
  - Production environment (single environment)
  - Proof-of-concept environment for teams to try out their apps
- Build and release pipelines managed through Azure DevOps by using Power Platform Build Tools.
- Dev and test environments are refreshed weekly through automated builds.
- Automated tests in test environments and UAT environments to help ensure smoother co-development.
- Solutions: Each app is a solution and is in the process of becoming a managed solution.

## Security and compliance integration

After completing security and compliance integration, any app in development can use it. This integration has the following characteristics:

- A high volume of read-only data: In some instances in Success Hub, data is needed only for reference purposes; for example, the daily, monthly, and weekly active user metrics for a tenant. This data is used to understand usage, but never modified in Success Hub. Virtual tables are used to render such data, which is often high volume and read-only.  
- A high volume of read-write data: Power Automate flows meet most integration needs, but some scenarios require advanced Azure capabilities, like invoking Azure Functions. In these cases, Azure Logic Apps are used.
- Simple integration: Flows are used extensively to build integrations in addition to business logic in the organization. 
- Specific roles are created to honor security.
- Regular compliance reviews happen at the Success Hub level because it stores sensitive information.  
- App teams don't need to conduct compliance reviews if they use existing data tables and integrations.

## Integration with other data sources

Business apps often need data from different sources. Microsoft Dataverse lets you integrate with other data sources by using virtual tables. It supports integration with these types of data sources:  

- Microsoft customer, sales, and partner data (for example, Microsoft Sales Experience, Lifecycle Services, and Customer Service)
- DevOps and serviceability (Azure DevOps and IcM Incident Management)
- Organization hierarchy and user profiles (Microsoft Entra and Microsoft Graph)

## Support and maintenance channels

The following channels enable any app to be developed, supported, and maintained:

- Wiki, guidance, and weekly office hours for asking questions 
- Maintenance (including alerting and monitoring) managed by a single team (Microsoft Power Platform workstream)
- Telemetry dashboard to track performance and health metrics
