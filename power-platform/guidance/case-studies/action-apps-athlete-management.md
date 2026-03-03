---
title: Action Apps redefines athlete management with Power Platform and Azure AI
description: Learn how Action Apps uses Power Platform and Azure AI to centralize athlete data, improve decision-making, and enhance sports performance management.
#customer intent: As a Power Platform user, I want to learn how Action Apps used Power Platform and Azure AI to create an athlete management solution so that I can build a similar data-driven solution for my organization.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 03/03/2026
ms.topic: overview
---

# Action Apps redefines athlete management with Power Platform and Azure AI

[Action Apps](https://actionapps.co.uk/) is a UK-based software company specializing in athlete management systems (AMS) and performance tracking tools. Founded in 2020, the company helps sports teams and individuals make better use of their data to improve productivity and results. Recognizing the limitations of traditional hosted AMS solutions, with fragmented data, limited customization, and constrained scalability, the Action Apps team set out to build a modern, flexible, and robust platform designed to meet the data needs of sports organizations.

In this case study, you learn how:

- A data-driven solution supports evolving sports organizations.
- A suite of applications helps improve decision-making and performance.
- AI agents can help make captured data more accessible.

## Business challenges

Athlete management processes are typically fragmented, manual, and difficult to scale. Teams rely on disconnected spreadsheets, paper-based evaluations, and inconsistent data entry, leading to unreliable insights and insecure data storage.

Many software as a service (SaaS)-based athlete management solutions attempt to address these challenges, but they typically store the sports teams' data on shared software systems, offer limited customization, and can't be tailored to the unique needs of each organization.

Action Apps aimed to provide a solution where sports organizations can own their data and store it in a secure and customizable software solution. Their goal was to offer a unified platform that adapts to the evolving needs of a modern sports organization—combining flexibility, data integrity, and enterprise-grade security.

## Solution

Action Apps uses a suite of Microsoft technologies to build smart and secure solutions. By using Power Apps, Azure, and Microsoft 365, they built an athlete management system (AMS).

> The Action Apps AMS transformed the way we worked with our data. The data platform allowed us to ingest data in an instant and gave us amazing interactivity with the data visualizations in Power BI. This allowed us to measure session and game performance faster and helped us make better and more informed decisions.
>
> — *Dan Hodges, Head of Performance at Newcastle United*

### Athlete management system (AMS)

The athlete management system (AMS) consists of three main modules that centralize analytics and insights based on athlete performance and health data. An operational layer supports day-to-day operations, and an AI agent, called [AAVA](#aava-the-ai-agent), lets users ask questions in natural language and get instant answers.

#### Sports Science

The Sports Science module, a model-driven app, serves as a central hub for AMS. This module provides centralized management of athlete data, covering injury tracking, event planning, and player information. It ensures data quality through structured workflows and consistent standards, delivering reliable insights that teams can act on.

Key capabilities include:

- **360° athlete view**: Offers a complete profile of each athlete, empowering informed, data-driven decision-making.

- **System integration**: Connects with GPS systems, wearables, video analysis tools, and medical records to form a unified data ecosystem.

- **Advanced analytics**: Uses Power BI for customizable dashboards and reports, helping teams identify trends and optimize performance.

The following image shows the model‑driven app with an athlete profile.

:::image type="content" source="media/action-apps-athlete-management/player-overview.png" alt-text="Screenshot of athlete profile page displaying personal details, team info, tasks, timeline, and injury records in a model-driven app." lightbox="media/action-apps-athlete-management/player-overview.png":::

This image shows the Power BI report embedded in the app, which presents athlete performance analytics.

:::image type="content" source="media/action-apps-athlete-management/player-report.png" alt-text="Screenshot of a Power BI player report showing charts, stats panels, and filters for athlete performance analytics." lightbox="media/action-apps-athlete-management/player-report.png":::

#### Electronic Medical Records

The Electronic Medical Records (EMR) module, also built inside the model-driven app, was developed in collaboration with elite sports teams to meet the specific needs of medical professionals and sports scientists. It centralizes athlete health data and supports clinical decision-making through a robust, secure, and interoperable platform.

Key features include:

- **Clinical documentation**: Supports SOAP notes, surgery tracking, metadata capture, and secure document storage for comprehensive medical records.

- **Injury and availability tracking**: Enables monitoring of athlete injuries and player availability to inform training and competition decisions.

- **Integrated coding compliance**: Uses Orchard Sports Injury and Illness Classification System (OSIICS), International Classification of Diseases (ICD), and Sports Medicine Diagnostic Coding System (SMDCS) for consistent data entry and reporting to governing bodies.

#### Scout App

The Scout App is a Power Apps canvas app optimized for smartphones and tablets that modernizes athlete evaluation workflows. Key features include:

- **Attribute-based scoring**: Scouts can evaluate athletes across multiple attributes and generate an overall score to identify who to follow up with for continued tracking.

- **Secure data handling**: Role-based permissions ensure that sensitive information is stored safely and data is no longer on paper, reducing the risk of loss or damage.

- **Structured data capture**: The app catalogs athlete evaluations digitally and includes athlete development insights to support long-term tracking and analysis.

#### Operational layer

A fourth pillar of the solution is the operational layer achieved using seamless integration with Microsoft 365. This layer:

- Enhances collaboration using Microsoft Teams, SharePoint, and Outlook for seamless communication and document management.

- Automates repetitive tasks with Microsoft Power Automate, freeing resources for strategic and performance-focused initiatives.

- Supports centralized scheduling to reduce conflicts and optimize resource allocation.

#### Management layer

The management layer of the AMS solution helps Action Apps achieve their unique goals for their application ecosystem:

- **Own your own data**: Organizations manage their data directly within their Microsoft environment using familiar tools. This includes Microsoft 365 applications, such as SharePoint, Outlook, Teams, Forms, Word, Excel, and PowerPoint, and Power Platform, Dataverse, and Azure services.

  - All apps and data reside in the customers' secure Microsoft environment.

  - Seamless integration across the Microsoft stack prevents data silos and ensures full accessibility.

  - Unlike traditional SaaS AMS solutions where teams upload data into a shared vendor environment, Action Apps ensures customers retain full ownership and control of their data.

- **Fully customizable**: Teams can customize their applications to meet their exact needs.

  - Customizable metadata, lookup fields, and on/off configurations are up to the customer to customize and turn the capabilities on and off. It's brandable and customizable for customers.

  - Low-code flexibility enables teams to meet their immediate business needs and scale the impact across the organization.

- **Enterprise-grade security**: Microsoft Azure provides robust security across its infrastructure. This level of security is bolstered by:

  - Microsoft Entra ID secures password, role, and permission access.

  - Microsoft Dataverse provides role-based security, row and field-level authorization, and complete auditing capabilities.

- **Compliance-ready**: The system supports the General Data Protection Regulation (GDPR), the Health Insurance Portability and Accountability Act (HIPAA), and other regulatory requirements by ensuring that personal and health data remain within the customer's environment, protected and governed by Microsoft's compliance framework.

### AAVA the AI agent

Action Apps built their own large language model (LLM)—AAVA (Action Apps Virtual Assistant)—by using Azure and OpenAI. AAVA helps their clients explore their data by enabling users to ask questions in natural language and receive instant, contextual answers.

AAVA also enables deep analytics on the data. They can collect more than 20 million data points about each player every year. Action Apps also uses RAG (retrieval-augmented generation) to search for data and combine the retrieved content with an enriched prompt, to generate an intelligent response about the information.

The following image shows AAVA in action. The user asks, *"What is the average total distance covered by each player in games where they played more than 80 minutes in the most recent season?"*

:::image type="content" source="media/action-apps-athlete-management/aava-agent.png" alt-text="Screenshot of AAVA dashboard with a user query, bar chart of distances, chart controls, and navigation menu." lightbox="media/action-apps-athlete-management/aava-agent.png":::

## Architecture

The following diagram shows the technologies that Action Apps used to build a trusted and secure solution for their clients. They deploy the entire platform within each customer's Microsoft environment, using Azure's built-in security, governance, and compliance capabilities.

:::image type="content" source="media/action-apps-athlete-management/architecture.png" alt-text="Diagram showing the technologies used including Power Apps, Power BI, Power Automate, Dataverse, Microsoft 365, and Azure services." lightbox="media/action-apps-athlete-management/architecture.png":::

Core security and capabilities:

- **Compliance**: Azure supports a wide range of industry and regulatory standards, including HIPAA, ISO standards for information security, and Payment Card Industry Data Security Standard (PCI DSS). This support helps organizations ensure that their applications and data meet regulatory requirements and are secure.

- **Identity and access management**: Microsoft Entra ID provides granular role-based access control to prevent unauthorized access to sensitive data and applications.

- **Threat protection**: Various security tools, such as Azure Security Center and Microsoft Sentinel, can detect threats, surface potential vulnerabilities, and offer actionable remediation guidance.

- **Data encryption**: All data is encrypted at REST and in transit.

- **DDoS Protection**: Azure's built-in DDoS Protection helps mitigate attacks and protect against potential downtime.

- **Continuous monitoring and compliance reporting**: Azure continuously monitors its infrastructure and logs and provides compliance reporting to help organizations maintain security readiness.

The AMS architecture is designed to unify data from multiple sources while maintaining strong governance:

- Data from external systems is integrated via APIs, ensuring secure and standardized ingestion.

- End users can upload spreadsheets and Comma‑Separated Values (CSV) files, and Data Factory ingests the data.

- Users primarily use tools they're already familiar with: SharePoint, Outlook, Teams, and Forms, integrated directly into the AMS system. It also connects to OneDrive, Office 365 Groups, Word, and Excel. Action Apps uses the applications that customers already use, such as:

  - Scheduling is done by using Outlook Calendars.

  - Users receive notifications both in-app and in Microsoft Teams.

- Application consumption is provided through Power Apps model-driven applications and mobile canvas apps, extended with custom pages for enhanced user experiences.

- Application data is stored in Dataverse and augmented with external datasets hosted in Azure SQL Server, including athlete data from wearable devices.

- Power BI is embedded into the interfaces and automatically visualizes the data analysis from the Power Apps solutions.

- Power Automate flows orchestrate notifications, data sync, scheduling, and workflow automation.

- Authentication and authorization across the system is secured by using Microsoft Entra ID.

## Technologies used

Action Apps deeply integrates Microsoft's suite of tools to ensure scalability, security, and innovation:

- **Power Platform** (Power Apps, Power Automate, Dataverse): Provides a flexible and robust platform for building apps and setting up automation, allowing teams to customize workflows.

- **Power BI**: Provides real-time dashboard and performance analytics.

- **Azure**: Powers the platform's cloud infrastructure, ensuring scalability, data integrity, and seamless integrations with APIs.

- **Microsoft 365**: Supports collaboration, scheduling, and document management to streamline team operations.

- **AI and LLM capabilities**: By using Azure OpenAI, the teams can interact with data through natural language and generate real-time insights.

- **Security and compliance**: By building on Microsoft's compliance frameworks (ISO 27001, SOC 1/2/3), Action Apps ensures robust data protection and audit readiness.

## Takeaways

This case study demonstrates the potential of using Power Platform, Azure, and Microsoft 365 services to set up an application suite that enables data-driven decision-making, tailored for a specific business. Here are key takeaways:

- Use a mix of Microsoft technologies to build applications that turn captured data into visual insights, empowering smarter, data-driven decisions.

- Structure your solution to collect data in a clear and consistent format, making it easier to apply AI now and scale it in the future.

- Integrate AI agents into existing systems, enabling users to explore data through natural language and gain real-time, actionable insights.

Action Apps successfully deployed their athlete management system (AMS) solution globally, and it's used across 12 leagues, 20 brands, and 30 teams.

> Microsoft 365, Azure, and Power Platform gave us the building blocks that we used to create a product that helps practitioners in elite sports enhance the performance of their athletes by turning complex, fragmented athlete data into decisions, predictions, and actions.
>
> — *Matt Groves, CTO, Action Apps*

## Looking ahead

Action Apps plans to build deeper AI integration, including using Copilot Studio to build agents that surface in the Power Apps applications. Action Apps also plans to build advanced player development tools and add API connections to further expand the data ecosystem.

Action Apps continues to lead the way in revolutionizing athlete management, providing organizations with innovative, secure, and future-proof solutions that adapt to the complexities of modern sports performance.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
  - [Overview of building a model-driven app with Power Apps](/power-apps/maker/model-driven-apps/model-driven-app-overview)
  - [Overview of building canvas apps](/power-apps/maker/canvas-apps/getting-started)
  - [FAQ about using AI responsibly in Power Apps](/power-apps/maker/common/responsible-ai-overview)
- [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro)
- [What is Power Automate?](/power-automate/flow-types)
- [What is Power BI?](/power-bi/fundamentals/power-bi-overview)
- [What is Azure AI Foundry Agent Service?](/azure/ai-foundry/agents/overview)
