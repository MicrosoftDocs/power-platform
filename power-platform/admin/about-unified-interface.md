---
title: "About Unified Interface  | MicrosoftDocs"
description: About Unified Interface
author: mduelae
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/15/2018
ms.author: mkaur
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# About Unified Interface 

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

With the release of [!INCLUDE [pn-crm-9-0-0-online](../includes/pn-crm-9-0-0-online.md)], we've introduced a new user experience - Unified Interface - which uses responsive web design principles to provide an optimal viewing and interaction experience for any screen size, device, or orientation. 

The new Unified Interface brings all the rich experiences to any client that you are using. Whether you are on a browser, tablet, or phone, you will be able to consume similar experiences. Some examples: 

> - Similar form experiences to update and view your records.
> - Interactive dashboards across all devices to view your information and drill into it. 
> - Reference Panel is now available to be used with all entities supported in Unified Interface. 
> - We now support right-to-left (RTL) languages.
> - All experiences on Unified Interface have accessibility improvements. 

## Capabilities available in Unified Interface with Dynamics 365 for Customer Engagement, version 9.0 

Most of the core functionalities of sales and customer service have moved to the Unified Interface client. 

### Dashboards and charts

You can access all the system and user dashboards from within your Unified Interface apps. The interactive dashboards are now available for all record types with richer interactive dashboard capabilities. 

![Unified Interface dashboard](media/uci-interactive-dashboard.png "Unified Interface dashboard")

### Enhanced user experience

If users work on core record types like Activities, Accounts, Contacts, Leads, Opportunities and Cases, you'll be able to move them to the Unified Interface client. 

They will have familiar capabilities on Unified Interface and will also discover productivity enhancements with the introduction of some enhanced capabilities. 

**Timeline control** - The timeline view helps you collaborate with your team by tracking customer communication in a record on a single page in an easy to read view. You can see everything from posts and voice attachments, to emails and notes. It provides a quick way to see the entire communication thread. 

**Business process enhancement** - The business process flow has been improved by the docking mechanism. You can dock the business process stage on your screen to help you stay focused on the task at hand in your business process flow. This is especially useful when the stage of the process has complex steps to complete. 

**Reference panel** - Use the reference panel for apps built on Unified Interface like Dynamics 365 for Customer Engagement apps for Customer Service. The reference panel is a great way to get work done without clicking away from the screen you are on. You can look up other things like knowledge base articles within the context of the record you are viewing. 

**Navigation** - The new menu options let you swiftly navigate the different apps in the system. It provides quick access to recently viewed records and pinned favorites. 

**Reflow** - The app also scales by reflowing the components on the screen. The responsive design adapts to your environment based on screen size, so the more available space that you have the more information can be displayed. 

![Unified Interface adapts to screen](media/uci-reflow.png "Unified Interface adapts to screen")

### Focused Experience
Unified interface experiences are based on [model-driven apps](https://docs.microsoft.com/powerapps/maker/model-driven-apps/model-driven-app-overview). You can scope the user experience based on the jobs they need to accomplish. Users can have single or multiple apps based on their requirements and can easily switch between apps as needed. 

### Rich controls 
Unified interface is a metadata driven experience. All controls experiences are built on the control framework that is extensible and provides a uniform experience across clients. The app display reflows to the viewport size the user is working in. 

## Getting started with Unified Interface experience
When you are provisioning a new Dynamics 365 for Customer Engagement apps org, depending on whether you are provisioning for Sales, Customer service, Field service, Project service automation, all the options, or an org with no customization, you will see the following Unified Interface apps:

|Choice while provisioning  |Unified Interface apps |
|---------|---------|
|Sales     |Sales Hub         |
|Customer service     |Customer Service Hub         |
|Field service     |Field Resource Hub         |
|Project service automation     |Project Resource Hub          |
|None     |Dynamics 365 for Customer Engagement apps Hub         |
|All      |All the above except Dynamics 365 for Customer Engagement apps Hub         |

![Unified Interface apps](media/uci-apps.png "Unified Interface apps")

> [!NOTE]
> [!INCLUDE[pn-marketing-business-app-module-name](../includes/pn-marketing-business-app-module-name.md)] always uses the Unified Interface and is  [provisioned separately](../marketing/trial-signup.md).

### Accessing Unified Interface apps on browsers
Once provisioned, you can access the installed Unified Interface and web apps from multiple interfaces. On browsers you can see all the apps both Unified Interface and web: 

1. In [https://home.dynamics.com/](https://home.dynamics.com/)

   ![Dynamics 365 for Customer Engagement apps Home page](media/uci-home-dynamics.png "Dynamics 365 for Customer Engagement apps Home page")

2. In app navigation

   ![In app navigation](media/uci-in-app-navigation.png "In app navigation")

3. In My Apps page under Settings

   ![Unified Interface apps on My Apps page](media/uci-my-apps-page.png "Unified Interface apps on My Apps page")

### Accessing Unified Interface apps on phone and tablets
Unified interface apps are the only apps supported on phones and tablets for Dynamics 365 for Customer Engagement, version 9.0. When a user logs into the above org, they will only see the Unified Interface apps on their apps landing page. 

|  | |  |
|---------|---------|---------|
|On phone <br/>![Unified Interface phone app](media/uci-app-phone.png "Unified Interface phone app")     |    |On tablet <br/>![Unified Interface tablet app](media/uci-app-tablet.png "Unified Interface tablet app")    |

### Creating a new Unified Interface app
In case you have requirements to create your own experience on Unified Interface, you can create a model-driven app using the app designer. See [Overview of building model-driven apps](https://docs.microsoft.com/powerapps/maker/model-driven-apps/model-driven-app-overview).

![Create new Unified Interface app](media/uci-model-driven-app.png "Create new Unified Interface app")

![Unified Interface custom hub](media/uci-custom-hub.png "Unified Interface custom hub")

## Capabilities not yet on Unified Interface

We released some capabilities of the legacy web client in the Unified Interface that are available in the hybrid experience. You can [enable the hybrid experience](enable-hybrid-experience.md) to get them in the browser client.

There are certain capabilities that continue to be unavailable in the Unified Interface and we are working to provide these in future releases:

-	Custom styling of advanced chart properties (excluding colors and basic formatting)
-	Composite address control
-	Global notifications
-	Admin experiences
-	Editable grids on phones
-	Learning Path

## Read-only entities on Unified Interface

There are certain entities that are currently read-only on Unified Interface. Users will not be able to make changes to these entity records within an Unified Interface app. We are working to make them editable in future releases.

> [!NOTE]
> Some entities are being deprecated. Check out [Important changes (deprecations) coming](https://docs.microsoft.com/dynamics365/get-started/whats-new/customer-engagement/important-changes-coming#contracts-contract-line-items-and-contract-templates-entities-are-deprecated).

The following are entities that are currently read-only in Unified Interface:

- Connection Role
- KnowledgeArticleViews
- KnowledgeBaseRecord
- SharePointDocument
- SharePointSite
- SLA
- SLAKPIInstance
- Template
- Contract
- Contract Lines
- Contract Templates
- Case Resolution
- Service

### See also
[Overview of building model-driven apps](https://docs.microsoft.com/powerapps/maker/model-driven-apps/model-driven-app-overview)
