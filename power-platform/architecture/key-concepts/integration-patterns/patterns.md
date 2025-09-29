---
title: Integration patterns
description: Discover integration patterns tailored to specific business scenarios and technical constraints. Learn how to choose the right approach for your architecture.
#customer intent: As an architect, I want to understand integration patterns so that I can choose the right approach for specific business scenarios and technical constraints.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/29/2025
ms.topic: concept-article
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:09/22/2025
---

# Integration patterns

Based on your analysis, the next step is to plan the integration and identify the best pattern based on your requirements. The following list of integration patterns is by no means exhaustive. You might find that a combination of these patterns best fits your scenario.

Each pattern addresses specific business scenarios and technical constraints:

- [nstant trigger pattern](#instant-trigger-pattern): This pattern reflects how users interact with systems. A user-driven action triggers a predefined series of actions.
- [Event driven pattern](#event-driven-pattern): This pattern requires an automatic trigger, such as a response to events happening in a given system.
- [Data consolidation pattern](#data-consolidation-pattern): This pattern is essential for organizations with multiple management systems that require a complete picture of their data across their various systems.
- [Service oriented architecture](#service-oriented-integration-pattern): This pattern typically involves multiple flows across systems, enabling modular, scalable integration in complex environments.
- [Synchronization](#data-synchronization-pattern): This pattern keeps data in sync across different databases and addresses performance and regulatory requirements.

## Instant trigger pattern

The Instant trigger pattern is user-driven and intuitive. It initiates an integration flow when a user performs an action, such as pressing a button in a Power App. This pattern is ideal for scenarios where data is needed on demand and not continuously.

### Example scenario

A Power App allows product managers to review customer feedback and create action plans. Some technical specifications are stored in Oracle’s Product Lifecycle Management system. Instead of copying the entire dataset to Dataverse, the app includes a button to fetch data when needed.

:::image type="content" source="../media/integration-patterns/instanttrigger.png" alt-text="Diagram showing user driven,instant trigger.":::

Reasons to integrate rather than redirect users to Oracle include:

- Poor user experience
- Security concerns
- Licensing costs

Given the cost-effectiveness of Power Platform integrations, any of these reasons may justify implementation.

### Flow design

Use an Instant cloud flow triggered by a button press. The flow typically includes:

1. Accepting parameters from the app (for example., Product ID)
2. Calling Oracle to retrieve data
3. Writing the data to Dataverse

This data then appears in the Power App interface.

### Considerations

- Data models between Oracle and Dataverse may differ, requiring transformation steps.
- Instant triggers are not truly instant. Execution time depends on system availability and transformation complexity.
- Add visual indicators in the app to show progress and allow cancellation if the operation takes too long.
- In large organizations, simultaneous requests from many users can strain the system.

### Error handling

Integrations can fail for various reasons. Ensure the app provides feedback to users during execution. Avoid scenarios where users click a button and receive no response, which leads to poor user experience.

## Event driven pattern:automatic trigger

Event-driven architectures respond to changes in systems without direct user interaction. This pattern is intuitive and scalable, making it ideal for automating business processes based on system events.

### Event driven:Example scenario

The customer service department wants to send automatic updates to customers when a case is updated. Only specific changes—such as adding a note or changing the status—should trigger notifications.

:::image type="content" source="../media/integration-patterns/autotrigger.png" alt-text="Diagram showing event-driven automatic trigger.":::

Use an automatic trigger in Power Automate to respond to these events. The flow listens for changes in Dataverse records and sends notifications when defined conditions are met.

### Trigger configuration

Configure the flow to monitor:

- **Change type**: Specify the type of update (for example., modify).
- **Select columns**: Limit the trigger to relevant fields (for example., notes, status).
- **Filter rows**: Ensure only customer-facing status changes activate the flow.

Avoid placing filtering logic inside the flow. Use trigger parameters to reduce unnecessary executions and improve performance.

### Avoid logical conflicts

Architects must evaluate the event logic to prevent unintended behavior:

- Avoid loops where an event triggers an action that re-triggers the same event.
- Prevent multiple updates from causing rapid, repeated notifications.
- Design flows to handle edge cases and avoid excessive executions.

### Volume and frequency considerations

Understand the expected volume of triggered events. Notification services (email, SMS, etc.) have limits on how many messages can be sent in a given time frame.

- Estimate the number of events per day or month.
- Implement throttling or rate-limiting mechanisms.
- Prepare a mitigation plan for unexpected spikes in event frequency.

## Data consolidation pattern:scheduled trigger

Data consolidation helps organizations unify information across multiple systems to support reporting and operational processes. While analytics often require full datasets, operational use cases focus on retrieving only the data needed to complete business tasks.

### Example scenario:data consolidation

A company uses three legacy systems:

- SAP for orders and accounts receivables
- Oracle for product inventory
- IBM for content management

:::image type="content" source="../media/integration-patterns/scheduledtrigger.png" alt-text="Diagram showing scheduled trigger.":::

The organization builds a Power Platform app that uses AI to recommend sales actions based on customer history. The app must collect relevant data from all three systems to generate a sales action plan.

### Integration approach

The integration does not require real-time updates or event-driven triggers. Instead, use a scheduled process to:

- Retrieve only the necessary data from each system
- Transform the data into a format compatible with Dataverse
- Feed the data into the AI model for analysis

Define the schedule based on how frequently sales staff interact with customers. Use a scheduled cloud flow in Power Automate to run the integration at regular intervals.

### Scheduled trigger configuration

Scheduled triggers offer flexible recurrence options—from once per second to once per year. They are predictable in timing but can become unpredictable in volume if data scope expands or growth exceeds expectations.

- Monitor flow execution time to avoid overlaps or delays
- Implement safeguards to prevent performance degradation
- Use Application Insights or similar tools to ensure the flow runs consistently

### Risk mitigation

If a scheduled flow takes longer than expected, it may disrupt business processes. For example, a flow designed to run every 10 minutes may fail if it starts taking longer than 10 minutes to complete.

- Monitor runtime and set alerts for anomalies
- Plan for scalability as data volume increases
- Ensure visibility into flow health to prevent unnoticed failures

## Service oriented integration pattern

Large organizations often operate multiple systems across departments. These systems evolve to depend on each other for completing business processes. The integration layer bridges these systems, allowing each to perform its core function while enabling cross-system communication.

### Integration landscape

In this scenario, the organization uses:

- SAP for orders and accounts receivables
- Oracle for product inventory
- IBM for financial document storage
- Dataverse for sales, customer service, and product management apps
- SharePoint for collaboration and knowledge base
- Maersk APIs for logistics automation

:::image type="content" source="../media/integration-patterns/eventdriventrigger.png" alt-text="Diagram showing service oriented pattern architecture.":::

Each system must interact with others through scheduled, event-driven, or manual triggers. No single flow can serve all use cases. Instead, build multiple flows tailored to specific triggers and business processes.

### Avoid monolithic flows

Creating one large flow to handle all integrations is impractical. It introduces performance, security, and maintenance challenges. Instead:

- Build modular flows for each trigger and process
- Optimize flows for specific use cases
- Scale the integration landscape with manageable components

### Optimize cross:system processes

Look for opportunities to consolidate logic where appropriate.  
Example: If a document in SharePoint must be sent to both SAP and Oracle, create one flow that reads the file once and writes it to both systems.

Avoid over-consolidation. Business processes and system configurations change frequently. Rigid, centralized logic reduces flexibility and increases maintenance overhead.

### Architectural mindset

Architects must think systematically. Design flows that are:

- Modular and maintainable
- Scalable across departments and systems
- Resilient to changes in business logic and system behavior

This pattern results in a service-oriented architecture—sometimes humorously called “spaghetti architecture”—where systems are interconnected through well-defined, purpose-built flows.

## Data synchronization pattern

Data synchronization is used when identical systems store data in separate databases. Although storing the same data twice may seem inefficient, this pattern supports specific business needs—most commonly performance and regulatory compliance.

### Common use cases

- **Performance**: Local data access improves responsiveness, especially in latency-sensitive industries.
- **Compliance**: Legal regulations may require data to be stored within national borders. Organizations often deploy local instances with synchronization processes to meet these requirements.

### synchronization:Example scenario

A medical devices company operates across multiple European countries. Each country mandates that medical data be stored locally. The company deploys Power Platform apps and Dataverse instances in each country.

To support sales operations, the company synchronizes non-sensitive data—such as contact details, orders, and shipping—across all instances. Medical data remains local and excluded from synchronization.

### Synchronization:Integration approach

Use an automatic cloud flow triggered by updates to the Account record. Configure filters to:

- Monitor only allowed fields
- Prevent synchronization of restricted data

This results in a targeted, event-driven integration that supports compliance and operational efficiency.

:::image type="content" source="../media/integration-patterns/eventdrivenautotrigger.png" alt-text="Diagram showing how volume and frequency varies with values.":::

### Response time expectations

Set realistic expectations for synchronization speed. Power Automate is asynchronous and does not guarantee real-time performance. If business users expect immediate data availability, clarify limitations early in the design process.

- Evaluate whether Power Automate meets performance needs
- Avoid over-engineering for real-time access unless justified by business requirements

### Architect’s role

Architects must understand the business process and validate whether real-time synchronization is necessary. Many requests for real-time access lack a strong business case. Prioritize clarity, scalability, and maintainability in the integration design.

## Strategic considerations:Beyond cloud flows(Choosing the right integration tool)

When selecting an integration tool, start with Power Automate as the default option. It offers unmatched cost-effectiveness for both development and maintenance. Architects must justify any deviation from this choice, especially when considering custom code or other Azure services.

### Why Power Automate is the default

- Delivers rapid development with low-code connectors
- Minimizes long-term maintenance costs
- Supports a wide range of triggers and systems
- Scales well for most business scenarios

Custom code, Azure Functions, Data Factory, or Service Bus may offer more control or performance, but they introduce higher complexity and cost. Use them only when Power Automate cannot meet the business or technical requirements.

:::image type="content" source="../media/integration-patterns/integration.png" alt-text="Diagram showing integrations.":::

### Beyond cloud flows:Example scenario

An online banking service wants to qualify customers for loans in real time. The qualification process involves complex calculations and data retrieval from multiple systems.

- Power Automate can handle data collection using built-in connectors
- Complex calculations are offloaded to an Azure Function or custom connector
- This hybrid approach balances performance, scalability, and cost

### Integration strategy

Avoid choosing between tools in isolation. Instead, combine their strengths:

- Use Power Automate for orchestration and connectivity
- Use Azure Functions for compute-intensive tasks
- Use custom connectors to extend functionality when needed

### Cost and scalability

Every integration decision must consider total cost of ownership. Custom solutions may seem powerful but often require more budget for development, licensing, and support.

- Justify higher costs with clear business value
- Use Power Automate unless proven insufficient
- Design integrations that are efficient, maintainable, and scalable

[Power automate coding guidelines](/power-automate/guidance/coding-guidelines/)
