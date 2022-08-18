---
title: "Use the Creator Kit | Creator Kit"
description: "The Creator Kit is shipped as a single, self-contained solution. Learn about the building blocks designed to help you create Fluent UI–based apps."
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
  - slaouist
---

# Use the Creator Kit

[This article is pre-release documentation and is subject to change.]

Before you use the components included with the Creator Kit, use the reference app to learn component behavior and implementation patterns. With the reference app, you'll also learn how to add components to an app. 

The Creator Kit includes the following assets:

- Power Apps component framework and canvas [components](components.md)
- A reference app to interactively learn with
- Templates to quickly start building apps with
- A theme editor that generates Theme JSON, used to easily style consistent components

## Learn about adding components to an app

After the kit has been [installed](setup.md), learn how to add the components to your app:

- How to [add code components to a canvas app](/power-apps/developer/component-framework/component-framework-for-canvas-apps#add-components-to-a-canvas-app)
- How to [add canvas components to a canvas app](/power-apps/maker/canvas-apps/component-library#import-from-a-component-library)

## Create the building blocks

In this section, you'll learn details about the different apps, templates, and components included with the Creator Kit.

- [Reference app](#reference-app) 
- [Templates](#templates) 
- [Canvas app template](#canvas-app-template) 
- [Custom page template](#custom-page-template) 
- [Theme editor app](#theme-editor-app) 
- [Canvas components](#canvas-components) 
- [Code components](#code-components) 

### Reference app

Use this app to learn about each component, get recommended best practices for the optimal user experience, interact with each component, and see behind the properties to the implementation code that enables their behavior. We recommend exploring the components of interest in the reference app before you use them in an actual app.

- Observe how the component behaves and renders data.
- Select the **Code** tab to see the underlying Power Fx formulas.
- Learn best practices from the inline guidance related to the control.

:::image type="content" source="media/ReferenceApp.png" alt-text="Screenshot of a page in the reference app that describes a control." border="false":::

### Templates

The templates are designed to help you quickly start creating responsive Fluent UI&ndash;based apps. They come with the custom components preloaded and attached to a Theme JSON variable, which reduces time to start developing.

:::image type="content" source="media/template-app.png" alt-text="Screenshot of a canvas app template and a custom page template." border="false":::

#### Canvas app template

Make a copy of this app to create a new [canvas app](/power-apps/maker/canvas-apps/getting-started) that requires the components from the kit.

To make a copy of the canvas template:

1. Create a new unmanaged solution.
1. In the ribbon, select **Add existing** > **Apps** > **Canvas**.
1. Select the **Canvas Template** app, and then select **Add**.
1. Edit the **Canvas Template**.
1. In the studio ribbon, select **File** > **Save As** and enter a new name for the copy. The copy will appear in the same solution.
1. Remove the original canvas app template from the solution.

Ensure that you only edit the copied app from now on, so that you can reuse the original app template.

#### Custom page template

Make a copy of this page to create a new custom page for a [converged app](/power-apps/maker/model-driven-apps/model-app-page-overview).

:::image type="content" source="media/custom-page-studio.png" alt-text="Custom page template.":::

Follow the preceding steps to [make a copy of the canvas template app](#canvas-app-template), except this time you'll select the **Save As** option in the upper-right corner:

1. In the upper-right corner, expand the menu next to the **Save** icon, and then select **Save as**.

    :::image type="content" source="media/custom-page-save.png" alt-text="Custom Page studio Save as menu.":::

1. Enter a new name, and then select **Save**.

    :::image type="content" source="media/custom-page-saveas.png" alt-text="Custom page studio rename dialog.":::

1. Close the studio by selecting the back button in the upper-left corner. Notice that the copy has been created in the same solution.

    :::image type="content" source="media/custom-page-added.png" alt-text="Custom page copy added to solution.":::

1. Remove the original custom page template from the solution.

### Theme editor app

Use this app to generate a **Theme JSON** object for styling components consistently.

> [!IMPORTANT]
> A *Theme JSON* object is a code block containing a set of colors. Creator Kit components are designed to accept the code block and map the color values to component properties. Save the object as a variable in your app (as described in the following instructions). Although a Theme JSON object is designed to be easily referenced by kit components, any component outside of the kit can also reference these values, which helps easily maintain consistency across all app components.

1. Play the Theme Editor App.

1. Modify the **Primary color**, **Text color**, and **Background color** values.

    :::image type="content" source="media/theme-editor.png" alt-text="Theme Editor app." border="false":::

1. In the upper-right corner, select **Export theme** to generate the Power Fx expression version of the Theme JSON, and then copy the value from the panel.

    :::image type="content" source="media/theme-editor-json.png" alt-text="Theme Editor app-generated Theme JSON." border="false":::

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

1. Reference the `AppTheme` variable for any Creator Kit control that has a `Theme` property.

> [!NOTE]
> Any control (including those outside the Creator Kit) can reference the Theme JSON colors, but the specific property of `palette` needs to be indicated.

The following example shows a formula that references the `AppTheme` primary color value in the `Fill` property for a standard button.

```powerapps-dot
ColorValue( AppTheme.palette.themePrimary )
```

### Canvas components

Canvas components are defined in the **Power CAT Component Library**, and are implemented by using [canvas components](/power-apps/maker/canvas-apps/create-component).

:::image type="content" source="media/canvascomponents.png" alt-text="Canvas components." border="false":::

### Code components

Code components, implemented with the [Power Apps component framework](/power-apps/developer/component-framework/custom-controls-overview), are defined as individual custom controls in the solution.

You can view the code components on the [components reference page](components.md).

:::image type="content" source="media/pcfcomponents.png" alt-text="Screenshot of the Custom controls menu." border="false":::

## Deploying apps that use Creator Kit components

If you configure solutions properly, you can avoid solution dependency issues when you deploy an app. Apps that use kit components can't be built outside of a solution, and they must be imported and exported as part of solutions.

- During development, build apps that use Creator Kit components in their own separate and unmanaged solution.
- When deploying an app that includes the components, make sure the Creator Kit (managed solution) is already installed in the target environment, or explicitly include the components used in the app in the solution.

For more information and general guidance, go to [solution import troubleshooting tips](/troubleshoot/dynamics-365/sales/troubleshoot-solution-import-errors-in-dynamics-365).

> [!div class="nextstepaction"]
> [Next step: View the components reference](components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
