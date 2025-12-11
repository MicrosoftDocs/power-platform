---
title: Signetic transforms healthcare operations with intelligent apps and agents powered by Power Platform and Copilot Studio
description: Discover how La Trobe University uses AI and Copilot Studio to streamline operations, enhance academic productivity, and improve staff support services.
#customer intent: As a Power Platform user, I want to learn how to use Copilot Studio and AI Builder to build a knowledge retrieval agent so that I can streamline support services at my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 12/11/2025
ms.topic: overview
---
# Signetic transforms healthcare operations with intelligent apps and agents powered by Power Platform and Copilot Studio

Signetic is a Seattle-based healthcare technology company using Microsoft Power Platform, Copilot Studio and Azure services to modernize pharmacy and clinic operations. Their integrated suite of applications streamlines patient scheduling, site configuration, visit management and claims processing – replacing manual, paper-heavy workflows with a scalable intelligent system.

By infusing AI agents built with Copilot Studio, Signetic is transforming its applications into an intelligent, proactive system that further enhances efficiency and user experience, enabling pharmacies and clinics to operate as modern community health hubs and scale to serve more patients.

This case study highlights how Signetic combines Power Platform, Azure, and AI-powered Copilot Studio agents to build enterprise-grade healthcare solutions that improve operational reliability and support smarter decision-making.

## Business Challenges 

Pharmacies and clinics often rely on outdated systems that slow down daily operations. Patients and staff frequently fill out multiple paper forms manually, leading to scheduling issues, incomplete patient records, and time-consuming documentation processes.

These inefficiencies delay service, increase error risks, and make it difficult for pharmacies and clinics to stay compliant or scale their services. To address these challenges, Signetic developed Signetic for Pharmacies, a suite of intelligent applications designed to streamline operations end to end - helping pharmacies and clinics work faster, more efficiently, and with greater reliability, so staff can focus on patient care rather than paperwork.

## Solution

### Overview

Signetic’s journey began with a mission to eliminate paperwork at pharmacies and clinics. During COVID‑19 pandemic, they rapidly expanded the platform to support mass-vaccination sites like Seattle’s Lumen Field, serving over 800,000 patients. Since then, the solution has evolved into an enterprise-grade platform that improves workflows across pharmacies, clinics, and community health providers. This system simplifies scheduling and documentation, reporting and claims processing, with AI agents augmenting labor-intensive tasks for billing operators.

The system is designed to provide tailored experiences through role-based apps and portals for patients, managers, staff, and billing operators. Behind the scenes, it integrates Power Platform, Copilot Studio and various Azure Services to provide a scalable, secure and extensible architecture. Signetic has also established a dedicated AI team responsible for model evaluation, prompt engineering, and identifying new opportunities to enhance and expand intelligent automation.

### Architecture

The architecture brings together Power Platform, Copilot Studio and Azure Services to deliver a unified, scalable, secure and extensible system. Core components include:

- Role-based portals and apps
  - React-based portal for patients to select services and schedule appointments
  - Canvas app for staff to document visit details
  - Model-driven apps for managers and billing operators
  - Dataverse as the primary data storage
- AI-driven automation
  - Copilot Studio agents embedded in apps to streamline billing and claims processes
  - Autonomous agents triggered by email to complete prior authorization workflows
- Integration layer
  - Azure App Services / APIs for communication between portals and Dataverse
  - Dataverse plugins + Azure Service Bus for integration with third-party systems
- Data, analytics and monitoring
  - Dataverse as the primary OLTP data storage
  - ETL Pipelines → Azure SQL Server for data warehouse and analytic
  - Azure Log Analytics + Azure Application Insights for monitoring logs and app health
  - Azure Logic Apps for system alerts
  - Power BI for analytics and reporting
  - Power Automate + Azure Functions for automated reporting

The following diagram shows how these components work together across user experiences, agentic automation, data flows and integration points.

:::image type="content" source="media/signetic/signetic-architecture.png" alt-text="":::

### Technologies used

The following sections summarize the technologies supporting the system.

- User-facing experiences:
  - **Power Apps:**
    - Canvas apps: Staff view appointments and documents visit details.
    - Model-driven apps: Managers configure locations, services, and schedules. Billing operators manage billing and claims procedures.
  - **Custom** **React-based portals:**
    - Patients view, select services, and schedule appointments.
    - Managers and staff use a start page showing available apps.
  - **Copilot Studio agent:** Conversational agent embedded in a model‑driven app, enabling staff to query claims data using natural language.
  - **Power BI dashboards:** Provide analytics and reporting to support informed decision‑making.

- Internal communication:
  - **Custom APIs built on Azure Services**: Manage communication between system components, ensuring secure and reliable data exchange.
  - *Example*: The Patient Portal API connects the patient portal with Dataverse.
- External communication:
  - **Dataverse plugins:** Integrate with third‑party services such as healthcare clearinghouses and SMS providers.
  - **Azure Service Bus:** Manages message queuing to ensure consistent processing.
  - **Power Automate + Azure Functions**: Triggered flows generate and deliver reports to the Centers for Disease Control and Prevention (CDC).
  - **Azure Logic Apps**: For monitoring-related alerts.

- Data Storage:
  - **Dataverse**: Serves as the primary data store.
  - **ETL pipelines**: Transfer data into a centralized warehouse.
  - **Azure SQL server**: Data warehouse, making data available for analytics.

- Monitoring:
  - **Azure Log Analytics + Azure Application Insights:** For maintaining logs.
  - **Azure Logic Apps:** To retrieve alerts.

### Role-based apps and portals deep dive

The system includes portals and apps designed for different roles:

- Overview portal for staff, managers, and billing operators
- Patient portal
- Canvas app for staff
- Model-driven apps for managers and billing operators

#### Overview portal

The overview portal serves as the central entry point for staff, managers, and billing operators. It provides quick access to the applications tailored to each role. Users can navigate to the patient portal, staff canvas app, or role-specific model-driven apps directly from this page.

The following image shows the overview page for the fictive Owl Pharmacy and Clinic company. App links take the user to the applications/portals dedicated to each role.

:::image type="content" source="media/signetic/overview-portal.png" alt-text="":::

#### Patient portal

The patient portal is a custom React application designed to provide convenient, self-service access for patients. It allows them to search for nearby clinics, select services, schedule appointments, and receive appointment confirmations and reminders. This portal ensures a streamlined and mobile-friendly scheduling experience, reducing manual intake for clinic staff.

:::image type="content" source="media/signetic/patient-portal.png" alt-text="":::

#### Canvas app for staff

When a patient arrives for their appointment, clinic staff use a Power Apps canvas to manage the visit. Through this app, staff can view scheduled appointments, complete required documentation, record services provided (such as vaccinations or test services), and document visit notes and outcomes.

The following image shows an appointment overview.

:::image type="content" source="media/signetic/appointment-overview.jpeg" alt-text="":::

The following image shows a service fulfillment.

:::image type="content" source="media/signetic/service-fulfillment.jpeg" alt-text="":::

#### Model-driven apps for billing operators

Some pharmacies and clinics have their own billing team, while others work with external billing companies or Signetic’s billing operations team. Most of the work is automated, such as checking claim eligibility and validating information.

Billing operators oversee the work, monitor pending claims and claims placed on hold. They review claims, identify and fix errors, such as missing or incomplete information.

The following images show the model-driven app designed for billing operators, claims processing overview and claim details.

:::image type="content" source="media/signetic/billingops-app.jpeg" alt-text="":::

:::image type="content" source="media/signetic/billingops-app2.jpeg" alt-text="":::

### Agents enhancing claims processing

Two Copilot Studio agents enhance key billing and claim workflow. Together, they reduce manual work, identify errors faster, and support both staff and patients through natural language interactions. The following diagram gives an overview of the two agents.

:::image type="content" source="media/signetic/signetic-agents.png" alt-text="":::

#### Billing Ops Agent

The Billing Ops Agent is a conversational agent built with Copilot Studio, embedded directly inside the Billing Operations portal (model-driven app) and supports billing operators as they review and resolve claims. Key capabilities include:

- Answers claims related questions from billing operators

- Retrieves live (claims) data from Dataverse

- Uses uploaded files as knowledge source to provide explanations

- Provides step-by-step guidance for common tasks

The agent opens when the chat icon in the bottom right corner of the app is selected. The following image shows the Billing Ops Agent with predefined prompts.

:::image type="content" source="media/signetic/billingops-agent.png" alt-text="":::

Example usage: If a claim is marked unprocessed, the billing operator can open it and ask: “Why is this claim unprocessed?”. If a claim is rejected, the billing operator can ask “Why was this claim rejected”. The following image shows the agent being tested in Copilot Studio.

:::image type="content" source="media/signetic/billingops-agent2.jpeg" alt-text="":::

The agent combines: Dataverse claim records (real-time status with details) and uploaded guidance documents with reasons for unprocessed claims. It then creates a clear explanation and recommends next steps. The agent also functions as a support assistant. For example, the operator can ask: “How do I create a task?” The agent returns procedural guidance aligned with internal policies.

The agent has been given the following instructions to ensure consistent and easy-to-follow responses.

:::image type="content" source="media/signetic/billingops-agent-instructions.jpeg" alt-text="":::

#### Send Prior Auth Agent

Prior authorization is required by many insurance providers before certain procedures or medications can be provided. Traditionally, this process involves manual form completion, lengthy back-and-forth communication, and risk of errors. The Send Prior Auth agent – an autonomous agent built with Copilot Studio automates this workflow end to end. When a patient’s e‑mail arrives, the **Send Prior Auth Agent** is triggered. It retrieves data from the Dataverse contact and appointment tables via the Dataverse MCP server, and applies agent flows, including AI prompts, to compose and send the prior authorization to the insurance provider. The agent is designed to:

- Verify information and request missing details (full name and date of birth).

- Retrieve the contact ID (GUID) from Dataverse to lookup appointments.

- Access appointment details from the appointment table.

- Confirm the destination for sending the prior authorization.

- Generate a composed e‑mail with the retrieved information in a pre-filled form, ready to be sent to the insurance provider.

The following image shows an example of the composed e-mail:

:::image type="content" source="media/signetic/authagent-email.jpeg" alt-text="":::

The following image shows the agent tested in Copilot Studio using the Dataverse MCP server to retrieve knowledge from Dataverse, an approach that improved retrieval accuracy. improved retrieval accuracy.

:::image type="content" source="media/signetic/auth-agent.jpeg" alt-text="":::

The agent’s general instructions:

:::image type="content" source="media/signetic/authagent-instructions.png" alt-text="":::

The Send Prior Auth Agent also supports Signetic’s Durable Medical Equipment service by generating prior authorization forms using data from the Dataverse product order tables.

Signetic’s solution delivers measurable operational improvements across clinics, pharmacies, and billing operations by modernizing core workflows and enabling Agentic experiences.

- Streamlined operations: Unified workflows reduce manual effort for clinic staff and billing teams.
- Faster claims resolution: Agents help identify issues and resolve claims efficiently.
- Improved patient experience: Self-service scheduling provides a simple and convenient access point for patients.
- Consistent and reliable data: Centralized data in Dataverse ensures accuracy across applications and processes.
- Built for scale: The enterprise-ready architecture supports expansion and future AI-driven enhancements.

## Looking ahead

Signetic is expanding the use of AI-powered data extraction and patient record creation. While these capabilities are currently used internally by developers, the next phase is to integrate them into the core application suite so clinics and operational teams can benefit directly.

Signetic also plans to further modernize the authorization process for the billing operations team. Because each insurance provider uses different portals and templates, the company is extending its solution to automatically retrieve, populate and submit the appropriate forms - supporting a wider variety of formats and enabling direct uploads to portals.

Together, these initiatives reinforce Signetic’s commitment to infusing AI throughout its platform – evolving its applications into intelligent, adaptive tools that help pharmacies and clinics scale, operate more efficiently and function as modern community health hubs.

## Takeaways

Here are some key takeaways:

- Design role-based portals and applications to simplify workflows and give each user the right tools.
- Embed Copilot Studio agents to deliver natural-language support and task guidance.
- Automate routine tasks, such as gathering details for prior authorizations, eligibility checks and claims submission to reduce errors and increase efficiency.
- Integrate automated reporting to meet regulatory requirements and reduce manual effort.
- Continuously evolve AI capabilities by testing new prompts, models, and automation scenarios.

*“Our billing operators are now able to process claims at a much faster rate, handle errors more efficiently, and manage documents seamlessly. AI from Copilot Studio and the Power Platform is bringing real intelligence into Signetic’s workflows, letting our teams focus on delivering value instead of repetitive tasks.”* Chandika Bhandari, Founder and CEO, Signetic.

*"With Copilot Studio and the Power Platform, we’ve been able to create smarter, grounded solutions quickly. Dataverse and MCP take care of the heavy lifting, empowering us to focus on delivering real value and infusing true intelligence into Signetic’s workflows without getting bogged down in API calls or data checks."* Summit Bajracharya, Solutions Architect, Signetic.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
  - [Training for Power Apps](/training/powerplatform/power-apps)
  - [What are canvas apps?](/power-apps/maker/canvas-apps/getting-started)
  - [What are model-driven apps in Power Apps?](/power-apps/maker/model-driven-apps/model-driven-app-overview)
  - [Add agents to your model-driven app](/power-apps/maker/model-driven-apps/add-agents-to-app)
- [What is Microsoft Copilot Studio?](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)
  - [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
  - [Add a Dataverse knowledge source](/microsoft-copilot-studio/knowledge-add-dataverse)
  - [Agent flows overview](/microsoft-copilot-studio/flows-overview)
- [Power Platform Well-Architected](/power-platform/well-architected/)
