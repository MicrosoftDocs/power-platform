---
title: Meeting Room Services template for Power Platform
description: The Meeting Room Services template for Power Platform enables you to easily set up a program that allows employees to submit expenses for reimbursement
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 01/28/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a user, I want to understand the purpose of the Meeting Room Services template so that I can use it effectively.
---

# Meeting Room Services template for Power Platform

The Meeting Room Services template enables you to quickly set up a program within your organization that simplifies how you manage and respond to service requests for meetings.

The Meeting Room Services apps offer the following capabilities:

- Oversight of meeting schedules, service requests, surveys, and issue reporting through an administrative app.
- Management of service requests for meetings via a user-friendly canvas app for business users.
- Notification of service owners upon request or update of services and administrators upon issue reporting through automated workflows.

You can further extend the capabilities of the Meeting Room Services template by customizing the apps to meet your organization's unique processing needs.

The Meeting Room Services template is available in [Microsoft AppSource](https://aka.ms/AccessMeetingRoomSvcsReqTemplate).

## Meeting Room Services components

The Meeting Room Services solution contains components that manage the user experience.

- Two apps:
  - **Meeting Room Services** is the app where users manage service requests for their meetings.
  - **Meeting Room Services Administrator** is the model-driven app where an admin can manage all data and view available dashboards.

- Eleven tables:

  - **Meeting**
  - **Meeting Room**
  - **Service**
  - **Subservice**
  - **Service Request**
  - **Reported Issue**
  - **Survey**
  - **Survey Rating**
  - **Survey Topic**
  - **App Settings**
  - **Team**

- Three security roles:

  - **Meeting Room Services – Admin** provides full access to the model-driven app for table and data management.
  - **Meeting Room Services – Support** provides read and update to the Reported Issue table.
  - **Meeting Room Services – User** provides access to the canvas app.

- Four Power Automate flows:

  - **Meeting Room Services - Notify Administrator When an Issue is Reported**: This flow sends an email notification to the administrator(s) when a new Report Issues record is created.
  - **Meeting Room Services - When service is requested or updated**: This flow  sends an email notification to the service owner(s) when a service request record is created or updated.
  - **Meeting Room Services - Send email notifications** is the child flow of:

    - Meeting Room Services - Notify Administrator When an Issue is Reported.
    - Meeting Room Services - When service is requested or updated.

  - **Meeting Room Services - When start date of the meeting has been updated**: This flow sends an email notification to the user or requestor regarding the updated meeting and affected service requests.

- Two Dashboards:

  - **Meeting Room Services Interactive Dashboard** is an interactive dashboard available for access by users assigned with Meeting Room Services – Administrator security role.
  - **Meeting Room Services Report** is a Power BI embedded dashboard available for access by users assigned with Meeting Room Services – Administrator security role.

- Two connection references:

  - **Meeting Room Services - Outlook**
  - **Meeting Room Services - Dataverse**

## Related resources

- [Install and set up the Meeting Room Services template](install-and-set-up.md)
- [Get started managing the Meeting Room Services template](manage.md)
