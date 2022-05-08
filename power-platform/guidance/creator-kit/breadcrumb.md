---
title: Breadcrumb control in the Creator Kit
description: Learn about the details and properties of Breadcrumb control in the Creator Kit.
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
# Auto width label control

A control used to provide navigation.

![Breadcrumb](media/breadcrumb.png "Breadcrumb")

## Description
This code component provides a wrapper around the [Fluent UI Breadcrumb](https://developer.microsoft.com/en-us/fluentui#/controls/web/breadcrumb) control for use in canvas & custom pages.

Breadcrumbs should be used as a navigational aid in your app or site. They indicate the current page's location within a hierarchy and help the user understand where they are in relation to the rest of that hierarchy. They also afford one-click access to higher levels of that hierarchy.

## Limitations
This PCF component can only be used in Canvas apps and Custom Pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| Items | Table with the items |
| Theme |  |
| Max displayed items | Maximum number of items that can be displayed |
| Overflow index | The index where overflow items are visualized (when all items cannot fit in the control width) |

## Items structure

The following table schema is needed to properly visualize data in the component. 

| Name | Description |
| ------ | ----------- |
| ItemKey | Arbitrary unique string associated with the breadcrumb item. |
| ItemDisplayName | Text to display in the breadcrumb item. |
| ItemClickable | If set to true, enables the item to be clickable. |

  ```powerapps-dot
  Table(
      {
          ItemKey: "1",
          ItemDisplayName: "General",
          ItemClickable: true
      },
      {
          ItemKey: "2",
          ItemDisplayName: "Document",
          ItemClickable: true
      }
  )
  ```

## Best Practices
Refer to [Fluent UI Breadcrumb control best practices](https://developer.microsoft.com/en-us/fluentui#/controls/web/breadcrumb)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]