---
title: HorizontalBarChart - Stacked control reference (preview) | Creator Kit
description: Learn about the details and properties of the HorizontalBarChart - Stacked control in the Creator Kit.
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

# :::no-loc text="HorizontalBarChart - Stacked"::: control (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Horizontal stacked bar chart displays multiple series of data as stacked bars, with each bar representing a category. The bars are stacked alongside each other, with the length of each bar representing the value of the category of the series.

:::image type="content" source="media/stackedchart.svg" alt-text="HorizontalBarChart - Stacked control.":::

This code component provides a wrapper around the [Fluent UI HorizontalBarChart - Stacked](https://developer.microsoft.com/en-us/fluentui#/controls/web/horizontalbarchart/stackedbarchart) control for use in canvas & custom pages.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

> [!NOTE]
> For the full documentation and source code, see [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/StackedBarChart).

## Properties

The control accepts the following properties:

- **HideLegend** - This value denotes whether to show or hide legends on the chart.
- **BarHeight** - This value denotes height of the bar presented in the chart.
- **HideTooltip** - This option controls whether to show or hide tooltips on the chart.
- **CustomColors** - This option is used to show custom colors on the chart if provided

- **Items** - The action items to render
  - **ItemTitle** - The Display Name of the particular chart data(Item).
  - **ItemKey** - The key to use to identify the Item. The keys must be unique.
  - **ItemValue** - Set the value of the particular chart data(Item).
  - **ItemColor** - Set the color name or HEX value to be displayed for the particular chart data(Item).
  - **ItemCallout** - Set the value to be displayed on a popover/tooltip.

> [!NOTE]
> Item color only applies if the `CustomColors` property is turned on.

### Accessibility

- **AccessibilityLabel** - Screen reader aria-label

## Usage

Map data values to the corresponding chart properties in the `Items` property of the control, as demonstrated in the below formula. The chart automatically adjusts the visual to match the relative values.

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
