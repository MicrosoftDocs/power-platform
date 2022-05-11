---
title: Pivot control reference | Creator Kit
description: Learn about the details and properties of Pivot control in the Creator Kit.
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
  - demora-msft
  - mehdis-msft
---
# Pivot control

A control used to provide navigation.

![Pivot](media/pivot.png "Pivot control")

## Description
The Pivot control and related tabs pattern are used for navigating frequently accessed, distinct content categories. Pivots allow for navigation between two or more content views and relies on text headers to articulate the different sections of content.

This code component provides a wrapper around the [Fluent UI Pivot](https://developer.microsoft.com/fluentui#/controls/web/pivot) control for use in canvas & custom pages.

## Limitations
This PCF component can only be used in Canvas apps and Custom Pages.


## Key properties

| Property | Description |
| -------- | ----------- |
| Items | Table with the items |

## Items structure
Each item uses the below schema to visualize data in the component. 

| Name | Description |
| ------ | ----------- |
| ItemKey | Arbitrary unique string associated with the Pivot item. |
| ItemDisplayName | Text to display in the Pivot item. |

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


## Configure Tab behavior
Coordinate tab pages by associating the `Visible` property of dependent components in your app (e.g., a container that represents a page) with the value of `Pivot1.Selected.ItemKey`.

Example `Visible` property of a dependent control that is displayed when the "tabFile" itemKey is selected:

  ```powerapps-dot
Pivot1.Selected.ItemKey = "tabFile"
  ```



## Best Practices
Refer to [Fluent UI Pivot control best practices](https://developer.microsoft.com/fluentui#/controls/web/pivot) for additional guidance.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]