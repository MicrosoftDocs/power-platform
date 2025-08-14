---
title: Icon control reference | Creator Kit
description: Learn about the details and properties of the Icon control in the Creator Kit.
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
# :::no-loc text="Icon"::: control

A control used to display Fluent UI icons.

:::image type="content" source="media/icon.png" alt-text="Icon control.":::

## Description

This control renders Fluent UI icons based on the name. You can use it to easily create an icon button and action button with custom styling.

For a list of icons, go to [Fluent UI icons](https://developer.microsoft.com/fluentui#/styles/web/icons).

## Key properties

| Property | Description |
| -------- | ----------- |
| `ItemIconName` | The Fluent UI icon to use (see [Fluent UI Icons](https://uifabricicons.azurewebsites.net/)) |
| `IconType` | Renders the icon as types `Action button`, `Icon button`, or `Icon only` |
| `IconSize` | The size of the icon (pixels) |
| `Text` | Text displayed (works for type `Action button`) |
| `TextAlignment` | Position of the text (works for types `Action button` and `Icon only`) |
| `Tooltip` | Text displayed in a tooltip when the user hovers over the icon. |


## Additional properties

| Property | Description |
| -------- | ----------- |
| `FontSize` | Size of the font (works for type `Action button`) |
| `IconColor` | Color of the icon |
| `HoverIconColor` | Color of the icon that appears on hover |
| `FontColor` | Color of the font |
| `HoverFontColor` | Color of the font that appears on hover |
| `FillColor` | Color of the background fill of the icon (works for types `Action button` and `Icon button`) |
| `HoverFillColor` | Color of the fill that appears on hover (works for types `Action button` and `Icon button`) |
| `BorderColor` | Color of the border of the icon (works for types `Action button` and `Icon button`) |
| `HoverBorderColor` | The color of the border that appears on hover |
| `BorderRadius` | Roundness of the corners (works for types `Action button` and `Icon button`) |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |
| `InputEvent` |  An event to send to the control. |

## Behavior

- Supports [SetFocus](setfocus.md) as an `InputEvent`.

## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
