---
title: CoE Starter Kit modules
description: Learn how core, governance, and nurture modules streamline Power Platform management and foster maker communities.
author: manuelap-msft

ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/05/2023
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# CoE Starter Kit modules

The Center of Excellence (CoE) Starter Kit is shipped in multiple components:

## Building blocks

The building blocks section introduces the essential components that make up the solution.

### Center of Excellence – core components

These components provide what you need to get started with setting up a CoE. They sync all your resources into tables and build admin apps on top of that to help you get more visibility of the apps, flows, and makers that exist in your environment. Additionally, apps like DLP Editor and Set App Permissions help with daily admin tasks.  

The CoE core components solution contains assets that are only relevant to admins. Learn more in [Set up inventory components](setup-core-components.md) and [Use core components](core-components.md)

### Center of Excellence – governance components

After you've become familiar with your environment and resources, you might start thinking about audit and compliance processes for your apps. You might want to gather additional information about your apps from your makers, or audit specific connectors or app usage. The apps and flows that are part of this solution help you get started.  

The governance components solution contains assets that are relevant to admins and makers. Learn more in [Set up Developer Compliance components](setup-governance-components.md) and [Use governance components](governance-components.md)

### Center of Excellence – nurture components

An essential part of establishing a CoE is nurturing your makers and creating an internal community. You'll want to share best practices and templates, and onboard new makers. The assets that are part of this solution can help develop a strategy for this motion.  

The nurture components solution contains assets that are relevant to everyone in the organization: admins, makers, and users of apps and flows. Learn more in [Set up nurture components](setup-nurture-components.md) and [Use nurture components](nurture-components.md)

We recommend becoming familiar with the CoE core components solution before you add governance, nurture, or theming components.

## Standalone add-ons

Standalone add-ons are separate features or services that you can add to your existing subscription. These add-ons let you customize your experience and access additional capabilities as needed.

### Center of Excellence - Power Platform Administration Planner

Behind the scenes, your IT and Center of Excellence team spends time configuring, managing and nurturing the adoption of Microsoft Power Platform. Understanding how that time is spent can help you plan who you need on your team and find the highest impact opportunities to streamline the administrative effort.

Admin tasks are defined in a model-driven app and insights provided in a Power BI dashboard. Learn more in [Use Microsoft Power Platform administration planning](admin-tasks-component.md)

### Center of Excellence - Power Platform communication site template

Set up your own SharePoint Hub or Teams site to share success stories, upcoming events, rules of engagement and guidelines with your maker community. 

The Power Platform communication site is a SharePoint Online template, designed to provide a starting point of content and page templates as you're setting up your internal Power Platform wiki and community site.

Learn more in [Get started with a SharePoint site template](../adoption/sharepoint-site-template.md)

### Center of Excellence – application lifecycle management components  

The application lifecycle management (ALM) components are intended to provide Power Platform makers guidance on creating healthy ALM practices for their solutions as part of their overall DevOps strategy.

- **ALM Accelerator for Power Platform (AA4PP)** - Contains assets that are relevant to makers, advanced makers, maker teams, and admins. The ALM Accelerator for Power Platform provides an App and Azure Pipelines to enable Makers to source control their solutions and promote their solutions from one environment to another. Promotion of solutions can be configured to ensure the correct approvals take place at every step in the process. The user experience in the AA4PP App is configurable to allow for targeting specific user personas and roles. Learn more in [Configure the ALM Accelerator manually](setup-almacceleratorpowerplatform-cli.md) and [Use ALM Accelerator for Power Platform components](almacceleratorpowerplatform-components.md)

- **ALM Accelerator for Makers (AA4M)** - Contains a reference app and GitHub workflows to allow makers to source control and deploy their solutions in a limited fashion. For more robust deployment configurations, including components that need to be configured as part of or after the solution deployment, it's recommended to use the ALM Accelerator for Power Platform. The GitHub integration in the ALM Accelerator for Makers will eventually be replaced by functionality in the ALM Accelerator for Power Platform, but remains as part of the CoE Starter Kit for reference. Learn more in [Configure the ALM Accelerator using the admin app](setup-almaccelerator.md).

### Center of Excellence – Innovation Backlog components

The Innovation Backlog solution contains assets that are relevant to everyone in the organization. Learn more in [Set up Innovation Backlog components](setup-innovationbacklog.md), and [Use the Innovation Backlog app](use-innovationbacklog.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
