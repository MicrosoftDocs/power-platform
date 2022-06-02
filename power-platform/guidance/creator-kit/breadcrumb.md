---
title: Breadcrumb control reference | Creator Kit
description: Learn about the details and properties of the Breadcrumb control in the Creator Kit.
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

# :::no-loc text="Breadcrumb"::: control

[This article is pre-release documentation and is subject to change.]

A control used to provide navigation.

:::image type="content" source="media/breadcrumb.png" alt-text="Breadcrumb control.":::

## Description

`Breadcrumb` controls should be used as a navigational aid in your app or site. They indicate the current page's location within a hierarchy and help the user understand where they are in relation to the rest of that hierarchy. A breadcrumb also provides one-click access to higher levels of that hierarchy.

This code component provides a wrapper around the [Fluent UI Breadcrumb](https://developer.microsoft.com/fluentui#/controls/web/breadcrumb) control for use in canvas apps and custom pages. 

> [!NOTE]
> You can find component source code and more information at the [Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit).

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | Table with the items |
| `Max displayed items` | Maximum number of items that can be displayed |
| `Overflow index` | The index where overflow items are visualized (when all items can't fit in the control width) |

## Items structure

Each item uses the following schema to visualize data in the component. 

| Name | Description |
| ------ | ----------- |
| `ItemKey` | Arbitrary unique string associated with the breadcrumb item. |
| `ItemDisplayName` | Text to display in the breadcrumb item. |
| `ItemClickable` | If set to true, enables the item to be selectable<!--note from editor: Edit okay?-->. |

Example:

  ```powerapps-dot
  Table(
      {
          ItemKey: "1",
          ItemDisplayName: "General",
          ItemClickable: true
      },
      {
          ItemKey: "2",
          ItemDisplayName: "Document",
          ItemClickable: true
      }
  )
  ```


## Configure "On Select" behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemKey` as the switch value.

Replace the `false` values with appropriate expressions in the Power Fx language. 

Because this control is used for navigation, a logical action is to use [navigation functions](/power-apps/maker/canvas-apps/functions/function-navigate) (ideally to a relevant screen with the related data loaded).

  ```powerapps-dot
    Switch( Self.Selected.ItemKey,
      /* Action for ItemKey 1 */
      "1", false,
      
      /* Action for ItemKey 2 */
      "2", false,
    
      /* Default action */
          false
    )
  ```

## Best practices

Go to [Fluent UI Breadcrumb control best practices](https://developer.microsoft.com/fluentui#/controls/web/breadcrumb).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]