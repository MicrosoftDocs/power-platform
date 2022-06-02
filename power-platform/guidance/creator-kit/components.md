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
  - slaouist
---

# Overview of the Creator Kit components

[This article is pre-release documentation and is subject to change.]

The following table lists the components included with the Creator Kit, and describes whether the component has Fluent UI and which app type supports it&mdash;canvas apps, custom pages, or model-driven apps.
<!--note from editor: In the following table, I made the wording of the Overview column parallel. Also changed the "cross" and "check" symbols to "yes" and "no" because the screen reader (Windows Narrator) didn't read the symbols at all.-->
| Code component | Type | Overview | Fluent UI | Canvas apps | Custom pages | Model-driven apps |
| ---------------------------------------- | -------------- | ------------------------------------------------------------ | --------- | ----------- | ------------ | ----------------- |
| [`AutoWidthLabel`](autowidthlabel.md) | User interface | Has behavior similar to the standard canvas app label, but expands dynamically in width to accommodate the text. This functionality is currently not supported in canvas apps today. | No | Yes | Yes| No |
| [`Breadcrumb`](breadcrumb.md) | User Interface | Provides a wrapper around the [Fluent UI `Breadcrumb`](https://developer.microsoft.com/fluentui#/controls/web/breadcrumb) control for use in canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`ContextMenu`](contextmenu.md) | User Interface | Provides a wrapper around the [Fluent UI `ContextMenu`](https://developer.microsoft.com/fluentui#/controls/web/contextualmenu) control bound to a button for use in canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`CommandBar`](commandbar.md) | User Interface | Provides a wrapper around the [Fluent UI `CommandBar`](https://developer.microsoft.com/fluentui#/controls/web/commandbar) control for use in canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`DetailsList`](detailslist.md) | User Interface | Allows the use of the [Fluent UI `DetailsList` component](https://developer.microsoft.com/fluentui#/controls/web/detailslist) from inside canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`Dialog`](dialog.md) | User Interface | Mimics the style and behavior of the [Fluent UI `Dialog` component](https://developer.microsoft.com/fluentui#/controls/web/dialog) from inside canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`Elevation`](elevation.md) | User Interface | Provides Fluent UI elevation support with mouse hover events. | Yes | Yes | Yes | No |
| [`ExpandMenu`](expandmenu.md) | User Interface | A canvas component that provides a navigation interface. | No | Yes | Yes | No |
| [`Icon`](icon.md) | User Interface | Fluent UI [font icon](https://developer.microsoft.com/fluentui#/controls/web/icon), icon button, and action button with custom styling. | Yes | Yes | Yes| No |
| [`KeyboardShortcuts`](keyboardshortcuts.md) | Utility | Registers keypress event handlers to allow keyboard shortcuts to be used inside canvas apps. | No | Yes | No | No |
| [`Nav`](nav.md) | User Interface | Provides a wrapper around the [Fluent UI `Nav` component](https://developer.microsoft.com/fluentui#/controls/web/nav) control bound to a button for use in canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`Panel`](panel.md) | User Interface | Mimics the style and behavior of the [Fluent UI `Panel` component](https://developer.microsoft.com/fluentui#/controls/web/panel) from inside canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`Picker`](picker.md) | User Interface | Provides Fluent UI Tag Picker support with custom item styling to allow for color and icon tags.<!--note from editor: Is this what "color/icons tags" means? Also, the article doesn't refer to either, is that okay?--> | Yes | Yes | Yes| No |
| [`Pivot`](pivot.md) | User Interface | Wraps the [Fluent UI `Pivot` control](https://developer.microsoft.com/fluentui#/controls/web/pivot) for use in canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`ProgressIndicator`](progressindicator.md) | User Interface | Mimics the style and behavior of the [Fluent UI `ProgressIndicator` component](https://developer.microsoft.com/fluentui#/controls/web/progressindicator) from inside canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`ResizableTextArea`](resizabletextarea.md) | User interface | A text area control that the user can resize by using a handle in the lower-right corner. Can be styled to look like either the classic, Fluent UI, or model-driven text field controls. | No | Yes | Yes | Yes |
| [`SearchBox`](searchbox.md) | User Interface | Mimics the style and behavior of the [Fluent UI `SearchBox` component](https://developer.microsoft.com/fluentui#/controls/web/searchbox) from inside canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`Spinner`](spinner.md) | User Interface | Mimics the style and behavior of the [Fluent UI `Spinner` component](https://developer.microsoft.com/fluentui#/controls/web/spinner) from inside canvas apps and custom pages. | Yes | Yes | Yes| No |
| [`TagList`](taglist.md) | User Interface | Provides a tag list that provides flexible-width rendering bound to a collection. | Yes | Yes | Yes| No |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]