---
title: SearchBox control reference | Creator Kit
description: Learn about the details and properties of the SearchBox control in the Creator Kit.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/16/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - slaouist
---

# :::no-loc text="SearchBox"::: control (Experimental)

[This article is pre-release documentation and is subject to change.]

A control used to create a search experience.

:::image type="content" source="media/SearchBox.png" alt-text="SearchBox control.":::

## Description

A search box (`SearchBox`) provides an input field for searching within a site or app to find specific items.

This canvas component mimics the style and behavior of the [Fluent UI SearchBox control](https://developer.microsoft.com/fluentui#/controls/web/searchbox).

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `HintText` | The hint text displayed when there's no search text |
| `Default` | Default text displayed when the component is rendered |
| `ClearButton` | Default text displayed when the component is rendered |

### Style properties

| Property | Description |
| -------- | ----------- |
| `Theme` | The Theme object (not Json formatted). See [theming](theme.md) for guidance on how to configure. |

### Output properties

| Property | Description |
| -------- | ----------- |
| `SearchText` | The value of the text in the search box. |

## Behavior

### Configure search behavior

Add this control to your app where a search interface is needed, usually coupled with a gallery, [`DetailsList`](detailslist.md), or any control that can display a dataset.

Create a search experience by using the [Search() or Filter()](/power-apps/maker/canvas-apps/functions/function-filter-lookup) expressions that use the value of the `Text` property in the `SearchBox`.

```powerapps-dot
Search( Accounts, SearchBox.SearchText, "name" )
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]