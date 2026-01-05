---
title: Dataverse auditing
description: Learn how to use Dataverse auditing to ensure accountability, detect risks, and align with regulatory standards.
#customer intent: As a Power Platform admin, I want to set up Dataverse auditing so that I can track data changes, user activities, and system and business events for compliance and security.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
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

Dataverse auditing allows your organization to track data changes, user activities, and system and business events to ensure compliance and security. 

> [!TIP]
> The article provides an example scenario and visual representation of how to establish Dataverse auditing. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

Dataverse auditing is a feature of Microsoft Dataverse that allows your organization to track and record user activities, system events, and changes to data. It helps ensure data integrity, security, and compliance by capturing operations such as CRUD (create, read, update, and delete) actions, modifications of security roles, and user access to the system. By maintaining a historical log of these activities, your organization can monitor system usage, detect unauthorized access, and meet regulatory requirements around the handling of sensitive data. It's essential for businesses that require transparency in data changes, accountability in user actions, and insights into system performance to maintain operational efficiency.

## Architecture diagram

:::image type="content" source="media/dataverse-auditing/dataverse-architecture.png" alt-text="Diagram of Dataverse auditing architecture showing data and business event auditing with Power Apps, Power Automate, and Power BI." lightbox="media/dataverse-auditing/dataverse-architecture.png":::

## Data auditing

Auditing can be done at the environment, entity, or field level, depending on your needs. Audit logs are securely stored and can be reviewed through the Power Platform admin center for analysis and reporting.

Getting access to audit data is a multi-step process:

1. **Turn on audit logging** in the Dataverse environment and select the entities to be logged.

1. **Configure permissions** and assign appropriate roles to users.

1. **Set up data retention policies**, such as how long audit logs can be kept.

1. **Allow access to tooling** such as the Power Platform admin center or PowerShell scripts for advanced querying so that admins and auditors can review audit data.

1. **Set up automated alerts and reporting** based on specific audit data patterns, such as if certain fields are updated outside of business hours.

### Use case: Data auditing

**The scenario**: A financial institution needs to track data modifications and security incidents, prevent unauthorized access, and ensure compliance with security policies.

This scenario involves the following components:

- **Dataverse**: Serves as the central data source for security tracking. Role-based security controls access to sensitive customer and compliance data.

- **Power Apps**: Security teams use model-driven apps to manage policies and regulations and provide structured compliance reviews for admin dashboards and reports. Canvas apps allow users to self-monitor their data access and report any compliance violations or incidents in a user-friendly interface.

- **Power Automate**: Sends alerts to notify admins and security teams about suspicious activities.

- **Power BI dashboard**: Helps admins and security teams analyze trends in security incidents.

### How various personas use audit data

Different user personas in the organization use audit data in different ways and for different purposes.

This section highlights the auditing needs of different user personas for this use case and how they consume audit data.

#### Employees

**Employees** can view their own audit logs in a canvas app to learn who else accessed their data and report unauthorized access. They receive notifications by email if their data is modified.

| Role | Employees accessing PowerApps and Dataverse for business needs |
|----------|----------------------------------------------------------------|
| **How they use audit logs** | - View who accessed their data and when<br>- Receive notifications if their records are modified<br>- Report unauthorized access via canvas apps |
| **Components used** | - Canvas apps to view personal/self-service audit logs within canvas apps and report issues<br>- Email notifications if their data is accessed by unauthorized users |

#### Security teams

**Security teams** monitor audit logs collected in Power BI dashboards to look for suspicious activity and analyze trends in security incidents. Unusual activities, such as bulk data exports or unauthorized changes to security roles, trigger Power Automate alerts to the security team.

| Role | Detects security threats, investigates anomalies, and prevents data breaches |
|----------|----------------------------------------------------------------|
| **How they use audit logs** | - Identify suspicious access patterns (for example, users accessing data outside their department)<br>- Investigate unauthorized changes to security roles and permissions<br>- Track user sessions and login locations for anomalies |
| **Components used** | - Power Automate to trigger for unusual activities<br>- Model-driven app and built-in dashboards for managing policies and regulations<br>- Power BI dashboards for reviewing access logs |

#### Environment admins

**Environment admins** use Power BI dashboards to monitor who accessed or modified sensitive records such as financial transactions or customer data. They review audit logs by entity, user, and date in a model-driven app to identify potential security incidents, and set up Power Automate alerts for unauthorized modifications.

| Role | Manages Dataverse environments and ensures compliance with security policies |
|----------|----------------------------------------------------------------|
| **How they use audit logs** | - Monitor who accessed or modified sensitive records (for example, financial transactions, customer data)<br>- Detect bulk data exports or deletions that might indicate data breaches<br>- Audit Power Apps access logs to ensure compliance with policies |
| **Components used** | - Power BI dashboard showing user access logs and data changes<br>- Model-driven app to review audit logs by entity, user, and date<br>- Automated alerts for unauthorized modifications |

## Business event auditing

In addition to Dataverse field-level auditing, your organization can use business event auditing to provide better operational oversight, ensure compliance with internal controls and external regulatory requirements, and identify potential risks. Business events include critical actions such as financial approvals, contract renewals, order fulfillment, policy updates, and escalations.

Business event auditing includes the following key capabilities:

- **Tracking event life cycles**: Capture the full life cycle of a business event, from initiation to resolution, to ensure that all actions are traceable.

- **Detailed change logs**: Maintain detailed logs of who performed each action, when it occurred, and the data it affected.

- **Role-based insights**: Allow stakeholders such as business managers, auditors, and compliance officers to view and report on the status and history of key events.

- **Anomaly detection**: Identify unusual or out-of-policy events, such as approvals made outside of business hours or policy changes without proper authorization.

### Use case: Business event auditing

**The scenario**: A financial institution needs to track business events that occur as part of its loan approval process, such as who reviewed and approved a loan, changes to loan terms, and any escalations to senior management.

This scenario involves the following components:

- **Dataverse**: Stores all data related to customers, loans, and transactions and serves as the central data source for security tracking. Role-based security controls access to sensitive customer, financial, and compliance data.

- **Power Automate**: Sends alerts to notify approvers and managers when a loan is created, approved, or modified.

- **Power BI dashboard**: Helps compliance officers and auditors review loan records for compliance with regulatory requirements.

  :::image type="content" source="media/dataverse-auditing/business-event.png" alt-text="Diagram illustrating a sample business auditing workflow with Dataverse, Power Automate, and Power BI." lightbox="media/dataverse-auditing/business-event.png":::

The workflow for business event auditing in the example loan approval process includes the following steps:

**Loan creation:**

- **Trigger**: A loan officer creates a loan application in Dataverse.
- **Audit action**: Dataverse logs the creation event, capturing the date, time, creator's identity, and initial loan terms.

**Loan review:**

- **Trigger**: A loan officer reviews the loan application.
- **Audit action**: Dataverse logs the loan officer's access to the loan record and any modifications that were made during the review, such as a change in the terms.

**Loan approval:**

- **Trigger**: A loan manager or senior officer approves or rejects the loan.
- **Audit action**: Dataverse logs the decision, capturing the date, time, and approver's identity.

**Loan term changes (if any):**

- **Trigger**: A loan officer modifies the terms of the loan.
- **Audit action**: Dataverse logs the modification, capturing what was changed, by whom, and when.

**Escalation to senior management:**

- **Trigger**: The loan application is escalated due to exceptions such as a high-value loan or policy deviation.
- **Audit action**: Dataverse logs the escalation action, capturing the date, time, and reason for the escalation.

**Final loan status update:**

- **Trigger**: The loan status is finalized as disbursed, canceled, or rejected.
- **Audit action**: Dataverse logs the final decision, capturing the date, time, and action taken.

**Compliance reporting:**

- **Trigger**: Compliance officers or auditors request a report on loan approvals and modifications.
- **Audit action**: All audit logs related to the loan application are retrieved for review.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rasika Chaudhary](https://www.linkedin.com/in/rasika-chaudhary-a2348b28/)**, Principal Program Manager
