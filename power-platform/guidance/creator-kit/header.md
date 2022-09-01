---
title: Header control reference | Creator Kit
description: Learn about the details and properties of the Header control in the Creator Kit.
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

# :::no-loc text="Header"::: control (Experimental)

[This article is pre-release documentation and is subject to change.]

A control used to create a navigation experience.

:::image type="content" source="media/header.png" alt-text="Header control.":::

## Description

A `Header` is commonly used to display global app details (e.g., app name or page name) and  navigation actions (e.g., navigation to home or back buttons).

The `Header` component can replace the default Power Apps header if you want different look or behavior.

The Header control should be used with layout containers to make sure the experience is responsive due to its nature of varying width when the app is played.

This canvas component mimics the style and behavior of the default Power Apps header, and can actually replace it (see Behavior section below).

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

## Behavior

## Replace default Power Apps navigation bar with `Header`

If you want to only display the header, you can hide the default navigation bar that is rendered by Power Apps player by sharing the app link with the query parameter `hideNavBar`.

Set the `Width` property to the following expression. The width values can be adjusted based on the resolution of the app.

```powerapps-dot
If( Self.IsExpanded, 200, 46 )
```


## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]