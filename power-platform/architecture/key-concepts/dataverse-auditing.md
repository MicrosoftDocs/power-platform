---
title: Dataverse auditing
description: Empower your organization with Dataverse auditing to ensure accountability, detect risks, and align with regulatory standards.
#customer intent: As a Power Platform admin, I want to set up Dataverse auditing so that I can track data changes, user activities, and system and business events for compliance and security.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/02/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - rachaudh
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/24/2025
---

# Dataverse auditing

Dataverse auditing enables organizations to track data changes, user activities, and system and business events to ensure compliance and security.

> [!TIP]
> The article provides an example scenario and visual representation of how to establish Dataverse auditing. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/dataverse-auditing/dataverse-architecture.png" alt-text="Diagram of Dataverse auditing architecture showing data and business event auditing with Power Apps, Power Automate, and Power BI." lightbox="media/dataverse-auditing/dataverse-architecture.png":::

## Dataverse data auditing

Dataverse auditing is a Microsoft Dataverse feature that enables organizations to track and record changes to data, user activities, and system events. It helps ensure data integrity, security, and compliance by capturing operations such as record creation, updates, deletions, security role modifications, and user access events. By maintaining a historical log of these activities, organizations can monitor system usage, detect unauthorized access, and meet regulatory requirements like GDPR (General Data Protection Regulation) and HIPAA (Health Insurance Portability and Accountability Act). 

Auditing in Dataverse can be enabled at the environment, entity, or field level, allowing organizations to customize their tracking needs. Audit logs are securely stored and can be reviewed through the Power Platform admin center for analysis and reporting. This feature is essential for businesses that require transparency in data changes, accountability in user actions, and insights into system performance to maintain operational efficiency.

## Data auditing use case

A financial institution needs to track data modifications and security incidents, prevent unauthorized access, and ensure compliance with security policies.

The components involved in this scenario interact as follows:

- **Dataverse**: Stores and tracks compliance records, incidents, and approvals. Dataverse auditing needs to be enabled to track CRUD (create, read, update, and delete) actions and serves as the central data source for security tracking. Additionally, role-based security can be used to control access to sensitive compliance data.

- **Power Apps (model-driven and canvas)**: Security teams use model-driven apps to manage policies and regulations and provide structured compliance reviews for admin dashboards and reports. Canvas apps allow end users to self-monitor their data access and report any compliance violations or incidents via a user-friendly interface for submitting incidents.

- **Power Automate**: Sends alerts to notify admins and security teams about suspicious activities.

- **Power BI dashboard**: Helps admins and security teams analyze trends in security incidents.

### Persona-based audit consumption

This section highlights the auditing needs of different user personas for this use case and how they consume audit data.

#### End users (self-monitoring and privacy control)

| Role | Employees accessing PowerApps and Dataverse for business needs |
|----------|----------------------------------------------------------------|
| **How they use audit logs** | - View who accessed their data and when<br>- Receive notifications if their records are modified<br>- Report unauthorized access via canvas apps |
| **Components used** | - Canvas apps to view personal/self-service audit logs within canvas apps and report issues<br>- Email notifications if their data is accessed by unauthorized users |

#### Security teams (threat detection and incident response)

| Role | Detects security threats, investigates anomalies, and prevents data breaches |
|----------|----------------------------------------------------------------|
| **How they use audit logs** | - Identify suspicious access patterns (for example, users accessing data outside their department)<br>- Investigate unauthorized changes to security roles and permissions<br>- Track user sessions and login locations for anomalies |
| **Components used** | - Power Automate to trigger for unusual activities<br>- Model-driven app and built-in dashboards for managing policies and regulations<br>- Power BI dashboards for reviewing access logs |

#### Environment admins (data governance and compliance monitoring)

| Role | Manages Dataverse environments and ensures compliance with security policies |
|----------|----------------------------------------------------------------|
| **How they use audit logs** | - Monitor who accessed or modified sensitive records (for example, financial transactions, customer data)<br>- Detect bulk data exports or deletions that might indicate data breaches<br>- Audit Power Apps access logs to ensure compliance with policies |
| **Components used** | - Power BI dashboard showing user access logs and data changes<br>- Model-driven app to review audit logs by entity, user, and date<br>- Automated alerts for unauthorized modifications |

### What it takes to get access to audit information

1. **Enable audit logging**: Administrators must enable auditing on the Dataverse environment and select the entities to be logged (for example, Ticket or Case).

1. **Configure permissions**: Ensure the appropriate roles are assigned to users (for example, support agents for ticket management, admins for accessing audit logs).

1. **Set up data retention policies**: Configure retention periods for audit data based on company policies (for example, using the Power Platform admin center).

1. **Enable access to tooling**: Ensure admins and auditors can access logs using the Power Platform admin center or PowerShell scripts for advanced querying.

1. **Set up alerts/reporting**: Set up automated alerts or reports based on specific audit data patterns (for example, if certain fields are updated outside of business hours).

## Business event auditing

In addition to Dataverse field-level auditing, business event auditing captures and monitors significant business events to provide better operational oversight, ensure compliance, and identify potential risks. These business events can include critical actions such as financial approvals, contract renewals, order fulfillment, policy updates, and escalations. By auditing these events, organizations gain better transparency into key business processes and ensure they remain aligned with internal controls and external regulatory requirements.

The key capabilities of business event auditing include:

- **Tracking event lifecycles**: Capture the full lifecycle of a business event, from initiation to resolution, to ensure all actions are traceable.
- **Detailed change logs**: Maintain detailed logs of who performed each action, when it occurred, and the data affected.
- **Role-based insights**: Enable relevant stakeholders (for example, business managers, auditors, and compliance officers) to view and report on the status and history of key events.
- **Anomaly detection**: Identify unusual or out-of-policy events (for example, approvals made outside of business hours or policy changes without proper authorization).

## Business events use case

In a financial institution's loan approval process, it's important to track different business events such as who reviewed and approved the loan, changes to loan terms, and any escalations to senior management.

### Business event auditing workflow

:::image type="content" source="media/dataverse-auditing/business-event.png" alt-text="Diagram illustrating a sample business auditing workflow with Dataverse, Power Automate, and Power BI.":::

The workflow for business event auditing in the example loan approval process includes the following steps:

**Loan creation:**

- **Trigger**: A loan officer creates a new loan application in Dataverse.
- **Audit action**: Dataverse logs the creation event, capturing the date, time, creator's identity, and initial loan terms (for example, amount, interest rate, duration).

**Loan review:**

- **Trigger**: A loan officer reviews the loan application.
- **Audit action**: Dataverse logs the user's access to the loan record and any modifications made during the review (for example, change in interest rate, loan terms).

**Loan approval:**

- **Trigger**: A loan manager or senior officer approves or rejects the loan.
- **Audit action**: Dataverse logs the approval decision, capturing the date, time, and approver's identity.

**Loan term changes (if any):**

- **Trigger**: Loan terms (for example, interest rate, repayment terms) are modified after initial approval.
- **Audit action**: Dataverse logs the modification, capturing what was changed, by whom, and when.

**Escalation to senior management:**

- **Trigger**: Loan application is escalated due to exceptions (for example, high-value loans or policy deviations).
- **Audit action**: Dataverse logs the escalation action, capturing the date, time, and reason for the escalation.

**Final loan status update:**

- **Trigger**: Loan status is finalized (for example, disbursed, canceled, or rejected).
- **Audit action**: Dataverse logs the final decision, capturing the date, time, and action taken.

**Compliance reporting:**

- **Trigger**: Compliance officers or auditors request a report on loan approvals and modifications.
- **Audit action**: All audit logs related to the loan application are retrieved for review.

## Considerations 

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rasika Chaudhary](https://www.linkedin.com/in/rasika-chaudhary-a2348b28/)**, Principal Program Manager
