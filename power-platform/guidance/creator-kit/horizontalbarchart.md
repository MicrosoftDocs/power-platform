---
title: HorizontalBarChart control reference (preview) | Creator Kit
description: Learn about the details and properties of the HorizontalBarChart control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: conceptual
ms.date: 06/01/2022
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

This code component provides a wrapper around the [Fluent UI HorizontalBarChart](https://developer.microsoft.com/en-us/fluentui#/controls/web/horizontalbarchart) control for use in canvas & custom pages.

| Canvas apps | Custom pages | Model-driven apps | Portals |
| ----------- | ------------ | ----------------- | ------- |
| ✅           | ✅            | ⬜                 | ⬜       |

## Configuration

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

### Style Properties

- **Theme** - Accepts a JSON string that is generated using [Fluent UI Theme Designer](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps.
- **AccessibilityLabel** - Screen reader aria-label.

### Example Theme

The following is an example of setting the theme based on the output from the [Fluent UI Theme Designer](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/).

```powerapps-dot
Set(varThemeBlue, {
palette: {
themePrimary: ColorValue("#0078d4"),
themeLighterAlt: ColorValue("#eff6fc"),
themeLighter: ColorValue("#deecf9"),
themeLight: ColorValue("#c7e0f4"),
themeTertiary: ColorValue("#71afe5"),
themeSecondary: ColorValue("#2b88d8"),
themeDarkAlt: ColorValue("#106ebe"),
themeDark: ColorValue("#005a9e"),
themeDarker: ColorValue("#004578"),
neutralLighterAlt: ColorValue("#faf9f8"),
neutralLighter: ColorValue("#f3f2f1"),
neutralLight: ColorValue("#edebe9"),
neutralQuaternaryAlt: ColorValue("#e1dfdd"),
neutralQuaternary: ColorValue("#d0d0d0"),
neutralTertiaryAlt: ColorValue("#c8c6c4"),
neutralTertiary: ColorValue("#a19f9d"),
neutralSecondary: ColorValue("#605e5c"),
neutralPrimaryAlt: ColorValue("#3b3a39"),
neutralPrimary: ColorValue("#323130"),
neutralDark: ColorValue("#201f1e"),
black: ColorValue("#000000"),
white: ColorValue("#ffffff")
}
});

Set(varThemeBlueJSON,"{""palette"":{
""themePrimary"": ""#0078d4"",
""themeLighterAlt"": ""#eff6fc"",
""themeLighter"": ""#deecf9"",
""themeLight"": ""#c7e0f4"",
""themeTertiary"": ""#71afe5"",
""themeSecondary"": ""#2b88d8"",
""themeDarkAlt"": ""#106ebe"",
""themeDark"": ""#005a9e"",
""themeDarker"": ""#004578"",
""neutralLighterAlt"": ""#faf9f8"",
""neutralLighter"": ""#f3f2f1"",
""neutralLight"": ""#edebe9"",
""neutralQuaternaryAlt"": ""#e1dfdd"",
""neutralQuaternary"": ""#d0d0d0"",
""neutralTertiaryAlt"": ""#c8c6c4"",
""neutralTertiary"": ""#a19f9d"",
""neutralSecondary"": ""#605e5c"",
""neutralPrimaryAlt"": ""#3b3a39"",
""neutralPrimary"": ""#323130"",
""neutralDark"": ""#201f1e"",
""black"": ""#000000"",
""white"": ""#ffffff""
}
}");
```

The Theme JSON string is passed to the component property, whilst the varTheme can be used to style other standard components such as buttons using the individual colors.
