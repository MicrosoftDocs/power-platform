---
title: Panel control reference (experimental) | Creator Kit
description: Learn about the details and properties of the Panel control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 05/16/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
---
# :::no-loc text="Panel"::: control (experimental)

[This article is pre-release documentation and is subject to change.]

A control used to group content.

:::image type="content" source="media/Panel.png" alt-text="Panel control.":::

> [!IMPORTANT]
> - This is an experimental feature.
> - Experimental features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Description

Panels are overlays that contain supplementary content and are used for complex creation, edit, or management experiences—for example, viewing details about an item in a list or editing settings.

This canvas component mimics the style and behavior of the [Fluent UI Panel control](https://developer.microsoft.com/fluentui#/controls/web/Panel).

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `Buttons` | A dataset that defines the buttons. |
| `Title` | Text displayed in the title section. |
| `Subtitle` | Optional. Text displayed under the title. |
| `DialogWidth` | Width of the panel. |
| `ContentX` | The X coordinate for the content area. |
| `ContentY` | The Y coordinate for the content area. |
| `ContentWidth` | The width of the panel's content area. |
| `ContentHeight` | The height of the panel's content area. |

#### `Buttons` properties

| Property | Description |
| -------- | ----------- |
| `Label` | The label displayed on the button |
| `ButtonType` | Enumeration that determines the styling of the button. Choose between `Standard` and `Primary` |

```power-fx
Table(
  {
    Label: "Cancel",
    ButtonType: 'Microsoft.CoreControls.Button.ButtonType'.Standard 
  },{
    Label: "Ok", 
    ButtonType: 'Microsoft.CoreControls.Button.ButtonType'.Primary
  }
)
```

### Style properties

| Property | Description |
| -------- | ----------- |
| `Overlay Color` | Color displayed in the overlay area. |
| `DialogWidth` | The width of the panel (not to be confused with the control width, which should span the app width). |
| `Position of the panel` | Provide the text value `Right` or `Left` to indicate which side of the screen the panel should be rendered on. |
| `Theme` | Theme object. Leaving this blank will render the default Power Apps theme. See [theming](theme.md) for guidance on how to configure. |

### Event properties

| Property | Description |
| -------- | ----------- |
| `OnCloseSelect` | Action expression that's executed when the close button is selected. |
| `OnButtonSelect` | Action expression that's executed when one of the action buttons are selected. |

## Behavior

### Configure panel visibility

The `Panel`'s visibility can be toggled with a Boolean (true/false) type variable.

1. Use the following Power Fx formula to display the dialog (e.g., the `OnSelect` property of a button control):

    ```power-fx
    UpdateContext({ showHideDialog: true })
    ```

1. Assign the following values to the `Panel`:

    |Property|Value|
    |-|-|
    |`OnCloseSelect`|`UpdateContext({ showHideDialog: false })`|
    |`Visible`| `showHideDialog` |

### Configure button actions

In the `OnButtonSelect` property of the panel, provide actions in an `If()` or `Switch()` condition based on the `Self.SelectedButton.Label` text value to define the action. Depending on the action, it is common to hide the `Panel` after the action is completed.

```power-fx
Switch( Self.SelectedButton.Label,
  "Ok", Notify("The Ok button was pressed.");
);

// Closes the panel
UpdateContext({ showHideDialog: false })
```

### Format panel content

Associate a container with the content properties of the `Panel` to place content in the appropriate region of the screen. Make sure to associate the content's visibility with the `Panel`.

Steps to format content in a panel:
1. Add the `Panel` (example name: `cmp_panel`)
1. Add a container (example name: `c_panelContent`)
1. Modify the following properties of `c_panelContent`:

    |Property|Value|
    |-|-|
    |`X`| `cmp_panel.ContentX` |
    |`Y`| `cmp_panel.ContentY` |
    |`Width`| `cmp_panel.ContentWidth` |
    |`Height`| `cmp_panel.ContentHeight` |
    |`Visible`| `cmp_panel.Visible` | 

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
