---
title: "Setup | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set up the Center of Excellence Starter Kit

The Center of Excellence (CoE) starter kit is a collection of components and tools that are designed to help get started with developing a strategy for adopting and supporting the Power Platform, with a focus on Power Apps and Power Automate.

In this walkthrough, you'll learn how to

- Import the Center of Excellence Starter Kit solutions
- Configure the apps, flows and dashboard assets
- Extend the Starter Kit
- Install updates to the Starter Kit

## Prerequisites

The following are prerequisites for installing the CoE starter kit as it comes in the solution.

1. **Admin account**
    1. Power Platform Service Admin, Global tenant admin or Dynamics 365 service admin for access to all tenant resources through the Power Apps APIs.
    1. This solution will still work for Environment admins, but the view will be restricted to only the environments an Environment admin has access to.
    1. Dynamics 365 service admin is required for getting details on Model Driven Apps and Solution Aware Flows.
1. **PowerApps Premium License** (Per App, Per User or Dynamics 365 Online licenses)  This is for using the CDS solution.
1. **Environment with a CDS instance**, where the user installing the solution has the System Administrator security role.
1. The environment must have a **DLP Policies** that allows Common Data Service, Power Platform Management connectors, Office 365 Users and Office 365 Outlook to be used together - those connectors must be in the business data only bucket of the DLP policy for this environment.
1. **Download of the Center of Excellence Solution** and Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload)
1. Both the Audit and Report Components and Nurture components solution require the **Core Components solution to be installed**

These are the requirements for using the solution.

1. Power Apps Premium License (Per App, Per User or Dynamics 365 Online licenses)
1. For the **Core Components** solution, only the admins need a Premium License. For the Audit and Report Components, all makers require a Premium License. For the Nurture components, everyone will require Premium License.

> [!NOTE]
  >**Where the data comes from**
  >
  >The "Admin \| Sync Template" flows crawl through all the resources stored in the Power Platform and makes a copy of details in each resource (e.g., apps and flows) to the CDS (entity definitions are provided in this solution). All data displayed in most of the starter kit components are dependent on the data first being in CDS, which means that the sync template must be configured for everything else to work. The Sync Flows run daily overnight. When you first set up the CoE Starter Kit, you can manually start the **Admin \| Sync Template v2** which will start the process of crawling and storing the information in CDS.

There are multiple components provided in this starter kit, each will require some configuration to install. The installation instructions have been segmented based on the set of components that should be grouped and installed together, and dependencies on other segments are outlined in each section.

## Extending the Toolkit

## Recent changes to the CoE Starter Kit

## Installing updates

## FAQ

- **What licenses do I need to run this solution?**
The apps and flows in the CoE Starter Kit use Premium Features like Custom Connectors and CDS, therefore a Per App or Per User Power Apps license is required to run and play the apps. More information: [Power Platform licensing overview](https://docs.microsoft.com/power-platform/admin/pricing-billing-skus)
If you want to use the Power BI report (packaged as part of the solution), you'll need a Power BI license. More information: [Power BI pricing](https://powerbi.microsoft.com/pricing/)

- **It looks like I found a bug with the app; where should I go?** To file a bug with the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

- **What features are currently not supported in GCC?** The Office 365 Audit Log and custom connector are not available in GCC.

## Issues and feedback

For feedback and issues about the CoE Starter Kit, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
