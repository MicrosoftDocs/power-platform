---
title: "Use the Creator Kit | Creator Kit"
description: "The Creator Kit is shipped as a single, self-contained solution. Learn about the building blocks designed to help you create Fluent UI–based apps."
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 06/10/2024
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
  - DanaMartens
ms.custom: sfi-image-nochange
---

# Use the Creator Kit

Before you use the components included with the Creator Kit, use the reference app to learn component behavior and implementation patterns. With the reference app, you learn how to add components to an app.

The Creator Kit includes the following assets, distributed in three solutions:

|Solution | Items |
|-|-| 
| **CreatorKitCore** | <li>24 Power Apps component framework and canvas [components](components.md)</li> |
| **CreatorKitReference (MDA)** | <li>A reference app (Model Driven with custom pages) to interactively learn with</li><li>A canvas page template</li> |
| **CreatorKitReference (Canvas)** | <li>Reference app (Canvas) to interactively learn with (does not required standalone Power Apps license)</li><li>A canvas template app</li><li>A theme editor that generates Theme JSON, used to easily style consistent components</li>


## Learn how to add components to an app

After the kit has been [installed](setup.md), learn how to add the components to your app:

- How to [add code components to a canvas app](/power-apps/developer/component-framework/component-framework-for-canvas-apps#add-components-to-a-canvas-app)
- How to [add canvas components to a canvas app](/power-apps/maker/canvas-apps/component-library#import-from-a-component-library)

## Create the building blocks

In this section, you'll learn details about the different apps, templates, and components that make up the Creator Kit.

- [Reference app](#reference-app) 
- [Templates](#templates) 
- [Canvas app template](#canvas-app-template) 
- [Custom page template](#custom-page-template) 
- [Canvas components](#canvas-components) 
- [Code components](#code-components) 

### Reference app

Use this app to learn about each component, get recommended best practices for the optimal user experience, interact with each component, and see behind the properties to the implementation code that enables their behavior. We recommend exploring the components of interest in the reference app before you use them in an actual app.

- Observe how the component behaves and renders data.
- Select the **Code** tab to see the underlying Power Fx formulas.
- Learn best practices from the inline guidance related to the control.

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

Follow the preceding steps to [make a copy of the canvas template app](#canvas-app-template), except this time you select the **Save As** option in the upper-right corner:

1. In the upper-right corner, expand the menu next to the **Save** icon, and then select **Save as**.

    :::image type="content" source="media/custom-page-save.png" alt-text="Custom Page studio Save as menu.":::

1. Enter a new name, and then select **Save**.

    :::image type="content" source="media/custom-page-saveas.png" alt-text="Custom page studio rename dialog.":::

1. Close the studio by selecting the back button in the upper-left corner. Notice that the copy has been created in the same solution.

    :::image type="content" source="media/custom-page-added.png" alt-text="Custom page copy added to solution.":::

1. Remove the original custom page template from the solution.

### Fluent theme designer app

Use this app to generate a **Theme Json** object for styling components consistently.

:::image type="content" source="media/theme-editor.png" alt-text="Theme Editor app." border="false":::

See [Theming](./theme.md) for instructions on how to generate themes and reference themes from components.

### Canvas components

Canvas components are defined in the **Power CAT Component Library**, and are implemented using [canvas components](/power-apps/maker/canvas-apps/create-component).

:::image type="content" source="media/canvascomponents.png" alt-text="Canvas components." border="false":::

### Code components

Code components, implemented with the [Power Apps component framework](/power-apps/developer/component-framework/custom-controls-overview), are defined as individual custom controls in the solution.

You can view the code components on the [components reference page](components.md).

:::image type="content" source="media/pcfcomponents.png" alt-text="Screenshot of the Custom controls menu." border="false":::

## Deploying apps that use Creator Kit components

Apps that use kit components can't be built outside of a solution, and they must be imported and exported as part of solutions.

- During development, build apps that use Creator Kit components in their own separate, unmanaged solution.
- When deploying an app that includes the components, the `CreatorKitCore` (managed solution) must be installed in the target environment before dependent solutions are imported.

For more information and general guidance, go to [solution import troubleshooting tips](/troubleshoot/dynamics-365/sales/troubleshoot-solution-import-errors-in-dynamics-365).

## Frequently asked questions (FAQ)

**Should large organizations encourage citizen makers to use the Creator Kit? What kind of overhead does that come with from an O&M perspective?**

The Creator Kit isn't an officially supported Microsoft product, meaning customers can't raise a Microsoft support ticket for issues. Instead, they must file [issues on the GitHub repository](https://github.com/microsoft/powercat-creator-kit/issues) and work with the team directly. If there's triage or debug information that they aren't comfortable sharing on GitHub, the team can arrange to handle sensitive conversations privately by [submitting a request form](https://forms.microsoft.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR4lL86nyt-9Io8ocQ1vGVaBUMDZBWE42RUdLWUNPVERZWU4yNjZVTERKQy4u).

We recommend first evaluating whether modern controls meet your application's requirements, as these controls are the most up-to-date and fully supported by Microsoft. If modern controls don't suffice, then validate the legacy components to determine their suitability. Creator Kit controls should only be considered when no other options meet your needs. Additionally, it's important to pay attention to the release status of the components being used, ensuring they're stable and supported for your development pipeline.

**What is the most effective or efficient way to roll out these updates to multiple production environments?**

There are several strategies to consider depending on the organization's priorities:

- *Most secure:* If security is a top priority (for example, initial validation before deployment to production environments), the organization's Center of Excellence (CoE) can host an isolated test environment to validate updates. Automation can then be used to deploy solutions to the desired production environments. For more information, see [Power catalog](/power-apps/maker/data-platform/catalog-overview) and [Microsoft Power Platform CLI](/power-platform/developer/cli/introduction?tabs=windows) for more details.
- *Lowest maintenance:* If security validation isn't necessary, environments can be individually configured to receive continuous updates automatically by enabling the Power CAT - MSFT publisher for the environment in the Power Platform admin center.

**As the overlap between the new Modern controls and the Creator Kit increases over time, will some Creator Kit components be deprecated? If so, what will that process entail?**

Yes, a subset of Creator Kit components are reimplemented as modern controls and are considered successors of the Creator Kit components. The team will deprecate the Creator Kit component predecessors in the AppSource offering once the successor meets parity for the needs of the majority. Deprecation timelines will be announced through regular channels such as GitHub updates, Office Hours, and discussion forums. For more information on the recommended migration process, see the [migration process documentation](https://github.com/microsoft/powercat-creator-kit/discussions/473).

**What are the best practices for development pipelines (dev > UAT > prod) involving the Creator Kit?**

Install the managed `CreatorKitCore` solution in all environments where apps using Creator Kit components are deployed. Ensure this solution is installed before the solution with the app. For more information on the basic installation and how to incorporate it into the development pipeline, see the [install instructions](setup.md).

> [!div class="nextstepaction"]
> [Next step: View the components reference](components.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
