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

# :::no-loc text="SearchBox"::: control

[This article is pre-release documentation and is subject to change.]

A control used to create a search experience.

:::image type="content" source="media/SearchBox.png" alt-text="SearchBox control.":::

## Description

A search box (`SearchBox`) provides an input field for searching within a site or app to find specific items.

This canvas component mimics the style and behavior of the [Fluent UI SearchBox control](https://developer.microsoft.com/fluentui#/controls/web/searchbox).

[View the component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri_msapp_src).

## Limitations

This canvas component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `HintText` | The hint text displayed when there's no text. |
| `Text` | The value of the text in the search box. |

## Configure search behavior

Add the `SearchBox` control to your app where you need a search interface that's coupled with a gallery, `DetailsList`, or some control that can display a dataset.

Create a search experience by using the [Search() or Filter()](/power-apps/maker/canvas-apps/functions/function-filter-lookup) expressions that use the value of the `Text` property in the `SearchBox`.

```powerapps-dot
Search( Accounts, SearchBox.Text, "name" )
```

## Best practices

Go to [Fluent UI SearchBox control best practices](https://developer.microsoft.com/fluentui#/controls/web/searchbox).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]