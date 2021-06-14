---
title: "Using the SharePoint Online Connector with canvas apps in Power Apps  | MicrosoftDocs"
description: SharePoint is a great data source for organizations with a strong Office 365 practice who are starting their journey with the Power Apps. As an example, Standard Bank built a Power Apps canvas app with SharePoint for inspecting ATMs.
author: slaouist
manager: spant
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/20/2021
ms.author: mehdis
ms.reviewer: 
search.audienceType: 
search.app: 
  
---
# Using the SharePoint Online Connector with canvas apps 

SharePoint is a great data source for organizations with a strong Office 365 practice who are starting their journey with the Power Apps. The SharePoint connector allows app makers to quickly connect to SharePoint lists and perform CRUD operations in a simple and efficient way. SharePoint as a data source is well suited for apps with a simple object model and limited number of tables (lists) and relationships between those tables. The SharePoint Online Connector is also adequate for apps not requiring more complex security models such as row-level or field-level security. On the other hand, as data grows in size and complexity, app developers using SharePoint bases app makers need to be aware of some limitations when searching and filtering data due the delegation support offered by the SharePoint connector. These limitations are well documented here https://docs.microsoft.com/powerapps/maker/canvas-apps/delegation-overview and should be taken into account when choosing the right data source or backend for your app.

The following diagram represents the data flow when calling a standard connector such as a SharePoint online. When a request is issued from the Power Apps client, we move through API Management and the connector hub before we reach the final data source where data is retrieved or written. This move introduces a small decrease in performance but ensures a consistent interface for Power Apps with all connectors. 

![Custom Connector architecture](./media/DefaultConnectorArchi.png)

As an example, Standard Bank built a Power Apps canvas app with SharePoint for inspecting ATMs. The app uses the device GPS capabilities to find nearby ATMs and the device camera to take pictures when issues need to be reported.  Check out the full story here:
https://powerapps.microsoft.com/blog/standard-bank-south-africa-creates-a-center-of-excellence-for-the-power-platform/

![Custom Connector architecture](./media/StandardBank.png)