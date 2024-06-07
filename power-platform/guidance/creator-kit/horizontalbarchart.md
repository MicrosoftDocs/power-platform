---
title: HorizontalBarChart control reference (preview) | Creator Kit
description: Learn about the details and properties of the HorizontalBarChart control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: conceptual
ms.date: 06/13/2024
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - mehdis-msft
  - Ramakrishnan24689
---

# :::no-loc text="HorizontalBarChart"::: control (preview)

[This article is pre-release documentation and is subject to change.]

:::image type="content" source="media/horizontalbarchart.svg" alt-text="HorizontalBarChart control.":::

A horizontal bar chart is a chart that presents categorical data with rectangular bars with lengths proportional to the values they represent. This type of chart is particularly useful when the intention is to show comparisons among various categories and the labels for those categories are long.

This code component provides a wrapper around the [Fluent UI HorizontalBarChart](https://developer.microsoft.com/en-us/fluentui#/controls/web/horizontalbarchart) control for use in canvas & custom pages.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/HorizontalBarChart).

## Properties

The control accepts the following properties:

 - **Title** - This denotes title of the chart.
 - **HideLabels** - Set this to true to hide labels on the chart.
 - **BarHeight** - This denotes height of the bar presented in the chart.
 - **HideTooltip** - Set this to true to hide tooltips on the chart.
 - **CustomColors** - Set this to true to allow custom colors on chart if provided.
 - **Variant** - This option allows the chart to be shown in `Absolute scale` or `Part to whole`.
 - **ChartDataMode** - This option provides to show the value of each bar in `Fraction` or `Percentage`.
- **Items** - The action items to render:
  - **ItemTitle** - The Display Name of the particular chart data (Item).
  - **ItemLegend** - The legend associated with the particular chart data (Item).
  - **ItemValue** - Set the value of the particular chart data (Item).
  - **ItemTotalValue** - The total value to be used for the particular chart data (Item).
  - **ItemXPopover** - The X-axis popover text for the particular chart data (Item).
  - **ItemYPopover** - The Y-axis popover text for the particular chart data (Item).
  - **ItemColor** - Set the color name or HEX value to be displayed for the particular chart data (Item).

  Note: Item color will only apply if the `CustomColors` property is turned on.

### Style properties

- **Theme** - Accepts a JSON string that is generated using [Fluent UI Theme Designer](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure.
- **AccessibilityLabel** - Screen reader aria-label.

## Usage

Map data values to the corresponding chart properties in the `Items` property of the control, as demonstrated in the formula below.

Enable the `CustomColors` property to define consistent colors.

```powerapps-dot
Table(
    {
        ItemTitle: "First",
        ItemLegend: "First",
        ItemValue: 40,
        ItemTotalValue: 100,
        ItemXPopOver: "10/2/2024",
        ItemYPopOver: "10%",
        ItemColor: "#00A892"
    },
    {
        ItemTitle: "Second",
        ItemLegend: "Second",
        ItemValue: 20,
        ItemTotalValue: 100,
        ItemXPopOver: "20/4/2024",
        ItemYPopOver: "20%",
        ItemColor: "#9A44FC"
    },
    {
        ItemTitle: "Third",
        ItemLegend: "Third",
        ItemValue: 120,
        ItemTotalValue: 100,
        ItemXPopOver: "10/6/2024",
        ItemYPopOver: "30%",
        ItemColor: "#3483FA"
    },
    {
        ItemTitle: "Fourth",
        ItemLegend: "Fourth",
        ItemValue: 90,
        ItemTotalValue: 100,
        ItemXPopOver: "20/4/2024",
        ItemYPopOver: "40%",
        ItemColor: "#EBA800"
    }
)
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
