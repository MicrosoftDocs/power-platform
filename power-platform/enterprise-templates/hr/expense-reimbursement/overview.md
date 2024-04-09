---
title: Expense Reimbursement template for Power Platform
description: The Expense Reimbursement template for Microsoft Power Platform enables employees to submit expenses for reimbursement.
author: tverhasselt
contributors:
  - microsoft-george
  - nghiemdoan-msft
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 04/05/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Expense Reimbursement template for Power Platform

The Expense Reimbursement template makes it easy to set up and facilitate an automated expense reimbursement program within your organization.

The Expense Reimbursement program allows:

- Employees in your organization to submit expense reimbursement requests with receipt documentation in the canvas app. The canvas app can be accessed from a desktop or mobile device.
- Your organization to streamline and automate the request processes in the model-driven admin app.

You can further extend the capabilities of the Expense Reimbursement template by customizing the apps to meet your organization's unique processing needs.
  
The Expense Reimbursement template is available in [Microsoft AppSource](<https://aka.ms/AccessRefundRequestTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains common foundational components that all human resource (HR) solutions use. For now, only components that are needed for localization capabilities are included. Common strings can be localized once in the base solution and shared so that all dependent solutions get the benefit.
- **Expense Reimbursement app** contains all the components necessary to enable users to submit requests for expense reimbursements and manage the requests.

## Employee Experience base solution components

The **Employee Experience Base** solution contains components that manage app language preferences.

- **Employee Experience Localization Admin** (model-driven app) allows admins to view and edit localized string values.
- **Employee Experience Localization** (table)stores the string replacements for every localized version of the app.
- Two security roles:
  - **Employee Experience Localization Reader** provides *read* access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.
- One choice: **ISO Employee Experience Language Code** stores the abbreviations that identify available language codes.

## Expense Reimbursement solution components

The Expense Reimbursement solution contains components that manage the user experience.

- Two apps:
  - **Expense Reimbursement** (canvas app) allows users view and submit expense reimbursements.
  - **Expense Reimbursement Administrator** (model-driven app) allows admins to view and manage all expense reimbursement data.
- Six tables:
  - **Expense Reimbursement**
  - **Attachment**
  - **Refund Program**
  - **Category**
  - **Expense Reimbursement Process**
  - **Team**
- Two security roles:
  - **Expense Reimbursement - program admin** provides access to the model-driven admin app.
  - **Expense Reimbursement - user** provides access to the canvas app.
- Three choices:
  - **Payment Status** stores the available payment status of the expense reimbursement request (Not Started, Completed).
  - **Request Status** stores the available status for expense reimbursement request (Under Review, Approved, Denied).
  - **Stage Category** stores the available stage category in the business process flow.
- **New Request for Refund Notification** (Power Automate flow) handles:
  - all notifications for the requestor when an expense reimbursement has been submitted.
  - all notifications for the approver to enable quick review and processing of the expense reimbursement requests.
  - processing of all responses from approvers.
- Two Dashboards:
  - **Expense Reimbursement Interactive Dashboard** is available to admins in the model-driven app.
  - **Expense Reimbursement Report** is a Power BI embedded dashboard available to admins in the model-driven app.
- Two Processes:
  - **Expense Reimbursement Process** is a business-process flow enabled for all expense reimbursement records.
  - **Set Active Stage** is a workflow to set the business-process flow's active-stage field to current-stage field on Expense Reimbursement entity.
- Three connection references:
  - **Expense Reimbursement - Outlook**
  - **Expense Reimbursement - Dataverse**
  - **Expense Reimbursement - Approvals**
  
### Next step

[Install and set up the Expense Reimbursement template](install-and-set-up.md)

### See also

[Manage the Expense Reimbursement app](manage.md)
