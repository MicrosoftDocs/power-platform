---
title: SAP Setup Assistant template for Power Platform
description: The SAP Setup Assistant template for Microsoft Power Platform enables get Power Platform + SAP installation up.
author: menakakmsft
contributors:
  - menakakmsft
  - ellenwehrle
ms.author: menakakollu
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 12/02/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As an administrator, I want to learn about Microsoft's SAP Setup Assistant so I can integrate Power Platform with SAP and set up the SAP Procurement template.
---

# What is the SAP Setup Assistant?

The SAP Setup Assistant walks you through a checklist of manual and automated steps to help you get your Power Platform + SAP Procurement installation up and running as quickly as possible.

The Assistant is organized by stages, activities, and steps. Each stage has at least one activity with specific steps you need to complete. For example, you'll walk through these stages with the SAP Setup Assistant:

- **Introduction**: Get to know the SAP Procurement template and the SAP Setup Assistant.
- **Prerequisites**: Ensure you have the necessary licensing and environment setup.
- **Installation & Configuration**: Import and deploy the SAP Procurement template solution.
- **Optional activities**: Enable additional features to optimize your deployment and end-user experience.
- **Deployment and next steps**: Review the installer stages, launch the app, and explore the next steps.
  
To ensure the best chance of a successful installation and deployment of the SAP Procurement template, it's important to complete as many activity steps as possible in each stage before going to the next stage.

## Access SAP Setup Assistant

The SAP Setup Assistant template is available in [Microsoft AppSource](<https://aka.ms/AccessSAPSetupAssistantTemplate>).

To avoid having to transfer downloaded files across the machines, we recommend you **run the SAP Setup Assistant on the Windows Virtual Machine** where the data gateway is set up.

## SAP Setup Assistant package

The template package consists of one solution that contains the foundational components used for SAP Setup Assistant:

- One canvas app:
  - **SAP Setup Assistant** is the canvas app that takes user through different stages, activities, and steps.
- One copilot:
  - **SAP Setup Assistant Copilot** Helps with in-app knowledge.
- Two choices
  - **Install Template Batch Type** is the choice which helps with batch processing.
  - **ISO Language Code** is the choice that stores the abbreviations for the available language codes.
- Eight Cloud flows
  - **InstallTemplateGetCurrentEnvironment**
  - **InstallTemplateImportSolutionFile**
  - **InstallTemplateSAPMenuItem**
  - **InstallTemplateSAPProcess**
  - **InstallTemplateSAPProcessBatchRun**
  - **InstallTemplateSAPStrings**
  - **InstallTemplateShareApps**
  - **InstallTemplateShareFlows**
- Seven Connection references
  - **SAP Setup Assistant - Dataverse**
  - **SAP Setup Assistant - Office 365 Outlook**
  - **SAP Setup Assistant - Office 365 Users**
  - **SAP Setup Assistant - Power Apps for Makers**
  - **SAP Setup Assistant - Power Automate Management**
  - **SAP Setup Assistant - Power Platform for Admins**
  - **SAP Setup Assistant - Power Query Dataflows**
- One security role
  - **Template Installer**
- Thirteen Dataverse Tables
  - **Activity Step**
  - **Activity Step Resource**
  - **Activity Step Value**
  - **Deployment Team**
  - **Install Process**
  - **Install Template Async Process**
  - **Install Template Async Process Item**
  - **Process Stage**
  - **SAP List of Value**
  - **SAP Localization**
  - **SAP Menu Item**
  - **Stage Activity**
- Three Web resources
  - **List of Value Icon**
  - **Menu Items Icon**
  - **World Icon**

### Next step

[Install and set up the SAP Setup Assistant template](install-and-set-up.md)
