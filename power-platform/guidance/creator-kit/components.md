---
title: "Overview of the Creator Kit components | MicrosoftDocs"
description: "Learn about the manifest of the Creator Kit components and assets."
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
  - slaouist
---

# Overview of the Creator Kit components

[This article is pre-release documentation and is subject to change.]

The following table lists the components included with the Creator Kit, and describes whether the component has Fluent UI and which app type supports it&mdash;canvas apps, custom pages, or model-driven apps.

Release status key:
- **Shipped**: Stable release, ready for production use.
- **Preview**: Stable release but subject to change. Not ready for production use.
- **Experimental**: This feature is a work in progress. Not ready for production use.

| Code component | Type | Overview | Fluent UI | Canvas apps | Custom pages | Model-driven apps | Release status |
| ---------------------------------------- | -------------- | ------------------------------------------------------------ | --------- | ----------- | ------------ | ----------------- | - |
| **`AutoWidthLabel`**<br>[aka.ms/ck/autowidthlabel](autowidthlabel.md) | User interface | Has behavior similar to the standard canvas app label, but expands dynamically in width to accommodate the text. This functionality is currently not supported in canvas apps today. | No | Yes | Yes| No | Shipped |
| **`Breadcrumb`**<br>[aka.ms/ck/breadcrumb](breadcrumb.md) | User Interface | Provides a wrapper around the [Fluent UI `Breadcrumb`](https://developer.microsoft.com/fluentui#/controls/web/breadcrumb) control. | Yes | Yes | Yes| No | Shipped |
| **`Calendar`**<br>[aka.ms/ck/calendar](calendar.md) | User Interface | Provides a wrapper around the [Fluent UI `Calendar`](https://developer.microsoft.com/fluentui#/controls/web/calendar) control. | Yes | Yes | Yes| No | Shipped |
| **`ContextMenu`**<br>[aka.ms/ck/contextmenu](contextmenu.md) | User Interface | Provides a wrapper around the [Fluent UI `ContextMenu`](https://developer.microsoft.com/fluentui#/controls/web/contextualmenu) control bound to a button for use in canvas apps and custom pages. | Yes | Yes | Yes| No | Shipped |
| **`CommandBar`**<br>[aka.ms/ck/commandbar](commandbar.md) | User Interface | Provides a wrapper around the [Fluent UI `CommandBar`](https://developer.microsoft.com/fluentui#/controls/web/commandbar) control. | Yes | Yes | Yes| No | Shipped |
| **`DetailsList`**<br>[aka.ms/ck/detailslist](detailslist.md) | User Interface | Allows the use of the [Fluent UI `DetailsList` component](https://developer.microsoft.com/fluentui#/controls/web/detailslist). | Yes | Yes | Yes| No | Shipped |
| **`DonutChart`**<br>[aka.ms/ck/donutchart](donutchart.md) | User Interface | Allows the use of the [Fluent UI `DonutChart` component](https://developer.microsoft.com/fluentui#/controls/web/donutchart). | Yes | Yes | Yes| No | Preview |
| **`Dialog`**<br>[aka.ms/ck/dialog](dialog.md) | User Interface | Mimics the style and behavior of the [Fluent UI `Dialog` component](https://developer.microsoft.com/fluentui#/controls/web/dialog). | Yes | Yes | Yes| No | Experimental |
| **`Elevation`**<br>[aka.ms/ck/elevation](elevation.md) | User Interface | Provides Fluent UI elevation support with mouse hover events. | Yes | Yes | Yes | No | Shipped |
| **`ExpandMenu`**<br>[aka.ms/ck/expandmenu](expandmenu.md) | User Interface | Provides an expandable menu interface (also known as hamburger menu). | No | Yes | Yes | No | Experimental |
| **`Facepile`**<br>[aka.ms/ck/facepile](facepile.md) | User Interface | Provides a wrapper around the [Fluent UI `Facepile`](https://developer.microsoft.com/fluentui#/controls/web/facepile) control. | Yes | Yes | Yes| No | Shipped |
| **`GaugeChart`**<br>[aka.ms/ck/gaugechart](gaugechart.md) | User Interface | Provides a wrapper around the [Fluent UI `GaugeChart`](https://developer.microsoft.com/fluentui#/controls/web/gaugechart) control. | Yes | Yes | Yes| No | Preview |
| **`HorizontalBarChart`**<br>[aka.ms/ck/horizontalbarchart](horizontalbarchart.md) | User Interface | Provides a wrapper around the [Fluent UI `HorizontalBarChart`](https://developer.microsoft.com/fluentui#/controls/web/horizontalbarchart) control. | Yes | Yes | Yes| No | Preview |
| **`HorizontalBarChart-Stacked`**<br>[aka.ms/ck/stackedbarchart](stackedbarchart.md) | User Interface | Provides a wrapper around the [Fluent UI `HorizontalBarChart-Stacked`](https://developer.microsoft.com/en-us/fluentui#/controls/web/horizontalbarchart/stackedbarchart) control. | Yes | Yes | Yes| No | Preview |
| **`Icon`**<br>[aka.ms/ck/icon](icon.md) | User Interface | Fluent UI [font icon](https://developer.microsoft.com/fluentui#/controls/web/icon), icon button, and action button with custom styling. | Yes | Yes | Yes| No | Shipped |
| **`KeyboardShortcuts`**<br>[aka.ms/ck/keyboardshortcuts](keyboardshortcuts.md) | Utility | Registers keypress event handlers to allow keyboard shortcuts to be used inside canvas apps. | No | Yes | No | No | Shipped |
| **`Nav`**<br>[aka.ms/ck/nav](nav.md) | User Interface | Provides a wrapper around the [Fluent UI `Nav` component](https://developer.microsoft.com/fluentui#/controls/web/nav) control bound to a button for use in canvas apps and custom pages. | Yes | Yes | Yes| No | Shipped |
| **`Panel`**<br>[aka.ms/ck/panel](panel.md) | User Interface | Mimics the style and behavior of the [Fluent UI `Panel` component](https://developer.microsoft.com/fluentui#/controls/web/panel) from inside canvas apps and custom pages. | Yes | Yes | Yes| No | Experimental |
| **`PeoplePicker`**<br>[aka.ms/ck/peoplepicker](peoplepicker.md) | User Interface| Provides a wrapper around the [Fluent UI `PeoplePicker`](https://developer.microsoft.com/fluentui#/controls/web/peoplepicker) control. | Yes | Yes | Yes| No | Preview |
| **`Persona`**<br>[aka.ms/ck/persona](persona.md) | User Interface | Provides a wrapper around the [Fluent UI `Persona`](https://developer.microsoft.com/fluentui#/controls/web/persona) control. | Yes | Yes | Yes| No | Preview |
| **`Picker`**<br>[aka.ms/ck/picker](picker.md) | User Interface | Provides Fluent UI Tag Picker support with custom item styling to allow for color and icon tags. | Yes | Yes | Yes| No | Shipped |
| **`Pivot`**<br>[aka.ms/ck/pivot](pivot.md) | User Interface | Wraps the [Fluent UI `Pivot` control](https://developer.microsoft.com/fluentui#/controls/web/pivot) for use in canvas apps and custom pages. | Yes | Yes | Yes| No | Shipped |
| **`ProgressIndicator`**<br>[aka.ms/ck/progressindicator](progressindicator.md) | User Interface | Mimics the style and behavior of the [Fluent UI `ProgressIndicator` component](https://developer.microsoft.com/fluentui#/controls/web/progressindicator) from inside canvas apps and custom pages. | Yes | Yes | Yes| No | Shipped |
| **`ResizableTextArea`**<br>[aka.ms/ck/resizabletextarea](resizabletextarea.md) | User interface | A text area control that the user can resize by using a handle in the lower-right corner. Can be styled to look like either the classic, Fluent UI, or model-driven text field controls. | No | Yes | Yes | Yes | Shipped |
| **`SearchBox`**<br>[aka.ms/ck/searchbox](searchbox.md) | User Interface | Provides a wrapper around the [Fluent UI SearchBox](https://developer.microsoft.com/en-us/fluentui#/controls/web/searchbox) control for use in canvas & custom pages. | Yes | Yes | Yes | No | Preview |
| **`Shimmer`**<br>[aka.ms/ck/shimmer](shimmer.md) | User Interface | Provides a wrapper around the [Fluent UI `Shimmer`](https://developer.microsoft.com/fluentui#/controls/web/shimmer) control for use in canvas apps and custom pages. | Yes | Yes | Yes | No | Shipped |
| **`SpinButton`**<br>[aka.ms/ck/spinbutton](spinbutton.md) | User Interface | Provides a wrapper around the [Fluent UI `SpinButton`](https://developer.microsoft.com/fluentui#/controls/web/spinbutton) control for use in canvas apps and custom pages. | Yes | Yes | Yes | No | Preview |
| **`Spinner`**<br>[aka.ms/ck/spinner](spinner.md) | User Interface | Mimics the style and behavior of the [Fluent UI `Spinner` component](https://developer.microsoft.com/fluentui#/controls/web/spinner) from inside canvas apps and custom pages. | Yes | Yes | Yes| No | Shipped |
| **`SubwayNav`**<br>[aka.ms/ck/subwaynav](subwaynav.md) | User Interface | Provides a wrapper around the [Office 365 Admin SubwayNav](https://admincontrolsdemoapps.blob.core.windows.net/release/admin-controls/45.0.2/index.html#/examples/subwaynav) control for use in canvas & custom pages. | Yes | Yes | Yes| No | Preview |
| **`TagList`**<br>[aka.ms/ck/taglist](taglist.md) | User Interface | Provides a tag list that provides flexible-width rendering bound to a collection. | Yes | Yes | Yes| No | Shipped |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
