---
title: Signetic transforms healthcare operations with intelligent apps and agents powered by Power Platform and Copilot Studio
description: Learn how Signetic revolutionizes healthcare operations with Power Platform and Copilot Studio, streamlining workflows, enhancing efficiency, and improving patient care.
#customer intent: As a healthcare technology professional, I want to understand how Signetic uses Power Platform and Copilot Studio to modernize clinic operations so that I can apply similar solutions in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.date: 12/12/2025
ms.topic: overview
---

# Signetic transforms healthcare operations with intelligent apps and agents

[Signetic](https://www.signetic.com/about-us) is a Seattle-based healthcare technology company that successfully modernized its pharmacy and clinic operations using Microsoft Power Platform, Copilot Studio, and Azure services. Their integrated suite of applications streamlined patient scheduling, site configuration, visit management, and claims processing&mdash;replacing manual, paper-heavy workflows with a scalable intelligent system.

By infusing AI agents built with Copilot Studio, Signetic transformed its applications into an intelligent, proactive system. The enhanced system improves efficiency and user experience and enables pharmacies and clinics to both operate as modern community health hubs and scale to serve more patients.

This case study highlights how Signetic uses Power Platform, Azure, and AI-powered Copilot Studio agents to provide enterprise-grade healthcare solutions that improve operational reliability and support smarter decision-making.

## Business challenges 

Pharmacies and clinics often rely on outdated systems that slow down daily operations. Patients and staff frequently fill out multiple paper forms manually, leading to scheduling problems, incomplete patient records, and time-consuming documentation processes.

These inefficiencies delay service, increase error risks, and make it difficult for pharmacies and clinics to stay compliant or scale their services. To address these challenges, Signetic developed [Signetic for Pharmacies](https://www.signetic.com/), a suite of intelligent applications designed to streamline operations end to end. The suite helps pharmacies and clinics work faster, more efficiently, and with greater reliability, so staff can focus on patient care rather than paperwork.

## Solution

Signetic's journey began with a mission to eliminate paperwork at pharmacies and clinics. During the COVID‑19 pandemic, they rapidly expanded the platform to support mass-vaccination sites like Seattle's Lumen Field, which served over 800,000 patients. Since then, the solution evolved into an enterprise-grade platform that improves workflows across pharmacies, clinics, and community health providers. The platform simplifies scheduling, documentation, reporting, and claims processing with AI agents augmenting labor-intensive tasks for billing operators.

The solution provides tailored experiences through role-based apps and portals for patients, managers, staff, and billing operators. Behind the scenes, it integrates Power Platform, Copilot Studio, and various Azure services to provide a scalable, secure, and extensible architecture. Signetic also established a dedicated AI team responsible for model evaluation, prompt engineering, and identifying new opportunities to enhance and expand intelligent automation.

## Architecture

The architecture brings together Power Platform, Copilot Studio, and Azure services to deliver a unified, scalable, secure, and extensible system. Core components include:

- Role-based portals and apps:
  - React-based portal for patients to select services and schedule appointments
  - Canvas app for staff to document visit details
  - Model-driven apps for managers and billing operators
  - Dataverse as the primary data storage
- AI-driven automation:
  - Copilot Studio agents embedded in apps to streamline billing and claims processes
  - Autonomous agents triggered by email to complete prior authorization workflows
- Integration layer:
  - Azure App Services and APIs for communication between portals and Dataverse
  - Dataverse plugins and Azure Service Bus for integration with third-party systems
- Data, analytics, and monitoring:
  - Dataverse as the primary OLTP (online transaction processing) data storage
  - ETL (extract, transform, load) pipelines to Azure SQL Server for data warehouse and analytics
  - Azure Log Analytics and Azure Application Insights for monitoring logs and app health
  - Azure Logic Apps for system alerts
  - Power BI for analytics and reporting
  - Power Automate and Azure Functions for automated reporting

The following diagram shows how these components work together across user experiences, agentic automation, data flows, and integration points.

:::image type="content" source="media/signetic/signetic-architecture.svg" alt-text="Diagram showing the high-level architecture of the Signetic solution." lightbox="media/signetic/signetic-architecture.svg":::

## Technologies used

The following sections summarize the technologies that support the system.

- User-facing experiences:
  - **Power Apps**:
    - Canvas apps: Staff view appointments and documents visit details.
    - Model-driven apps: Managers configure locations, services, and schedules. Billing operators manage billing and claims procedures.
  - **Custom React-based portals**:
    - Patients view, select services, and schedule appointments.
    - Managers and staff use a start page showing available apps.
  - **Copilot Studio agent**: Conversational agent embedded in a model‑driven app, enabling staff to query claims data by using natural language.
  - **Power BI dashboards**: Provide analytics and reporting to support informed decision‑making.

- Internal communication:
  - **Custom APIs built on Azure Services**: Manage communication between system components, ensuring secure and reliable data exchange.
  - *Example*: The Patient Portal API connects the patient portal with Dataverse.
- External communication:
  - **Dataverse plugins**: Integrate with third‑party services such as healthcare clearinghouses and SMS providers.
  - **Azure Service Bus**: Manages message queuing to ensure consistent processing.
  - **Power Automate + Azure Functions**: Triggered flows generate and deliver reports to the Centers for Disease Control and Prevention (CDC).
  - **Azure Logic Apps**: Monitor alerts.

- Data storage:
  - **Dataverse**: Serves as the primary data store.
  - **ETL pipelines**: Transfer data into a centralized warehouse.
  - **Azure SQL Server**: Data warehouse, for making data available for analytics.

- Monitoring:
  - **Azure Log Analytics + Azure Application Insights**: For maintaining logs.
  - **Azure Logic Apps**: To retrieve alerts.

## Key features

The Signetic for Pharmacies system combines role-based portals and applications designed for different roles:

- Overview portal for staff, managers, and billing operators
- Patient portal
- Canvas app for staff
- Model-driven apps for managers and billing operators
- AI-powered agents built with Copilot Studio to enhance billing and claims processing, for both staff and patients

### Overview portal

The overview portal serves as the central entry point for staff, managers, and billing operators. It provides quick access to the applications tailored to each role. Users can navigate to the patient portal, staff canvas app, or role-specific model-driven apps directly from this page.

The following image shows the overview page for the fictive Owl Pharmacy and Clinic company. App links take the user to the applications and portals dedicated to each role.

:::image type="content" source="media/signetic/overview-portal.png" alt-text="Screenshot of the Owl Pharmacy and Clinic overview portal with app links for Manager, Staff, and Patient portals.":::

### Patient portal

The patient portal is a custom React application designed to provide convenient, self-service access for patients. It lets them search for clinics, select services, schedule appointments, and receive confirmations and reminders. The Patient Portal reduces manual intake for clinic staff and offers a streamlined and mobile-friendly experience.

:::image type="content" source="media/signetic/patient-portal.png" alt-text="Screenshot of Owl Pharmacy and Clinic patient portal with service selection options and a Continue button.":::

### Canvas app for staff

When a patient arrives for their appointment, clinic staff use a Power Apps canvas app to manage the visit. Through this app, staff can view appointments, complete required documentation, record services provided (such as vaccinations or test services), and document visit notes and outcomes.

The following image shows an appointment overview.

:::image type="content" source="media/signetic/appointment-overview.jpg" alt-text="Screenshot of appointment overview in a canvas app showing patient information, insurance details, and a booked flu vaccine service.":::

The following image shows a service fulfillment.

:::image type="content" source="media/signetic/service-fulfillment.jpg" alt-text="Screenshot of service fulfillment screen showing flu vaccine details, billing type dropdown, counseling question, and Proceed to Payment button.":::

### Model-driven apps for billing operators

Some pharmacies and clinics have their own billing team, while others work with external billing companies or Signetic's billing operations team. Most of the work is automated, such as checking claim eligibility and validating information.

Billing operators oversee the work and monitor pending claims and claims placed on hold. They review claims and identify and fix errors, such as missing or incomplete information.

The following images show the model-driven app designed for billing operators. This image shows the claims processing overview page.

:::image type="content" source="media/signetic/billings-app-overview.jpg" alt-text="Screenshot of the overview screen in the model-driven app for billing operators showing claims counts, filters, search, and a table of claim details." lightbox="media/signetic/billings-app-overview.jpg":::

This image shows claim details:

:::image type="content" source="media/signetic/billings-app-detail.jpg" alt-text="Screenshot of the claim detail screen in the model-driven app for billing operators showing ICD codes, insurance and billing information, and service line breakdown." lightbox="media/signetic/billings-app-detail.jpg":::

### Agents that enhance claims processing

Signetic uses two Copilot Studio agents to reduce manual work, identify errors faster, and support both staff and patients through natural language interactions. 

The following diagram provides an overview of architecture of the two agents.

:::image type="content" source="media/signetic/signetic-agent-architecture.svg" alt-text="Diagram of the agent architecture for Signetic's Copilot Studio apps." lightbox="media/signetic/signetic-agent-architecture.svg":::

#### Billing Ops Agent

The Billing Ops Agent is a conversational agent built with Copilot Studio. The agent is embedded directly inside the Billing Operations portal (model-driven app) to support billing operators as they review and resolve claims. 

The Billing Ops Agent is designed to:

- Answer claims-related questions from billing operators.
- Retrieve real-time claims data from Dataverse.
- Use uploaded files as knowledge sources to provide explanations.
- Provide step-by-step guidance for common tasks.

The agent launches when a user selects the chat icon in the bottom right corner of the app. The following image shows the Billing Ops Agent with predefined prompts.

:::image type="content" source="media/signetic/billings-agent-launch.png" alt-text="Screenshot of Billing Ops Agent chat window showing sample prompts for claims errors and eligibility troubleshooting." lightbox="media/signetic/billings-agent-launch.png":::

## Examples

- If a claim is marked unprocessed, the billing operator can open it and ask: "Why is this claim unprocessed?"
- If a claim is rejected, the billing operator can ask: "Why was this claim rejected?" 

The following image shows the agent being tested in Copilot Studio.

:::image type="content" source="media/signetic/billings-agent-test.jpg" alt-text="Screenshot of Billing Ops Agent in Copilot Studio showing a test session with claim rejection analysis and recommended steps." lightbox="media/signetic/billings-agent-test.jpg":::

The agent combines Dataverse claim records and uploaded guidance documents to create clear explanations and recommended next steps. It also serves as a support assistant. For example, the operator can ask: "How do I create a task?" The agent then returns procedural guidance aligned with internal policies.

The agent has clear instructions to ensure consistent and easy-to-follow responses.

:::image type="content" source="media/signetic/billings-agent-instructions.jpg" alt-text="Screenshot of agent instructions panel in Copilot Studio, displaying objective, guidelines, and capabilities for the Billings Op Agent." lightbox="media/signetic/billings-agent-instructions.jpg":::

```copilot-prompt
OBJECTIVE
Provide accurate and actionable responses to queries related to the Signetic Billing Portal, including claims and NCPDP claim errors, ensuring users receive clear guidance without requiring direct database access.

GENERAL GUIDELINES
Be empathetic, clear, and concise in all responses.
For claims or portal-related questions, refer to the Signetic Billing Portal Navigation document.
Treat general or non-specific queries as related to the Billing Portal.
For NCPDP‑related questions:
Recognize claim IDs in the format ncpdp-XXXXXXXXXX (10-digit numeric suffix).
Always query the smvs_ncpdp_claimses table in Dataverse for claim details.
Never instruct users to manually check database tables or system columns.
Focus on error diagnosis, reason, and actionable resolution.

CAPABILITIES
Billing Portal Guidance: Provide navigation and usage instructions for the Signetic Billing Portal.
Claim Status Analysis: Determine the current state of claims (processed, pending, or errored).
NCPDP Error Resolution: Extract error details from Dataverse and translate them into step-by-step recommended solutions.
Knowledge Integration: Reference official Signetic documentation and NCPDP Knowledge Base for accurate guidance.
```

#### Send Prior Auth Agent

Many insurance providers require prior authorization before certain procedures or medications. Traditionally, this involves manual form completion, back-and-forth communication, and a high risk of errors. The Send Prior Auth Agent&mdash;an autonomous agent built with Copilot Studio&mdash;automates this workflow end to end. 

When a patient's email arrives, the agent:

- Verifies information and requests missing details (full name and date of birth).
- Retrieves contact and appointment data from Dataverse via the MCP (model context protocol).
- Confirms the destination for the authorization.
- Generates a composed email and form for the insurance provider.

The following image shows an example of the composed email:

:::image type="content" source="media/signetic/authorization-agent-email.jpg" alt-text="Screenshot of an example email composed by the agent showing a filled prior authorization form." lightbox="media/signetic/authorization-agent-email.jpg":::

The following image shows the agent tested in Copilot Studio using the Dataverse MCP server to retrieve knowledge from Dataverse, an approach that improved retrieval accuracy.

:::image type="content" source="media/signetic/authorization-agent-test.jpg" alt-text="Screenshot of Copilot Studio testing the Send Prior Auth Agent, showing flow inputs, Dataverse MCP Server steps, and a successful authorization message." lightbox="media/signetic/authorization-agent-test.jpg":::

Again, the agent has clear instructions to ensure consistent and easy-to-follow responses.

:::image type="content" source="media/signetic/authorization-agent-instructions.png" alt-text="Screenshot of the Send Prior Auth Agent overview tab with instructions panel, agent details, and enabled orchestration toggle.":::

```copilot-prompt
When a user requests to send a Prior Authorization via email or message, first verify that the message includes the patient’s Full Name and Date of Birth.
If either Full Name or Date of Birth is missing, prompt the user to provide these details before proceeding, and Send an email (V2) to request the missing information.
Using the provided Full Name and Date of Birth, automatically query the Contact table in Dataverse
to find the matching patient record and internally retrieve the associated contactid.
Do NOT prompt the user for the contactid.
Ask the user for the Email Address where the Prior Authorization should be sent.
Query the msemr_appointments entity using the following OData filter:
/api/data/v9.1/msemr_appointments?f‌​ilter=_msemr_actorpatient_value eq '{contactid}'

Replace {contactid} with the retrieved GUID value.
Use only the _msemr_actorpatient_value lookup field to filter appointments by patient contactid.
Do NOT use any other fields to find patient appointments.
Include all appointments returned by this query regardless of date, status, or field completeness.
```

The Send Prior Auth Agent also supports Signetic's Durable Medical Equipment service by generating prior authorization forms using data from the Dataverse product order tables.

Signetic's solution delivers measurable operational improvements across clinics, pharmacies, and billing operations by modernizing core workflows and enabling agentic experiences.

## Impact

- **Streamlined operations**: Unified workflows reduce manual effort for clinic staff and billing teams.
- **Faster claims resolution**: Agents help identify problems and resolve claims efficiently.
- **Improved patient experience**: Self-service scheduling provides a simple and convenient access point for patients.
- **Consistent and reliable data**: Centralized data in Dataverse ensures accuracy across applications and processes.
- **Built for scale**: The enterprise-ready architecture supports expansion and future AI-driven enhancements.

## Looking ahead

Signetic is expanding its AI-powered data extraction and patient record creation capabilities, integrating them into their core applications. They're also modernizing the authorization to support more templates and direct portal submissions.

These advancements help Signetic continue infusing AI throughout its platform and enable pharmacies and clinics to operate as modern community health hubs.

## Takeaways

Here are some key takeaways for organizations looking to modernize healthcare operations with intelligent applications and agents:

- Design role-based portals and applications to simplify workflows and give each user the right tools.
- Embed Copilot Studio agents to deliver natural-language support and task guidance.
- Automate routine tasks, such as gathering details for prior authorizations, eligibility checks, and claims submission to reduce errors and increase efficiency.
- Integrate automated reporting meeting regulatory requirements and reduce manual effort.
- Continuously evolve AI capabilities by testing new prompts, models, and automation scenarios.

> Our billing operators are now able to process claims at a much faster rate, handle errors more efficiently, and manage documents seamlessly. AI from Copilot Studio and the Power Platform is bringing real intelligence into Signetic's workflows, letting our teams focus on delivering value instead of repetitive tasks.
>
> — *Chandika Bhandari, Founder and CEO, Signetic*

> With Copilot Studio and the Power Platform, we've been able to create smarter, grounded solutions quickly. Dataverse and MCP take care of the heavy lifting, empowering us to focus on delivering real value and infusing true intelligence into Signetic's workflows without getting bogged down in API calls or data checks.
>
> — *Summit Bajracharya, Solutions Architect, Signetic*

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
  - [Training for Power Apps](/training/powerplatform/power-apps)
  - [What are canvas apps?](/power-apps/maker/canvas-apps/getting-started)
  - [What are model-driven apps in Power Apps?](/power-apps/maker/model-driven-apps/model-driven-app-overview)
  - [Add agents to your model-driven app](/power-apps/maker/model-driven-apps/add-agents-to-app)
- [Copilot Studio overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)
  - [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
  - [Add a Dataverse knowledge source](/microsoft-copilot-studio/knowledge-add-dataverse)
  - [Agent flows overview](/microsoft-copilot-studio/flows-overview)
- [Power Platform Well-Architected](/power-platform/well-architected/)
