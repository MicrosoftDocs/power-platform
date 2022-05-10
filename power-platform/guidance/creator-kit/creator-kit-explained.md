---
title: "How to use the Creator Kit | Creator Kit"
description: "The Power Platform CoE Starter Kit is shipped as a single self-contained solution. Learn about the building blocks  designed to help you create fluent UI based apps"
author: denisem-msft
manager: devkeydet

ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/06/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - demora-msft
  - mehdis-msft
---
# Use the Creator Kit
The Creator Kit is shipped with the following assets:
- **PCF** and **Canvas** [components](creator-kit/components.md)
- A **Reference app** to interactively learn
- **Templates** to quickly start building apps
- A **Theme Editor** generates Theme JSON, used to easily style consistent components

## How to add components to an app
Once the kit has been [installed](setup.md), learn how to add the components into your app.
- How to [add PCF code components to a Canvas apps](https://docs.microsoft.com/en-us/power-apps/developer/component-framework/component-framework-for-canvas-apps#add-components-to-a-canvas-app)
- How to [add Canvas components to a Canvas app](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/component-library#import-from-a-component-library)

## Building blocks

### Reference App
Use the reference app to learn how to use each component.

- Observe how the component behaves and renders data.
- Select the {Code} tab to see the Power Fx formulas used.
- Learn best practices from the inline guidance related to the control.


 ![The Creator Kit](media/ReferenceApp.png "The Creator Kit")

### Templates
The kit templates provide an option to quickly start creating a responsive Fluent UI based app. They come with the custom components pre-loaded to and attached to a Theme JSON variable to reduce the time it takes to start developing.

#### Canvas Template
Make a copy of this app when creating a new [canvas app](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/getting-started) for a project or proof-of-concept that require the components in the kit.

   ![Canvas Template App](media/template-app.png "Canvas Template App")

#### Custom Page Template
Make a copy of this page when creating a new custom page for a [converged app](https://docs.microsoft.com/en-us/power-apps/maker/model-driven-apps/model-app-page-overview).

### Theme Editor App
Use this app to generate the desired color palette used by the components.

1. Play the Theme Editor App
1. Modify the Primary color, Text color, and Background color values
   ![Theme Editor App](media/theme-editor.png "Theme Editor App")
1. Select the **Export theme** button in the top right corner of the app to generate the Power Fx expression version of the Theme JSON.
1. Save the Theme JSON as a variable in your app (or replace the existing Theme definition if starting from a template app), and make sure the Creator Kit controls are referencing the variable. 

### Canvas Components
These components are defined in the component library called "Power CAT Component Library", and are implemented with [Canvas app custom components](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/create-component).

### Code Components
Implemented with [Power Apps component framework (PCF)](https://docs.microsoft.com/en-us/power-apps/developer/component-framework/custom-controls-overview), which are defined as individual custom controls in the solution.

View the code components in the [components refernce page](components.md).

## Solution dependencies
Follow these best practices to help ensure you do not run into solution dependency issues during deployment:
- Always build apps that use Creator Kit components within a solution
- When deploying apps to another Environment that use the components, make sure either:
    - The target Environment already contains the managed Creator Kit solution, or
    - The app solution contains the components used in the app

> [!div class="nextstepaction"]
> [Next step: View the components reference](components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
