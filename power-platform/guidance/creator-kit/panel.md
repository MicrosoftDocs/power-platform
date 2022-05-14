---
title: Panel control reference | Creator Kit
description: Learn about the details and properties of Panel control in the Creator Kit.
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
# :::no-loc text="Panel"::: control

[This article is pre-release documentation and is subject to change.]

A control used to group content.

:::image type="content" source="media/Panel.png" alt-text="Panel control.":::

## Description

Panels are overlays that contain supplementary content and are used for complex creation, edit, or management experiences. For example, viewing details about an item in a list or editing settings.

This canvas component mimics the style and behavior of the [Fluent UI Panel control](https://developer.microsoft.com/fluentui#/controls/web/Panel).

[View component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri_msapp_src)

## Limitations

This canvas component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Buttons` | A data set that defines the buttons. |
| `Title` | Text displayed in the title section. |
| `Overlay Color` | Color displayed in the overlay area. |
| `DialogWidth` | The width of the panel (not to be confused with the control width, which should span the app width). |
| `Subtitle` | Text displayed under the title |
| `Position of the panel` | Provide the text value `Right` or `Left` to indicate which side of the screen the panel should be rendered. |
| `OnCloseSelect` | Action expression that executes when the close button is selected. |
| `OnButtonSelect` | Action expression that executes when one of the action buttons are selected. |

## Configure panel visibility

Make the `Panel` control itself (or the surface it's located within) visible when a boolean (true/false) type variable changes to true, assign that variable to the panel's visibility property. Once the panel is displayed, you can hide the panel by updating the variable on the reset property, which is triggered when the close icon is clicked.

Power Fx formula to open the dialog, in an action formula on another component somewhere in the app (for example, the `OnSelect` property of a button):

```powerapps-dot
UpdateContext({ showHideDialog: true })
```

Power Fx formula to close the dialog, in the `OnCloseSelect` property of the panel:

```powerapps-dot
UpdateContext({ showHideDialog: true })
```

Assign the variable to the `Visible` property of the dialog:

```powerapps-dot
showHideDialog
```

## Configure button actions

In the `OnButtonSelect` property of the panel, provide actions in an `If()` or `Switch()` condition based on the `Self.SelectedButton.Label` text value to define the action. Depending on the action, it might make sense to also close the panel after the action is completed.

```powerapps-dot
    If( Self.SelectedButton.Label = "Send", 
        Notify("Email Sent")
    );
    UpdateContext({ showHideDialog: false })
```

## Buttons Dataset

| Property | Description |
| -------- | ----------- |
| `Label` | The label displayed on the button |
| `ButtonType` | Enumeration that determines the styling of the button. Choose between Standard and Primary |

```powerapps-dot
Table(
    {
        Label: "Cancel", 
        ButtonType:'Microsoft.CoreControls.Button.ButtonType'.Standard 
    },{
        Label: "Ok", 
        ButtonType:'Microsoft.CoreControls.Button.ButtonType'.Primary
    }
)
```

## Best practices

See [Fluent UI Panel control best practices](https://developer.microsoft.com/fluentui#/controls/web/Panel)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
