---
title: Revolutionize vehicle inspections with EVVIE
description: Discover how the Enterprise Visual Vehicle Inspection Engine uses AI and Power Platform to automate vehicle inspections, saving time and improving accuracy.
#customer intent: As a Power Platform user, I want to understand the workflow of EVVIE so that I can design a similar solution.
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

# Cardio Triage AI



For a demo and more information about the Cardio Triage AI solution, visit [GitHub](https://github.com/microsoft/Powerful-Devs-Hack-Together/issues/34).

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/cardio-triage/cardio-triage.png" alt-text="Architecture diagram of the Cardio Triage AI solution." border="true" lightbox="media/cardio-triage/cardio-triage.png":::

## Workflow

1. **Patient registration and check-in**:
    - A Front Desk Interactive Agent (built using Microsoft Copilot Studio) guides the front desk staff or patient through the registration process.
    - Upon check-in, the agent generates an Outpatient (OP) ticket and records patient information in Microsoft Dataverse.
    - This marks the start of the triage process and creates a unique case identifier for tracking.
1. **Lab report submission and data extraction**:
    - A lab technician or patient uploads the diagnostic lab report via the CardiaLite Power Apps interface.
    - AI Builder automatically extracts relevant health metrics (e.g., troponin levels, ECG values) using pre-trained form processing models.
    - Extracted values are validated and stored securely in Dataverse, updating the patient record in real-time.
1. **Autonomous triage trigger**:
    - Upon successful lab report submission, a Power Automate flow is triggered automatically.
    - This flow activates the Triage Master Agent, an autonomous AI agent designed using Copilot Studio, which begins the triage evaluation
1. **AI-powered data evaluation and triage decisioning**:
    - The Triage Master Agent evaluates the patient’s lab data by referencing:
    - Intelligent Cardiac Triage Guidelines – to assess criticality and risk.
    - Intelligent Clinic Scheduling Guidelines – to determine if a consultation is necessary and what expertise is required.
    - The agent may also call the Microsoft Graph API to retrieve physician availability and contextual data (e.g., prior appointments).
    - Based on the outcome, the case is categorized as critical, non-critical with follow-up, or monitor-only.
1. **Automated appointment scheduling**:
    - If a physician consultation is recommended, the system books an appointment using Microsoft Bookings, matching patient urgency with the relevant cardiologist’s availability.
    - The booking details are synchronized with Outlook calendars for both patients and doctors.
1. **Real-time notifications**:
    - Patients are immediately notified of the triage outcome via Outlook email notifications.
    - If consultation is booked: Email includes time, doctor name, and location/link.
    - If no immediate action is required: Email provides personalized health tips or follow-up reminders.
    - All interactions and outcomes are logged for transparency and audit purposes.

## Components

### Microsoft Power Platform:

- Power Apps: Power Apps is a user-friendly platform that allows anyone to build custom apps with minimal coding. It helps create intuitive, front-end interfaces that connect to various data sources. In a solution design, Power Apps can be used to create easy-to-use applications for tasks like managing patient data or interacting with healthcare systems, all without requiring complex development skills. 
- Power Automate: Power Automate is a tool that helps automate repetitive tasks and workflows. It connects different services and apps to perform tasks automatically, saving time and reducing the chance of human error. In a technical solution, Power Automate can be used to streamline processes like scheduling patient appointments or syncing data across systems, making operations more efficient.
- Dataverse: Dataverse is a secure, scalable database solution that stores and organizes data from various sources. It’s designed to handle large amounts of structured and unstructured data, making it easy to store and retrieve information in a consistent way. For a healthcare solution, Dataverse would store patient records, appointment data, and other critical information, ensuring data is secure and easily accessible.
- AI Builders: AI Builder is a tool that lets you add artificial intelligence to your apps without needing deep technical knowledge. It can help build features like predictive analytics or automated insights. In a healthcare solution, AI Builders could assist in assessing patient conditions, predicting future health risks, or helping staff make data-driven decisions quickly.

### Copilot Agents

Copilot Agents are AI-powered assistants that help automate decision-making and assist with tasks. For healthcare, these agents analyze patient data to provide real-time suggestions or assessments, improving decision-making accuracy. Copilot Agents help clinicians by offering AI-driven recommendations based on patient data, making appointment processes smoother and more efficient.

### Microsoft Bookings

Microsoft Bookings is a scheduling tool that makes it easier for patients to book appointments and for staff to manage their schedules. It helps optimize resources by providing an easy-to-use interface for managing appointments. In a technical solution, Microsoft Bookings would simplify appointment management, allowing patients to schedule visits and staff to organize their time without any hassle.

### Microsoft Graph

Microsoft Graph is an API that gives access to a wide range of data from Microsoft 365 services, like calendars, emails, and tasks. Microsoft Graph is being used to pull in important data from services like patient schedules or staff calendars, helping keep everything in sync and up to date in real-time.

### Azure App Registrations

Azure App Registrations allows you to register apps within Azure Active Directory (Azure AD) for secure access and authentication. It ensures that only authorized users or applications can access sensitive data. Azure App Registrations help manage app security and ensure safe, seamless integration with services like Microsoft Graph or Power Apps.

### Azure Key Vault

Azure Key Vault is a service that stores sensitive data, such as passwords, API keys, and encryption keys, securely. It helps keep your most important information safe while allowing authorized apps or users to access it when needed. Azure Key Vault is being used to securely store secrets, such as database passwords or connection strings, ensuring everything is protected and accessible only by the right people or systems. 

## Scenario details

### Business Problem

Cardiology departments in hospitals and clinics face significant challenges in prioritizing and managing patients based on the severity of their cardiac conditions. Traditional triage processes are largely manual, dependent on the subjective judgment of administrative staff or the availability of clinical resources. This often leads to:

- Delays in treating critical cases such as myocardial infarctions or arrhythmias.
- Overbooking or under-utilization of cardiologists due to inefficient scheduling.
- Increased cognitive load on healthcare staff, who must handle data-intensive tasks like interpreting lab reports or managing appointments.
- Errors in triage and scheduling, which can have life-threatening implications in high-risk cardiac cases.

There is a growing need for an intelligent, automated triage system that can reduce manual intervention, improve the accuracy of risk assessments, and optimize scheduling workflows—especially in resource-constrained or high-volume healthcare environments.

### Use Case Overview

CardioTriage-AI is a Power Platform-based AI solution designed to address these issues by leveraging AI Builder, Copilot Custom Agents, Microsoft 365 integrations, and Azure services to:

- Automatically extract and analyse lab reports using AI Builder, removing the need for manual data interpretation.
- Use a Copilot-powered autonomous agent to assess condition severity and recommend appropriate specialist care based on:
    - Intelligent Cardiac Triage System Documentation 
    - Intelligent Clinic Scheduling Guidelines 
- Prioritize patients in real time and update triage queues dynamically.
- Streamline appointment scheduling using Microsoft Bookings, ensuring critical cases are matched to available specialists quickly.
- Trigger automated workflows using Power Automate to notify doctors, book slots, and update records.
- Securely manage patient data using Dataverse, Key Vault, and private endpoints within Azure.

### Business Value and Outcomes

CardioTriage-AI delivers measurable improvements in both clinical outcomes and operational efficiency, including:

- Reduced treatment delays for critical cardiac patients by automating and accelerating triage decisions.
- Improved resource allocation by ensuring doctors' time is used effectively based on the urgency of each case.
- Enhanced clinical decision support via explainable AI recommendations, reducing clinician cognitive load.
- Secure, compliant data handling with full auditability and adherence to privacy regulations.
- Decreased administrative overhead and manual scheduling errors through automation and self-service interfaces.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Automated Recovery & Error Handling: Power Automate flows include error handling, retries, and parallel execution to prevent workflow failures. Try-Catch-Finally patterns are used where applicable.
- Reliable Data Backbone with Dataverse: CardioTriage-AI uses Microsoft Dataverse as its core data platform, benefiting from its 99.9% availability SLA, robust schema validation, and transactional integrity. Built-in backup and recovery mechanisms further enhance system reliability.
- Queued Processing for Scalability: Background processes such as triage scoring and appointment scheduling are designed using autonomous AI agent for scalability and reduced system load.

### Security

- Azure Key Vault secures secrets such as API tokens and database connection strings.
- Azure Active Directory (AAD) and role-based access control (RBAC) manage authentication and authorization for all users (e.g., doctors, front desk).
- Private endpoints ensure secure traffic routing within Microsoft’s backbone network.
- Adheres to compliance standards relevant for healthcare (HIPAA/GDPR), ensuring data privacy.

### Operational Excellence

- Power Platform Admin Center is used to monitor and govern apps, flows, and usage metrics.
- Solutions are deployed using managed environments, enabling consistent ALM (Application Lifecycle Management) practices.
- Monitoring via Power Platform telemetry, flow analytics, and alerts supports proactive maintenance and incident response.

### Performance Efficiency

- Optimized Workflows and Logic: Power Automate flows are designed with minimal trigger conditions and efficient branching logic to reduce execution time, minimize system load, and ensure faster response times.
- Lightweight AI Processing: Inbuilt AI Builder models are used to generate real-time triage decisions using minimal compute resources, balancing accuracy with processing efficiency.
- Efficient API Usage with Microsoft Graph: Integration with Microsoft Graph API is carefully scoped to retrieve only the necessary data (e.g., calendar availability), reducing overhead and improving API response performance.

### Experience Optimization

- Power Apps UI is tailored for each persona (e.g., doctors, lab techs, front desk) to ensure role-specific experiences.
- Microsoft Bookings integration offers seamless appointment scheduling, reducing friction for both staff and patients.
- Copilot agents enhance interactivity by enabling natural language-based interactions, improving ease of use for non-technical users.

### Responsible AI

- Transparent, Documented Reasoning: The Copilot Agent’s decision-making is based on clinically approved guideline documents, ensuring consistent, explainable, and evidence-based outputs. All AI actions are logged for traceability and auditability.
- Purpose-Specific AI Design: AI Builder is used for extracting patient lab report values (e.g., biomarkers, ECG readings) from structured and unstructured data, reducing manual errors while preserving clinical accuracy.
- Human-in-the-Loop Oversight: Although decisions are AI-augmented, doctors and clinical staff remain in control, reviewing AI-driven suggestions before any critical action (e.g., patient triage or scheduling) is finalized.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- [Abey Abraham](https://www.linkedin.com/in/abey-abraham-80691710b/), Power Platform Architect
- [Ganesh Anandan](https://www.linkedin.com/in/ganeshglitz/), Copilot Lead

## Related resources

- Power Platform Well-Architected Framework – Design guidance for building scalable, reliable, and secure solutions on Power Platform
- Microsoft Power Apps Documentation – Build low-code apps and interfaces
- Microsoft Power Automate Documentation – Automate workflows and integrate systems
- Microsoft Dataverse Documentation – Secure and manage structured healthcare data
- AI Builder Documentation – Train and deploy AI models without writing code
- Microsoft Copilot Studio (Custom Copilot Agents) – Build intelligent conversational agents
- Microsoft Graph API Documentation – Access Microsoft 365 data for scheduling and notifications
- Microsoft Bookings Documentation – Simplify and automate patient appointment scheduling
- Azure Key Vault Documentation – Securely manage secrets and credentials
- Azure Private Link Documentation – Enable private access to Azure services
- Responsible AI Principles – Microsoft – Build ethical and transparent AI systems

## Next steps

For a demo video, further explanation of functionality, architecture, source code, and more, visit the Cardio Triage AI solution on [GitHub](https://github.com/microsoft/Powerful-Devs-Hack-Together/issues/34).
