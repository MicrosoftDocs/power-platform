---
title: ExpandMenu control reference | Creator Kit
description: Learn about the details and properties of ExpandMenu control in the Creator Kit.
author: denisem-msft
manager: devkeydet

ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/06/2022
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
# :::no-loc text="ExpandMenu"::: control

A control used to create a navigation experience.

:::image type="content" source="media/expandmenu.png" alt-text="ExpandMenu control.":::

## Description

Expand menus are like `Nav` components used to provide navigation, which provide links to the main areas of an app or site. It also provides the ability to expand and collapse the menu, which gives the user an option for more space if desired. It should be used in conjunction with layout containers to make sure the experience is responsive due to it's nature of varying width during runtime.

This Canvas component mimics the style and *limited* behavior of the [Fluent UI Nav control](https://developer.microsoft.com/fluentui#/controls/web/Nav).

[View component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/CanvasApps/cat_powercatcomponentlibrary_0be3a_DocumentUri_msapp_src)

## Limitations
This Canvas component can only be used in Canvas apps and Custom Pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Width` | The width of the control. |
| `Items` | A data set that displays items in the menu. |
| `OnExpandSelect` | Action expression triggered when the hamburger (three horizontal lines) button is selected. |
| `OnButtonSelect` | Action expression triggered when any of the buttons are selected. |

## Items dataset
| Property | Description |
| -------- | ----------- |
| `Label` | The text to display in the menu item. | 
| `Icon` | Image displayed next to the item label. |

Images can either be links to publicly hosted 

## Configure expand and collapse behavior
Add the `ExpandMenu` control to the desired location, usually on the left-hand side of the screen. Control the width of the menu with a variable, and set the width based on the value of that variable. A default width to show all the icons is 34.

In the `OnExpandSelect` property:
```powerapps-dot
UpdateContext({ expandCollapseMenu: !expandCollapseMenu })
```
In the `Width` property:
```powerapps-dot
If( expandCollapseMenu, 400, 34 )
```

## Best Practices
Refer to [Fluent UI Nav control best practices](https://developer.microsoft.com/fluentui#/controls/web/nav)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]