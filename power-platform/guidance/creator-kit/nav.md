---
title: Nav control reference | Creator Kit
description: Learn about the details and properties of Nav control in the Creator Kit.
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
  - demora-msft
  - slaouist
---

# Nav control

A control used to provide navigation.

:::image type="content" source="media/nav.png" alt-text="Nav control.":::

## Description

A navigation pane (Nav) provides links to the main areas of an app or site.

The Nav code component allows using of the [Fluent UI Nav menu component](https://developer.microsoft.com/fluentui#/controls/web/nav) from inside canvas apps and custom pages.

[View component in the Creator Kit GitHub repository](https://github.com/microsoft/powercat-creator-kit/tree/main/CreatorKitCore/SolutionPackage/Controls/cat_PowerCAT.Nav)

## Limitations

This PCF component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| Items | Required. The data source items table to render. |
| Fields | Required. The fields needed are indicated. |
| Columns | Required. Table mapping definition between the component column and the data source. Use this to map field names and define specific column behavior. |

## Additional properties

| Property | Description |
| -------- | ----------- |
| Selected key | The key that is selected by default |

## Items structure

Each item uses the below schema to visualize data in the component. 

| Name | Description |
| ------ | ----------- |
| ItemKey | Arbitrary unique string associated with the breadcrumb item. |
| ItemDisplayName | Text to display in the breadcrumb item. |
| ItemIconName | Name of the [Fluent UI icon](https://developer.microsoft.com/fluentui#/styles/web/icons) for the item |
| ItemIconColor | Color of the item icon |
| ItemExpanded | Whether the item is expanded by default, if there are children items |
| ItemVisible | Whether the item is rendered |
| ItemParentKey | ItemKey of the parent the item is nested under |

Example:

  ```powerapps-dot
Table(
    {
        ItemKey: "1",
        ItemDisplayName: "Home with Icon & Custom color",
        ItemIconName: "Home",
        ItemIconColor: "Green"
    },
    {
        ItemKey: "2",
        ItemDisplayName: "Documents",
        ItemExpanded: true
    },
    {
        ItemKey: "3",
        ItemDisplayName: "Contents"
    },
    {
        ItemKey: "4",
        ItemDisplayName: "Item Invisible",
        ItemVisible: false
    },
    {
        ItemKey: "5",
        ItemDisplayName: "Quick Reference Guide",
        ItemParentKey: "3",
        ItemIconName: "Document"
    }
)
  ```

## Configure "On Select" behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemKey` as the switch value.

Replace the `false` values with appropriate expressions in the Power Fx language.

  ```powerapps-dot
    Switch( Self.Selected.ItemKey,

      /* Action for ItemKey 1 */
      "1", false,

      /* Action for ItemKey 2 */
      "2", false,

      /* Action for ItemKey 3 */
      "3", false,

      /* Action for ItemKey 4 */
      "4", false,

      /* Action for ItemKey 5 */
      "5", false,

      /* Default action */
          false
    )
  ```

## Best Practices

Refer to [Fluent UI Nav control best practices](https://developer.microsoft.com/fluentui#/controls/web/nav)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]