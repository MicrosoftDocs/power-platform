---
title: HorizontalBarChart - Stacked control reference (preview) | Creator Kit
description: Learn about the details and properties of the HorizontalBarChart - Stacked control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: conceptual
ms.date: 06/01/2024
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

# :::no-loc text="HorizontalBarChart - Stacked"::: control (preview)

[This article is pre-release documentation and is subject to change.]

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/StackedBarChart).

:::image type="content" source="media/stackedchart.svg" alt-text="HorizontalBarChart - Stacked control.":::

Horizontal stacked bar chart displays multiple series of data as stacked bars, with each bar representing a category. The bars are stacked alongside each other, with the length of each bar representing the value of the category of the series.

This code component provides a wrapper around the [Fluent UI HorizontalBarChart - Stacked](https://developer.microsoft.com/en-us/fluentui#/controls/web/horizontalbarchart/stackedbarchart) control for use in canvas & custom pages.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/StackedBarChart).

## Properties

The control accepts the following properties:

 - **Title** - This denotes title of the chart.
 - **HideLegend** - This denotes whether to show or hide legends on the chart.
 - **BarHeight** - This denotes height of the bar presented in the chart.
 - **HideTooltip** - This denotes whether to show or hide tooltips on the chart.
 - **CustomColors** - This denotes to show custom colors on chart if provided
- **Items** - The action items to render
  - **ItemTitle** - The Display Name of the particular chart data(Item).
  - **ItemKey** - The key to use to identify the Item. The keys must be unique.
  - **ItemValue** - Set the value of the particular chart data(Item).
  - **ItemColor** - Set the color name or HEX value to be displayed for the particular chart data(Item).
  - **ItemCallout** - Set the value to be displayed on a popover/tooltip.

  Note: Item color will only apply if `CustomColors` property is turned on.

### Style properties

- **Theme** - Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure.
- **AccessibilityLabel** - Screen reader aria-label

## Usage

Map data values to the corresponding chart properties in the `Items` property of the control, as demonstrated in the below formula. The chart will automatically adjust the visual to match the relative values.

Enable the `CustomColors` property to define consistent colors.

```powerapps-dot
Table(
    {
        ItemKey: "1",
        ItemTitle: "First",
        ItemCallout:"First item callout title",
        ItemValue: 40,
        ItemColor: "#00A892"
    },
    {
        ItemKey: "2",
        ItemTitle: "Second",
        ItemCallout:"Second item callout title",
        ItemValue: 20,
        ItemColor: "#9A44FC"
    },
    {
        ItemKey: "3",
        ItemTitle: "Third",
        ItemCallout:"Third item callout title",
        ItemValue: 120,
        ItemColor: "#3483FA"
    },
    {
        ItemKey: "4",
        ItemTitle: "Fourth",
        ItemCallout:"Fourth item callout title",
        ItemValue: 90,
        ItemColor: "#EBA800"
    }
)
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
