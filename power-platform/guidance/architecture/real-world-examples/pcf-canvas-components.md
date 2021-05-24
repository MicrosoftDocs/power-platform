---
title: "Overview  | MicrosoftDocs"
description: Overview of the CoE Starter Kit
author: slaouist
manager: spant
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mehdis
ms.reviewer: 
search.audienceType: 
search.app: 
  
---
# Using PCF and Canvas Components  

Power Apps offers two options to create re-usable components. The first one is Canvas components which is a low-code way of creating reusable controls within Power Apps Studio and the second is the Power Apps Component Framework (PCF) which is a pro-developer way of building reusable controls using HTML, Typescript and CSS. Canvas components are powerful and can be used to fulfill most UI requirements for your app. They should be considered first as the cost to build and maintain can lower in most cases than PCF.

Here are some examples of canvas components

![Components](./media/Components.png)

Canvas components can be packaged within Component libraries which are containers that makes it easy to re-use components across many apps. Component libraries make it easy to search and discover components, publish changes and notify app makers when new components updates are available.


![Component Library](./media/ComponentLibrary.png)

For more advanced scenarios, PCF offers access to a rich set of framework APIs that expose many capabilities like component lifecycle management, contextual data, and metadata. For scenarios that require access to device features like camera, microphone or advanced animation and transitions, building a PCF component will be the only option. PCF Components can be using in Model Driven Apps, Canvas Apps and Power Portals.


To see real world use of PCF, check-out how Chevron built a digitally enhanced well planning tool to help with the design of a well that is 35000 feet deep (, nearly 7 miles under the earth). This digital tool use the Power Apps Component Framework to enhance the app experience. https://youtu.be/ABcRl-lErIY?t=2050  

![Azure function export](./media/Cheveron.png)