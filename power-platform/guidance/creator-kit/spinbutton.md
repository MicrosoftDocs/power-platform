---
title: SpinButton control reference (preview) | Creator Kit
description: Learn about the details and properties of the SpinButton control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 01/30/2023
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
  - Ramakrishnan24689
---

# :::no-loc text="SpinButton"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to accept user input.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/SpinButton).

:::image type="content" source="media/spinbutton.png" alt-text="SpinButton control.":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

## Description
A spin button (`SpinButton`) allows someone to incrementally adjust a value in small steps. It’s mainly used for numeric values, but other values are supported too.

This code component provides a wrapper around the [Fluent UI SpinButton](https://developer.microsoft.com/en-us/fluentui#/controls/web/spinbutton) control for use in canvas & custom pages.


## Key properties

| Name                 | Description | 
|----------------------|-------------|
| `Label` | Descriptive label for the control. |
| `IconName` | Name of the Fluent UI icon (see [Fluent UI Icons](https://developer.microsoft.com/en-us/fluentui#/styles/web/icons)). |
| `Min` | Max value of the control. If not provided, the control has no maximum value. |
| `Max` | Min value of the control. If not provided, the control has no minimum value. |
| `Step` | Difference between two adjacent values of the control. This value is used to calculate the precision of the input if no precision is given. The precision calculated this way will always be >= 0. |
| `Value` | Current value of the control. |
| `DefaultValue` | Initial value of the control when first rendered. |
| `Suffix` | Suffix to define any unit (e.g. cm, kg, ml) |

## Additional properties

| Name                 | Description | 
|----------------------| ------------|
| `AccessibilityLabel` | Screen reader aria-label |
| `InputEvent`         | An event to send to the control. E.g. `SetFocus`. See below. |
| `Theme`              | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. |

## Behavior

- Supports [SetFocus](setfocus.md) as an `InputEvent`.

## Example

### Connecting SpinButton to an Edit Form data card

1. Unlock the data card
1. Hide the default control for the field
1. Add the SpinButton into the data card
1. Update the `Update` property of the data card to reference the `SpinButton.Value` output property

## Limitations
This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
