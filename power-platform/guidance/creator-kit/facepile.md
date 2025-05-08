---
title: Facepile control reference | Creator Kit (preview)
description: Learn about the Creator Kit Facepile control.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 10/06/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
contributors:
  - tapanm-msft
  - slaouist
---

# :::no-loc text="Facepile"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to display and interact with images.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Facepile).

:::image type="content" source="media/facepile.png" alt-text="Facepile control.":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

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
|`MaxDisplayablePersonas`|Maximum number of Persona to appear of the Facepile <br> Five is the default and recommended number|
|`ImageShouldFadeIn`|Whether the image should have a Fade In effect while appearing|
|`ShowAddButton`|Whether the Add Button should appear in Facepile component|
|`OverflowButtonLabel`|Aria label for Overflow button|
|`AddbuttonAriaLabel`|Aria label for Add button|

#### `Items` Properties

| Name | Description |
| ------ | ----------- |
|`ItemPersonaName`|Display Name of the Persona|
|`ItemPersonaKey`|The key identify the specific Item <br> The key must be unique|
|`ItemPersonaImage`|The Image Column of Dataverse table that contains Persona Image(Profile Picture)|
|`ItemPersonaImageInfo`|Url or Base64 Content of Persona Image(Profile Picture)|
|`ItemPersonaPresence`|Optional - To define the Presence of the persona|
|`IsImage`| Whether the persona image(ItemPersonaImage) is an Image Column of Dataverse table. <br> This property allows the component to render the image based on the type(Url or Image). True in case Image needs to referred from Dataverse table & false, in case, it's a Url or Base64 to be referred from ItemPersonaImageInfo property|
|`ItemPersonaClickable`|Whether or not the persona should be clickable|

Example Power Fx formula for `Items` (uses the [Office 365 Users](/connectors/office365users/) connector) 

### Generate `Items` collection with photos using the Office 365 Users connector

A list of users can come from any data source, but the image must be provided to the component. If your data source doesn't have images for the users, you can use the AddColumns() Power Fx function to add the correct attributes to the list and retrieve the user's image, from a list of user Ids or user principal names that map to an active user in your Microsoft Entra.

Generate a collection called `UserPersonas` using [Office 365 Users connector](/connectors/office365users/), by referring to the below sample code, then pass the collection into the `Items` property of the control.

```power-fx
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
> [!NOTE] 
> The `IsImage` field is set to false because the `ItemPersonaImageInfo` coming from an image Url. To render Dataverse image fields, set `IsImage` field to true and use the `ItemPersonaImage` to pass in the image value instead.
 
 
## Usage

### Style Properties

| Property | Description |
| -------- | ----------- |
| `Theme` |Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. Leaving this blank will use the default theme defined by Power Apps. See [theming](theme.md) for guidance on how to configure. |
| `AccessibilityLabel` | Screen reader aria-label |

### Event Properties

| Property | Description |
| -------- | ----------- |
| `InputEvent` | An event to send to the control. For example, [SetFocus](#behavior). |

## Behavior

Supports [SetFocus](setfocus.md) as an `InputEvent`.

### Configure On Select behavior

Use the [**Switch()**](/power-apps/maker/canvas-apps/functions/function-if) formula in the component's `OnSelect` property to configure specific actions for each item by referring to the control's selected `ItemPersonaKey` as the switch value.

Example Power Fx formula in `OnSelect` property of `Facepile`:
  ```power-fx
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

## Limitations

This code component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
