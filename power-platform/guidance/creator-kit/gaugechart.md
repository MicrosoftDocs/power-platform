---
title: Gauge chart control reference (preview) | Creator Kit
description: Learn about the details and properties of the Gauge chart control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 06/10/2024
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - mehdis-msft
  - Ramakrishnan24689
---

# :::no-loc text="GaugeChart"::: control (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

There are two types of gauge charts: Speedometer and rating meter.

:::image type="content" source="media/gaugechart.svg" alt-text="GaugeChart control.":::

The speedometer measures a numerical value against a whole, like storage capacity. The needle is an optional component. The color of the segment representing the value being measured can be customized to suit certain scenarios or to align with branding colors.

The rating meter shows status of the current value within a few predefined ranges or segments. The needle is a required component here.

This code component provides a wrapper around the [Fluent UI GaugeChart](https://developer.microsoft.com/en-us/fluentui#/controls/web/gaugechart) control for use in canvas & custom pages.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]
> [!NOTE]
>
> For the full documentation and source code, see [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/GaugeChart).    |

## Properties

The control accepts the following properties:

- **Title** - This value denotes title of the chart.
- **Sublabel** - This value denotes sub label of the chart.
- **ChartValue** - This value denotes the value to be displayed on the gauge.
- **MinValue** - This value denotes the minimum value of the gauge.
- **MaxValue** - This value denotes the maximum value of the gauge.
- **HideMinMax** - This value denotes whether to hide the min and max values on the gauge.
- **HideLegend** - This value denotes whether to hide the legend on the gauge.
- **ChartValueFormat** - This value denotes to show chart value in `Percentage` or `Fraction`.
- **CustomColors** - Set this value to true to allow custom colors on the chart if provided.

- **Items** - The action items to render:
  - **ItemLegend** - The display name of the particular chart data (Item).
  - **ItemSize** - The size of the particular chart data (Item).
  - **ItemColor** - Set the color name or HEX value to be displayed for the particular chart data (Item).

> [!NOTE]
> Item color only applies if the `CustomColors` property is turned on.

### Accessibility

- **AccessibilityLabel** - Screen reader aria-label.

## Usage

### Speedometer

Only one row is needed for `Items`. Use the `ChartValue` to indicate the target position.

```powerapps-dot
Table(
    {
        ItemSize: 15,
        ItemColor: "#3483FA"
    }
)
```

### Rating meter

Provide the ranges as the `Items` property. The sum of all `ItemSize` values must add up to 100% of the difference between the `MinValue` and `MaxValue`. Use the `ChartValue` to indicate the current position.

```powerapps-dot
Table(
    {
        ItemLegend: "Critical",
        ItemSize: 11,
        ItemColor: "#C50F1F"
    },
    {
        ItemLegend: "Warning",
        ItemSize: 25,
        ItemColor: "#F2610C"
    },
    {
        ItemLegend: "No risk",
        ItemSize: 30,
        ItemColor: "#107C10"
    }
)
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
