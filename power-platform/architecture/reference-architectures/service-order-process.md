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

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to design a solution that automates service request lifecycles, approvals, SLA governance, and termination by using Power Apps, Power Automate, Dataverse, and Microsoft 365.

## Architecture diagram

:::image type="content" source="media/service-order-process/service-order-process.jpg" alt-text="Diagram of Power Platform architecture showing users, security, Dataverse, model-driven app UI, Power Automate, and Microsoft 365 integrations." lightbox="media/service-order-process/service-order-process.jpg":::

## Workflow

### Service Order Workflow

1. User access the model-driven app home page built as a custom page canvas app embedded into model-driven app. The custom page has quick links to access:

    - Existing Service Order, SLA or Termination requests
    - Create New Request for Service Order, SLA or Terminatio
    - View My assigned tasks
    - Button Admin – (Can be viewed only be Admin group)

1. Process starts with creating a new Service Order by clicking on New Service Order button from home page. A new Service Order form will appear which has different tabs to fill the service order information. User is able to attach the documents to newly created service order. All the documents will be stored in SharePoint. OOTB SharePoint subgrid option is used to allow upload document to SharePoint library.

1. When a new Service Request is created, user will see a custom button on the top of the page to submit the service order request. On click of Send Request button:

    1. a new service Order is created with new SO ID

    1. Status of request is updated to Service Order Requested

    1. New task is created in task table and assigned to Commercial Responsible group – Owner Team

    1. User cannot edit the request.

    1. Business process flow is updated to next stage.
    On click of custom button, a script is executed to update the request status and power automate flow will be triggered based on the status perform all the above actions. Script on model driven app form will check the request status and assigned to user and based on these criteria fields will be read only for everyone other than commercial responsible group. This is applicable for all the custom buttons available at different stages.

1. When commercial responsible user logs in, he is able to see the assigned task under My task.

1. Commercial responsible reviews the request, he sees two custom buttons:

    1. assigns the Primary Responsible approver for the request

    1. Reject Request

1. On Rejection, the request is rejected and notification is sent to the requester.

1. On click of Assign Primary Responsible, the request is sent to next stage

    1. Request status is updated to “Pending for PR approval”

    1. Business Process flow stage is updated

    1. New task is created for Primary Responsible assigned. Previous task assigned to Commercial Responsible is completed

    1. Notification is sent to Primary Responsible

1. When Primary Responsible logs in to the application, he is able to see the task under My task. The Primary Responsible (PR) can Approve, Reject or Send for Amendments. These custom buttons will be visible only to the user who has been assigned PR to the request and the request is under status “Pending for PR approval”

    1. Approve

        1. On approval, the request status is marked to approved. This is implemented via the custom script written on custom button

        1. Notification is sent to Commercial Responsible group and user who created the request.

        1. The request status is updated to “Pending final Signing Process”

        1. Task is assigned to Commercial Responsible group

        1. Business process flow is updated to next stage.

        1. Primary responsible task is completed

    1. Rejection

        1. On rejection, the request is marked to “Rejected”

        1. Business process flow is updated to Rejected stage

        1. Notification is sent to user and commercial responsible group

    1. Send for amendment

        1. The request is sent back to user who created the request for amendments

        1. Request status is updated to “service Order Request in progress” stage

        1. Business process flow is updated to initial stage

        1. Email notification is sent to user with deep link to service order request.

    1. On rejection or approve, a pdf document is exported and saved to Service Order SharePoint library. The pdf has been generated using Document Template feature of Dataverse where the template is created in word using xml entity attributes and power automate is created which calls the pdf document template api to generate the pdf version and exports all the data of the service request. The Document template ID and Service Order GUID needs to be passed to the power automate flow.

1. On next stage Final Sign-in process, commercial responsible is able to see the two tabs hiding all the other tabs using XRM api and javascvript. The user will the upload signed document button on the first tab. On click of the button, next tab is highlighted which has the sharepoint document subgrid and the pdf generated document created in the previous step.

    1. Commercial responsible can be able to download the pdf document, manually signs it and upload it in the document library tab.

    1. Complete Signing process custom button on the top is available and when commercial responsible click on the button, the request become read only and notification is sent to user and commercial responsible group and primary responsible about the completion of the request. Business process flow is marked to completed using power automate flow and task assigned is marked to completed.

### SLA Workflow

1. When user clicks on Create New SLA request, he will be redirected to New SLA form. In the form, the user can select only the completed Service Order Request created by him.

1. The SLA entity approval has a similar workflow and Business Process Flow as for Service Order approval except the Signin Service Order Request stage.

1. SLA is valid for 18 months by default unless specified in the request. Power automate backend job is there which runs every day to check the SLA expiration. When the SLA expiry date = today’s date, the SLA is marked to Terminated and Service Order is marked to Terminated. Corresponding email notifications and Business process flow stages are updated accordingly for both the entities.

### Termination Workflow

1. When a Service Order and SLA request needs explicit termination, a termination request is created.

1. The termination request has the similar workflow to get approval from Commercial responsible group and Primary Responsible User.

1. The request for termination is only be raised for SLA or Service Order which are approved and created by the logged in user.

1. When the termination date is reached for any approved termination request, a backend power automate daily flow checks and

    1. If the request is raised for SLA. Terminate the SLA associated with the termination request

    1. If the request is raised for Service Order, all the SLAs associated with the service order and Service order will get terminated.

## Use case details

### Overview

This architecture document outlines the design and implementation of a Power Platform–based application for automating the end‑to‑end lifecycle of Service Orders. The solution streamlines the initiation of service order requests, manages approval workflows across multiple stages, enforces SLA‑based lifecycle management, and handles termination processes.

The application also serves as a centralized reference system for the Legal and Contracting departments to manage service order contracts and associated signed documents.

### Business context

The requirement originated when the customer engaged HCLTech to migrate their existing Service Order Management process from an Angular–Camunda platform to Microsoft Power Platform.

The legacy solution—built on Angular, Camunda Workflow Engine, and PostgreSQL—incurred **high licensing costs**, required a **dedicated technical team** for change requests, and had **long turnaround times** for even minor enhancements. The complexity of the solution and its maintenance overhead prompted the customer to pursue a modern, cost‑effective, and easy‑to-maintain alternative.

### Objectives and drivers

Key drivers for the new solution:

- **Leverage existing Power Platform licenses and infrastructure** to eliminate additional licensing costs.

- **Reduce dependence on specialized technical support**, thereby lowering operational expenses.

- **Streamline change management** by using low-code features and minimizing custom development.

- **Deliver a lean, maintainable Power Platform solution within one month**, meeting the customer’s aggressive timeline.

- **Ensure seamless migration** of the existing process and underlying data.

- **Improve user experience** with an interactive, intuitive interface.

## Components

The team designed and implemented a **Model-Driven App** on the Microsoft Power Platform, supported by key out-of-the-box (OOTB) features to keep customization minimal while meeting all functional requirements.

**User Interface**

- **Model Driven App** serves as a primary user interface for user

- **Custom Pages** were incorporated to modernize the user experience ensuring the interactive UI behaviour and keep minimal change for end users as the application is migrating from existing platform

- **Custom button and javascript** to manage the business rules and approval process through different stages

- **Business Process Flow** to help user visualize the existing stage

**PDF Generation**

The previous system’s PDF export functionality was highly complex and required frequent technical intervention for even minor template updates.

The new solution leverages:

- **OOTB Entity Document Templates** for Word/PDF generation.

- **Admin-controlled template modifications**, eliminating dependency on technical teams.

This approach significantly reduces turnaround time and removes the need for development-driven template updates.

**Workflows and Approvals**

**Business Process Flows (BPFs**) were used to orchestrate request routing, approvals, and multi-stage progress tracking.

**Power automate** to perform various actions at completion of each approval stage, sending notification to outlook and teams, assign tasks and generate automatic pdf at the final stage

**Lifecycle & Termination management**

Scheduled Power Automate flows are implemented which runs on daily basis to check which SLAs are terminating and which Service Orders are terminating each day.

**Task Reminders**

Power Automate is utilized to send reminders to users to whom tasks have been assigned and due date is passed.

**Data Source**

Dataverse is used to manage and store the application data and maintain the audit log history

SharePoint is used as document repository and document versioning

**Reporting**

Model Driven inbuilt reporting is used to display the charts and provide insights to application data

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, which is a set of guiding tenets that can be used to improve the quality of a workload.

### Reliability

1. **Clear expectations** documented with customer for:

    - Response times
    
    - Approval timelines
    
    - Daily job windows (SLA expiry, Termination job)

1. Task Based Resilience is implemented when the Power automate step fails:

    1. Task remains in dataverse until all the action related to the task is completed

    1. Retry submission or approval can be done by user at any stage without any issue

    1. The request status will be updated only after all the steps in workflow is executed safely

    1. In case there is error in updating the stage, this can be visible through the business process flow

1. Daily job failure is also accommodated by putting retry logic and fetch the data based on dynamic filtering conditions

1. User actions are short-lived and stateless, reducing the chance of stuck workflows.

1. Logging feature is implemented to ensure reliable data for request and ensure traceability

### Security

1. Controlled access to Model driven app using Entra ID Security groups mapped to Dataverse owner groups

1. Custom Security Roles have been defined for commercial responsible, Primary Responsible and requestor and amin to ensure secure access to data

1. Guest users are invited to the Entra ID following Organizational policies and added to security group after the approval. External users are able to access using this security group

1. Dataverse field level and row level security has been implemented

1. SharePoint permissions have been granted adequately using the OOTB integration with Dataverse and Model Driven applications

1. Application is being deployed on managed environment with specific DLP policy defined for the application

1. Dataverse audit log is enabled to detect data anomalies

1. Data is read only after request reach to certain stage

1. Archival policy have been implemented to ensure admin has full control on archive data while user can only access the pdf documents generated for each requests

### Operational Excellence

1. Environment strategy clearly defined to ensure operation excellency by setting up managed environment and Dev-\> UAT -\> Production

1. Solution strategy has been implemented

    1. Unmanaged solution in dev environment and managed solution in other environments

    1. Solution segmentation has been designed to segment UI components, Process and Core components

1. Code Reviews were implemented before moving from dev environment

1. Model Driven app built on low code constructs ensuring faster enhancement delivery and bug fixing

### Performance Efficiency

1. Transaction volumes patterns have been identified from old applications and agreed with business on the volume data collected

1. Long-running activities (SLA expiry, Termination execution) delegated to scheduled flows not dependent on user interaction.

1. Batch APIs are utilized for bulk CRUD operations to avoid throttling limits

### Experience Optimization

1. Custom page has been implemented to ensure enhanced landing page

1. Well formatted emails are sent to ensure users can identify the emails

1. Deep linking is provided in the mail to ensure user directly access the request from email

1. Timely Reminders are sent to users to ensure the tasks are completed by them without delay

1. Quick links provided to My Tasks and Admin sections

1. Custom button has been implemented to allow user click on button and identify what actions they are taking

1. Notifications are generated after each button click to inform user about the success or failure

1. Unnecessary data is hidden from users when the request is raised to certain stage

1. Data archival has set up to ensure users see only working item at a time

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rakhi Jain](https://www.linkedin.com/in/rakhi-jain-39507661/)**, Technical Architect, HCLTech
