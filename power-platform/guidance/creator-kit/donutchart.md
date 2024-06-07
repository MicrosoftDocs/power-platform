---
title: DonutChart control reference (preview) | Creator Kit
description: Learn about the details and properties of the Donut chart control in the Creator Kit.
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

# :::no-loc text="DonutChart"::: control (preview)

[This article is pre-release documentation and is subject to change.]

:::image type="content" source="media/donutchart.svg" alt-text="DonutChart control.":::

Donut charts are used to show proportion, which expresses a partial value in comparison to a total value. These types of charts are best to show percentage of individual parts in comparison to a whole, where the change over time is not important to visualize. They are circular statistical graphics divided into slices to illustrate numerical proportion.

This code component provides a wrapper around the [Fluent UI DonutChart](https://developer.microsoft.com/en-us/fluentui#/controls/web/donutchart) control for use in canvas & custom pages.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/DonutChart).

## Properties

The control accepts the following properties:

 - **Title** - This denotes title of the chart.
 - **HideLabel** - This denotes whether to show or hide labels on the chart.
 - **HideTooltip** - This denotes whether to show or hide tooltips on the chart.
 - **ShowLabelsInPercentage** - This denotes whether to show labels in percentage.
 - **InnerRadius** - Set the value for inner radius of the donut chart.
 - **ValueInsideDonut** - This denotes to value to be shown inside the donut chart.
 - **CustomColors** - This denotes to show custom colors on chart if provided

- **Items** - The action items to render
  - **ItemTitle** - The Display Name of the particular chart data(Item).
  - **ItemKey** - The key to use to identify the Item. The keys must be unique.
  - **ItemValue** - Set the value of the particular chart data(Item).
  - **ItemColor** - Set the color name or HEX value to be displayed for the particular chart data(Item).

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
        ItemLegend: "First",
        ItemValue: 60,
        ItemColor:"#00A892"
    },
    {
        ItemLegend: "Second",
        ItemValue: 10,
        ItemColor:"#9A44FC"
    },
    {
        ItemLegend: "Third",
        ItemValue: 30,
        ItemColor:"#3483FA"
    }
)
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
