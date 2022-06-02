---
title: ExpandMenu control reference | Creator Kit
description: Learn about the details and properties of the ExpandMenu control in the Creator Kit.
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

# :::no-loc text="ExpandMenu"::: control

[This article is pre-release documentation and is subject to change.]

A control used to create a navigation experience.

:::image type="content" source="media/expandmenu.png" alt-text="ExpandMenu control.":::

## Description

Expand menus are like `Nav` components used to provide navigation, which consists of links to the main areas of an app or site. You can also expand and collapse the menu, which gives the user an option for more space if they want it. The ExpandMenu control should be used with layout containers to make sure the experience is responsive due to its nature of varying width during runtime.<!--note from editor: What does "during runtime" refer to - the responsive experience or the varying width? I can't picture what this is saying.-->

This canvas component mimics the style and *limited* behavior of the [Fluent UI Nav control](https://developer.microsoft.com/fluentui#/controls/web/Nav).

> [!NOTE]
> You can find component source code and more information at the [Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit).

## Limitations

This canvas component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Width` | The width of the control. |
| `Items` | A dataset that displays items in the menu. |
| `OnExpandSelect` | Action expression triggered when the hamburger (three horizontal lines) button is selected. |
| `OnButtonSelect` | Action expression triggered when any of the buttons are selected. |

## Items dataset

| Property | Description |
| -------- | ----------- |
| `Label` | The text to display in the menu item. |
| `Icon` | [Fluent UI Icon](https://uifabricicons.azurewebsites.net/) by name |
| `Screen` | App screen that the item will navigate to when selected. |

Example `Items` property:

```powerapps-dot
Table(
    {
        Icon: "PowerApps", 
        Label: "Power Apps", 
        Screen:PowerAppsScreen
    },{
        Icon: "PowerBILogo", 
        Label: "Power BI", 
        Screen:PowerBIScreen
    },{
        Icon: "PowerAutomateLogo", 
        Label: "Power Automate", 
        Screen:PowerAutomateScreen
    },{
        Icon: "Dataverse", 
        Label: "Dataverse", 
        Screen:DataverseScreen
    }
)
```

> [!IMPORTANT]
> The screen values in the preceding example code are from a sample, and might not exist in your app. Ensure that you replace the screen values with screen names in your app, as appropriate.

## Configure expand and collapse behavior

Set the `Width` property to the following expression. The width values can be adjusted based on the resolution of the app.

```powerapps-dot
If( Self.IsExpanded, 200, 46 )
```

## Best practices

Go to [Fluent UI Nav control best practices](https://developer.microsoft.com/fluentui#/controls/web/nav).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]