---
title: Checklist template for Power Platform
description: The Checklist template for Microsoft Power Platform provides a quick way to create custom checklists tailored to specific needs.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 07/10/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
# customer intent: As a reader, I want to understand the purpose and benefits of the Checklist template for Power Platform.
---

# What is the Checklist template Microsoft Power Platform?

The Checklist template provides a quick way to create custom checklists tailored to specific needs. Once set up, you can use the Checklist app to document and report on a wide range of tasks and projects. The app even includes options to use detailed steps and sub-steps, so it's a great app to use for complex repair and maintenance tasks.

The Checklist template comes with many capabilities:

- Custom checklist template creation for report production
- Step and sub-step definition for each custom template
- Inventory management, including item addition and categorization
- Customized template use for generating inventory reports
- Report navigation that allows you to skip and revisit steps and sub-steps as needed

You can extend the capabilities of the Checklist template by customizing the apps to meet your organization's needs.

The Checklist template package is available on Microsoft AppSource. The package consists of two solutions:

- **IT Base** contains components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Checklist App** contains all the components that enable you to create and manage custom checklist templates and create and manage reports for inventory items.

## IT Base solution

The **IT Base** solution contains various components that allow an admin to set up and manage the language preferences.

- **IT Template Administration** is the model-driven app that lets an admin create, view, and edit localized string values.

- Two tables:

  - **IT Localization** records the app string replacements for every localized version of the app
  - **IT Error** records all errors from app and flows
- One security role: IT Template Administrator provides create, read, update, and delete access to the table. 
- One choice: **ISO Language Code** stores the abbreviation for available language codes.

## Checklist solution

The Checklist solution contains components that enable the user and admin experiences