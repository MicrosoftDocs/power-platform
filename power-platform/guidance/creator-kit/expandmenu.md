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

[View component source code and additional documentation in the GitHub repository](https://github.com/microsoft/powercat-creator-kit)

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
| `Icon` | [Fluent UI Icon](https://uifabricicons.azurewebsites.net/) by name |
| `Screen` | App screen that the item will navigate to when pressed. |


Example `Items` property:
```powerapps-dot
Table(
    {
        Label: "Home",
        Icon: "Home",  
        Screen: App.ActiveScreen
    },{
        Label: "Learn", 
        Icon: "Reading", 
        Screen: App.ActiveScreen
    },{
        Label: "Apps", 
        Icon: "App", 
        Screen: App.ActiveScreen
    }
)
``` 
> ![IMPORTANT]
> Replace the Screen values `App.ActiveScreen` with the actual names of the screen in the app.

## Configure expand and collapse behavior
Set the `Width` property to the following expression. The width values can be adjusted based on the resolution of the app.

```powerapps-dot
If( Self.IsExpanded, 200, 46 )
```

## Best Practices
Refer to [Fluent UI Nav control best practices](https://developer.microsoft.com/fluentui#/controls/web/nav)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]