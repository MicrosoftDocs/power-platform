---
title: Meeting Room Services template for Power Platform
description: The Meeting Room Services template for Power Platform enables you to easily set up a program that allows employees to submit expenses for reimbursement
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 07/08/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a user, I want to understand the purpose of the Meeting Room Services template so that I can use it effectively.
---

# What is the Meeting Room Services template for Power Platform?

The Meeting Room Services template enables you to quickly set up a program within your organization that simplifies how you manage and respond to service requests for meetings.

The Meeting Room Services apps offer the following capabilities:

- Oversight of meeting schedules, service requests, surveys, and issue reporting through an administrative app.
- Management of service requests for meetings via a user-friendly canvas app for business users.
- Notification of service owners upon request or update of services and of administrators upon issue reporting through automated workflows.

You can further extend the capabilities of the Meeting Room Services template by customizing the apps to meet your organization's unique processing needs.

## Meeting Room Services package

The Meeting Room Services template is available in [Microsoft AppSource](<https://aka.ms/MeetingRoomServicesTemplate>)

- **Employee Experience Base** contains common foundational components that all solutions use. For now, only components that are needed for localization capabilities are included. Common strings can be localized once in the base solution and shared so that all dependent solutions get the benefit.
- **Meeting Room Services** contains all the components that are necessary to enable users to manage service requests for meetings.

### Employee Experience Base solution

The **Employee Experience Base** solution contains components that allow you manage app language preferences andd view errors as an admin.

- **Employee Experience Localization Admin** is the model-driven app that allows you to view and edit localized string values as an admin.
- **ISO Employee Experience Language Code** is the *one choice* that stores the abbreviations for the available language codes.
- Two tables:
  - **Employee Experience Localization** is the table that stores the string replacements for every localized version of the app.
  - **Employee Experience Error** records all errors from apps and flows.
- Two security roles:
  - **Employee Experience Localization Reader** provides *read* access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.

### Meeting Room Services solution

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

  - **Meeting Room Services – Admin** provides full access to model-driven app for table and data management.
  - **Meeting Room Services – Support** provides read and update to Reported Issue table.
  - **Meeting Room Services – User** provides access to canvas app.

- Four Power Automate flows:

  - **Meeting Room Services - Notify Administrator When an Issue is Reported** is the flow that sends an email notification to the administrator(s) when a new Report Issues record is created.
  - **Meeting Room Services - When service is requested or updated** is the flow that sends an email notification to the service owner(s) when a service request record is created or updated.
  - **Meeting Room Services - Send email notifications** is the child flow of:

    - Meeting Room Services - Notify Administrator When an Issue is Reported.
    - Meeting Room Services - When service is requested or updated.

  - **Meeting Room Services - When start date of the meeting has been updated** is the flow that sends an email notification to the user or requestor regarding the updated meeting and affected service requests.

- Two Dashboards:

  - **Meeting Room Services Interactive Dashboard** is an interactive dashboard available for access by users assigned with Meeting Room Services – Administrator security role.
  - **Meeting Room Services Report** is a Power BI embedded dashboard available for access by users assigned with Meeting Room Services – Administrator security role.

- Two connection references:

  - **Meeting Room Services - Outlook**
  - **Meeting Room Services - Dataverse**

## Related resources

- [Install and set up the Meeting Room Services template](install-and-set-up.md)
- [Get started managing the Meeting Room Services template](manage.md)
