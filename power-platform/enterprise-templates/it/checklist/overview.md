---
title: Checklist template for Power Platform
description: The Checklist template for Microsoft Power Platform provides a quick way to create custom checklists tailored to specific needs.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 01/08/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
# customer intent: As a business manager, I want to understand the purpose and benefits of the Checklist template for Power Platform.
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

The Checklist template package is available on Microsoft AppSource.

The Checklist solution contains components that enable the user and admin experiences. It has all the components that enable you to create and manage custom checklist templates and create and manage reports for inventory items.

- **Checklist App** is the canvas app where users create reports based on custom checklist templates.
- **Checklist App Administrator** is the model-driven app where an admin can manage all the data. This includes the creation of the checklist templates and the configuration of reference data such as inventories, items, categories, validation type, and validation units.

- Eleven tables:

  - **Category**
  - **Inventory**
  - **Item**
  - **Report**
  - **Report Step**
  - **Report Sub Step**
  - **Template**
  - **Template Step**
  - **Template Sub Step**
  - **Validation Type**
  - **Validation Unit**

- Two security roles:

  - **Checklist App Administrator** provides access to model-driven app and canvas app.
  - **Checklist App User** proves access to canvas app.

- **Validation-Type Choices** is the one choice that stores the available validation types. For example, Attachment, List, Open text, and Unit.

- Three connection references:

  - **Checklist App - [Dataverse](/connectors/commondataserviceforapps/)** - Connection reference to Microsoft Dataverse
  - **Checklist App - [Office 365 Outlook](/connectors/office365/)** - Connection reference to Microsoft Office 365 Outlook
  - **Checklist App _ [Teams](/connectors/teams/)** - Connection reference to Microsoft Teams
  
## Next steps

[Install and set up the Checklist template](install-and-set-up.md)

### See also

[Manage the Checklist app](manage.md)
