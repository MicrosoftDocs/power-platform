---
title: Facepile control reference | Creator Kit
description: Learn about the Creator Kit Facepile control.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 09/30/2022
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

# :::no-loc text="Facepile"::: control

A control used to display and interact with images.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Facepile).

:::image type="content" source="media/facepile.png" alt-text="Facepile control.":::

## Description

A face pile (`Facepile`) displays a list of personas. Each circle represents a person and contains their image or initials. Often this control is used when sharing who has access to a specific view or file, or when assigning someone a task within a workflow.

This code component provides a wrapper around the [Fluent UI Facepile](https://developer.microsoft.com/en-us/fluentui#/controls/web/facepile) control bound to a button for use in canvas apps and custom pages.

## Properties

### Key Properties

| Property | Description |
| -------- | ----------- |
| `Items` | The action items to render. The first item is considered the root item. |
|`PersonaSize`|Size of the persona to appear on screen|
|`OverflowButtonType`|To choose which type of Overflow button to appear and whether to appear or not|
|`MaxDisplayablePersonas`|Maximum number of Persona to appear of the Facepile| Five is the default and recommended number|
|`ImageShouldFadeIn`|Whether the image should have a Fade In effect while appearing|
|`ShowAddButton`|Whether Add Button should appear in Facepile component|
|`OverflowButtonLabel`|Aria label for Overflow button|
|`AddbuttonAriaLabel`|Aria label for Add button|

#### `Items` Properties

| Name | Description |
| ------ | ----------- |
|`ItemPersonaName`|Display Name of the Persona|
|`ItemPersonaKey`|The key identify the specific Item| The key must be unique|
|`ItemPersonaImage`|The Image Column of Dataverse table which contains Persona Image(Profile Picture)|
|`ItemPersonaImageInfo`|Url or Base64 Content of Persona Image(Profile Picture)|
|`ItemPersonaPresence`|Optional - To defined the Presence of the persona|
|`IsImage`| Whether the persona image(ItemPersonaImage) is a Image Column of Dataverse table. This allows the component to render the image based on the type(Url or Image). True incase Image needs to refered from Dataverse table & false, incase, its a Url or Base64 to be referred from ItemPersonaImageInfo property|
|`ItemPersonaClickable`|Whether or not the persona should be clickable|

Example Power Fx formula for `Items`:

  ```powerapps-dot
    Table(
        {
            ItemKey: "File",
            ItemIconName: "save",
            ItemDisplayName: "Save",
            ItemOverflow:true
        },
         {
            ItemKey: "Delete",
            ItemIconName: "Delete",
            ItemDisplayName: "Delete",
            ItemOverflow:true
        }
    )
    
  ```

### Style Properties

| Property | Description |
| -------- | ----------- |
| `Theme` |Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `Chevron` | Show or hide the down chevron on the root button |
| `IconColor` | Optional. color of the icon on the context menu button. |
| `HoverIconColor` | Optional. color of the icon when hovered over the context menu button. |
| `IconSize` | Optional. In pixels, the size of the icon on the context menu button. |
| `FontSize` | Optional. In pixels, the size of the text on the context menu button. |
| `FontColor` | Optional. the color of the text on the context menu button. |
| `HoverFontColor` | Optional. the color of the text when hovered over the context menu button. |
| `FillColor` | Optional. the background color of the context menu button. |
| `HoverFillColor` | Optional. the background color when hovered over the context menu button. |
| `TextAlignment` | The alignment of the button text. Possible values: Center, Left or Right |
| `AccessibilityLabel` | Screen reader aria-label |

### Event Properties

| Property | Description |
| -------- | ----------- |
| `InputEvent` | An event to send to the control. E.g. `SetFocus`. See below. |

## Behavior

Supports [SetFocus](setfocus.md) as an `InputEvent`.

### Configure On Select behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemPersonaKey` as the switch value.

Example Power Fx formula in `OnSelect` property of `Facepile`:
  ```powerapps-dot
    Switch( Self.EventName,
      /* Define action when persona clicked */
      "PersonaEvent", 
      Notify("Persona clicked: " & Self.Selected.ItemPersonaKey);
      ,
      
      /* Define logic when the add button clicked */
      "AddButtonEvent", 
      Notify("Add button was clicked");
      ,
    
      /* Define logic when overflow button clicked*/
      "OverFlowButtonEvent",
      Notify("Overflow button clicked");
    )
  ```

## Samples

### Office 365 Users Connector

To generate the input collection using Office365Users connector, to pass as items property, refer the below sample code.

```powerapps-dot
ClearCollect(
    UserPersonas,
    AddColumns(
       // Get first 10 users who have email ID - optional
        Filter(
            Office365Users.SearchUser({top: 10}),
            Mail <> Blank()
        ),
        "ItemPersonaKey",
        Mail,
        "ItemPersonaName",
        DisplayName,
        "IsImage",
        false,
        "ItemPersonaImageInfo",
        //Get base64 image data
        Substitute(
            JSON(
                Office365Users.UserPhotoV2(Id),
                JSONFormat.IncludeBinaryData
            ),
            """",
            ""
        ),
        "ItemPersonaPresence",
        "Away",
        "ItemPersonaClickable",
        true
    )
);
```

## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]