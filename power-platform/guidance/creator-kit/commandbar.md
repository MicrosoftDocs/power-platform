---
title: CommandBar control reference | Creator Kit
description: Learn about the details and properties of the CommandBar control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 11/02/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
---

# :::no-loc text="CommandBar"::: control (preview)

A control used to input commands.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/CommandBar).

:::image type="content" source="media/command-bar.png" alt-text="CommandBar control.":::

## Description

`CommandBar` is a surface that houses commands that operate on the content of the window, panel, or parent region it resides above.

This code component provides a wrapper around the [Fluent UI CommandBar](https://developer.microsoft.com/fluentui#/controls/web/commandbar) control for use in canvas apps and custom pages.

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | The action items to render |

## Items structure

Each item uses the following schema to visualize data in the component.

| Name | Description |
| ------ | ----------- |
| `ItemDisplayName` | The Display Name of the command bar item. |
| `ItemKey` | The key to use to indicate which item is selected, and when adding sub items. The keys must be unique. |
| `ItemEnabled` | Set to false if the option is disabled. |
| `ItemVisible` | Set to false if the option is not visible. |
| `ItemChecked` | Set to true if the option is checked (e.g. split buttons in a command bar). |
| `ItemSplit` | Set to true if the option can be clicked and used as a drop down flyout menu. |
| `ItemIconName` | The Fluent UI icon to use (see [Fluent UI Icons](https://uifabricicons.azurewebsites.net/)) |
| `ItemIconColor` | The color to render the icon as (e.g. named, rgb or hex value). |
| `ItemIconOnly` | Do not show the text label - only the icon. |
| `ItemOverflow` | Set to true for overflow behavior |
| `ItemOverflow` | Render the option in the overflow items. |
| `ItemFarItem` | Render the option in the far items group of a command bar. |
| `ItemHeader` | Render the item as a section header. If there are items that have their `ItemParentKey` set to the key of this item, then they are added as semantically grouped items under this section. |
| `ItemTopDivider` | Render a divider at the top of the section. |
| `ItemDivider` | Render the item as a section divider - or if the item is a header (ItemHeader = true), then controls whether to render a divider at the bottom of the section. |
| `ItemParentKey` | Render the option as child item of another option. |

> [!NOTE]
> - `ItemIconColor` will override the component's Theme value and ignore other state colors (e.g., disabled).
> - `ItemHeader` and `ItemDivider` must be set to true to render as a divider. If set to false, it expects other values and will render blank.

## Example

Example Power Fx formula for basic `Items`:

  ```power-fx
  Table(
      {
          ItemKey: "new",
          ItemDisplayName: "New",
          ItemIconName: "Add"
      },
      {
          ItemKey: "edit",
          ItemDisplayName: "Edit",
          ItemIconName: "Edit"
      },{
          ItemKey: "delete",
          ItemDisplayName: "Delete",
          ItemIconName: "Delete"
      },{
          ItemKey: "refresh",
          ItemDisplayName: "Refresh",
          ItemIconName: "refresh"
      },{
          ItemKey: "help",
          ItemDisplayName: "Help",
          ItemIconName: "help"
      }
  )
    
  ```

### Style properties
| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |

### Event properties
| Property | Description |
| -------- | ----------- |
| `InputEvent` | An event to send to the control. E.g. `SetFocus`. |

## Behavior

Supports [SetFocus](setfocus.md) as an `InputEvent`.

### Configure 'On Select' behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemKey` as the switch value.

Replace the `false` values with appropriate expressions in the Power Fx language.

  ```power-fx
    Switch( Self.Selected.ItemKey,
      /* Action for ItemKey 'new' (e.g., Patch function) */
      "new", false,
      
      /* Action for 'edit' (e.g., Patch function) */
      "edit", false,
      
      /* Action for 'delete' (e.g., Remove function ) */
      "delete", false,
      
      /* Action for 'refresh' (e.g., Refresh function) */
      "refresh", false,
      
      /* Action for 'help' (e.g., email support with the Office 365 connector ) */
      "help", false,
    
      /* Default action */
          false
    )
  ```

  ### Setting focus on the control
When a new dialog is shown, and the default focus should be on the control, an explicit set focus will be needed.

To make calls to the input event, you can set a context variable that is bound to the Input Event property to a string that starts with `SetFocus` and followed by a random element to ensure that the app detects it as a change.

Example Power Fx formula:
```power-fx
UpdateContext({ ctxResizableTextareaEvent:"SetFocus" & Text(Rand()) }));
```

The context variable `ctxResizableTextareaEvent` would then be bound to the property Input Event property.

## Limitations

This code component can only be used in canvas apps and custom pages.

See more limitation notes in the [component design challenges](https://github.com/microsoft/powercat-code-components/blob/main/CommandBar/README.md#design-challenges).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
