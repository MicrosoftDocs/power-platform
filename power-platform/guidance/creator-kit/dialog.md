---
title: Dialog control reference (experimental) | Creator Kit
description: Learn about the details and properties of the Dialog control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 07/25/2025
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: jhaskett-msft
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
---
# :::no-loc text="Dialog"::: control (experimental)

[This article is pre-release documentation and is subject to change.]

A control used to group content.

:::image type="content" source="media/dialog.png" alt-text="Dialog control.":::

> [!IMPORTANT]
> - This is an experimental feature.
> - Experimental features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Description

A dialog box (Dialog) is a temporary pop-up window that takes focus from the page or app and requires people to interact with it. It's primarily used for confirming actions, such as deleting a file, or asking people to make a choice.

This canvas component mimics the style and behavior of the [Fluent UI Dialog control](https://developer.microsoft.com/fluentui#/controls/web/Dialog). See the documentation for best practices.

[View the component in the Creator Kit GitHub repository](
https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/src/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri.msapp).

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `Buttons` | A dataset that defines the buttons (see properties below) |
| `Title` | Text displayed in the title section |
| `OverlayColor` | Color displayed in the overlay area |
| `DialogWidth` | The width of the dialog (not to be confused with the control width, which should span the app width) |
| `DialogHeight` | The height of the dialog (not to be confused with the control height, which should span the app height). |
| `SubTitle` | Text displayed under the title |

### `Buttons` properties

| Property | Description |
| -------- | ----------- |
| `Label` | The label displayed on the button. |
| `ButtonType` | Enumeration that determines the styling of the button. Choose between `Standard` and `Primary`.|

```power-fx
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

### Style properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Theme object. See [theming](theme.md) for guidance on how to configure. |

For formatting, see guidance in the Format panel content section of [Panel](./panel.md#format-panel-content).

### Event properties

| Property | Description |
| -------- | ----------- |
| `OnCloseSelect` | Action expression that's executed when the close button is selected. |
| `OnButtonSelect` | Action expression that's executed when one of the action buttons are selected. |

## Behavior

### Configure Dialog visibility

Make the `Dialog` control itself (or the surface it's located within) visible when a Boolean (true/false) type variable changes to true, and assign that variable to the dialog's visibility property. After the dialog is displayed, you can hide the dialog by updating the variable on the reset property, which is triggered when the close icon is selected.

The following shows the Power Fx formula to open the dialog in an action formula on another component somewhere in the app (for example, the `OnSelect` property of a button):

```power-fx
UpdateContext({ showHideDialog: true })
```

The following is the Power Fx formula to close the dialog in the `OnCloseSelect` property of the dialog:

```power-fx
UpdateContext({ showHideDialog: false })
```

Assign the variable to the `Visible` property of the dialog:

```power-fx
showHideDialog
```

### Configure button actions

In the `OnButtonSelect` property of the dialog, provide actions in an `If()` or `Switch()` condition based on the `Self.SelectedButton.Label` text value to define the action. Depending on the action, it might make sense to also close the dialog after the action is completed.

```power-fx
    If( Self.SelectedButton.Label = "Send", 
        Notify("Email Sent")
    );
    UpdateContext({ showHideDialog: false })
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
