---
title: "Overview of the Creator Kit components | MicrosoftDocs"
description: "Learn about the manifest of the Creator Kit components and assets."
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
  - demora-msft
  - mehdis-msft
---

# Overview of the Creator Kit components

The following table describes the components included with the Creator Kit.

The table also describes whether the component has Fluent UI, and the supported app type such as canvas apps, custom pages, or model-driven apps.

| Code component | Type | Overview | Fluent UI | Canvas apps | Custom pages | Model-driven apps |
| ---------------------------------------- | -------------- | ------------------------------------------------------------ | --------- | ----------- | ------------ | ----------------- |
| [`AutoWidthLabel`](autowidthlabel.md) | User interface | This code component acts similar to the standard canvas app label, but will expand dynamically in width to accommodate the text. This functionality is currently not supported in canvas apps today. | &cross; | &check; | &check;| &cross; |
| [`Breadcrumb`](breadcrumb.md) | User Interface | This code component provides a wrapper around the [Fluent UI `Breadcrumb`](https://developer.microsoft.com/fluentui#/controls/web/breadcrumb) control for use in canvas and custom pages. | &check; | &check; | &check;| &cross; |
| [`ContextMenu`](contextmenu.md) | User Interface | This code component provides a wrapper around the [Fluent UI `ContextMenu`](https://developer.microsoft.com/fluentui#/controls/web/contextualmenu) control bound to a button for use in canvas and custom pages. | &check; | &check; | &check;| &cross; |
| [`CommandBar`](commandbar.md) | User Interface | This code component provides a wrapper around the [Fluent UI `CommandBar`](https://developer.microsoft.com/fluentui#/controls/web/commandbar) control for use in canvas and custom pages. | &check; | &check; | &check;| &cross; |
| [`DetailsList`](detailslist.md) | User Interface | The DetailsList code component allows using of the [Fluent UI `DetailsList` component](https://developer.microsoft.com/fluentui#/controls/web/detailslist) from inside canvas apps and custom pages. | &check; | &check; | &check;| &cross; |
| [`Elevation`](elevation.md) | User Interface | Fluent UI elevation support with mouse hover events. | &check; | &check; | &check; | &cross; |
| [`Icon`](icon.md) | User Interface | Fluent UI [Font Icon](https://developer.microsoft.com/fluentui#/controls/web/icon)/ Icon Button and Action Button with custom styling. | &check; | &check; | &check;| &cross; |
| [`KeyboardShortcuts`](keyboardshortcuts.md) | Utility | Registers key press event handlers to allow keyboard short cuts to be used inside canvas apps. | &cross; | &check; | &cross; | &cross; |
| [`Nav`](nav.md) | User Interface | This code component provides a wrapper around the [Fluent UI `Nav` component](https://developer.microsoft.com/fluentui#/controls/web/nav) control bound to a button for use in canvas and custom pages. | &check; | &check; | &check;| &cross; |
| [`Picker`](picker.md) | User Interface | Fluent UI Tag Picker support with custom item styling to allow for color/icons tags. | &check; | &check; | &check;| &cross; |
| [`Pivot`](pivot.md) | User Interface | This code component wraps the [Fluent `Pivot` control](https://developer.microsoft.com/fluentui#/controls/web/pivot) for use in canvas and custom pages. | &check; | &check; | &check;| &cross; |
| [`ResizableTextArea`](resizabletextarea.md) | User interface | A text area control that can be resized by the user using handle on the bottom right corner. Can be styled to look like either the classic, fluent or model-driven text field controls. | &cross; | &check; | &check; | &check; |
| [`TagList`](taglist.md) | User Interface | This code component provides a Tag List that provides flexible width rendering bound to a collection. | &check; | &check; | &check;| &cross; |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]