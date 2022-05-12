---
title: "Use the Creator Kit | Creator Kit"
description: "The Power Platform CoE Starter Kit is shipped as a single self-contained solution. Learn about the building blocks  designed to help you create Fluent UI based apps."
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/16/2022
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

Before you use the components included with the Creator Kit, use the **Reference App** to learn component behavior and implementation patterns. And learn about how to add components to an app.

The Creator Kit is shipped with the following assets:

- **Power Apps component framework** and **Canvas** [components](components.md)
- A **Reference App** to interactively learn
- **Templates** to quickly start building apps
- A **Theme Editor** that generates Theme JSON, used to easily style consistent components

## Learn about adding components to an app

Once the kit has been [installed](setup.md), learn how to add the components into your app:

- How to [add code components to a canvas app](/power-apps/developer/component-framework/component-framework-for-canvas-apps#add-components-to-a-canvas-app)
- How to [add canvas components to a canvas app](/power-apps/maker/canvas-apps/component-library#import-from-a-component-library)

## Create the building blocks

In this section, you'll learn the details about different apps, templates, and components included with the Creator Kit.

- [Reference App](#reference-app) - an app for you to learn each component
- [Templates](#templates) - quickly start creating responsive Fluent UI-based apps
- [Canvas App Template](#canvas-app-template) - a template of canvas app for reuse
- [Custom Page Template](#custom-page-template) - a template of custom page for reuse
- [Theme Editor App](#theme-editor-app) - Theme JSON object for styling components consistently
- [Canvas components](#canvas-components) - sample canvas components
- [Code components](#code-components) - sample code components

### Reference App

This app allows you to learn about each component, recommended best practices for optimal user experience, interact with each component, and see the implementation code behind the properties that enables the behavior. We recommend exploring the components of interest in the Reference App before trying to use the components in an actual app.

- Observe how the component behaves and renders data.
- Select the **Code** tab to see the Power Fx formulas used.
- Learn best practices from the inline guidance related to the control.

:::image type="content" source="media/ReferenceApp.png" alt-text="The Creator Kit.":::

### Templates

The templates are designed to help quickly start creating responsive Fluent UI based apps. They come with the custom components preloaded and attached to a Theme JSON variable, which reduces time to start developing.

:::image type="content" source="media/template-app.png" alt-text="Canvas app and Custom Page Templates.":::

#### Canvas App Template

Make a copy of this app when creating a new [canvas app](/power-apps/maker/canvas-apps/getting-started) that requires the components from the kit.

How to make a copy of the canvas template:

1. Create a new unmanaged solution.
1. Select **Add existing** > **Apps** > **Canvas** action in the ribbon.
1. Select the **Canvas Template** app and then press **Add**.
1. Edit the **Canvas Template**.
1. In the studio top ribbon, select **File** > **Save As** and enter a new name for the copy. The copy will appear in the same solution.
1. Remove the original Canvas App Template from the solution.

Ensure that you only edit the copied app now onwards so that the original app template can be reused.

#### Custom Page Template

Make a copy of this page when creating a new custom page for a [converged app](/power-apps/maker/model-driven-apps/model-app-page-overview).

:::image type="content" source="media/custom-page-studio.png" alt-text="Custom Page Template.":::

Follow the steps to [make a copy of the canvas template app](#canvas-app-template), with the difference of having the **Save As** option in the top-right corner of the studio for pages:

1. In the top-right corner, expand the menu next to the save icon, and select **Save as**.

    :::image type="content" source="media/custom-page-save.png" alt-text="Custom Page studio save as menu.":::

1. Enter a new name, then select **Save**.

    :::image type="content" source="media/custom-page-saveas.png" alt-text="Custom Page studio rename dialog.":::

1. Close the studio by selecting the back button in the top-left corner. Notice that the copy was created in the same solution.

    :::image type="content" source="media/custom-page-added.png" alt-text="Custom Page copy added to solution.":::

1. Remove the original Custom Page Template from the solution.

### Theme Editor App

Use this app to generate a **Theme JSON** object for styling components consistently.

> [!IMPORTANT]
> A Theme JSON object is a code block containing a set of colors. Creator Kit components are designed to accept the code block and maps the color values to component properties. The object should be saved as a variable in your app (see instructions below). Although it is designed to be easily referenced with kit components, any component outside of the kit can also reference these values, which helps easily maintain consistency across all app components.

1. Play the Theme Editor App.
1. Modify the Primary color, Text color, and Background color values.

    :::image type="content" source="media/theme-editor.png" alt-text="Theme Editor App.":::

1. Select **Export theme** from the top-right corner of the app to generate the Power Fx expression version of the Theme JSON, then copy the value from the panel.

    :::image type="content" source="media/theme-editor-json.png" alt-text="Theme Editor App generated Theme JSON.":::

1. Save the Theme JSON as a global variable in the `OnStart` property of your app, with the palette code block as a property of the `AppTheme` object variable.

    ```powerapps-dot
    Set( AppTheme, {
      palette: {
        themePrimary: "#0078d4",
        themeLighterAlt: "#eff6fc",
        themeLighter: "#deecf9",
        themeLight: "#c7e0f4",
        themeTertiary: "#71afe5",
        themeSecondary: "#2b88d8",
        themeDarkAlt: "#106ebe",
        themeDark: "#005a9e",
        themeDarker: "#004578",
        neutralLighterAlt: "#faf9f8",
        neutralLighter: "#f3f2f1",
        neutralLight: "#edebe9",
        neutralQuaternaryAlt: "#e1dfdd",
        neutralQuaternary: "#d0d0d0",
        neutralTertiaryAlt: "#c8c6c4",
        neutralTertiary: "#a19f9d",
        neutralSecondary: "#605e5c",
        neutralPrimaryAlt: "#3b3a39",
        neutralPrimary: "#323130",
        neutralDark: "#201f1e",
        black: "#000000",
        white: "#ffffff"
      }
    });
    ```

1. Reference the `AppTheme` variable for any Creator Kit controls that has a `Theme` property.

> [!NOTE]
> Any control (including those outside of the Creator Kit) can reference the Theme JSON colors, but the specific property of palette needs to be indicated.

Example formula referencing the `AppTheme` color values in a standard button's `TextColor`:

```powerapps-dot
ColorValue( AppTheme.palette.white )
```

### Canvas components

These components are defined in the component library called **Power CAT Component Library**, and are implemented with [canvas components](/power-apps/maker/canvas-apps/create-component).

:::image type="content" source="media/canvascomponents.png" alt-text="Canvas components.":::

### Code Components

Implemented with [Power Apps component framework](/power-apps/developer/component-framework/custom-controls-overview), that are defined as individual custom controls in the solution.

View the code components in the [components reference page](components.md).

:::image type="content" source="media/pcfcomponents.png" alt-text="Code Components.":::

## Deploying apps with Creator Kit components

Avoid solution dependency issues when deploying an app by configuring solutions properly. Apps that use kit components can't be built outside of a solution and require solutions for importing and exporting.

- Build apps that use Creator Kit components in their own separate and unmanaged solution during development.
- When deploying an app with the components, make sure the Creator Kit (managed solution) is already installed in the target environment, or explicitly include the components used in the app in the solution.

For more information about general guidance, see [solution import troubleshooting tips](/troubleshoot/dynamics-365/sales/troubleshoot-solution-import-errors-in-dynamics-365).

> [!div class="nextstepaction"]
> [Next step: View the components reference](components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
