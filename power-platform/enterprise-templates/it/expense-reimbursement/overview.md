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
- Your organization to streamline and automate request approval processes in the model-driven admin app and the email notifications triggered by Microsoft Power Automate flows.

You can further extend the capabilities of the Expense Reimbursement template by customizing the apps to meet your organization's unique processing needs.
  
The Expense Reimbursement template is available in [Microsoft AppSource](<https://aka.ms/AccessRefundRequestTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains components that enable localization capabilities. By sharing the components across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Expense Reimbursement app** contains all the components to enable users to request and manage refunds.

## IT Base solution components

The *IT Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: **IT Template Administration** lets an admin create, view, and edit localized string values
- **Two tables**
  - **IT Localization** records the app string replacements for every localized version of the app
  - **IT Error** records all errors from app and flows
- **One choice**: **ISO Language Code** stores the abbreviation for available language codes.
