---
title: Pivot control reference | Creator Kit
description: Learn about the details and properties of the Pivot control in the Creator Kit.
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

# :::no-loc text="Pivot"::: control

[This article is pre-release documentation and is subject to change.]

A control used to provide navigation.

:::image type="content" source="media/pivot.png" alt-text="Pivot control.":::

## Description

The `Pivot` control and related tabs pattern are used for navigating frequently accessed, distinct content categories. Pivots allow for navigation between two or more content views and rely on text headers to articulate the different sections of content.

This code component provides a wrapper around the [Fluent UI `Pivot`](https://developer.microsoft.com/fluentui#/controls/web/pivot) control for use in canvas apps and custom pages.

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
| `ItemKey` | Arbitrary unique string associated with the Pivot item. |
| `ItemDisplayName` | Text to display in the Pivot item. |

Example:

  ```powerapps-dot
Table(
    {
        ItemKey: "tabFile",
        ItemDisplayName: "File"
    },
    {
        ItemKey: "tabHome",
        ItemDisplayName: "Home"
    },
    {
        ItemKey: "tabView",
        ItemDisplayName: "View"
    },
    {
        ItemKey: "tabAction",
        ItemDisplayName: "Action"
    }
)
  ```

## Configure tab behavior

Coordinate tab pages by associating the `Visible` property of dependent components in your app (for example, a container that represents a page) with the value of `Pivot1.Selected.ItemKey`.

`Visible` property of a dependent control that's displayed when the **tabFile** itemKey is selected:

  ```powerapps-dot
Pivot1.Selected.ItemKey = "tabFile"
  ```

## Best practices

Go to [Fluent UI Pivot control best practices](https://developer.microsoft.com/fluentui#/controls/web/pivot).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]