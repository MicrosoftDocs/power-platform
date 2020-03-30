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

The Center of Excellence (CoE) starter kit is a collection of components and tools that are designed to help get started with developing a strategy for adopting and supporting the Power Platform, with a focus on Power Apps and Power Automate. Learn more about the  individual components under [Use the CoE Starter Kit](starter-kit-explained.md).

In this article, you will learn how to:

- Import the Center of Excellence Starter Kit solutions
- Configure the apps, flows and dashboard
- Extend the Starter Kit
- Install updates to the Starter Kit

## Prerequisites

The following are prerequisites for **installing** the CoE starter kit as it comes in the solution.

1. **Admin account**
    1. Power Platform Service Admin, Global tenant admin or Dynamics 365 service admin for access to all tenant resources through the Power Apps APIs.
    1. This solution will work for Environment admins, but the view will be restricted to only the environments an Environment admin has access to.
    1. Dynamics 365 service admin is required for getting details on Model-Driven Apps and Solution Aware Flows.
1. **Power Apps Premium License** (Per App, Per User or Dynamics 365 Online licenses) is required for using the CDS solution.
1. **Environment with a CDS instance**, where the user installing the solution has the System Administrator security role.
1. The environment must have a **DLP Policy** that allows Common Data Service, Power Platform Management connectors, Office 365 Users and Office 365 Outlook to be used together - those connectors must be in the business data only bucket of the DLP policy for this environment.
1. **Download of the Center of Excellence Solution** and CoE Power BI dashboard files to your device. The entire content package can be downloaded directly at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).
1. Both the Governance and Nurture solutions require the **Core solution to be installed**.

These are the requirements for **using** the solution.

1. Power Apps Premium License (Per App, Per User or Dynamics 365 Online licenses).
1. For the **Core Components** solution, only the admins need a Premium License. For the Audit and Report components, all makers require a Premium License. For the Nurture components, everyone will require Premium License.

> [!NOTE]
>The *Admin \| Sync Template* flows crawl through all the resources stored in the Power Platform and make a copy of details in each resource (e.g., apps and flows) to CDS (entity definitions are provided in this solution). All data displayed in most of the starter kit components must be in CDS, which means that the sync template must be configured for everything else to work. The Sync Flows run daily overnight. When you first set up the CoE Starter Kit, you can manually start the *Admin \| Sync Template v2* which will start the process of crawling and storing the information in CDS.

Start installing the CoE Starter Kit by [Setting up the Core Components](setup-core-components.md).

## Extending the Toolkit

When you are ready to extend the CoE Starter Kit with your own ideas, you will do so by making modifications to the solution components in your own unmanaged solution:

1. **Read about solutions** in our documentation, which will introduce you to
    the concepts as well as to notions like how to create your publisher:
    [Introduction to
    solutions](https://docs.microsoft.com/powerapps/developer/common-data-service/introduction-solutions).

1. Create a new **unmanaged solution**.

1. **Choose components from the CoE starter kit to add to your new solution**;
    you decide which ones you want to customize.

1. **Extend the CoE starter kit** by making modifications to the solution
    components in the context of your new unmanaged solution.

1. It is currently not possible to **extend canvas apps or flows**. If you want to make customizations to apps and flows, create a copy add it to your unmanaged solution.

1. **Deploy to test and production**. We recommend making modifications and
    installing updates pushed by our team to the solution in a development
    environment dedicated to this kit and hosting a production environment that
    has the real data. If data is being accessed and contributed by other end
    users, that would be a scenario to have a dev/test/prod environment.  

## Installing updates

Periodically, the solution will receive updates with new features, bug fixes, or optimizations. These updates will be announced on the [GitHub repo](https://aka.ms/CoEStarterKitRepo) and can be downloaded from there or the direct download at [aka.ms/CoEStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

Install the updates by importing the latest version to the environment where you originally installed the solution - select **Upgrade > Overwrite customizations** to upgrade the solution.

>[!WARNING]
>Currently, only model-driven components and CDS entities will be updated with managed solution updates. Canvas Apps and Flows will be replaced during an update. If you are extending and customizing canvas apps, you will need to make a copy of the app first (which will not receive updates).

## FAQ

- **What licenses do I need to run this solution?**
The apps and flows in the CoE Starter Kit use Premium Features like Custom Connectors and CDS, therefore a Per App or Per User Power Apps license is required to run and play the apps. More information: [Power Platform licensing overview](https://docs.microsoft.com/power-platform/admin/pricing-billing-skus).
If you want to use the Power BI report (packaged as part of the solution), you'll need a Power BI license. More information: [Power BI pricing](https://powerbi.microsoft.com/pricing/).

- **It looks like I found a bug with the app; where should I go?** To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

- **What features are currently not supported in Government Community Cloud GCC?** The Office 365 Audit Log and custom connector are not available in the Government Community Cloud.

## Issues and feedback

For feedback and issues about the CoE Starter Kit, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
