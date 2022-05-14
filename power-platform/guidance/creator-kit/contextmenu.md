---
title: ContextMenu control reference | Creator Kit
description: Learn about the details and properties of ContextMenu control in the Creator Kit.
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

# :::no-loc text="ContextMenu"::: control

A control used to input commands.

:::image type="content" source="media/context-menu.png" alt-text="ContextMenu control.":::

## Description

A contextual menu (`ContextMenu`) is a list of commands that are based on the context of selection, mouse hover or keyboard focus. They're one of the most effective and highly used command surfaces, and can be used in various places.

This code component provides a wrapper around the [Fluent UI `ContextMenu`](https://developer.microsoft.com/fluentui#/controls/web/contextualmenu) control bound to a button for use in canvas apps and custom pages.

> [!NOTE]
> Component source code and more information available at the [Creator kit GitHub repository](https://github.com/microsoft/powercat-creator-kit).

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | Table with the component items. |
| `Chevron` | Set to true to display the chevron icon, indicating more options. |
| `Input event` | Action that is triggered upon button-click. |

## Items structure

Each item uses the below schema to visualize data in the component.

| Name | Description |
| ------ | ----------- |
| `ItemKey` | Arbitrary unique string associated with the item. |
| `ItemDisplayName` | Text to display in the `ContextMenu` item. |
| `ItemIconName` | [Fluent UI Icon](https://uifabricicons.azurewebsites.net/) by name |
| `ItemOverflow` | Set to true for overflow behavior |

Example:

  ```powerapps-dot
    Table(
        {
            ItemKey: "File",
            ItemIconName: "save",
            ItemDisplayName: "Save",
            ItemOverflow:true
        },
         {
            ItemKey: "Delete",
            ItemIconName: "Delete",
            ItemDisplayName: "Delete",
            ItemOverflow:true
        }
    )
    
  ```

## Configure 'On Select' behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemKey` as the switch value.

Replace the `false` values with appropriate expressions in the Power Fx language.

  ```powerapps-dot
    Switch( Self.Selected.ItemKey,
      /* Action for ItemKey 1 */
      "File", false,
      
      /* Action for ItemKey 2 */
      "Delete", false,
    
      /* Default action */
          false
    )
  ```

## Best practices

See [Fluent UI `ContextMenu` control best practices](https://developer.microsoft.com/fluentui#/controls/web/contextmenu).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]