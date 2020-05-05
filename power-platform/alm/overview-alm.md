---
title: "Application lifecycle management with Power Apps | Microsoft Docs"
description: "Learn how to implement application lifecycle management with Power Apps"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 04/08/2020
ms.reviewer: ""
ms.service: powerapps
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Overview of application lifecycle management with Microsoft Power Platform
The articles in this section describe how you can implement application lifecycle management (ALM) using Power Apps, Power Automate, and Common Data Service. 

## What is ALM? 
ALM is the lifecycle management of applications, which includes governance, development, and maintenance. Moreover, it includes these disciplines: requirements management, software architecture, development, testing, maintenance, change management, continuous integration, project management, deployment, and release management. ALM tools provide a
standardized system for communication and collaboration between software
development teams and related departments, such as test and operations. These
tools can also automate the process of software development and delivery. To
that end, ALM combines the disciplines concerned with all aspects of the process
to achieve the goal of driving efficiency through predictable and repeatable
software delivery.

## Key areas of ALM
1.  **Governance**  includes requirements management, resource management, data
    security, user access, change tracking, review, audit, deployment control,
    and rollback.

2.  **Application development**  includes identifying current problems, and
    planning, design, building, and testing the application. This area includes
    traditional developer and app maker roles.

3.  **Maintenance** includes deployment of the app and maintenance of optional and
    dependent technologies.

The *application lifecycle* is the cyclical software development process that involves these areas: plan and track, develop, build and test, deploy, operate, monitor, and learn from discovery.

![The application lifecycle](media/application-lifecycle.png "The application lifecycle") 

## ALM for Power Apps, Power Automate, and Common Data Service

Common Data Service in Microsoft Power Platform lets you securely store and manage data that's used by business applications. To use the features and tools available for ALM, all environments that participate in ALM must include a Common Data Service database.

The following concepts are important for understanding ALM using the Microsoft Power Platform.

-   *Solutions* are the mechanism for implementing ALM; you use them to distribute components across environments through export and import. A component represents something that you can potentially customize. Anything that can be included in a solution is a component, such as site maps, apps, entities, fields, charts, or plug-ins. 

-   *Common Data Service* stores all the artifacts, including solutions.

-   *Source control* should be your source of truth for storing and collaborating on your components.

<!-- Power BI is not part of this ALM story. For more information about Power
BI ALM, see \<add a link to Power BI docs\ --> 

For more information about how ALM and Azure DevOps technologies&mdash;combined with people and processes&mdash;enable teams to continually provide value to customers, see [DevOps tools on Azure](https://azure.microsoft.com/solutions/devops/).

### See also
[Application lifecycle management with Microsoft Power Platform basics](basics-alm.md)<br/>
[What is Common Data Service?](/powerapps/maker/common-data-service/data-platform-intro)