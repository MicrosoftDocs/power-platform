---
title: CommandBar control reference | Creator Kit
description: Learn about the details and properties of CommandBar control in the Creator Kit.
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

# :::no-loc text="CommandBar"::: control

A control used to input commands.

:::image type="content" source="media/command-bar.png" alt-text="CommandBar control.":::

## Description

`CommandBar` is a surface that houses commands that operate on the content of the window, panel, or parent region it resides above.

This code component provides a wrapper around the [Fluent UI `CommandBar`](https://developer.microsoft.com/fluentui#/controls/web/commandbar) control for use in canvas & custom pages.

View component source code and additional documentation in the [GitHub repository](https://github.com/microsoft/powercat-creator-kit)

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | Table with the component items. |
| `Input event` | Action that is triggered upon a mouse-click. |

## Items structure

Each item uses the below schema to visualize data in the component.

| Name | Description |
| ------ | ----------- |
| `ItemKey` | Arbitrary unique string associated with the item. |
| `ItemDisplayName` | Text to display in the `CommandBar` item. |
| `ItemIconName` | [Fluent UI Icon](https://uifabricicons.azurewebsites.net/) by name |
| `ItemOverflow` | Set to true for overflow behavior |

Example:

  ```powerapps-dot
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

## Configure 'On Select' behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemKey` as the switch value.

Replace the `false` values with appropriate expressions in the Power Fx language.

  ```powerapps-dot
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

## Best practices

For more information about general best practices about this control, see [Fluent UI `CommandBar` control best practices](https://developer.microsoft.com/fluentui#/controls/web/commandbar).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]