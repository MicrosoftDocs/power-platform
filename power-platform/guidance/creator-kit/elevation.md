---
title: Elevation control reference | Creator Kit
description: Learn about the details and properties of the Elevation control in the Creator Kit.
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
| `Padding` | The distance between the `Elevation` card and the edge of the control (in each direction: left, right, top, and bottom). |
| `DarkOverlay` | When enabled, displays a dark overlay effect in the padded area. |

## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]