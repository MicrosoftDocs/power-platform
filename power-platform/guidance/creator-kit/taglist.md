---
title: TagList control reference | Creator Kit
description: Learn about the details and properties of the TagList control in the Creator Kit.
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
  - mehdis-msft
---

# :::no-loc text="TagList"::: control

[This article is pre-release documentation and is subject to change.]

A control used to display data.

:::image type="content" source="media/taglist.png" alt-text="TagList control.":::

## Description

This code component provides a tag list that provides flexible-width rendering bound to a collection.

> [!NOTE]
> You can find component source code and more information at the [Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit).

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | Table with the items |

## Items structure

Each item uses the following schema to visualize data in the component.

| Name | Description |
| ------ | ----------- |
| `ItemDisplayName` | The display name of the command, tab, or menu item. |
| `ItemKey` | The key to use to indicate which item is selected, when adding sub-items. The keys must be unique. |
| `ItemEnabled` | Set to false if the option is disabled. |
| `ItemVisible` | Set to false if the option isn't visible. |
| `ItemChecked` | Set to true if the option is selected (for example, split buttons in a command bar). |
| `ItemIconName` | The Fluent UI icon to use (for more information, go to [Fluent UI icons](icon.md)). |
| `ItemIconColor` | The color to render the icon as (for example, named, RGB, or hex value). |
| `ItemTextColor` | The color of the text inside the tag. |
| `ItemBackgroundColor` | The color of the tag background. |

Example:

  ```powerapps-dot
Table(
    {
    	ItemDisplayName: "Power Apps",
    	ItemKey: "1",
    	ItemEnabled: true,
        ItemChecked: true,
    	ItemIconName: "Powerapps",
    	ItemIconColor: "purple",
    	ItemTextColor: "purple",
    	ItemBackgroundColor: "lightpurple"
    },
    {
    	ItemDisplayName: "Power Automate",
    	ItemKey: "2",
    	ItemEnabled: false,
    	ItemIconName: "MicrosoftFlowLogo",
    	ItemIconColor: "Blue",
    	ItemTextColor: "blue",
    	ItemBackgroundColor: "lightBlue"
    },
    {
    	ItemDisplayName: "Power BI",
    	ItemKey: "3",
    	ItemEnabled: false,
    	ItemIconName: "Powerbilogo",
    	ItemIconColor: "black",
    	ItemTextColor: "black",
    	ItemBackgroundColor: "#fce100"
    }
)
  ```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]