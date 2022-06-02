---
title: ContextMenu control reference | Creator Kit
description: Learn about the details and properties of the ContextMenu control in the Creator Kit.
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

[This article is pre-release documentation and is subject to change.]

A control used to input commands.

:::image type="content" source="media/context-menu.png" alt-text="ContextMenu control.":::

## Description

A contextual menu (`ContextMenu`) is a list of commands that are based on the context of selection, mouse hover, or keyboard focus. They're one of the most effective and highly used command surfaces, and can be used in various places.

This code component provides a wrapper around the [Fluent UI ContextualMenu](https://developer.microsoft.com/fluentui#/controls/web/contextualmenu)<!--note from editor: Edit okay? If so, should the title and TOC entry also be "ContextualMenu"?--> control bound to a button for use in canvas apps and custom pages.

> [!NOTE]
> You can find component source code and more information at the [Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit).

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | Table with the component items. |
| `Chevron` | Set to true to display the chevron icon, indicating more options. |
| `Input event` | Action that's triggered upon button selection<!--note from editor: Edit okay?-->. |

## Items structure

Each item uses the following schema to visualize data in the component.

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

Go to [Fluent UI ContextualMenu control best practices](https://developer.microsoft.com/fluentui#/controls/web/contextmenu).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]