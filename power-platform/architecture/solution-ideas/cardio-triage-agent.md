---
title: Cardio Triage AI workflow with Power Platform
description: Streamline cardiac triage and appointment scheduling with Power Platform, AI Builder, and Copilot Agents. See how it works.
#customer intent: As a Power Platform user, I want to automate cardiac triage and appointment scheduling so that I can reduce manual work and improve patient care.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Cardio Triage AI workflow with Power Platform



For a demo and more information about the Cardio Triage AI solution, visit [GitHub](https://github.com/microsoft/Powerful-Devs-Hack-Together/issues/34).

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/cardio-triage/cardio-triage.png" alt-text="Architecture diagram of the Cardio Triage AI solution." border="true" lightbox="media/cardio-triage/cardio-triage.png":::

## Workflow

This section outlines the step-by-step process followed in the Cardio Triage AI workflow.

1. **Patient registration and check-in**:
    - A front desk interactive agent (built using Microsoft Copilot Studio) guides the front desk staff or patient through registration.
    - At check-in, the agent generates an Outpatient (OP) ticket and records patient information in Microsoft Dataverse.
    - This starts the triage process and creates a unique case identifier for tracking.
1. **Lab report submission and data extraction**:
    - A lab technician or patient uploads the diagnostic lab report through the CardiaLite Power Apps interface.
    - AI Builder automatically extracts relevant health metrics (like troponin levels and ECG values) using pre-trained form processing models.
    - The system validates and securely stores extracted values in Dataverse, updating the patient record in real time.
1. **Autonomous triage trigger**:
    - When the lab report is submitted successfully, a Power Automate flow starts automatically.
    - This flow activates the Triage Master Agent, an autonomous AI agent designed using Copilot Studio, which starts the triage evaluation.
1. **AI-powered data evaluation and triage decisioning**:
    - The Triage Master Agent evaluates the patient’s lab data by referencing the following:
    - Intelligent Cardiac Triage Guidelines – to assess criticality and risk.
    - Intelligent Clinic Scheduling Guidelines – to determine if a consultation is necessary and what expertise is required.
    - The agent can also call the Microsoft Graph API to get physician availability and contextual data (like prior appointments).
    - Based on the outcome, the case is categorized as critical, non-critical with follow-up, or monitor-only.
1. **Automated appointment scheduling**:
    - If a physician consultation is recommended, the system books an appointment using Microsoft Bookings, matching patient urgency with the relevant cardiologist’s availability.
    - The booking details sync with Outlook calendars for both patients and doctors.
1. **Real-time notifications**:
    - Patients get immediate notifications of the triage outcome through Outlook email.
    - If a consultation is booked, the email includes the time, doctor name, and location or link.
    - If no immediate action is needed, the email provides personalized health tips or follow-up reminders.
    - The system logs all interactions and outcomes for transparency and auditing.

## Components

Here are the main components that make up the Cardio Triage AI workflow solution.

### Microsoft Power Platform:

- **Power Apps**: Power Apps is a user-friendly platform that lets anyone build custom apps with minimal coding. It helps create intuitive, front-end interfaces that connect to different data sources. In a solution design, use Power Apps to create easy-to-use applications for tasks like managing patient data or interacting with healthcare systems, all without needing complex development skills.
- **Power Automate**: Power Automate is a tool that helps automate repetitive tasks and workflows. It connects different services and apps to perform tasks automatically, saving time and reducing the chance of human error. In a technical solution, use Power Automate to streamline processes like scheduling patient appointments or syncing data across systems, making operations more efficient.
- **Dataverse**: Dataverse is a secure, scalable database solution that stores and organizes data from different sources. It’s designed to handle large amounts of structured and unstructured data, making it easy to store and retrieve information in a consistent way. In a healthcare solution, use Dataverse to store patient records, appointment data, and other critical information, ensuring data is secure and easy to access.
- **AI Builders**: AI Builder is a tool that lets you add artificial intelligence to your apps without needing deep technical knowledge. It helps build features like predictive analytics or automated insights. In a healthcare solution, use AI Builders to assess patient conditions, predict future health risks, or help staff make data-driven decisions quickly.

### Copilot Agents

Copilot Agents are AI-powered assistants that help automate decision making and assist with tasks. In healthcare, these agents analyze patient data to provide real-time suggestions or assessments, improving decision making accuracy. Copilot Agents help clinicians by offering AI-driven recommendations based on patient data, making appointment processes smoother and more efficient.

### Microsoft Bookings

Microsoft Bookings is a scheduling tool that makes it easier for patients to book appointments and for staff to manage their schedules. It helps optimize resources by providing an easy-to-use interface for managing appointments. In a technical solution, use Microsoft Bookings to simplify appointment management, letting patients schedule visits and staff organize their time easily.

### Microsoft Graph

Microsoft Graph is an API that gives access to a wide range of data from Microsoft 365 services, like calendars, emails, and tasks. Use Microsoft Graph to pull important data from services like patient schedules or staff calendars, helping keep everything in sync and up to date in real time.

### Azure App Registrations

Azure App Registrations lets you register apps within Azure Active Directory (Azure AD) for secure access and authentication. It ensures that only authorized users or applications can access sensitive data. Use Azure App Registrations to manage app security and ensure safe, seamless integration with services like Microsoft Graph or Power Apps.

### Azure Key Vault

Azure Key Vault is a service that stores sensitive data, such as passwords, API keys, and encryption keys, securely. It helps keep your most important information safe while letting authorized apps or users access it when needed. Use Azure Key Vault to securely store secrets, such as database passwords or connection strings, ensuring everything is protected and accessible only by the right people or systems. 

## Scenario details
This section describes the specific scenario, including the workflow, participants, and goals of the Cardio Triage AI solution.

### Business problem

Cardiology departments in hospitals and clinics face challenges prioritizing and managing patients based on the severity of their cardiac conditions. Traditional triage processes are mostly manual and depend on the judgment of administrative staff or the availability of clinical resources. These challenges can cause:

- Delays in treating critical cases like myocardial infarctions or arrhythmias
- Overbooking or underutilization of cardiologists because of inefficient scheduling
- Increased cognitive load on healthcare staff, who handle data-intensive tasks like interpreting lab reports or managing appointments
- Errors in triage and scheduling, which can have life-threatening effects in high-risk cardiac cases

Hospitals and clinics need an intelligent, automated triage system that reduces manual work, improves risk assessment accuracy, and optimizes scheduling—especially in resource-constrained or high-volume healthcare environments.

### Use case overview

CardioTriage-AI is a Power Platform-based AI solution designed to address these issues by using AI Builder, Copilot Custom Agents, Microsoft 365 integrations, and Azure services to:

- Automatically extract and analyze lab reports using AI Builder to remove manual data interpretation
- Use a Copilot-powered autonomous agent to assess condition severity and recommend specialist care based on:
    - Intelligent Cardiac Triage System Documentation
    - Intelligent Clinic Scheduling Guidelines
- Prioritize patients in real time and update triage queues dynamically
- Streamline appointment scheduling using Microsoft Bookings to match critical cases to available specialists quickly
- Trigger automated workflows using Power Automate to notify doctors, book slots, and update records
- Securely manage patient data using Dataverse, Key Vault, and private endpoints in Azure

### Business value and outcomes

CardioTriage-AI delivers measurable improvements in clinical outcomes and operational efficiency, including:

- Reduced treatment delays for critical cardiac patients by automating and accelerating triage decisions
- Improved resource allocation by making sure doctors' time is used effectively based on the urgency of each case
- Enhanced clinical decision support with explainable AI recommendations, reducing clinician cognitive load
- Secure, compliant data handling with full auditability and adherence to privacy regulations
- Decreased administrative overhead and fewer manual scheduling errors through automation and self-service interfaces

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Automated recovery and error handling: Power Automate flows include error handling, retries, and parallel execution to prevent workflow failures. Try-catch-finally patterns are used where applicable.
- Reliable data backbone with Dataverse: CardioTriage-AI uses Microsoft Dataverse as its core data platform, benefiting from its 99.9% availability SLA, robust schema validation, and transactional integrity. Built-in backup and recovery mechanisms further enhance system reliability.
- Queued processing for scalability: Background processes like triage scoring and appointment scheduling use autonomous AI agents for scalability and reduced system load.

### Security

- Azure Key Vault secures secrets like API tokens and database connection strings.
- Azure active directory (AAD) and role-based access control (RBAC) manage authentication and authorization for all users, like doctors and front desk staff.
- Private endpoints ensure secure traffic routing within Microsoft’s backbone network.
- The solution follows compliance standards relevant for healthcare, like HIPAA and GDPR, to ensure data privacy.

### Operational Excellence

- Power Platform admin center is used to monitor and govern apps, flows, and usage metrics.
- Solutions are deployed using managed environments, enabling consistent ALM (Application lifecycle management) practices.
- Monitoring via Power Platform telemetry, flow analytics, and alerts supports proactive maintenance and incident response.

### Performance Efficiency

- Optimized workflows and logic: Power Automate flows are designed with minimal trigger conditions and efficient branching logic to reduce execution time, minimize system load, and ensure faster response times.
- Lightweight AI processing: Inbuilt AI Builder models are used to generate real-time triage decisions using minimal compute resources, balancing accuracy with processing efficiency.
- Efficient API usage with Microsoft Graph: Integration with Microsoft Graph API is carefully scoped to retrieve only the necessary data (for example, calendar availability), reducing overhead and improving API response performance.

### Experience Optimization

- Power Apps UI is tailored for each persona (for example, doctors, lab techs, front desk) to ensure role-specific experiences.
- Microsoft Bookings integration offers seamless appointment scheduling, reducing friction for both staff and patients.
- Copilot agents enhance interactivity by enabling natural language-based interactions, improving ease of use for non-technical users.

### Responsible AI

- Transparent and documented reasoning: The Copilot Agent’s decision-making is based on clinically approved guideline documents, ensuring consistent, explainable, and evidence-based outputs. All AI actions are logged for traceability and auditability.
- Purpose-specific AI design: AI Builder is used for extracting patient lab report values (for example, biomarkers, ECG readings) from structured and unstructured data, reducing manual errors while preserving clinical accuracy.
- Human-in-the-loop oversight: Although decisions are AI-augmented, doctors and clinical staff remain in control, reviewing AI-driven suggestions before any critical action (for example, patient triage or scheduling) is finalized.

## Contributors

_Microsoft maintains this article. These contributors wrote this article._

Principal authors:

- [Abey Abraham](https://www.linkedin.com/in/abey-abraham-80691710b/), Power Platform Architect
- [Ganesh Anandan](https://www.linkedin.com/in/ganeshglitz/), Copilot Lead

## Related resources

- Power Platform Well-Architected Framework – Design guidance for building scalable, reliable, and secure solutions on Power Platform
- Microsoft Power Apps documentation – Build low-code apps and interfaces.
- Microsoft Power Automate documentation – Automate workflows and integrate systems.
- Microsoft Dataverse documentation – Secure and manage structured healthcare data.
- AI Builder documentation – Train and deploy AI models without writing code.
- Microsoft Copilot Studio (Custom Copilot Agents) – Build intelligent conversational agents.
- Microsoft Graph API documentation – Access Microsoft 365 data for scheduling and notifications.
- Microsoft Bookings documentation – Simplify and automate patient appointment scheduling.
- Azure Key Vault documentation – Securely manage secrets and credentials.
- Azure Private Link documentation – Enable private access to Azure services.
- Responsible AI Principles – Microsoft – Build ethical and transparent AI systems.

## Next steps

For a demo video, more details about functionality, architecture, source code, and other resources, go to the Cardio Triage AI solution on [GitHub](https://github.com/microsoft/Powerful-Devs-Hack-Together/issues/34).
