---
title: "Introduction to Microsoft Power Platform for Developers"
description: "Overview of how to extend power platform for Azure developers."
keywords: 
author: marcelbf
ms.subservice: alm
ms.author: marcelbf
manager: 
ms.custom: ""
ms.date: 05/25/2022
ms.reviewer: 
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerPlatform
  - PowerApps
  - Azure
---

# Introduction to Microsoft Power Platform for Developers

Microsoft Power Platform is a low-code platform for building business apps quickly. It includes five main components: Power Apps, Power Automate, Power BI, Power Virtual Agents, and Power Pages. Each component can be used individually or together. When used together, they're designed to interact with the others to achieve business objectives, be it building analytics, process automation, or data-driven productivity apps.

The platform uses a low-code approach to build solutions rapidly. It allows everyone in an organization, from frontline workers to professional developers, to participate in building apps that drive positive business outcomes. Developers can work seamlessly with the makers in an organization to help fill gaps and solve complex challenges using a rich extensibility model provided by the platform components. Using native integration with Azure, developers can also use their cloud development skills to extend Microsoft Power Platform. This approach to low-code development is a transformative way to achieve application development objectives within an organization quickly.

![Power platform.](media/power-platform.png "Power platform")

To be an efficient developer on the platform, it's important to understand the basics of what the platform offers. Bellow is a high-level overview of each of the core components and their key extensibility points.

## Power Apps 

Apps created with Power Apps are consumed by users using their desktop or mobile devices. There are different types of Power Apps: canvas, model-driven, and portal.

| Type | Description |
| ---- | ---- |
| **Canvas** | Provide the maker with complete control over the pixel-perfect screen contents and navigation between multiple screens. Canvas applications use connectors to work with data and services. Canvas applications can be embedded into SharePoint, Teams, Power BI, and Dynamics 365 applications. |
| **Model Driven** | data-driven applications that are built on top of Microsoft Dataverse. Other data sources and services can be used by model-driven applications by embedding a canvas application. |

> #### Key developer extensibility points
> - Building custom visual controls using Power Apps Component Framework (PCF)
> - Implementing client business logic using JavaScript and the client API
> - Building custom connectors for external data sources and services using tools like Azure Functions and Azure API Management
> - Building HTML web resources 

## Power Automate

Power Automate is used to automate tasks and orchestrate activities across various services that use connectors. Using Power Automate you can create cloud flows or desktop flows.

| Type | Description |
| ---- | ---- |
| **Cloud flows** | can be triggered manually, configured to run when specific events occur, such as when a record is created, or scheduled to run at a specific time. Power Automate is built on top of Azure Logic Apps but offers unique integration with Microsoft Power Platform. |
| **Desktop flows** | used to automate repetitive interactive tasks on the web or the desktop. |

> #### Key developer extensibility points
> - Building custom connectors using tools like Azure Functions and Azure API Management
> - Use workflow definition functions to build complex expressions

## Power BI

Power BI is Microsoft's business analytics solution that provides interactive data visualization BI tools to help users visualize and share data and insights across their organization.

> #### Key developer extensibility points
> - Embed Power BI in apps, websites, and portals
> - Create custom visuals using the open-source SDK

## Power Virtual Agents

Power Virtual Agents lets you create powerful chatbots that can answer questions from your customers, other employees, or visitors to your website or service. Power Virtual Agents is built on Microsoft Bot Framework and provides a low-code experience to build and manage chatbots.

> #### Key developer extensibility points
> - Build Bot Framework Skills
> - Extend bots with Bot Framework Composer

## Power Pages

Power Pages is a secure, enterprise-grade, low-code software as a service (SaaS) platform for creating, hosting, and administering modern external-facing business websites. Power Pages is built on the foundation of Power Apps portals. Low-code makers can rapidly design, configure, and publish websites that seamlessly work across web browsers and devices. Professional developers can extend these capabilities to address advanced business requirements.

> #### Key developer extensibility points
> - Custom web page templates built with HTML, CSS, and [Liquid](/power-pages/configure/liquid-overview)
> - Extend site integration with Dataverse with the [portals Web API](/power-pages/configure/web-api-overview)
> - Use Visual Studio Code and the Power Platform CLI to enable metadata editing and CI/CD (Continuous Integration/Continuous Deployment) of site configurations

## Dataverse

Dataverse is a cloud scale data store that build on Microsoft's data technologies and abstracts away data management complexity from the app maker. It lets you securely store and manage data that is used by business applications. Business data within Dataverse is stored within a set of data tables. Role-based security allows businesses to control access to the data tables and even individual records for different users within your organization. Developers can extend or customize Dataverse functionality by adding custom business logic. You can define calculated table columns, business rules, workflows, and business process flows to ensure data quality and drive business processes.

> #### Key developer extensibility points
> - Create plug-ins, similar to event handlers, that customize or extend Dataverse data processing with custom business logic (code)
> - Use webhooks and Azure Service Bus to integrate with external systems
> - Extend the Dataverse API with your own custom API that implements your business logic
> - Use virtual tables to integrate data stored in external systems into Dataverse without replicating the data

[!INCLUDE[footer-include](../includes/footer-banner.md)]
