---
title: SearchBox control reference | Creator Kit
description: Learn about the details and properties of the SearchBox control in the Creator Kit.
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
---

# :::no-loc text="SearchBox"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to create a search experience.

:::image type="content" source="media/SearchBox.png" alt-text="SearchBox control.":::

## Description

A search box (`SearchBox`) provides an input field for searching within a site or app to find specific items.

This code component provides a wrapper around the [Fluent UI SearchBox](https://developer.microsoft.com/en-us/fluentui#/controls/web/searchbox) control for use in canvas & custom pages.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

## Key properties

| Property | Description |
| -------- | ----------- |
| `SearchText` | Text that is input by the user. Refer to this as the input for search functions. |
| `IconName` | Name of the Fluent UI icon (see [Fluent UI Icons](https://developer.microsoft.com/en-us/fluentui#/styles/web/icons)). |
| `Underlined` | Whether or not the SearchBox is underlined. |
| `DisableAnimation` | Whether or not to animate the SearchBox icon on focus. |
| `PlaceholderText` | Placeholder for the search box. |

### Additional properties

| Property | Description |
| -------- | ----------- |
| `Theme` | The Theme object (not Json formatted). See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label. |
| `InputEvent` | An event to send to the control. E.g. `SetFocus`. |

## Example

### Configure search behavior

Add this control to your app where a search interface is needed, usually coupled with a gallery, [`DetailsList`](detailslist.md), or any control that can display a dataset.

Create a search experience by using the [Search() or Filter()](/power-apps/maker/canvas-apps/functions/function-filter-lookup) expressions that use the value of the `SearchText` property in the `SearchBox`.

```power-fx
Search( Accounts, SearchBox.SearchText, "name" )
```

## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
