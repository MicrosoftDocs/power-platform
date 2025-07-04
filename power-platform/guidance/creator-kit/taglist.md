---
title: TagList control reference | Creator Kit
description: Learn about the details and properties of the TagList control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 05/16/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - mehdis-msft
---

# :::no-loc text="TagList"::: control

A control used to display data.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/TagList).

:::image type="content" source="media/taglist.png" alt-text="TagList control.":::

## Description

This code component provides a tag list that provides flexible-width rendering bound to a collection.

## Properties

### Key properties

| Property | Description |
| -------- | ----------- |
| `SelectedKey` |  The key to select. This will be updated via the **OnChange** event when the user interacts with the control. |
| `Items` |  The action items to render |

#### `Items` properties

Each item uses the following schema to visualize data in the component.

| Name | Description |
| ------ | ----------- |
  | `ItemDisplayName` |  The Display Name of the command/tab/menu item |
  | `ItemKey` |  The key to use to indicate which item is selected, and when adding sub items. The keys must be unique. |
  | `ItemIconName` |  The Fluent UI icon to use (see [Fluent UI icons](https://developer.microsoft.com/en-us/fluentui#/styles/web/icons)) |
  | `ItemIconColor` |  The color to render the icon as (e.g. named, rgb or hex value) |
  | `ItemTextColor` |  The color of the text inside the tag |
  | `ItemBackgroundColor` |  The color of the tag background |

Example:

  ```power-fx
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

### Style properties

| Name | Description |
| ------ | ----------- |
| `Theme` |  Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` |  Screen reader aria-label |

### Event properties

| Name | Description |
| ------ | ----------- |
| `InputEvent` |  An event to send to the control (E.g. `SetFocus`) |

## Behavior

Supports [SetFocus](setfocus.md) as an `InputEvent`.


  ## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
