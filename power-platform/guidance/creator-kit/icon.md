---
title: Icon control reference | Creator Kit
description: Learn about the details and properties of Icon control in the Creator Kit.
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
# :::no-loc text="Icon"::: control

[This article is pre-release documentation and is subject to change.]

A control used to display Fluent UI icons.

:::image type="content" source="media/icon.png" alt-text="Icon control.":::

## Description

This control renders Fluent UI icons based on the name. Allows you to easily create an Icon Button and Action Button with custom styling.

For a list of icons, go to [Fluent UI icons](https://developer.microsoft.com/fluentui#/styles/web/icons).

> [!NOTE]
> Component source code and more information in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Icon).

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Icon name` | [Fluent UI Icon](https://uifabricicons.azurewebsites.net/) by name |
| `Icon type` | Renders the icon as an action button, icon button, or icon only. |
| `Text` | Text displayed (action button type only) |
| `Text alignment` | Position of the text (action button type only) |
| `Icon color` | Color of the icon |
| `Icon size` | Size of the icon |
| `Font size` | Size of the font (action button type only) |
| `Font color` | Color of the font |
| `Fill color` | Background fill color of the icon |
| `Border color` | Border color of the icon |
| `Border radius` | Roundness of the corners |

## Additional properties

| Property | Description |
| -------- | ----------- |
| `Hover icon color` | Color of the icon while hovering |
| `Hover font color` | Color of the font while hovering |
| `Hover fill color` | Color of the fill while hovering |
| `Hover border color` | Color of the border while hovering |

## Best practices

See [Fluent UI `Icon` control best practices](https://developer.microsoft.com/fluentui#/controls/web/contextmenu)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]