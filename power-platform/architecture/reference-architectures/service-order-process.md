---
title: Power Platform–based architecture for service requests, approvals, SLA governance, and termination
description: Learn how to design a solution that automates service request lifecycles, approvals, SLA governance, and termination by using Power Platform components.
#customer intent: As a Power Platform user, I want to automate service request lifecycles, approvals, and SLA governance so that requests are processed consistently and in compliance with defined service agreements.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/09/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---

# Power Platform–based architecture for service requests, approvals, SLA governance, and termination

Power Platform can be used to automate service order requests, approvals, SLA governance, and termination workflows. This architecture uses Power Apps, Power Automate, Dataverse, and Microsoft 365 to streamline lifecycle management and provide centralized visibility into requests and associated documents.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to design a solution that automates service request lifecycles, approvals, SLA governance, and termination by using Power Apps, Power Automate, Dataverse, and Microsoft 365.

## Architecture diagram

:::image type="content" source="media/service-order-process/service-order-process.jpg" alt-text="Diagram of Power Platform architecture showing users, security, Dataverse, model-driven app UI, Power Automate, and Microsoft 365 integrations." lightbox="media/service-order-process/service-order-process.jpg":::

## Workflow

### Service order workflow

1. User accesses the model-driven app home page, which is a custom page embedded into the model-driven app. The custom page has quick links to access:

    - Existing service order, service level agreement (SLA), or termination requests
    - Create new request for service order, SLA, or termination
    - View my assigned tasks
    - Admin button visible to admin group members

1. The process starts when the user creates a new service order by selecting New Service Order from the home page. A new service order form appears with different tabs to fill in the service order information. The user can attach documents to the newly created service order. All the documents are stored in SharePoint. The out-of-the-box SharePoint subgrid option is used to upload documents to the SharePoint library.

1. When the user creates a new service request, they see a custom button at the top of the page to submit the service order request. When the user selects Send Request:

    1. A new service order is created with a new service order ID.

    1. The status of the request updates to Service Order Requested.

    1. A new task is created in the task table and assigned to the Commercial Responsible group – Owner Team.

    1. The user can't edit the request.

    1. The business process flow updates to the next stage.
    When the user selects the custom button, a script runs to update the request status and trigger a Power Automate flow that performs all the preceding actions. The script on the model-driven app form checks the request status and assigned user. Based on these criteria, fields are read-only for everyone other than the commercial responsible group. This condition applies to all the custom buttons available at different stages.

1. When the commercial responsible user signs in, they see the assigned task under My task.

1. The commercial responsible user reviews the request and sees two custom buttons:

    1. Assign primary responsible

    1. Reject request

1. On rejection, the request is rejected and a notification is sent to the requester.

1. When the user selects Assign primary responsible, the request moves to the next stage.

    1. The request status updates to Pending for PR approval.

    1. The business process flow stage updates.

    1. A new task is created for the primary responsible user. The previous task assigned to the commercial responsible user is completed.

    1. A notification is sent to the primary responsible user.

1. When the primary responsible user signs in to the application, they see the task under My task. The primary responsible user can Approve, Reject, or Send for amendments. These custom buttons are visible only to the user who is assigned PR to the request and the request is under status Pending for PR approval.

    1. Approval

        1. On approval, the request status is marked as approved. This status change is implemented through a custom script written on a custom button.

        1. A notification is sent to the Commercial Responsible group and the user who created the request.

        1. The request status updates to Pending final Signing Process.

        1. A task is assigned to the Commercial Responsible group.

        1. The business process flow updates to the next stage.

        1. The primary responsible task is completed.

    1. Rejection

        1. On rejection, the request is marked to “Rejected”

        1. The business process is updated to the Rejected stage.

        1. A notification is sent to the user and commercial responsible group.

    1. Send for amendment

        1. The request is sent back to the user who created the request for amendments.

        1. The request status is updated to "Service Order Request in progress" stage.

        1. The business process flow is updated to the initial stage.

        1. An email notification is sent to the user with a deep link to the service order request.

    1. When the user rejects or approves the request, a PDF document is exported and saved to the Service Order SharePoint library. The PDF is generated by using the Document Template feature of Dataverse, where the user creates the template in Word by using XML entity attributes. A Power Automate flow calls the PDF document template API to generate the PDF version and exports all the data of the service request. The Document template ID and service order  Globally Unique Identifier (GUID) are passed to the Power Automate flow.

1. In the next stage, Final Sign-in process, the commercial responsible user can see two tabs while all other tabs are hidden by using XRM API and JavaScript. The user sees the Upload signed document button on the first tab. When the user selects the button, the next tab is highlighted which has the SharePoint document subgrid and the PDF generated document created in the previous step.

    1. The commercial responsible user can download the PDF document, manually sign it, and upload it in the document library tab.

    1. A Complete Signing process custom button on the top is available. When the commercial responsible user selects the button, the request becomes read-only. A notification is sent to the user, the commercial responsible group, and the primary responsible about the completion of the request. The business process flow is marked as completed by using a Power Automate flow and the assigned task is marked as completed.

### SLA workflow

1. When you select Create New SLA request, you're taken to the New SLA form. In the form, you can select only the completed service order request that you created.

1. The SLA entity approval workflow uses a similar workflow and Business Process Flow as for Service Order approval, except it doesn't include the Sign in Service Order Request stage.

1. An SLA is valid for 18 months by default unless you specify otherwise in the request. A Power Automate backend job runs every day to check the SLA expiration. When the SLA expiry date matches today's date, the job marks the SLA as terminated and the Service Order as terminated. The job updates the corresponding email notifications and Business Process Flow stages for both entities.

### Termination workflow

1. When a service order and SLA request need explicit termination, a termination request is created.

1. The termination request uses a similar workflow to get approval from the commercial responsible group and primary responsible user.

1. You can only raise the request for termination for an SLA or service order that you approved and created.

1. When the termination date is reached for any approved termination request, a backend Power Automate daily flow checks and:

    1. If the request is for an SLA, terminate the SLA associated with the termination request.

    1. If the request is for a service order, terminate all the SLAs associated with the service order and terminate the service order.

## Use case details

### Overview

This architecture document outlines the design and implementation of a Power Platform–based application for automating the end‑to‑end lifecycle of service orders. The solution streamlines the initiation of service order requests, manages approval workflows across multiple stages, enforces SLA‑based lifecycle management, and handles termination processes.

The application also serves as a centralized reference system for the legal and contracting departments to manage service order contracts and associated signed documents.

### Business context

The requirement originated when the customer engaged HCLTech to migrate their existing Service Order Management process from an Angular–Camunda platform to Microsoft Power Platform.

The legacy solution, built on Angular, Camunda Workflow Engine, and PostgreSQL, incurred high licensing costs, required a dedicated technical team for change requests, and had long turnaround times for even minor enhancements. The complexity of the solution and its maintenance overhead prompted the customer to pursue a modern, cost-effective, and easy-to-maintain alternative.

### Objectives and drivers

Key drivers for the new solution:

- **Leverage existing Power Platform licenses and infrastructure** to eliminate extra licensing costs.

- **Reduce dependence on specialized technical support**, lowering operational expenses.

- **Streamline change management** by using low-code features and minimizing custom development.

- **Deliver a lean, maintainable Power Platform solution within one month**, meeting the customer’s aggressive timeline.

- **Ensure seamless migration** of the existing process and underlying data.

- **Improve user experience** with an interactive, intuitive interface.

## Components

The team designed and implemented a Power Apps model-driven app, supported by key out-of-the-box (OOTB) features to keep customization minimal while meeting all functional requirements.

### User Interface

- **Model-driven app** serves as the primary user interface for users.

- **Custom Pages** modernize the user experience by ensuring interactive UI behavior and minimal change for end users as the application migrates from the existing platform.

- **Custom buttons and JavaScript** manage the business rules and approval process through different stages.

- **Business process flow** (BPF) helps users visualize the existing stage.

### PDF Generation

The previous system's PDF export functionality was highly complex and required frequent technical intervention for even minor template updates.

The new solution uses:

- **OOTB Entity Document Templates** for Word/PDF generation.

- **Admin-controlled template modifications**, eliminating dependency on technical teams.

This approach significantly reduces turnaround time and removes the need for development-driven template updates.

### Workflows and Approvals

- **Business process flows** orchestrate request routing, approvals, and multistage progress tracking.

- **Power Automate** flows performs various actions at completion of each approval stage, such as sending notifications to Outlook and Teams, assigning tasks, and generating an automatic PDF at the final stage.

### Lifecycle and termination management

- **Power Automate** flows that run daily to check which SLAs and Service Orders are terminating each day.

### Task Reminders

- **Power Automate** flows to send reminders to users to whom tasks are assigned when the due date passes.

### Data Source

- **Dataverse** to manage and store the application data and maintain the audit log history.

- **SharePoint** as the document repository and for document versioning.

### Reporting

- **Power Apps** model-driven application inbuilt reporting displaying the charts and provide insights to application data.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, which is a set of guiding tenets that you can use to improve the quality of a workload.

### Reliability

1. Clear expectations documented with customer for:

    - Response times
    
    - Approval timelines
    
    - Daily job windows (SLA expiry, Termination job)

1. Task-based resilience is implemented when the Power Automate step fails:

    1. Task remains in Dataverse until the action related to the task is completed.

    1. User can retry submission or approval at any stage without any problem.

    1. The request status updates only after all the steps in workflow are executed safely.

    1. If there's an error in updating the stage, the business process flow makes this error visible.

1. Daily job failure is also accommodated by putting retry logic and fetching the data based on dynamic filtering conditions.

1. User actions are short-lived and stateless, reducing the chance of stuck workflows.

1. Logging feature is implemented to ensure reliable data for request and ensure traceability.

### Security

1. Controlled access to the model-driven app by using Entra ID security groups mapped to Dataverse owner groups.

1. Defined custom security roles for commercial responsible, primary responsible, requestor, and admin to ensure secure access to data.

1. Invited guest users to the Entra ID following organizational policies and added them to a security group after approval. External users can access by using this security group.

1. Implemented Dataverse field-level and row-level security.

1. Granted SharePoint permissions adequately by using the out-of-the-box integration with Dataverse and model-driven applications.

1. Deployed the application on a managed environment with a specific data loss prevention (DLP) policy defined for the application.

1. Enabled Dataverse audit log to detect data anomalies.

1. Made data read-only after the request reaches a certain stage.

1. Implemented archival policy to ensure admin has full control on archive data while user can only access the PDF documents generated for each request.

### Operational Excellence

1. Define an environment strategy to ensure operational excellence by setting up a managed environment and dev, UAT, and production environments.

1. Implement a solution strategy

    1. Use an unmanaged solution in the dev environment and a managed solution in other environments.

    1. Design solution segmentation to segment UI components, process, and core components.

1. Implement code reviews before moving from the dev environment.

1. Build a model-driven app on low-code constructs to ensure faster enhancement delivery and bug fixing.

### Performance Efficiency

1. Identify transaction volume patterns from old applications and agree with the business on the volume data collected.

1. Delegate long-running activities, such as SLA expiry and termination execution, to scheduled flows that don't depend on user interaction.

1. Use batch APIs for bulk CRUD operations to avoid throttling limits.

### Experience Optimization

1. Implement a custom page to create an enhanced landing page.

1. Send well-formatted emails so users can easily identify them.

1. Include deep linking in the email so users can directly access the request from the email.

1. Send timely reminders to users so they complete tasks without delay.

1. Provide quick links to My Tasks and Admin sections.

1. Implement a custom button that users can select to identify what actions they're taking.

1. Generate notifications after each button select to inform users about the success or failure.

1. Hide unnecessary data from users when the request reaches a certain stage.

1. Set up data archival so users see only working items at a time.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rakhi Jain](https://www.linkedin.com/in/rakhi-jain-39507661/)**, Technical Architect, HCLTech
