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

## Get started
Complete the following tasks before using the components to make getting started easier:
1. Learn [how to add components to an app](#How-to-add-components-to-an-app)
1. Use the [Reference App](#Reference-App) to learn component behavior and implementation patterns


## How to add components to an app
Once the kit has been [installed](setup.md), learn how to add the components into your app.
- How to [add PCF code components to a Canvas apps](https://docs.microsoft.com/en-us/power-apps/developer/component-framework/component-framework-for-canvas-apps#add-components-to-a-canvas-app)
- How to [add Canvas components to a Canvas app](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/component-library#import-from-a-component-library)

## Building blocks

### Reference App
This app allows you to interact with each component, see the implementation code behind the properties that enables the behavior, and also provides best practices. We recommend exploring the components of interest in the Reference App before trying to use the components in an actual app.

- Observe how the component behaves and renders data.
- Select the {Code} tab to see the Power Fx formulas used.
- Learn best practices from the inline guidance related to the control.


 ![The Creator Kit](media/ReferenceApp.png "The Creator Kit")

### Templates
The kit templates provide an option to quickly start creating a responsive Fluent UI based app. They come with the custom components pre-loaded to and attached to a Theme JSON variable to reduce the time it takes to start developing.

#### Canvas Template
Make a copy of this app when creating a new [canvas app](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/getting-started) for a project or proof-of-concept that require the components in the kit.

   ![Canvas Template App](media/template-app.png "Canvas Template App")

How to make a copy of the Canvas Template:
1. Create a new unmanaged solution
1. Select **Add existing** > **Apps** > **Canvas** action in the ribbon
1. Select the **Canvas Template** app and then press **Add**. The 
1. Edit the **Canvas Template**
1. In the studio top ribbon, select **File** > **Save As** and provide a new name for the copy
1. The copy will appear in the same solution
1. Remove the original Canvas Template app from the solution

Only edit the copy going forward so others can utilize the template app from the same starting point.

#### Custom Page Template
Make a copy of this page when creating a new custom page for a [converged app](https://docs.microsoft.com/en-us/power-apps/maker/model-driven-apps/model-app-page-overview).

Follow the same steps of how to make a copy of the Canvas Template app, except the Save As action is in the top right corner of the canvas page studio:

1. In the top right corner, expand the menu next to the save icon.

   ![Canvas Template App](media/custom-page-save.png "Canvas Template App")

1. Rename the page and save

   ![Canvas Template App](media/custom-page-saveas.png "Canvas Template App")

1. 
 
   ![Canvas Template App](media/custom-page-added.png "Canvas Template App")


### Theme Editor App
Use this app to generate a Theme JSON object that is referenced by the components for styling.

1. Play the Theme Editor App
1. Modify the Primary color, Text color, and Background color values
   ![Theme Editor App](media/theme-editor.png "Theme Editor App")
1. Select the **Export theme** button in the top right corner of the app to generate the Power Fx expression version of the Theme JSON, then copy the value from the panel.
    ![Theme Editor App](media/theme-editor-json.png "Theme Editor App")
1. Save the Theme JSON as a variable in your app (or replace the existing Theme definition if starting from a template app), and make sure the Creator Kit controls are referencing the variable. 

### Canvas Components
These components are defined in the component library called "Power CAT Component Library", and are implemented with [Canvas app custom components](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/create-component).

   ![Canvas Components](media/canvascomponents.png "Canvas Components")

### Code Components
Implemented with [Power Apps component framework (PCF)](https://docs.microsoft.com/en-us/power-apps/developer/component-framework/custom-controls-overview), which are defined as individual custom controls in the solution.

View the code components in the [components refernce page](components.md).

   ![Code Components](media/pcfcomponents.png "Code Components")

## Deploying apps with Creator Kit components
Avoid solution dependency issues when deploying an app by:
- Building apps that use Creator Kit components in a seperate, unmanaged solution.
- Ensuring target Environment already contain the Creator Kit managed solution, or include the specific components used in the app, in the solution

See [solution import troubleshooting tips](https://docs.microsoft.com/en-us/troubleshoot/dynamics-365/sales/troubleshoot-solution-import-errors-in-dynamics-365) for more general guidance.

> [!div class="nextstepaction"]
> [Next step: View the components reference](components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
