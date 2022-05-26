---
title: "Introduction to Microsoft Power Platform for Developers"
description: "Overview of how to extend power platform for azure developers."
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

Microsoft Power Platform is a low-code platform for building business apps quickly. It includes four main components: Power Apps, Power Automate, Power BI, and Power Virtual Agents. Each component can be used individually or together. When used together, they're designed to interact with the others to achieve business objectives, be it building analytics, process automation, or data-driven productivity apps.

The platform uses a low-code approach to build solutions rapidly. It allows everyone in an organization, from frontline workers to professional developers, to participate in building apps that drive positive business outcomes. Developers can work seamlessly with the makers in an organization to help fill gaps and solve complex challenges using a rich extensibility model provided by the platform components. Using native integration with Azure, developers can also use their cloud development skills to extend Microsoft Power Platform. This approach to low-code development is a transformative way to achieve application development objectives within an organization quickly.

To be an efficient developer on the platform, it's important to understand the basics of what the platform offers. The following is a high-level overview of each of the core components and their key extensibility points.

## Power Apps applications 

Apps created with Power Apps are consumed by users using their desktop or mobile devices. There are different types of Power Apps: canvas, model-driven, and portal.

| Type | Description |
| ---- | ---- |
| **Canvas** | Provide the maker with complete control over the pixel-perfect screen contents and navigation between multiple screens. Canvas applications use connectors to work with data and services. Canvas applications can be embedded into SharePoint, Teams, Power BI, and Dynamics 365 applications. |
| **Model Driven** | data-driven applications that are built on top of Microsoft Dataverse. Other data sources and services can be used by model-driven applications by embedding a canvas application. |
| **Power Apps Portal** | used to create external-facing websites that allow users outside an organization to sign in with a wide variety of identities, create and view data from Dataverse, or even browse content anonymously. |

> [!TIP]
> The following are the key developer extensibility points for Power Apps:
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

> [!TIP]
> The following are the key developer extensibility points:
> - Building custom connectors using tools like Azure Functions and Azure API Management
> - Use workflow definition functions to build complex expressions

## Power BI

Power BI is Microsoft's business analytics solution that provides interactive data visualization BI tools to help users visualize and share data and insights across their organization.

> [!TIP]
> The following are the key developer extensibility points:
> - Embed Power BI in apps, websites, and portals
> - Create custom visuals using the open-source SDK

## Power Virtual Agents

Power Virtual Agents lets you create powerful chatbots that can answer questions from your customers, other employees, or visitors to your website or service. Power Virtual Agents is built on Microsoft Bot Framework and provides a low-code experience to build and manage chatbots.

> [!TIP]
> The following are the key developer extensibility points:
> - Build Bot Framework Skills
> - Extend bots with Bot Framework Composer

[!INCLUDE[footer-include](../includes/footer-banner.md)]
