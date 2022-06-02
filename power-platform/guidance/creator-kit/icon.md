---
title: Icon control reference | Creator Kit
description: Learn about the details and properties of the Icon control in the Creator Kit.
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

This control renders Fluent UI icons based on the name. You can use it to easily create an icon button and action button with custom styling.

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
| `Icon color` | The color of the icon |
| `Icon size` | The size of the icon |
| `Font size` | The size of the font (action button type only) |
| `Font color` | The color of the font |
| `Fill color` | The color of the background fill of the icon |
| `Border color` | The color of the border of the icon |
| `Border radius` | The roundness of the corners |

## Additional properties
<!--note from editor: The "on hover" wording is from the Writing Style Guide. "While hovering" was a bit ambiguous as to the agent of action.-->
| Property | Description |
| -------- | ----------- |
| `Hover icon color` | The color of the icon that appears on hover |
| `Hover font color` | The color of the font that appears on hover |
| `Hover fill color` | The color of the fill that appears on hover |
| `Hover border color` | The color of the border that appears on hover |

## Best practices

Go to [Fluent UI Icon control best practices](https://developer.microsoft.com/fluentui#/controls/web/icon).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]