---
title: Expense Reimbursement template for Power Platform
description: The Expense Reimbursement template for Microsoft Power Platform enables employees to submit expenses for reimbursement.
author: tverhasselt
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 04/02/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Expense Reimbursement template for Power Platform

The Expense Reimbursement template enables people within your organization to have greater flexibility in requesting and approving refunds, reducing costs by providing an electronic form and automating the process.

The Expense Reimbursement app allows:

- Employees in your organization submit refund requests with supporting documents for approval from their desktop or mobile device. This eliminates repetitive and time-consuming tasks and at times erroneous manual processes like filling up of forms and sending email with corresponding attachments.
- Your organization to streamline the processing of expense requests through the model-driven app.
- Straight forward communications through email notifications sent by Microsoft Power Automate flow.

Organizations can further extend the potential benefits of the Expense Reimbursement template by customizing the apps to meet their unique processing needs and to ultimately create a more engaging, supportive, and efficient expense reimbursement process.
  
The Expense Reimbursement template is available in [Microsoft AppSource](<https://aka.ms/AccessRefundRequestTemplate>). The package consists of two solutions:

- **IT Base** contains components that enable localization capabilities. By sharing the components across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Expense Reimbursement app** contains all the components to enable users to request and manage refunds.

## IT Base solution components

The *IT Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: **IT Template Administration** lets an admin create, view, and edit localized string values
- **Two tables**
  - **IT Localization** records the app string replacements for every localized version of the app
  - **IT Error** records all errors from app and flows
- **One choice**: **ISO Language Code** stores the abbreviation for available language codes.
