---
title: Shimmer control reference | Creator Kit
description: Learn about the details and properties of the Shimmer control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 11/02/2022
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

# :::no-loc text="Shimmer"::: control

A control used to display a loading experience.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Shimmer).

:::image type="content" source="media/shimmer.png" alt-text="Shimmer control.":::

## Description

This code component provides a wrapper around the [Fluent UI Shimmer](https://developer.microsoft.com/en-us/fluentui#/controls/web/shimmer) control bound to a button for use in canvas & custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | The action items to render |
| `Rows` | The action items to render |
| `SpacebetweenShimmer` | Space or Gap between each Shimmer incase of multiple rows. | 

### Items properties

Each Record in the below Table contains can have following values.

| Property | Description |
| -------- | ----------- |
| `ItemKey` | Required. The key to use to indicate specific ShimmerElement. The keys must be unique. |
| `ItemType` | Required. The Shimmer element type from the list of three shimmer elements, i.e. circle, gap & line. |
| `ItemRowKey` | Required. The key to use to indicate the RowKey and establish relationship. |
| `ItemHeight` | Height of ShimmerElement |
| `ItemWidth` | Width of ShimmerElement |
| `ItemVerticalAlign` | To specify how the element should align. i.e. 'top', 'center' or'bottom'. |

Example Power Fx formula:
```
Table({ItemKey:"1",ItemWidth:"3.8",ItemHeight:60,ItemRowKey:"1",ItemType:"circle"},{ItemKey:"2",ItemWidth:"2",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"3",ItemWidth:"20",ItemHeight:10,ItemRowKey:"1",ItemType:"line"},{ItemKey:"4",ItemWidth:"2",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"5",ItemWidth:"2.8",ItemHeight:30,ItemRowKey:"1",ItemType:"line"},{ItemKey:"6",ItemWidth:"2",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"7",ItemWidth:"20",ItemHeight:10,ItemRowKey:"1",ItemType:"line"},{ItemKey:"8",ItemWidth:"1",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"9",ItemWidth:"3.8",ItemHeight:40,ItemRowKey:"1",ItemType:"line"},{ItemKey:"10",ItemWidth:"2",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"11",ItemWidth:"20",ItemHeight:10,ItemRowKey:"1",ItemType:"line"},{ItemKey:"12",ItemWidth:"2",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"13",ItemWidth:"2.8",ItemHeight:30,ItemRowKey:"1",ItemType:"line"},{ItemKey:"14",ItemWidth:"2",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"},{ItemKey:"15",ItemWidth:"20",ItemHeight:10,ItemRowKey:"1",ItemType:"line"},{ItemKey:"16",ItemWidth:"1",ItemHeight:10,ItemRowKey:"1",ItemType:"gap"})
```

### Rows (`rows_Items`) Property value

Each Record in the below Table contains can have following values.

| Property | Description |
| -------- | ----------- |
| `RowKey` | Required. The key to use to indicate specific Shimmer, and when adding sub items. The keys must be unique. |
| `RowOrder` | The order by which the Shimmer should render |
| `RowCount` | Number of Shimmers to render |
| `RowWidth` | Width of Shimmer |

Example Power Fx formula:
```
Table(
    {
        RowKey: "1",
        RowOrder:1,
        RowCount:5,
        RowWidth: 100
    }
)
```

### Style Properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |

#### Example Theme

The Theme JSON string is passed to the component property, whilst the `varTheme` can be used to style other standard components such as buttons using the individual colors.

For more information on the color palette to be used while working with Shimmer, refer `IShimmerColors Interface` section of [IShimmerElement](https://developer.microsoft.com/en-us/fluentui#/controls/web/shimmer#IShimmerElement) documentation.

## Limitations

This code component can only be used in canvas apps and custom pages.


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
