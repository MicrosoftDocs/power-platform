---
title: Scalable notification system with Power Platform
description: Learn to scale business applications with Microsoft Power Platform. Implement a scalable notification system to automate SMS and email reminders and improve appointment reliability.
#customer intent: As a Power Platform user, I want to manage appointments efficiently so that I can ensure accurate scheduling and notifications.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 12/09/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Scalable notification system with Power Platform

Microsoft Power Platform provides a way to scale business applications while integrating with enterprise-grade cloud services for high-volume operations. The Scalable notification system uses this capability to send SMS and email reminders for appointments stored in Dataverse. Key features include:

- Notifications automatically triggered one week, one day, and one hour before the appointment.
- Ability to update or cancel notifications when appointments are modified or canceled.
- Power Apps serves as the UI for users to manage appointments efficiently.
- Supports thousands of notifications per day while remaining reliable and performant.

The system uses Azure Service Bus for high-volume scheduling, Azure Functions for processing and delivery, and Dataverse for persistent tracking of appointments and notifications. Notifications are sent through SendGrid for email and Twilio or Azure Communication Services for SMS.

This architecture ensures scalability, reliability, and maintainability, overcoming the limitations of relying solely on Power Automate for orchestrating large volumes of notifications.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to send SMS and email reminders for appointments stored in Dataverse. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/scalable-notification-system/appointment-notification-architecture.png" alt-text="Architecture diagram showing Power Apps appointment scheduling with Azure services." border="true" lightbox="media/scalable-notification-system/appointment-notification-architecture.png":::

## Workflow

The system workflow reliably sends notifications at the correct times and supports updates and cancellations:

1. **Appointment creation** : Users create appointments through the Power Apps canvas application. The application writes the appointment data directly into Dataverse, ensuring that only authorized users can access the data based on security roles.

1. **Event triggering** : When an appointment is created, updated, or canceled, Dataverse triggers a server-side process, such as a plugin, webhook, or lightweight Power Automate flow. This event initiates the scheduling logic.

1. **Notification scheduling** : The Scheduler Azure Function calculates notification times for one week, one day, and one hour before the appointment. It then creates corresponding notification records in Dataverse and schedules messages in Azure Service Bus, storing sequence numbers for future updates or cancellations.

1. **Appointment updates** : If an appointment is modified, the Scheduler Function cancels previously scheduled notifications using Service Bus sequence numbers. It updates the notification records in Dataverse and reschedules the notifications based on the new appointment details.

1. **Appointment cancellation** : When an appointment is canceled, the Scheduler Function removes all pending messages from Azure Service Bus and updates the corresponding notification records in Dataverse as canceled.

1. **Notification delivery** : The Delivery Azure Function processes scheduled messages from Azure Service Bus. It sends email notifications via SendGrid and SMS via Twilio or Azure Communication Services. After sending, the function updates the notification record with status, retries, and any error information.

1. **Monitoring and observability** : Application Insights and Azure Monitor track function executions, queue health, delivery success, and failures. Dead-letter queues in Service Bus capture undeliverable messages for later analysis.

## Components

1. [**Power Apps (Canvas App)**](/power-apps/): The Power Apps canvas application serves as the primary user interface for managing appointments. It allows users to create, update, or cancel appointments in an intuitive, low-code interface. The canvas app interacts directly with Dataverse to read and write appointment and notification records. It also provides real-time feedback to the user about successful creation, updates, or cancellation of appointments. The UI is designed to validate data entry, handle conflicts such as overlapping appointments, and provide localized time zones for notifications.

1. [**Dataverse**](/power-apps/maker/data-platform/)
    1. **Appointment table**: Dataverse acts as the system of record for all appointment information. Each appointment entry includes details such as the patient or user, appointment time, service type, and status. The Appointment table is designed to trigger events on create, update, or delete operations. The Scheduler Azure Function listens to these events to calculate and schedule notifications. Dataverse provides built-in security through role-based access control, field-level permissions, and auditing, ensuring that sensitive appointment information is only accessible to the right users. Additionally, its integration with Power Platform ensures low-latency access and seamless interaction with other components.

    1. **Notification table**: The Notification table stores metadata for each scheduled notification, tracking the channel (SMS or Email), scheduled delivery time, status (Scheduled, Sent, Failed, or Canceled), number of attempts, and the associated Service Bus sequence number. The system provides real-time tracking, reporting, and error handling for all notifications by maintaining this data in Dataverse. The table enables administrators to audit the delivery history, monitor failed attempts, and take corrective action if necessary. It also supports automatic updates triggered by appointment changes, ensuring notifications remain accurate.

1. [**Azure Functions**](/azure/azure-functions/)
    1. **Scheduler**: The Scheduler function calculates notification times based on appointment details. It determines reminders for one week, one day, and one hour before the appointment and creates corresponding records in Dataverse. It also schedules messages in Azure Service Bus, storing the sequence numbers to allow for future cancellation or rescheduling. This function can handle high volumes of appointments without performance degradation and ensures idempotency so that it doesn't schedule duplicate notifications. Its serverless design allows it to scale automatically based on event load and ensures operational efficiency.

    1. **Delivery**: The Delivery function processes messages from Azure Service Bus when their scheduled delivery time arrives. It determines the correct channel for each notification, like email via SendGrid or SMS via Twilio/Azure Communication Services, and sends the message accordingly. After delivery, it updates the notification record in Dataverse with status and retry data if a failure happens. The function also implements error handling, logging, and retry mechanisms, ensuring that it delivers messages reliably if there's transient failure or provider rate limits. It scales automatically with the number of messages in Service Bus to handle spikes in notification volume.

1. [**Azure Service Bus**](/azure/service-bus-messaging/): It's the backbone of the notification scheduling system. It provides durable, high-throughput, and time-specific message queuing, ensuring it delivers messages exactly when needed. Sequence numbers allow it to cancel or reschedule messages if there's an appointment change, maintaining consistency. Service Bus also supports dead-letter queues to capture messages that fail delivery after multiple retries, providing administrators with the ability to investigate and correct errors. Its ability to decouple scheduling from delivery ensures that the system remains responsive and scalable.

1. **Email and SMS Providers**: External communication services handle the actual delivery of notifications. SendGrid is used for sending email notifications, providing robust tracking, analytics, and retry mechanisms. Twilio and [Azure Communication Services](/azure/communication-services/) deliver SMS notifications, supporting high-volume messaging with reliability. The Delivery Function interacts with these providers by using secure API keys stored in Azure Key Vault and implements retry strategies to handle transient errors or rate-limiting issues. By outsourcing delivery to specialized providers, the system ensures high reliability and reduces operational overhead.

1. [**Azure Key Vault**](/azure/key-vault/): You can securely store all sensitive credentials and API keys in Azure Key Vault. Azure Functions access secrets through managed identities, which eliminates the need to store sensitive data in code or configuration files. Key Vault ensures that it encrypts credentials at rest, audits access, and applies rotation policies automatically to maintain security compliance.

1. [**Monitoring and Observability Tools**](/azure/azure-monitor/): The system uses Application Insights and Azure Monitor to provide full visibility into the health and performance of the solution. Application Insights tracks function executions, queue lengths, delivery status, and failures, while Azure Monitor provides alerts for abnormal behavior, message backlogs, or service failures. You can use logs and telemetry for troubleshooting, operational analysis, and capacity planning, ensuring that administrators have the information necessary to maintain high operational reliability and performance.

## Scenario details

This solution is designed for organizations that need to send timely reminders for scheduled appointments, such as healthcare clinics, vaccination centers, or service-based businesses. Users interact through Power Apps to enter appointment details, which are stored in Dataverse and immediately processed to schedule notifications. The system automatically calculates reminder times, such as one week, one day, and one hour before the appointment, and ensures it delivers those reminders through the appropriate channel.

The system can handle thousands of daily notifications without performance degradation, enabled by the separation between appointment management, scheduling, and message delivery. It ensures that reminders continue to be accurate even when appointments are shifted or canceled by rescheduling or removing Service Bus messages dynamically. Each step of the process is logged and tracked. This approach ensures that both administrators and support staff have visibility into system behavior and the status of each notification sent.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

## Security

The system integrates security throughout by using Microsoft Entra ID for identity and Dataverse roles to restrict access to appointments and notifications. Power Apps users authenticate by using Microsoft Entra ID, ensuring that all interactions with Dataverse are authorized and logged. The Azure Functions use managed identities to securely interact with Dataverse, Service Bus, and Key Vault without storing credentials in code or configuration files.

Store sensitive credentials, such as SendGrid and Twilio keys, only in Azure Key Vault and access them through managed identities. You can further secure communication between Azure services by using private endpoints and virtual networks, reducing exposure to the public internet. All message exchanges between the system’s components adhere to encrypted communication standards to protect data at rest and in transit.

## Operational Excellence

You achieve operational excellence through continuous monitoring, observability, and automated alerting. Application Insights collects detailed telemetry from the Azure Functions, including execution times, failures, retries, and performance metrics. Azure Monitor tracks the health of Azure Service Bus queues, identifying potential bottlenecks or backlogs. Dead-letter queues provide a mechanism for capturing and troubleshooting messages that fail to process after multiple attempts.

Administrators can configure alerts to notify them of failures related to message processing, provider outages, or abnormal queue growth. Dataverse maintains an audit trail within the Notification table, allowing administrators to track the lifecycle of each notification. Because Azure Functions are stateless and scale automatically, the system can respond to sudden increases in message volume without manual intervention, ensuring consistent performance and uptime.

## Performance Efficiency

The architecture is optimized for high performance and scalability. Azure Service Bus enables efficient handling of scheduled notifications without the overhead that Power Automate-based delays would introduce. The separation of scheduling and delivery into separate Functions allows each component to scale independently based on demand. The Delivery Function benefits from automatic scaling, allowing it to process spikes in outbound messages without impacting user-facing systems.

Additionally, using managed identities and caching strategies for provider authentication reduces latency during message delivery. The system minimizes unnecessary storage overhead by only keeping essential metadata in Dataverse and supporting archival strategies for older notifications. By combining Power Platform capabilities with Azure’s scalable messaging infrastructure, the system ensures rapid, efficient, and cost-effective notification delivery at enterprise scale.

## Contributor

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Summit Bajracharya](https://www.linkedin.com/in/summitbajracharya/)**, Solution Architect  
