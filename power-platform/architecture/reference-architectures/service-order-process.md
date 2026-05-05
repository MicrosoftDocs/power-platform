---
title: Automate service order lifecycle and SLA governance with Power Platform
description: Learn how to design a solution that automates service request lifecycles, approvals, SLA governance, and termination by using Power Platform components.
#customer intent: As a Power Platform user, I want to automate service request lifecycles, approvals, and SLA governance so that requests are processed consistently and in compliance with defined service agreements.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 05/04/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---

# Automate service order lifecycle and SLA governance with Power Platform

This architecture document outlines the design and implementation of a Power Platform–based application for automating the end‑to‑end lifecycle of service orders. The solution streamlines the initiation of service order requests, manages approval workflows across multiple stages, enforces SLA‑based lifecycle management, and handles termination processes.

The application also serves as a centralized reference system for the legal and contracting departments to manage service order contracts and associated signed documents.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to design a solution that automates service request lifecycles, approvals, SLA governance, and termination by using Power Apps, Power Automate, Dataverse, and Microsoft 365.

## Architecture diagram

<!-- Art Library Source# ConceptArt-0-000-203 -->
:::image type="content" source="media/service-order-process/service-order-architecture.svg" alt-text="Diagram of Power Platform architecture showing users, security, Dataverse, model-driven app UI, Power Automate, and Microsoft 365 integrations." border="false" lightbox="media/service-order-process/service-order-architecture.svg":::

## Workflow

The workflow consists of three main processes: service order workflow, SLA workflow, and termination workflow. Each workflow has different stages and approval processes.

### Service order workflow

A user starts the service order request process by filling out a form in the model-driven app. Other users, such as the commercial responsible group user and the primary responsible user, are involved in the approval process at different stages.

The workflow is as follows:

1. The user accesses the home page, which is a custom page embedded in the model-driven app. The custom page has quick links to:

    - Access existing service order, service level agreement (SLA), or termination requests
    - Create new request for service order, SLA, or termination
    - View assigned tasks
    - Admin button visible to admin group members

1. The user selects **New Service Order** from the home page. A new service order form appears with tabs to enter service order details. The user can attach documents to the newly created service order using the out-of-the-box SharePoint subgrid option.

1. To create the service order request, the user selects the **Send Request** custom button at the top of the page. The following actions take place:

    1. A new service order is created with a new service order ID.

    1. The status of the request updates to *Service Order Requested*.

    1. A new task is created in the task table and assigned to the Commercial Responsible group – Owner Team.

    1. The user can no longer edit the request.

    1. The business process flow updates to the next stage.

    When the user selects the custom button, a script runs to update the request status and trigger a Power Automate flow that performs all the preceding actions. The script on the model-driven app form checks the request status and the assigned user. Fields become read-only for everyone other than the commercial responsible group. This condition applies to all the custom buttons available at the various stages.

The commercial responsible user assigns or rejects the request as follows:

1. The commercial responsible user signs in and selects the assigned task under **My task**.

1. The commercial responsible user reviews the request and either approves or rejects the request by selecting the corresponding custom button:
    - **Assign primary responsible**
    - **Reject request**

1. On rejection, the request is rejected and a notification is sent to the service order requester.

1. When the user selects **Assign primary responsible**, the request moves to the next stage.

    1. The request status updates to *Pending for PR approval*.

    1. The business process flow stage updates.

    1. A new task is created for the primary responsible user. The previous task assigned to the commercial responsible user is completed.

    1. A notification is sent to the primary responsible user.

The primary responsible user approves, rejects, or requests changes as follows:

1. The primary responsible user signs in and selects the assigned task under **My task**.

1. The primary responsible user chooses to **Approve**, **Reject**, or **Send for amendments**. These custom buttons are visible only to the user who is assigned the PR to the request when the request has the status *Pending for PR approval*.

    - **Approve**:

        1. The request status is marked as approved. This status change is implemented through a custom script written on a custom button.

        1. A notification is sent to the commercial responsible group and the service order requester.

        1. The request status updates to *Pending Final Signing Process*.

        1. A task is assigned to the commercial responsible group.

        1. The business process flow updates to the next stage.

        1. The primary responsible user's task is completed.

    - **Reject**:

        1. The request is marked as rejected.

        1. The business process is updated to the Rejected stage.

        1. A notification is sent to the service order requester and the commercial responsible group.

    - **Send for amendment**:

        1. The request is sent back to the service order requester for amendments.

        1. The request status is updated to *Service Order Request in Progress* stage.

        1. The business process flow is updated to the initial stage.

        1. An email notification is sent to the service order requester with a link to the service order request.

    When the primary responsible user rejects or approves the request, a PDF document is exported and saved to the Service Order SharePoint library. The PDF is generated by using the Document Template feature of Dataverse, where the user creates the template in Word by using XML entity attributes. A Power Automate flow calls the PDF document template API to generate the PDF version and exports all the data of the service request. The Document template ID and service order  Globally Unique Identifier (GUID) are passed to the Power Automate flow.

In the final signing stage, the commercial responsible user signs the document and completes the request. The user can only see the tabs related to the document signing process. All other tabs are hidden. This functionality is implemented by using XRM API and JavaScript on the form.

1. On the first tab, the commercial responsible user sees the **Upload signed document** button.

1. When the user selects the button, the app highlights the next tab, which contains the SharePoint document subgrid and the PDF document generated in the previous step.

1. The commercial responsible user downloads the PDF document, manually signs it, and uploads it in the document library tab.

1. A **Complete Signing process** custom button on the top becomes available.

1. When the commercial responsible user selects the button, the request becomes read-only.

1. When the request is complete, a notification is sent to the user, the commercial responsible group, and the primary responsible user. A Power Automate flow marks the business process flow and the assigned task as completed.

### SLA workflow

The service level agreement (SLA) workflow is initiated after the service order request is approved. The SLA request has a similar workflow to the service order request, with approval stages and task assignments.

The SLA is valid for 18 months by default, and a backend Power Automate job runs daily to check for SLA expiration. When the SLA expiry date matches the current date, the job marks the SLA and the associated service order as terminated and updates the corresponding email notifications and business process flow stages for both entities.

To start the SLA workflow, the user selects **Create New SLA request** to open a **New SLA** form. In this form, the user can select only a completed service order request that they themselves created.

### Termination workflow

When a service order and SLA request require explicit termination, a termination request is created. The termination request uses a similar workflow to obtain approval from the commercial responsible group and primary responsible user.

A user can only raise the request for termination for an SLA or service order that they approved and created.

When the termination date is reached for any approved termination request, a backend Power Automate flow runs daily to check and:

- If the request is for an SLA, terminate the SLA associated with the termination request.

- If the request is for a service order, terminate all the SLAs associated with the service order and terminate the service order.

## Use case details

This section summarizes the business context and goals that shaped the service order solution including the decision to move to Power Platform.

### Business context

This initiative began when an organization set out to move its service order management process from an Angular–Camunda platform to Microsoft Power Platform.

The legacy solution, built on Angular, Camunda Workflow Engine, and PostgreSQL, incurred high licensing costs, required a dedicated technical team for change requests, and experienced long turnaround times for even minor enhancements. The complexity of the solution and its maintenance overhead prompted the organization to pursue a modern, cost-effective, and easy-to-maintain alternative.

### Objectives and drivers

Key drivers for the new solution:

- **Leverage existing Power Platform licenses and infrastructure** to eliminate extra licensing costs.

- **Reduce dependence on specialized technical support**, lowering operational expenses.

- **Streamline change management** by using low-code features and minimizing custom development.

- **Deliver a lean, maintainable Power Platform solution within one month**, meeting the customer's aggressive timeline.

- **Ensure seamless migration** of the existing process and underlying data.

- **Improve user experience** with an interactive, intuitive interface.

## Components

The team designed and implemented a Power Apps model-driven app, supported by key out-of-the-box (OOTB) features to keep customization minimal while meeting all functional requirements.

### User interface

**Model-driven app** serves as the primary user interface for users.

**Custom pages** modernize the user experience by ensuring interactive UI behavior and minimal change for end users as the application migrates from the existing platform.

**Custom buttons and JavaScript** manage the business rules and approval process through different stages.

**Business process flow** (BPF) helps users visualize the existing stage.

### PDF generation

The previous system's PDF export functionality was highly complex and required frequent technical intervention for even minor template updates.

The new solution uses:

- **OOTB entity document templates** for Word/PDF generation.

- **Admin-controlled template modifications**, eliminating dependency on technical teams.

This approach significantly reduces turnaround time and removes the need for development-driven template updates.

### Workflows and approvals

**Business process flows** orchestrate request routing, approvals, and multistage progress tracking.

**Power Automate flows** perform various actions at completion of each approval stage, such as sending notifications to Outlook and Teams, assigning tasks, and generating an automatic PDF at the final stage.

### Lifecycle and termination management

**Power Automate flows** run daily to check for SLAs and service orders that terminate that day.

### Task reminders

**Power Automate flows** send reminders to users to whom tasks are assigned when the due date passes.

### Data source

**Dataverse** to manage and store the application data and maintain the audit log history.

**SharePoint** as the document repository and for document versioning.

### Reporting

**Power Apps** model-driven application inbuilt reporting display charts and provide insights to application data.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Establish clear expectations for:
  - Response times
  - Approval timelines
  - Daily job windows (SLA expiry, Termination job)

- Implement task-based resilience. For example, if a Power Automate step fails:

  - Keep the task in Dataverse until the related action finishes.

  - Let users retry submission or approval at any stage.

  - Update the request status only after all the steps in the workflow execute.
  
  - Show the error in the business process flow if a stage update fails.

- Handle daily job failures with retry logic and fetch data based on dynamic filters.

- Use short-lived, stateless user actions to reduce the chance of stuck workflows.

- Use logging to keep request data reliable and support traceability.

### Security

- Control access to the model-driven app using Microsoft Entra ID security groups mapped to Dataverse owner groups.

- Clearly define security roles for commercial responsible, primary responsible, requester, and administrators to secure data access.

- Invite guest users to Microsoft Entra ID following organizational policies, and add them to the security group only after approval. Use the same security group for approved external users.

- Use Dataverse field-level and row-level security.

- Grant SharePoint permissions through built-in integration with Dataverse and model-driven applications.

- Deploy the application in a Managed Environment and define a specific data policy for it.

- Use Dataverse audit logging to detect data anomalies.

- Make data read-only after the request reaches a specific stage.

- Implement an archival policy to ensure admins have full control of archived data, and users can access only the PDF documents generated for each request.

### Operational Excellence

- Define an environment strategy to ensure operational excellence. Set up a Managed Environment, and development, testing, and production environments.

- Implement a solution strategy:

  - Use an unmanaged solution in the development environment and a managed solution in other environments.

  - Design solution segmentation to segment UI components, processes, and core components.

- Implement code reviews before moving from the development environment.

- Build a model-driven app on low-code constructs for faster enhancements and bug fixes.

### Performance Efficiency

- Identify transaction volume patterns from old applications and agree with the business on the volume data collected.

- Delegate long-running activities, such as SLA expiry and termination execution, to scheduled flows that don't depend on user interaction.

- Use batch APIs for bulk CRUD operations to avoid throttling limits.

### Experience Optimization

- Create a custom page to enhance the landing page.

- Send well-formatted emails so users can identify them easily.

- Include deep links in emails so users can go directly to requests.

- Send timely reminders to help users complete tasks on time.

- Add quick links to **My Tasks** and the admin sections.

- Add custom buttons that users can select to identify actions to take.

- Notify users of success or failure after each button selection.

- Hide unnecessary data when requests reach a specific stage.

- Archive data so users see only active items.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rakhi Jain](https://www.linkedin.com/in/rakhi-jain-39507661/)**, Technical Architect
