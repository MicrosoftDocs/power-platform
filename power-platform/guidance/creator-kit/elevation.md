---
title: Elevation control reference | Creator Kit
description: Learn about the details and properties of the Elevation control in the Creator Kit.
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

# :::no-loc text="Elevation"::: control

A control used to construct cards and flyout menus.

:::image type="content" source="media/elevation.png" alt-text="Elevation control.":::

## Description

`Elevation` is used to draw focus to an experience and add a physical materiality to the app. Shallow levels are reserved for items that are closely connected to the canvas or view, such as tiles. Deeper levels create a prominent frame around the surface, drawing strong focus to self-contained experiences like dialogs. Supports mouse hover events.

Go to [Fluent UI Elevation style](https://developer.microsoft.com/fluentui#/styles/web/elevation) page for best practices.

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `Depth` | The depth of the shadow. |
| `HoverDepth` | The depth of the shadow that appears on hover. |

### Style properties

| Property | Description |
| -------- | ----------- |
| `FillColor` | The background color of the `Elevation` control. |
| `HoverFillColor` | The background color of the `Elevation` control that appears on hover. |
| `PaddingLeft` | Left edge gap between card and control boundary |
| `PaddingRight` | Right edge gap between card and control boundary |
| `PaddingTop` | Top edge gap between card and control boundary |
| `PaddingBottom` | Bottom edge gap between card and control boundary |
| `DarkOverlay` | When enabled, displays a dark overlay effect in the padded area. |

### Formatting content over `Elevation` with layout containers

1. Add a [`Container`](/power-apps/maker/canvas-apps/controls/control-container) control to the screen (not `Horizontal container` or `Vertical container`).

1. Add an `Elevation` component in the container
1. Set `Elevation` properties to fit it's parent `Container`:

    |Property|Value|
    |-|-|
    |`X`| `0` |
    |`Y`| `0` |
    |`Width`|`Parent.Width`|
    |`Height`|`Parent.Height`|

1. Set `PaddingRight`, `PaddingTop` and `PaddingBottom` properties to reference `Self.PaddingLeft`
1. Choose desired `Depth` and adjust the value of `PaddingLeft` to provide enough gap for the shadow not to get cut off. 
1. Insert a [`Vertical container`](/power-apps/maker/canvas-apps/controls/control-vertical-container) into the same parent `Container`. This is used to host the content of the card.
1. Set the `Vertical container` properties to visually align to the `Elevation` component's edges:

    |Property|Value|
    |-|-|
    |`X`| `Elevation.PaddingLeft` |
    |`Y`| `Elevation.PaddingLeft` |
    |`Width`|`Parent.Width - Elevation.PaddingLeft * 2`|
    |`Height`|`Parent.Height - Elevation.PaddingLeft * 2`|

1. Add contents into the `Vertical container` to populate the card.

:::image type="content" source="media/elevation-sample.png" alt-text="Elevation example.":::

## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
