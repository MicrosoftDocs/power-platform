---
title: "Building reusable UI using Power Apps component framework and canvas apps components  | MicrosoftDocs"
description: "Power Apps offers two options to create reusable components: low-code canvas components in Power Apps Studio and the Power Apps component framework."
author: slaouist
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/20/2021
ms.author: mehdis
ms.reviewer: kvivek 
  
---
# Building reusable UI using Power Apps component framework and canvas apps components

Power Apps offers two options to create reusable components:
- [Canvas apps components](/powerapps/maker/canvas-apps/create-component), which is a low-code way of creating reusable controls within Power Apps Studio. 
- [Power Apps component framework](/powerapps/developer/component-framework/overview), which is a pro-developer way of building reusable controls using HTML, Typescript, and CSS. 

Canvas apps components are powerful and can be used to fulfill most UI requirements for your app. They should be considered first as the cost to build and maintain can be lower in most cases than Power Apps component framework.

Here are some examples of canvas apps components.

![Components in canvas apps](./media/components.png)

Canvas apps components can be packaged within component libraries, which are containers that makes it easy to reuse components across many apps. Component libraries make it easy to search and discover components, publish changes, and notify app makers when new components updates are available.


![Component library](./media/ComponentLibrary.png)

For more advanced scenarios, Power Apps component framework offers access to a rich set of framework APIs that expose many capabilities like component lifecycle management, contextual data, and metadata. For scenarios that require access to device features like camera, microphone, or advanced animation and transitions, building a code component using Power Apps component framework will be the only option. Code components created using Power Apps component framework can be using in canvas apps, model-driven apps, and Power Apps portals.

To see real world use of Power Apps component framework, view this video on how Chevron built a digitally enhanced well planning tool to help with the design of a well that is 35000 feet deep (nearly 7 miles under the earth): [Video: Real World Stories: Global energy companies power digital transformation with Microsoft Power Platform](https://youtu.be/ABcRl-lErIY?t=2050).

This digital tool uses Power Apps component framework to enhance the app experience.   

![Azure function export](./media/Cheveron.png)  
