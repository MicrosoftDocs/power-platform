---
title: SAP Setup Assistant template for Power Platform
description: The SAP Setup Assistant template for Microsoft Power Platform enables get Power Platform + SAP installation up.
author: menakamsft
contributors:
  - menakakmsft
  - ellenwehrle
ms.author: menakakmsft
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 08/20/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# SAP Setup Assistant

The SAP Setup Assistant walks you through a checklist of manual and automated steps to help you get your Power Platform + SAP Procurement installation up and running as quickly as possible.

The Assistant is organized by stages, activities, and steps. Each stage has at least one activity with specific steps you need to complete.

The stages are:

- **Introduction**: Get to know the SAP Procurement template and the SAP Setup Assistant.
- **Prerequisites**: Ensure you have the necessary licensing and environment setup.
- **Installation & Configuration**: Import and deploy the SAP Procurement template solution.
- **Optional activities**: Enable additional features to optimize your deployment and end-user experience.
- **Deployment and next steps**: Review the installer stages, launch the app, and explore the next steps.

## Watch the demo

## SAP Setup Assistant package

The SAP Setup Assistan template is available in [Microsoft AppSource](<https://aka.ms/AccessSAPSetupAssistantTemplate>). The template package consists of one solution:

- **SAP Setup Assistant** contains foundational components used for SAP Setup Assistant

### SAP Setup Assistant solution components

- One canvas app:
  - **SAP Setup Assistant** is the canvas app that takes user through different stages, activities, and steps.
- One copilot:
  - **SAP Setup Assistant Copilot** Get help with template installation instructions.
- Two choices
  - **Install Template Batch Type** is the choice which helps with batch processing.
  - **ISO Language Code** is the choice that stores the abbreviations for the available language codes.
- Eight Cloud flows
- Six Connection references
  - **Template Installer Dataverse**
  - **Template Installer Office 365 Outlook**
  - **Template Installer Office 365 Users**
  - **Template Power Apps for Makers**
  - **Template Power Automate Management**
  - **Template Power Platform for Admins**
- One security role
  - **Template Installer**
- Thirteen Dataverse Tables
- Three Web resources
  - **List of Value Icon**
  - **Menu Items Icon**
  - **World Icon**

### Next step

[Install and set up the SAP Setup Assistant template](install-and-set-up.md)

### See also

[Manage the SAP Setup Assistant app](manage.md)
