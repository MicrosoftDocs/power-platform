---
title: Elevation control reference | Creator Kit
description: Learn about the details and properties of Elevation control in the Creator Kit.
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

[This article is pre-release documentation and is subject to change.]

A control used to construct cards and flyouts.

:::image type="content" source="media/elevation.png" alt-text="Elevation control":::

## Description

Fluent UI `Elevation` support with mouse hover events.

> [!NOTE]
> Component source code and more information available at the [Creator kit GitHub repository](https://github.com/microsoft/powercat-creator-kit).

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Fill color` | Background color of the `Elevation` control. |
| `Depth` | Depth of the shadow. |

## Additional properties

| Property | Description |
| -------- | ----------- |
| `Hover fill color` | Background color of the `Elevation` control while hovering. |
| `Hover depth` | Depth of the shadow while hovering. |
| `Padding` | Distance between the `Elevation` card and the edge of the control (in each direction: left, right, top, and bottom). |
| `Dark overlay padding` | Enable for a dark overlay effect in the padded area. |

## Best practices

See [Fluent UI `Elevation` control best practices](https://developer.microsoft.com/fluentui#/styles/web/elevation).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]